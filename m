Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AED816D147
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 17:26:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0LHQsAo021164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2019 09:26:55 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 21 Jan 2019 09:26:54 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 21 Jan 2019 12:26:50 -0500
Message-ID: <d26b88dd2980a8385da86ea5ddcbc3ecc2930a62.1548091536.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1548091536.git.bruce.ashfield@windriver.com>
References: <cover.1548091536.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.18: update to v4.18.25
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
X-List-Received-Date: Mon, 21 Jan 2019 17:26:55 -0000
Content-Type: text/plain

Integrating the -stable updates from Paul Gortmaker that comprise the
following commits:

   e07895ef36e2 Linux 4.18.25
   735782c616aa drm/rockchip: psr: do not dereference encoder before it is null checked.
   90d4d21063af drm/vc4: Set ->is_yuv to false when num_planes == 1
   5758821188c7 drm/nouveau/drm/nouveau: Check rc from drm_dp_mst_topology_mgr_resume()
   8a79f6e48dc7 lib: fix build failure in CONFIG_DEBUG_VIRTUAL test
   c85e10aa1ea6 of: __of_detach_node() - remove node from phandle cache
   d7ba3e8331c7 of: of_node_get()/of_node_put() nodes held in phandle cache
   9739deeff0bf power: supply: olpc_battery: correct the temperature units
   2e4bfb04a730 intel_th: msu: Fix an off-by-one in attribute store
   233fc3ff6d19 genwqe: Fix size check
   3722e178318e drivers/perf: hisi: Fixup one DDRC PMU register offset
   e7153ded4c17 ceph: don't update importing cap's mseq when handing cap export
   96c39638d19f sched/fair: Fix infinite loop in update_blocked_averages() by reverting a9e7f6544b9c
   f73f80f3cff6 iommu/vt-d: Handle domain agaw being less than iommu agaw
   87310c3e7901 RDMA/srpt: Fix a use-after-free in the channel release code
   49cb944dbb54 rxe: fix error completion wr_id and qp_num
   9c1e8e00a232 9p/net: put a lower bound on msize
   595eab91d583 iio: dac: ad5686: fix bit shift read register
   6930d7e4b110 powerpc/tm: Set MSR[TS] just prior to recheckpoint
   da655a6fd9a9 powerpc/tm: Unset MSR[TS] if not recheckpointing
   6c968fff7e66 leds: pwm: silently error out on EPROBE_DEFER
   d92af6def7be arm64: relocatable: fix inconsistencies in linker script and options
   5c7ffec8c4a1 arm64: drop linker script hack to hide __efistub_ symbols
   231c17d7fe6d lockd: Show pid of lockd for remote locks
   bb36bf436ae9 PCI / PM: Allow runtime PM without callback functions
   109e48764a2d selinux: policydb - fix byte order and alignment issues
   a608335e8a1c b43: Fix error in cordic routine
   ce624ec2363b gfs2: Fix loop in gfs2_rbm_find
   7b0eb99a925c gfs2: Get rid of potential double-freeing in gfs2_create_inode
   2e8e0dc1bbff dlm: memory leaks on error path in dlm_user_request()
   20e150ecbb17 dlm: lost put_lkb on error path in receive_convert() and receive_unlock()
   eb1cbd2d152c dlm: possible memory leak on error path in create_lkb()
   700687f3cb98 dlm: fixed memory leaks after failed ls_remove_names allocation
   c45cc3521032 block: mq-deadline: Fix write completion handling
   9d3b67453638 block: deactivate blk_stat timer in wbt_disable_default()
   53a5e3001ad1 Fix failure path in alloc_pid()
   1da2e8ee069f driver core: Add missing dev->bus->need_parent_lock checks
   8fb38bca0d9a srcu: Lock srcu_data structure in srcu_gp_start()
   fabb4446a87b ALSA: usb-audio: Always check descriptor sizes in parser code
   eaf28235170f ALSA: usb-audio: Fix an out-of-bound read in create_composite_quirks
   1a814f226eee ALSA: usb-audio: Check mixer unit descriptors more strictly
   974f484d8ff9 ALSA: usb-audio: Avoid access before bLength check in build_audio_procunit()
   7fac2a4ca7d3 ALSA: cs46xx: Potential NULL dereference in probe
   a489f553dc12 media: cx23885: only reset DMA on problematic CPUs
   4c7d8d7c1308 raid6/ppc: Fix build for clang
   dabfa8988258 powerpc: Disable -Wbuiltin-requires-header when setjmp is used
   71a4448d5e50 powerpc: avoid -mno-sched-epilog on GCC 4.9 and newer
   77355e0e98c6 powerpc: consolidate -mno-sched-epilog into FTRACE flags
   0f5ac11d097d powerpc: remove old GCC version checks
   9fcbfe720a66 sunrpc: use SVC_NET() in svcauth_gss_* functions
   192b590d4aec sunrpc: fix cache_head leak due to queued request
   c7c58f2faee2 mm, swap: fix swapoff with KSM pages
   8289463a7e9d mm, hmm: mark hmm_devmem_{add, add_resource} EXPORT_SYMBOL_GPL
   1a799c400ed1 mm, hmm: use devm semantics for hmm_devmem_{add, remove}
   0c99af45252a mm, devm_memremap_pages: add MEMORY_DEVICE_PRIVATE support
   59333a88f665 kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN
   58bc5ba9a00d mm, devm_memremap_pages: fix shutdown handling
   948d528a2a6f mm, devm_memremap_pages: kill mapping "System RAM" support
   df07b8f0fb0a mm, devm_memremap_pages: mark devm_memremap_pages() EXPORT_SYMBOL_GPL
   ebd7e55e0733 hwpoison, memory_hotplug: allow hwpoisoned pages to be offlined
   959653a9bf73 zram: fix double free backing device
   8b9b4edba3be fork: record start_time late
   b901d884c9e8 scsi: lpfc: do not set queue->page_count to 0 if pc_sli4_params.wqpcnt is invalid
   82485bca00f2 scsi: zfcp: fix posting too many status read buffers leading to adapter shutdown
   773911d8b527 auxdisplay: charlcd: fix x/y command parsing
   49c70d21c358 serial/sunsu: fix refcount leak
   0ec65d840ea3 qmi_wwan: Fix qmap header retrieval in qmimux_rx_fixup
   0438f1ea114b net: netxen: fix a missing check and an uninitialized use
   1567f283e00e Input: synaptics - enable SMBus for HP EliteBook 840 G4
   a3913c9c9c8c gpio: mvebu: only fail on missing clk if pwm is actually to be used
   9e1a572ef0b5 lan743x: Remove MAC Reset from initialization
   3cda7e7e3ecb virtio: fix test build after uio.h change
   09d4f9477813 kbuild: fix false positive warning/error about missing libelf
   02b8b59bea29 mac80211: free skb fraglist before freeing the skb
   6499acbbd54f nl80211: fix memory leak if validate_pae_over_nl80211() fails
   65fbf8702ff9 vxge: ensure data0 is initialized in when fetching firmware version information
   6eee1a4d51f3 lan78xx: Resolve issue with changing MAC address
   a200d52163e4 net: macb: add missing barriers when reading descriptors
   8bbf0bc96ad7 net: macb: fix dropped RX frames due to a race
   acbf1fb508aa net: macb: fix random memory corruption on RX with 64-bit DMA
   02c208c4c6b2 qed: Fix an error code qed_ll2_start_xmit()
   88f38f2f554e SUNRPC: Fix a race with XPRT_CONNECTING
   78f44c6b4abc net: hns: Fix ping failed when use net bridge and send multicast
   028ea5c9d17a net: hns: Add mac pcs config when enable|disable mac
   4f6210aba92c net: hns: Fix ntuple-filters status error.
   02c9ec12dd21 net: hns: Avoid net reset caused by pause frames storm
   1a4c0bc47d5e net: hns: Free irq when exit from abnormal branch
   3153ec7cf997 net: hns: Clean rx fbd when ae stopped.
   716fc005da40 net: hns: Fixed bug that netdev was opened twice
   dd3287b18cf8 net: hns: Some registers use wrong address according to the datasheet.
   23cccfe76598 net: hns: All ports can not work when insmod hns ko after rmmod.
   4982bfce35ef net: hns: Incorrect offset address used for some registers.
   90bd8d1a20b2 w90p910_ether: remove incorrect __init annotation
   c392d1a12520 net/tls: Init routines in create_ctx
   1e623fa0042c drivers: net: xgene: Remove unnecessary forward declarations
   ecd5c4ebb822 x86, hyperv: remove PCI dependency
   81dae7a1df1c mt76: fix potential NULL pointer dereference in mt76_stop_tx_queues
   e28b6d2c57b5 scsi: target: iscsi: cxgbit: add missing spin_lock_init()
   68d361ffeabd scsi: target: iscsi: cxgbit: fix csk leak
   6c1b3803a6e3 bnx2x: Send update-svid ramrod with retry/poll flags enabled
   3acfa2246629 bnx2x: Clear fip MAC when fcoe offload support is disabled
   7e20b7779059 netfilter: nat: can't use dst_hold on noref dst
   e3a08d34d535 netfilter: ipset: do not call ipset_nest_end after nla_nest_cancel
   48f3cb1f4e86 i40e: fix mac filter delete when setting mac address
   5d04bcd6e69e ieee802154: ca8210: fix possible u8 overflow in ca8210_rx_done
   f53ba1853ffd ibmvnic: Fix non-atomic memory allocation in IRQ context
   34bd82d476ad ibmvnic: Convert reset work item mutex to spin lock
   0a597b1ccd73 Input: synaptics - enable RMI on ThinkPad T560
   014633247654 Input: omap-keypad - fix idle configuration to not block SoC idle states
   a284212b45ed scsi: bnx2fc: Fix NULL dereference in error handling
   e639597419e9 Revert "scsi: qla2xxx: Fix NVMe Target discovery"
   cea74ed31970 netfilter: seqadj: re-load tcp header pointer after possible head reallocation
   b139c854a00a xfrm: Fix bucket count reported to userspace
   d3353f400809 checkstack.pl: fix for aarch64
   ca5e170a8f47 drm/amdgpu: Fix DEBUG_LOCKS_WARN_ON(depth <= 0) in amdgpu_ctx.lock
   fe69ecd10177 powerpc/mm: Fallback to RAM if the altmap is unusable
   50a6a1e7140b Input: restore EV_ABS ABS_RESERVED
   495cd33a97d6 ARM: dts: imx7d-nitrogen7: Fix the description of the Wifi clock
   8d8cbaca6ba2 ARM: imx: update the cpu power up timing setting on i.mx6sx
   b930167e8ec5 ARM: dts: imx7d-pico: Describe the Wifi clock
   4ef7a4b98ce3 HID: ite: Add USB id match for another ITE based keyboard rfkill key quirk
   e5a9a47bd51a powerpc/mm: Fix linux page tables build with some configs
   251058825091 powerpc: Fix COFF zImage booting on old powermacs
   d113f206d275 ARM: dts: sun8i: a83t: bananapi-m3: increase vcc-pd voltage to 3.3V
   26068dd8b8cf Linux 4.18.24
   aec6f6bc5108 MIPS: Only include mmzone.h when CONFIG_NEED_MULTIPLE_NODES=y
   edc9f994d18e spi: bcm2835: Unbreak the build of esoteric configs
   7675f3ad41aa tpm: tpm_i2c_nuvoton: use correct command duration for TPM 2.x
   62c528f41b75 arm64: compat: Avoid sending SIGILL for unallocated syscall numbers
   fe9ecf948b3f iommu/arm-smmu-v3: Fix big-endian CMD_SYNC writes
   daf79a7eff57 KVM: arm/arm64: vgic: Fix off-by-one bug in vgic_get_irq()
   4e397462644c KVM: arm/arm64: vgic-v2: Set active_source to 0 when restoring state
   679602791d84 KVM: arm/arm64: vgic: Cap SPIs to the VM-defined maximum
   c48ea7b2f18b KVM: arm/arm64: vgic: Do not cond_resched_lock() with IRQs disabled
   c96e540c5472 rtc: m41t80: Correct alarm month range with RTC reads
   728bdad63d25 ARM: dts: exynos: Specify I2S assigned clocks in proper node
   85157899ecd7 arm/arm64: KVM: vgic: Force VM halt when changing the active state of GICv3 PPIs/SGIs
   61f42110c833 arm64: KVM: Avoid setting the upper 32 bits of VTCR_EL2 to 1
   3b0dec9f506f CIFS: Fix error mapping for SMB2_LOCK command which caused OFD lock problem
   9829db6a18eb MIPS: OCTEON: mark RGMII interface disabled on OCTEON III
   cee82d1ae17b MIPS: Expand MIPS32 ASIDs to 64 bits
   c808d70b9e27 MIPS: Align kernel load address to 64KB
   eb8af7549685 MIPS: Ensure pmd_present() returns false after pmd_mknotpresent()
   45bff3e8e6a5 MIPS: c-r4k: Add r4k_blast_scache_node for Loongson-3
   9c6f89bc1709 MIPS: math-emu: Write-protect delay slot emulation pages
   7f7b89296833 tools lib traceevent: Fix processing of dereferenced args in bprintk events
   b8a224716756 media: v4l2-tpg: array index could become negative
   6f9be5d7e3f3 media: vb2: check memory model for VIDIOC_CREATE_BUFS
   11f1d3879a7d media: vivid: free bitmap_cap when updating std/timings/etc.
   cb40fc23227e media: imx274: fix stack corruption in imx274_read_reg
   b64ba5d0b731 media: rc: cec devices do not have a lirc chardev
   4e3ad74d0a78 media: cec-pin: fix broken tx_ignore_nack_until_eom error injection
   2696fefea8a6 media: cec: keep track of outstanding transmits
   fd247353c0f9 serial: uartps: Fix interrupt mask issue to handle the RX interrupts properly
   22fcd1b2f73e f2fs: sanity check of xattr entry size
   29c1ff73b20b f2fs: fix validation of the block count in sanity_check_raw_super
   cb1c54a6a7d5 brcmfmac: Fix out of bounds memory access during fw load
   a9a25c4bd9bb brcmfmac: fix roamoff=1 modparam
   146ef869a043 Btrfs: send, fix race with transaction commits that create snapshots
   ba440c3c4a27 btrfs: run delayed items before dropping the snapshot
   6ba644894048 Btrfs: fix fsync of files with multiple hard links in new directories
   593a1bdf137a btrfs: skip file_extent generation check for free_space_inode in run_delalloc_nocow
   6eb353db8d32 btrfs: dev-replace: go back to suspend state if another EXCL_OP is running
   e113e7d0b41f btrfs: dev-replace: go back to suspended state if target device is missing
   cbf669bb140f cdc-acm: fix abnormal DATA RX issue for Mediatek Preloader.
   cdb991cbe9ca cgroup: fix CSS_TASK_ITER_PROCS
   d9d96d8f9665 crypto: cfb - fix decryption
   c29db9d0e70c crypto: testmgr - add AES-CFB tests
   f35387186793 crypto: chcr - small packet Tx stalls the queue
   57d999759174 crypto: cavium/nitrox - fix a DMA pool free failure
   a040dc4c332a clk: sunxi-ng: Use u64 for calculation of NM rate
   25bfefc210fd clk: rockchip: fix typo in rk3188 spdif_frac parent
   78f1e2ce6bec spi: bcm2835: Avoid finishing transfer prematurely in IRQ mode
   ce8fd4553894 spi: bcm2835: Fix book-keeping of DMA termination
   2ed14d56eb9a spi: bcm2835: Fix race on DMA termination
   fdfc740438e4 ext4: fix special inode number checks in __ext4_iget()
   8912afbd5a69 ext4: check for shutdown and r/o file system in ext4_write_inode()
   0fd748f86521 ext4: force inode writes when nfsd calls commit_metadata()
   743da24c6365 ext4: avoid declaring fs inconsistent due to invalid file handles
   5636580f533c ext4: include terminating u32 in size of xattr entries when expanding inodes
   398f2e6ee30e ext4: fix EXT4_IOC_GROUP_ADD ioctl
   f22c319b9afa ext4: missing unlock/put_page() in ext4_try_to_write_inline_data()
   3c6a7b0029a9 ext4: fix possible use after free in ext4_quota_enable
   8ec2e8ccc275 ext4: add ext4_sb_bread() to disambiguate ENOMEM cases
   2253b6438f00 ocxl: Fix endiannes bug in read_afu_name()
   031013077a31 ocxl: Fix endiannes bug in ocxl_link_update_pe()
   bff7ed6c9727 perf pmu: Suppress potential format-truncation warning
   ccd3a28ebefd clocksource/drivers/arc_timer: Utilize generic sched_clock
   a08eae1dccb6 DRM: UDL: get rid of useless vblank initialization
   3b278133c061 drm/v3d: Skip debugfs dumping GCA on platforms without GCA.
   dce6965d4e91 platform-msi: Free descriptors in platform_msi_domain_free()
   26712157a7e8 KVM: nVMX: Free the VMREAD/VMWRITE bitmaps if alloc_kvm_area() fails
   f5a53ddee2a0 arm64: KVM: Make VHE Stage-2 TLB invalidation operations non-interruptible
   4224dc370109 KVM: x86: Use jmp to invoke kvm_spurious_fault() from .fixup
   43df8745c955 Input: elan_i2c - add ACPI ID for touchpad in ASUS Aspire F5-573G
   de2c125b1e40 s390/pci: fix sleeping in atomic during hotplug
   c96a4e056b97 staging: wilc1000: fix missing read_write setting when reading data
   4f30183ffc00 media: dvb-usb-v2: Fix incorrect use of transfer_flags URB_FREE_BUFFER
   af84c969f481 usb: roles: Add a description for the class to Kconfig
   f6019125567c usb: r8a66597: Fix a possible concurrency use-after-free bug in r8a66597_endpoint_disable()
   dadfc9d5b5c4 USB: serial: option: add Fibocom NL678 series
   d589d1192b88 USB: serial: pl2303: add ids for Hewlett-Packard HP POS pole displays
   836492f91017 usb: dwc2: host: use hrtimer for NAK retries
   0c046d05b49c ALSA: hda/tegra: clear pending irq handlers
   03cfeaa90d58 ALSA: firewire-lib: use the same print format for 'without_header' tracepoints
   012b3d3a29f0 ALSA: firewire-lib: fix wrong assignment for 'out_packet_without_header' tracepoint
   852d675f1d0c ALSA: firewire-lib: fix wrong handling payload_length as payload_quadlet
   a84e166fe7f2 ALSA: fireface: fix for state to fetch PCM frames
   5e20e79d9939 ALSA: hda: add mute LED support for HP EliteBook 840 G4
   ea84faf00d17 mtd: rawnand: marvell: prevent timeouts on a loaded machine
   a941558bd40c mtd: atmel-quadspi: disallow building on ebsa110
   90a23a9a0a4b ALSA: emux: Fix potential Spectre v1 vulnerabilities
   be9ee86f4eee ALSA: pcm: Fix potential Spectre v1 vulnerability
   4c9cf57302b4 ALSA: emu10k1: Fix potential Spectre v1 vulnerabilities
   48c20b51db1e ALSA: rme9652: Fix potential Spectre v1 vulnerability
   0e48718ccbbc IB/hfi1: Incorrect sizing of sge for PIO will OOPs
   7eff9c1500e1 net/mlx5e: RX, Fix wrong early return in receive queue poll
   4717407dfe21 mlxsw: core: Increase timeout during firmware flash process
   11acf8fbd110 qed: Fix command number mismatch between driver and the mfw
   865270a3cb40 net/mlx5e: RX, Verify MPWQE stride size is in range
   423f90f819f6 net/mlx5e: Cancel DIM work on close SQ
   63e31b4cc7a1 mscc: Configured MAC entries should be locked.
   a6988f6f3fb8 ipv6: route: Fix return value of ip6_neigh_lookup() on neigh_create() error
   20b706e8bf44 nfp: flower: ensure TCP flags can be placed in IPv6 frame
   2d7aa068e5ea net/ipv6: Fix a test against 'ipv6_find_idev()' return value
   9685169f3280 ipv6: frags: Fix bogus skb->sk in reassembled packets
   e3d4855a5aea net/mlx5e: Remove the false indication of software timestamping support
   f28566f8d6c1 tipc: check group dests after tipc_wait_for_cond()
   1e5ef82d6ba3 net/mlx5: Typo fix in del_sw_hw_rule
   afe50f0b53fc xen/netfront: tolerate frags with no data
   51125e14bcd9 VSOCK: Send reset control packet when socket is partially bound
   d99050a5b574 vhost: make sure used idx is seen before log in vhost_add_used_n()
   4ce7430e49b2 tipc: use lock_sock() in tipc_sk_reinit()
   ce57d1d97f83 tipc: fix a double kfree_skb()
   a95f3e4813ba tipc: fix a double free in tipc_enable_bearer()
   813c817626cd tipc: compare remote and local protocols in tipc_udp_enable()
   2d9a3dc2539e tipc: check tsk->group in tipc_wait_for_cond()
   c934db384fcf tcp: fix a race in inet_diag_dump_icsk()
   9c4201f36ac8 sock: Make sock->sk_stamp thread-safe
   3f95e9533d48 sctp: initialize sin6_flowinfo for ipv6 addrs in sctp_inet6addr_event
   e01f35c50eec qmi_wwan: Add support for Fibocom NL678 series
   c4889ffd91f4 qmi_wwan: Added support for Telit LN940 series
   02df72acc8d0 qmi_wwan: Added support for Fibocom NL668 series
   7fdbc7a1e2ae ptr_ring: wrap back ->producer in __ptr_ring_swap_queue()
   5e3a73f0075c net/wan: fix a double free in x25_asy_open_tty()
   01ff438449fe net: stmmac: Fix an error code in probe()
   570725e3eb49 net/smc: fix TCP fallback socket release
   b093b2bcb009 netrom: fix locking in nr_find_socket()
   39eead897120 net: phy: Fix the issue that netif always links up after resuming
   21e87a82fa5c net: macb: restart tx after tx used bit read
   e76b3cc898a3 net/hamradio/6pack: use mod_timer() to rearm timers
   b69120829e6e isdn: fix kernel-infoleak in capi_unlocked_ioctl
   4099e52fdca2 ip: validate header length on virtual device xmit
   5cd2dc4cbf28 ipv6: tunnels: fix two use-after-free
   99b91aad172d ipv6: explicitly initialize udp6_addr in udp_sock_create6()
   dd6292ddd74d ipv4: Fix potential Spectre v1 vulnerability
   5476a3d1c7aa ip6mr: Fix potential Spectre v1 vulnerability
   98b15b0c0f6d ieee802154: lowpan_header_create check must check daddr
   d6025c2f233b ibmveth: fix DMA unmap error in ibmveth_xmit_start error path
   6e2e801ef5e9 gro_cell: add napi_disable in gro_cells_destroy
   d347cc2d0383 ax25: fix a use-after-free in ax25_fillin_cb()
   3ea51578ff5f drm/ioctl: Fix Spectre v1 vulnerabilities
   42ef003d4562 proc/sysctl: don't return ENOMEM on lookup when a table is unregistering
   3a4e7b8d4815 Input: elantech - disable elan-i2c for P52 and P72
   29eb38509a18 mm: don't miss the last page because of round-off error
   0dd101b35dc8 mm, page_alloc: fix has_unmovable_pages for HugePages
   fa9b81a99860 mm: thp: fix flags for pmd migration when split
   2161b228a28e mm, memory_hotplug: initialize struct pages for the full memory section
   567b54213293 iwlwifi: add new cards for 9560, 9462, 9461 and killer series
   a3a2be9932c4 rtlwifi: Fix leak of skb when processing C2H_BT_INFO
   08372e4a8a12 xfrm_user: fix freeing of xfrm states on acquire
   069467d9f4a9 mm: introduce mm_[p4d|pud|pmd]_folded
   eefeffc11188 mm: make the __PAGETABLE_PxD_FOLDED defines non-empty
   a31fff8051df mm: add mm_pxd_folded checks to pgtable_bytes accounting functions
   d50fbd2cbce5 panic: avoid deadlocks in re-entrant console drivers
   06251134c592 x86/mtrr: Don't copy uninitialized gentry fields back to userspace
   bb898527a1c7 futex: Cure exit race
   0bbaf6c392f0 Drivers: hv: vmbus: Return -EINVAL for the sys files for unopened channels
   303b25349d17 KVM: Fix UAF in nested posted interrupt processing
   1d53c9694d61 kvm: x86: Add AMD's EX_CFG to the list of ignored MSRs
   2b3f1bd62f4a KVM: X86: Fix NULL deref in vcpu_scan_ioapic
   7a773622fc03 posix-timers: Fix division by zero bug
   f14b8859148c gpio: max7301: fix driver for use with CONFIG_VMAP_STACK
   477761b67ccd mmc: omap_hsmmc: fix DMA API warning
   a681b2da2c88 mmc: core: Use a minimum 1600ms timeout when enabling CACHE ctrl
   89f2351adfac mmc: core: Allow BKOPS and CACHE ctrl even if no HPI support
   ddf77476eb50 mmc: core: Reset HPI enabled state during re-init and in case of errors
   a49c12bd3427 scsi: sd: use mempool for discard special page
   80f7b4857185 ubifs: Handle re-linking of inodes correctly while recovery
   a3fa57176fc3 USB: serial: option: add Telit LN940 series
   4079ef6f75e0 USB: serial: option: add Fibocom NL668 series
   dced7dfb270b USB: serial: option: add Simcom SIM7500/SIM7600 (MBIM mode)
   dce4d3b1443f USB: serial: option: add HP lt4132
   551e6023cc86 USB: serial: option: add GosunCn ZTE WeLink ME3630
   66ae0bdde44c USB: hso: Fix OOB memory access in hso_probe/hso_get_config_data
   740745a91e92 Revert "vfs: Allow userns root to call mknod on owned filesystems."
   2c5ca276d2ae nvme: validate controller state before rescheduling keep alive
   fbdd7e1e387f i2c: uniphier-f: fix violation of tLOW requirement for Fast-mode
   bc2fbb452ec1 i2c: uniphier: fix violation of tLOW requirement for Fast-mode
   4a3280619c2a i2c: scmi: Fix probe error on devices with an empty SMB0001 ACPI device node
   5e6e49d9a2dc i2c: axxia: properly handle master timeout
   8546aaab43e0 mlxsw: spectrum_switchdev: Fix VLAN device deletion via ioctl
   abcaa45cfc72 vhost/vsock: fix reset orphans race with close timeout
   8365792328f0 cifs: In Kconfig CONFIG_CIFS_POSIX needs depends on legacy (insecure cifs)
   935b7a30671d drm/ast: Fix connector leak during driver unload
   91ee67721601 tools/testing/nvdimm: Align test resources to 128M
   150d613009a7 drm/amdgpu/vcn: Update vcn.cur_state during suspend
   c999e264b2e8 ethernet: fman: fix wrong of_node_put() in probe function
   2040e90bd48a ARM: 8816/1: dma-mapping: fix potential uninitialized return
   8b1e20a3df5d ARM: 8815/1: V7M: align v7m_dma_inv_range() with v7 counterpart
   c277c0e1b0e7 ARM: 8814/1: mm: improve/fix ARM v7_dma_inv_range() unaligned address handling
   52f34d6d10d4 bpf: check pending signals while verifying programs
   cd17f2d553dc net/mlx4_en: Fix build break when CONFIG_INET is off
   536fca86ba87 mv88e6060: disable hardware level MAC learning
   2d9e565170d7 macvlan: return correct error value
   349c7c7a5880 libata: whitelist all SAMSUNG MZ7KM* solid-state disks
   ee58548c5cd2 Input: omap-keypad - fix keyboard debounce configuration
   47155a7f238a Input: synaptics - enable SMBus for HP 15-ay000
   31b7a055ad25 clk: mmp: Off by one in mmp_clk_add()
   83a71b688529 clk: mvebu: Off by one bugs in cp110_of_clk_get()
   90bcde56db66 drm/amd/powerplay: issue pre-display settings for display change event
   c7d3364fa445 drm/msm: Fix error return checking
   f5e8e639af30 drm/msm/hdmi: Enable HPD after HDMI IRQ is set up
   51c8414a3df7 ide: pmac: add of_node_put()
   1b75425347bf drivers/tty: add missing of_node_put()
   12cdbd02480c drivers/sbus/char: add of_node_put()
   c937d742441c sbus: char: add of_node_put()
   ec06c2365739 SUNRPC: Fix a potential race in xprt_connect()
   9e370ae200de nfs: don't dirty kernel pages read by direct-io
   4e52a4ee3fd4 liquidio: read sc->iq_no before release sc
   d65e4426decd bpf: Fix verifier log string check for bad alignment.
   f75ea663b145 bonding: fix 802.3ad state sent to partner when unbinding slave
   bac2acf174bb net: stmmac: Move debugfs init/exit to ->probe()/->remove()
   3fb715bbd6c1 ARC: io.h: Implement reads{x}()/writes{x}()
   1af56dd937b0 drm/amdgpu: wait for IB test on first device open
   ff3fec41655d drm/msm: Grab a vblank reference when waiting for commit_done
   2f71ee62933d drm/msm/dsi: configure VCO rate for 10nm PLL driver
   e66c684213a9 drm/msm: fix handling of cmdstream offset
   840811d0633f x86/earlyprintk/efi: Fix infinite loop on some screen widths
   66d3d30021bb drm/amd/display: Fix 6x4K displays light-up on Vega20 (v2)
   9bd27a8b616e net: ethernet: ave: Replace NET_IP_ALIGN with AVE_FRAME_HEADROOM
   82de9c06a97b tools/bpf: add addition type tests to test_btf
   277da06f81cd tools/bpf: fix two test_btf unit test cases
   2329fbe32f13 scsi: vmw_pscsi: Rearrange code to avoid multiple calls to free_irq during unload
   475aa44e2e0f scsi: libiscsi: Fix NULL pointer dereference in iscsi_eh_session_reset
   9e957fbd1a9a i2c: rcar: check bus state before reinitializing
   d8245e2588f7 Input: hyper-v - fix wakeup from suspend-to-idle
   02fb6a1529b1 mac80211_hwsim: fix module init error paths for netlink
   14b0e82132c7 IB/hfi1: Remove race conditions in user_sdma send path
   5623e2407bb8 locking/qspinlock, x86: Provide liveness guarantee
   8e02266863b2 locking/qspinlock: Re-order code
   70c590120035 Linux 4.18.23
   9cf5402745e6 dm zoned: Fix target BIO completion handling
   2fa0d692ad6f dm zoned: target: use refcount_t for dm zoned reference counters
   61bfc80fbe52 drm/amdgpu: update SMC firmware image for polaris10 variants
   df1c1bcf1c4e drm/amdgpu: update smu firmware images for VI variants (v2)
   db1207f9310d drm/amdgpu: add some additional vega10 pci ids
   5724922ae4d7 drm/amdkfd: add new vega10 pci ids
   d525e2cdf832 drm/amdgpu/powerplay: Apply avfs cks-off voltages on VI
   53835137f8e7 drm/i915/execlists: Apply a full mb before execution for Braswell
   5f99e72756cd drm/nouveau/kms: Fix memory leak in nv50_mstm_del()
   2c94183dbe89 powerpc: Look for "stdout-path" when setting up legacy consoles
   fb4f2f865a85 powerpc/msi: Fix NULL pointer access in teardown code
   056fb552b47f media: vb2: don't call __vb2_queue_cancel if vb2_start_streaming failed
   2729394ef4d3 tracing: Fix memory leak of instance function hash filters
   3ccaf85e64f0 tracing: Fix memory leak in set_trigger_filter()
   8d2b0c01ecb9 tracing: Fix memory leak in create_filter()
   b5a75238a5ea dm: call blk_queue_split() to impose device limits on bios
   a234ec33c6a3 dm cache metadata: verify cache has blocks in blocks_are_clean_separate_dirty()
   d4921c64ab6f dm thin: send event about thin-pool state change _after_ making it
   696142d867f8 ARM: dts: bcm2837: Fix polarity of wifi reset GPIOs
   a854f226870b ARM: mmp/mmp2: fix cpu_is_mmp2() on mmp2-dt
   2fd965e41eeb fuse: continue to send FUSE_RELEASEDIR when FUSE_OPEN returns ENOSYS
   eeb7db93fdc4 mmc: sdhci: fix the timeout check window for clock and reset
   ded687bfc9fc mmc: sdhci-omap: Fix DCRC error handling during tuning
   c40d26e2aebb mmc: core: use mrq->sbc when sending CMD23 for RPMB
   e7e84222759e MMC: OMAP: fix broken MMC on OMAP15XX/OMAP5910/OMAP310
   2ceb08b99848 ovl: fix decode of dir file handle with multi lower layers
   77d91ee8c4a3 arm64: dma-mapping: Fix FORCE_CONTIGUOUS buffer clearing
   ff0ded5c2c54 aio: fix spectre gadget in lookup_ioctx
   011f3bf616f1 pinctrl: sunxi: a83t: Fix IRQ offset typo for PH11
   419b946bd2f3 staging: olpc_dcon: add a missing dependency
   7d8acff1f129 scsi: raid_attrs: fix unused variable warning
   fb9e55d63efa bpf: fix off-by-one error in adjust_subprog_starts
   ef2ec7729026 IB/hfi1: Fix an out-of-bounds access in get_hw_stats
   0defcee2b10f ALSA: hda/realtek - Fixed headphone issue for ALC700
   24c4139a1a7b ALSA: fireface: fix reference to wrong register for clock configuration
   67f2dd243dc6 flexfiles: enforce per-mirror stateid only for v4 DSes
   8d30703d6d56 ocfs2: fix potential use after free
   6f2718bb8624 initramfs: clean old path before creating a hardlink
   23399a09fda4 kernel/kcov.c: mark funcs in __sanitizer_cov_trace_pc() as notrace
   d8979491c9fc proc: fixup map_files test on arm
   ad71ec08f8b1 debugobjects: avoid recursive calls with kmemleak
   8a5ae5ba9bd9 hfsplus: do not free node before using
   1b4d458615cf hfs: do not free node before using
   7bc2546c9a43 mm/page_alloc.c: fix calculation of pgdat->nr_zones
   21bf0b91ba0b ocfs2: fix deadlock caused by ocfs2_defrag_extent()
   a907830b4425 ACPI/IORT: Fix iort_get_platform_device_domain() uninitialized pointer value
   f4bebbf5c1da nvme-rdma: fix double freeing of async event data
   4a26fd2794ef nvme: flush namespace scanning work just before removing namespaces
   5cbbefd895b8 fscache, cachefiles: remove redundant variable 'cache'
   aac96283f143 cachefiles: Explicitly cast enumerated type in put_object
   214b0f7241f4 fscache: fix race between enablement and dropping of object
   2352fd0ff37c afs: Fix validation/callback interaction
   874cc883482c pstore/ram: Correctly calculate usable PRZ bytes
   f7dd088587d8 pvcalls-front: fixes incorrect error handling
   23f5fbe66464 Revert "xen/balloon: Mark unallocated host memory as UNUSABLE"
   60382e03a73f xen: xlate_mmu: add missing header to fix 'W=1' warning
   ee24ad3eedc5 drm/ast: fixed reading monitor EDID not stable issue
   2af2d7794f32 drm/amdgpu: Add delay after enable RLC ucode
   6ca52fbbee20 net: hisilicon: remove unexpected free_netdev
   7501d55624c2 ixgbe: recognize 1000BaseLX SFP modules as 1Gbps
   5a5d699051f2 igb: fix uninitialized variables
   9e42380eab9a cachefiles: Fix page leak in cachefiles_read_backing_file while vmscan is active
   4701317cee0f fscache: Fix race in fscache_op_complete() due to split atomic_sub & read
   7395908ac92d cachefiles: Fix an assertion failure when trying to update a failed object
   689b67edb5f0 ALSA: usb-audio: Add vendor and product name for Dell WD19 Dock
   4b61635fc96f netfilter: nf_tables: deactivate expressions in rule replecement routine
   ae9b39bd26ab usb: gadget: u_ether: fix unsafe list iteration
   866e243e89c4 net: thunderx: fix NULL pointer dereference in nic_remove
   914fa3100245 x86/kvm/vmx: fix old-style function declaration
   4da0cd45e88a KVM: x86: fix empty-body warnings
   7c1ff883a73e netfilter: nat: fix double register in masquerade modules
   6741803da10e netfilter: add missing error handling code for register functions
   f018d5eae708 IB/mlx5: Fix page fault handling for MW
   03f7f8880455 netfilter: ipv6: Preserve link scope traffic original oif
   c465b31ab032 drm/meson: add support for 1080p25 mode
   bb9e268e9d7e USB: omap_udc: fix rejection of out transfers when DMA is used
   8d5bbff94d07 USB: omap_udc: fix USB gadget functionality on Palm Tungsten E
   09ec687795df USB: omap_udc: fix omap_udc_start() on 15xx machines
   88d2c380cc95 USB: omap_udc: fix crashes on probe error and module removal
   1b288004247d USB: omap_udc: use devm_request_irq()
   7872b15dde9d ipvs: call ip_vs_dst_notifier earlier than ipv6_dev_notf
   c78d20b2a104 bpf: fix check of allowed specifiers in bpf_trace_printk
   cd5689673b74 RDMA/hns: Bugfix pbl configuration for rereg mr
   01b473861aa5 exportfs: do not read dentry after free
   9a215042b425 ASoC: omap-dmic: Add pm_qos handling to avoid overruns with CPU_IDLE
   e646abb7b69a ASoC: omap-mcpdm: Add pm_qos handling to avoid under/overruns with CPU_IDLE
   c45caaef2252 ASoC: omap-mcbsp: Fix latency value calculation for pm_qos
   b9daf5f65c75 RDMA/rdmavt: Fix rvt_create_ah function signature
   77861b6c5671 RDMA/bnxt_re: Avoid accessing the device structure after it is freed
   eb1f01e4226a RDMA/mlx5: Fix fence type for IB_WR_LOCAL_INV WR
   0d27ad481081 Btrfs: send, fix infinite loop due to directory rename dependencies
   4af31d016230 ARM: dts: at91: sama5d2: use the divided clock for SMC
   d2b8c6a8a1b8 phy: qcom-qusb2: Fix HSTX_TRIM tuning with fused value for SDM845
   ca9eb79073a8 phy: qcom-qusb2: Use HSTX_TRIM fused value as is
   aaab6336eb9c objtool: Fix segfault in .cold detection with -ffunction-sections
   ef2f6bee2159 objtool: Fix double-free in .cold detection error path
   e432cceeb8bd ASoC: acpi: fix: continue searching when machine is ignored
   bba8179fae04 PCI: imx6: Fix link training status detection in link up check
   5362dba7b696 perf tools: Restore proper cwd on return from mnt namespace
   d8c06c8c36b9 hwmon: (w83795) temp4_type has writable permission
   885bf92930f8 netfilter: xt_hashlimit: fix a possible memory leak in htable_create()
   8ae7dfd71f06 aio: fix failure to put the file pointer
   46b5558d5a1a spi: omap2-mcspi: Add missing suspend and resume calls
   5ec9552fc58b ASoC: dapm: Recalculate audio map forcely when card instantiated
   77b10c913a16 ASoC: omap-abe-twl6040: Fix missing audio card caused by deferred probing
   8c6f04133b20 hwmon: (ina2xx) Fix current value calculation
   c18d4263d24a s390/cpum_cf: Reject request for sampling in event initialization
   6b064b5de14f ASoC: wm_adsp: Fix dma-unsafe read of scratch registers
   60e1eccd5fb5 hwmon (ina2xx) Fix NULL id pointer in probe()
   f4b4f286496e s390/cio: Fix cleanup when unsupported IDA format is used
   ded23ec5857c s390/cio: Fix cleanup of pfn_array alloc failure
   4a0d7435b9c2 netfilter: nf_tables: fix use-after-free when deleting compat expressions
   9ce994a65de6 netfilter: xt_RATEEST: remove netns exit routine
   0f94c96587ab perf tools: Fix crash on synthesizing the unit
   255e04f5a250 selftests: add script to stress-test nft packet path vs. control plane
   0a7e0d53afd2 netfilter: nf_tables: don't skip inactive chains during update
   84dae51b3b3b sysv: return 'err' instead of 0 in __sysv_write_inode
   cfd7d86743d4 ASoC: sun8i-codec: fix crash on module removal
   fceaf70e406d tools: bpftool: prevent infinite loop in get_fdinfo()
   dc752d44748a ARM: OMAP1: ams-delta: Fix possible use of uninitialized field
   fa0914f171b6 ARM: dts: logicpd-somlv: Fix interrupt on mmc3_dat1
   5d2ea9832d2e ARM: dts: LogicPD Torpedo: Fix mmc3_dat1 interrupt
   7831d2076244 ARM: dts: am3517: Fix pinmuxing for CD on MMC1
   7d8ee81c2c7e staging: rtl8723bs: Fix the return value in case of error in 'rtw_wx_read32()'
   604f01123bc4 ASoC: qdsp6: q6afe: Fix wrong MI2S SD line mask
   ce35cd5ee1e3 ASoC: rsnd: fixup clock start checker
   3ea13a21d07a ARM: OMAP2+: prm44xx: Fix section annotation on omap44xx_prm_enable_io_wakeup
   8d42df355212 sctp: update frag_point when stream_interleave is set
   fafdf91a4940 net: phy: sfp: correct store of detected link modes
   524ad2fabf9b virtio-net: keep vnet header zeroed after processing XDP
   b3de25aafea1 tun: forbid iface creation with rtnl ops
   b9e84444a172 tcp: fix NULL ref in tail loss probe
   bfe7b2583c29 sctp: kfree_rcu asoc
   763df95b2195 rtnetlink: ndo_dflt_fdb_dump() only work for ARPHRD_ETHER devices
   13a1ce2ad74f Revert "net/ibm/emac: wrong bit is used for STA control"
   e21d76868b2c net: phy: don't allow __set_phy_supported to add unsupported modes
   ec6cff67dc81 net/mlx4_en: Change min MTU size to ETH_MIN_MTU
   4edc05c73545 net/mlx4_core: Correctly set PFC param if global pause is turned off.
   4c10e8930e85 net: 8139cp: fix a BUG triggered by changing mtu with network traffic
   751c494d491a ipv6: sr: properly initialize flowi6 prior passing to ip6_route_output
   f9c324ce9f08 neighbour: Avoid writing before skb->head in neigh_hh_output()
   612931cc02b5 ipv6: Check available headroom in ip6_xmit() even without options
   552cf47e54a1 ipv4: ipv6: netfilter: Adjust the frag mem limit when truesize changes
   7ec7433c5890 HID: quirks: fix RetroUSB.com devices
   455549628a0b mac80211: ignore NullFunc frames in the duplicate detection
   0c7da0aa7b1c mac80211: fix reordering of buffered broadcast packets
   ba2caf535dc3 mac80211: ignore tx status for PS stations in ieee80211_tx_status_ext
   2545ea1dcdcb mac80211: Clear beacon_int in ieee80211_do_stop
   39ca1b1a5f04 mac80211: fix GFP_KERNEL under tasklet context
   babb30868c1c mac80211_hwsim: Timer should be initialized before device registered
   1f1afa100306 cfg80211: Fix busy loop regression in ieee80211_ie_split_ric()
   3ca6ef9feafa libnvdimm, pfn: Pad pfn namespaces relative to other regions
   60b82363d437 kgdboc: fix KASAN global-out-of-bounds bug in param_set_kgdboc_var()
   3d7dc255fe92 tty: do not set TTY_IO_ERROR flag if console port
   adf103eac922 tty: serial: 8250_mtk: always resume the device in probe.
   9df22addf43b Drivers: hv: vmbus: Offload the handling of channels to two workqueues
   93fd54970c3c kprobes/x86: Fix instruction patching corruption when copying more than one RIP-relative instruction
   5af246208420 drm/i915: Downgrade Gen9 Plane WM latency error
   e8c4ec7a8cb5 drm/amdgpu/gmc8: always load MC firmware in the driver
   b8b88b63975b drm/amdgpu/gmc8: update MC firmware for polaris
   d1569baf730a drm/msm: Move fence put to where failure occurs
   1c2a37eae264 drm/lease: Send a distinct uevent
   f558434b38cc drm/amdgpu: update mc firmware image for polaris12 variants
   50152de6de4f crypto: do not free algorithm before using
   4352e6c016ec Revert commit ef9209b642f "staging: rtl8723bs: Fix indenting errors and an off-by-one mistake in core/rtw_mlme_ext.c"
   4e9e20b3082c staging: rtl8712: Fix possible buffer overrun
   05ae28903d5c cifs: Fix separator when building path from dentry
   f0fd776c02c4 Revert "x86/e820: put !E820_TYPE_RAM regions into memblock.reserved"
   7b1469c3f003 xhci: Prevent U1/U2 link pm states if exit latency is too long
   ac4556802707 USB: xhci: fix 'broken_suspend' placement in struct xchi_hcd
   dc04aae7f67c xhci: workaround CSS timeout on AMD SNPS 3.0 xHC
   d7bad132104f ARM: 8806/1: kprobes: Fix false positive with FORTIFY_SOURCE
   f192f717a29d dmaengine: cppi41: delete channel from pending list when stop channel
   9901c1492367 dmaengine: dw: Fix FIFO size for Intel Merrifield
   e62d2249c68e SUNRPC: Fix leak of krb5p encode pages
   a2a5e2fde8c3 vhost/vsock: fix use-after-free in network stack callers
   ed5a4844a3bd virtio/s390: fix race in ccw_io_helper()
   e956edc8a6c8 virtio/s390: avoid race on vcdev->config
   666ba2ee65fa parisc: Enable -ffunction-sections for modules on 32-bit kernel
   61502a480493 Revert "mfd: cros_ec: Use devm_kzalloc for private data"
   ccb717e43ac1 media: gspca: fix frame overflow error
   bce19403ad9e ALSA: hda/realtek - Fix speaker output regression on Thinkpad T570
   f24c98d59963 ALSA: pcm: Call snd_pcm_unlink() conditionally at closing
   f4be72e0bf8c ALSA: pcm: Fix starvation on down_write_nonblock()
   c93f1f31d1bd ALSA: hda: Add support for AMD Stoney Ridge
   01da3695a290 ALSA: usb-audio: Fix UAF decrement if card has no live interfaces in card.c
   74a5ec298bee ALSA: usb-audio: Add SMSL D1 to quirks for native DSD support
   026947331690 USB: serial: console: fix reported terminal settings
   673238324c4e USB: check usb_get_extra_descriptor for proper size
   3889e33bb1d0 usb: appledisplay: Add 27" Apple Cinema Display
   7a84b5a362e2 usb: quirk: add no-LPM quirk on SanDisk Ultra Flair device
   ca857e5103dd net: amd: add missing of_node_put()
   0da2f98fc745 team: no need to do team_notify_peers or team_mcast_rejoin when disabling port
   e9a722de9249 ibmvnic: Update driver queues after change in ring size support
   3f4134c1db37 ibmvnic: Fix RX queue buffer cleanup
   15604a70011d flexfiles: use per-mirror specified stateid for IO
   8c88fb37b2c9 iommu/vt-d: Use memunmap to free memremap
   7bdd56b674cd net: faraday: ftmac100: remove netif_running(netdev) check before disabling interrupts
   d30aa84cf6de riscv: fix warning in arch/riscv/include/asm/module.h
   2b492d33ce39 net/ibmvnic: Fix RTNL deadlock during device reset
   5aa8e66efe3c net/ibmnvic: Fix deadlock problem in reset
   d15648cc57d6 qed: Fix QM getters to always return a valid pq
   3f44a9e68949 qed: Fix bitmap_weight() check
   121e97d57b63 NFSv4: Fix a NFSv4 state manager deadlock
   176e0f131cbc mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
   a51b12e14de8 HID: multitouch: Add pointstick support for Cirque Touchpad
   61f7e06c559d Revert "HID: uhid: use strlcpy() instead of strncpy()"
   8b26c115fdab cpufreq: ti-cpufreq: Only register platform_device when supported
   bd3ddbff7a21 mtd: rawnand: qcom: Namespace prefix some commands
   8a70c6977ac9 tc-testing: tdc.py: Guard against lack of returncode in executed command
   ab8885c434bc tc-testing: tdc.py: ignore errors when decoding stdout/stderr
   625510a08d3c gpio: mockup: fix indicated direction
   6abc9f8ddae4 gpio: pxa: fix legacy non pinctrl aware builds again
   5e228fca94b5 net/mlx4: Fix UBSAN warning of signed integer overflow
   47a0a222daa6 net/mlx4_core: Fix uninitialized variable compilation warning
   5b53369dbb76 net/mlx4_core: Zero out lkey field in SW2HW_MPT fw command
   596f8d294724 drm/amd/display: Support amdgpu "max bpc" connector property (v2)
   31436df3a605 drm/amdgpu: Add amdgpu "max bpc" connector property (v2)
   021a2a365e35 nvme-fc: resolve io failures during connect
   9dc330320b96 Revert "usb: gadget: ffs: Fix BUG when userland exits with submitted AIO transfers"
   dbd1e112f822 usb: dwc2: pci: Fix an error code in probe
   88aeb64586df qed: Fix reading wrong value in loop condition
   d7cdbdfa0446 qed: Fix PTT leak in qed_drain()
   b678bf52f8a5 bnx2x: Assign unique DMAE channel number for FW DMAE transactions.
   a88bcdc2f534 amd/iommu: Fix Guest Virtual APIC Log Tail Address Register
   5f3352a721d7 batman-adv: Expand merged fragment buffer for full packet
   77bfec5b5de0 batman-adv: Use explicit tvlv padding for ELP packets
   a934bcb21cd2 HID: input: Ignore battery reported by Symbol DS4308
   e711cc95c600 test_firmware: fix error return getting clobbered
   baa8bdeb4c77 can: rcar_can: Fix erroneous registration
   ae6ed5e2d24a iommu/ipmmu-vmsa: Fix crash on early domain free
   894857cf8a55 mt76: fix building without CONFIG_LEDS_CLASS
   ae5157c74bb4 iommu/vt-d: Fix NULL pointer dereference in prq_event_thread()
   b882f3a05330 media: ipu3-cio2: Unregister device nodes first, then release resources
   d7fe182705df media: omap3isp: Unregister media device as first
   ee69fa8a8dd0 media: cec: check for non-OK/NACK conditions while claiming a LA

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index e862e8d6547a..d4a21a03d468 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cbaa90ae19895c927910b60812d3a879332bb4d5"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine ?= "5cc3fddf0e2a9f390b00d50f27c726a5aea86d85"
+SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.22"
+LINUX_VERSION ?= "4.18.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 41765b525125..2efa40f16cfa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.22"
+LINUX_VERSION ?= "4.18.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c2892e0099ce0b5f6effa3f925ff1a9c83e57997"
-SRCREV_machine ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine_qemuarm ?= "214d5273e58b56f89795bf384068e7b8c21c0f8d"
+SRCREV_machine ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index e8ecc8f55a15..1ecbec992243 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5a58952eb0d5ff7553e3eb53c65ef70b91b01c64"
-SRCREV_machine_qemuarm64 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_machine_qemumips ?= "fe54f591b6f365c8af386981b57714ccef0a9381"
-SRCREV_machine_qemuppc ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_machine_qemux86 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_machine_qemux86-64 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_machine_qemumips64 ?= "4b398ad91730576c68164798cc83c72d4b7f55cc"
-SRCREV_machine ?= "db2d813869a0501782469ecdb17e277a501c9f57"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine_qemuarm ?= "0002e7595bd75ecb2c1561d4b5c025130ccd31f3"
+SRCREV_machine_qemuarm64 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_machine_qemumips ?= "28983ad3c7a64c15c154c1edf1d11472abb778f7"
+SRCREV_machine_qemuppc ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_machine_qemux86 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_machine_qemux86-64 ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_machine_qemumips64 ?= "3be07269ed012fb6d148bd641ee40a40cb6cb13f"
+SRCREV_machine ?= "28e7781d57a59227bf1c08c7f3dbdfee16aa0dc2"
+SRCREV_meta ?= "ce063086f1a9bd2f8d361f91757755df83aa1f13"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.22"
+LINUX_VERSION ?= "4.18.25"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


