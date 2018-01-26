Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36E9878432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxQPA012485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:26 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:12 -0500
Message-ID: <aaf4d92300081b277edd63b93347e996fd073607.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] linux-yocto/4.9: update to v4.9.71
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:26 -0000
Content-Type: text/plain

Integrating the korg stable updates that comprise the following
commits:

   b632d710149f Linux 4.9.71
   ed70a2212526 ath9k: fix tx99 potential info leak
   8f23eb16afd8 icmp: don't fail on fragment reassembly time exceeded
   2eb165b9fbb7 IB/ipoib: Grab rtnl lock on heavy flush when calling ndo_open/stop
   0c70b35bf158 RDMA/cma: Avoid triggering undefined behavior
   31eb4108e107 macvlan: Only deliver one copy of the frame to the macvlan interface
   b64ab3ca9d31 udf: Avoid overflow when session starts at large offset
   91e0cf85caea scsi: bfa: integer overflow in debugfs
   64da4e8d00f1 scsi: sd: change allow_restart to bool in sysfs interface
   1cafdac89191 scsi: sd: change manage_start_stop to bool in sysfs interface
   8315bcf841ae rtl8188eu: Fix a possible sleep-in-atomic bug in rtw_disassoc_cmd
   6641d3e307f5 rtl8188eu: Fix a possible sleep-in-atomic bug in rtw_createbss_cmd
   28e006e14ff9 vt6655: Fix a possible sleep-in-atomic bug in vt6655_suspend
   04d5a2d5d2d0 IB/core: Fix calculation of maximum RoCE MTU
   c744ecec01ae scsi: scsi_devinfo: Add REPORTLUN2 to EMC SYMMETRIX blacklist entry
   f39486bd37ee raid5: Set R5_Expanded on parity devices as well as data.
   4fdb10391bca pinctrl: adi2: Fix Kconfig build problem
   afeeff4d6156 usb: musb: da8xx: fix babble condition handling
   92ad6c13e17e tty fix oops when rmmod 8250
   421910e924b6 soc: mediatek: pwrap: fix compiler errors
   7745382fe86c powerpc/perf/hv-24x7: Fix incorrect comparison in memord
   ab9d25711493 scsi: hpsa: destroy sas transport properties before scsi_host
   1723d6668df5 scsi: hpsa: cleanup sas_phy structures in sysfs when unloading
   237e053346f1 PCI: Detach driver before procfs & sysfs teardown on device remove
   8f84f861f99c RDMA/cxgb4: Declare stag as __be32
   769bca9339f0 xfs: fix incorrect extent state in xfs_bmap_add_extent_unwritten_real
   c82209949bba xfs: fix log block underflow during recovery cycle verification
   fc4177eacfa6 l2tp: cleanup l2tp_tunnel_delete calls
   6a559523ee66 nvme: use kref_get_unless_zero in nvme_find_get_ns
   e2fce5a5578d platform/x86: hp_accel: Add quirk for HP ProBook 440 G4
   7fab68e1f730 btrfs: tests: Fix a memory leak in error handling path in 'run_test()'
   b7ada2c0ea29 arm64: prevent regressions in compressed kernel image size when upgrading to binutils 2.27
   52aaa748a948 Ib/hfi1: Return actual operational VLs in port info query
   9102ed6a5f6a bcache: fix wrong cache_misses statistics
   c2a0531f59c3 bcache: explicitly destroy mutex while exiting
   75f66eeae657 GFS2: Take inode off order_write list when setting jdata flag
   026ffaf65879 scsi: scsi_debug: write_same: fix error report
   d8914530f247 thermal/drivers/step_wise: Fix temperature regulation misbehavior
   019433db872f ASoC: rsnd: rsnd_ssi_run_mods() needs to care ssi_parent_mod
   cf16dac8bd98 ppp: Destroy the mutex when cleanup
   27f5597c9859 clk: tegra: Fix cclk_lp divisor register
   54809e38a629 clk: hi6220: mark clock cs_atb_syspll as critical
   47b63ea40ee1 clk: imx6: refine hdmi_isfr's parent to make HDMI work on i.MX6 SoCs w/o VPU
   d6b6302c36b5 clk: mediatek: add the option for determining PLL source clock
   2850c3ec0d25 mm: Handle 0 flags in _calc_vm_trans() macro
   18498f1c7089 crypto: tcrypt - fix buffer lengths in test_aead_speed()
   2ed46cbf23fc arm-ccn: perf: Prevent module unload while PMU is in use
   c843e9f8f97f xfs: truncate pagecache before writeback in xfs_setattr_size()
   03bfadfb0d79 iommu/amd: Limit the IOVA page range to the specified addresses
   cb0acb37010c badblocks: fix wrong return value in badblocks_set if badblocks are disabled
   dcdca123814c target/file: Do not return error for UNMAP if length is zero
   998201fdc5c9 target:fix condition return in core_pr_dump_initiator_port()
   a4f54ec403da iscsi-target: fix memory leak in lio_target_tiqn_addtpg()
   e086a82a926a target/iscsi: Fix a race condition in iscsit_add_reject_from_cmd()
   abc4b4420af8 platform/x86: intel_punit_ipc: Fix resource ioremap warning
   6e5a846d5172 powerpc/ipic: Fix status get and status clear
   d7e7c431d621 powerpc/opal: Fix EBUSY bug in acquiring tokens
   a463f9c5dfd1 netfilter: ipvs: Fix inappropriate output of procfs
   b3b6d1eea0de iommu/mediatek: Fix driver name
   9a4bf05126f4 PCI: Do not allocate more buses than available in parent
   29a404be7b30 powerpc/powernv/cpufreq: Fix the frequency read by /proc/cpuinfo
   f44d28e0348d PCI/PME: Handle invalid data when reading Root Status
   5a7192bc389e dmaengine: ti-dma-crossbar: Correct am335x/am43xx mux value type
   03a48dc96505 ASoC: Intel: Skylake: Fix uuid_module memory leak in failure case
   9146b10f8cd6 rtc: pcf8563: fix output clock rate
   cf53526f3312 video: fbdev: au1200fb: Return an error code if a memory allocation fails
   90e2591f6f3f video: fbdev: au1200fb: Release some resources if a memory allocation fails
   92c3c7db8336 video: udlfb: Fix read EDID timeout
   aecce5fc047a fbdev: controlfb: Add missing modes to fix out of bounds access
   0312ab0f0e43 sfc: don't warn on successful change of MAC
   da73389e8aa7 HID: cp2112: fix broken gpio_direction_input callback
   e15628b293a7 Revert "x86/acpi: Set persistent cpuid <-> nodeid mapping when booting"
   25b0b3f2373d target: fix race during implicit transition work flushes
   892e4f9bc2e2 target: fix ALUA transition timeout handling
   0d34f4770ea1 target: Use system workqueue for ALUA transitions
   8f60ef94477c btrfs: add missing memset while reading compressed inline extents
   5d460d359abe NFSv4.1 respect server's max size in CREATE_SESSION
   88af4e34771c efi/esrt: Cleanup bad memory map log messages
   e30b840d4668 perf symbols: Fix symbols__fixup_end heuristic for corner cases
   2a47e7de0822 tty: fix data race in tty_ldisc_ref_wait()
   70f450fc8610 tty: don't panic on OOM in tty_set_ldisc()
   3d57ec51d204 rxrpc: Ignore BUSY packets on old calls
   42b6d6e824d3 net: mpls: Fix nexthop alive tracking on down events
   fd27dbcae937 net/mlx4_core: Avoid delays during VF driver device shutdown
   65bfe003dceb nvmet-rdma: Fix a possible uninitialized variable dereference
   571e47760de5 nvmet: confirm sq percpu has scheduled and switched to atomic
   af0cee086b09 nvme-loop: fix a possible use-after-free when destroying the admin queue
   a8939aac82b0 afs: Fix abort on signal while waiting for call completion
   d43dda072544 afs: Fix afs_kill_pages()
   856bb4b609ee afs: Fix page leak in afs_write_begin()
   833acb3e09db afs: Populate and use client modification time
   a3e7a29abf0b afs: Better abort and net error handling
   ab2390611619 afs: Invalid op ID should abort with RXGEN_OPCODE
   972e7b7cbf5c afs: Fix the maths in afs_fs_store_data()
   9329ae4cb10e afs: Prevent callback expiry timer overflow
   7da1b85a75d4 afs: Migrate vlocation fields to 64-bit
   7286fad15704 afs: Flush outstanding writes when an fd is closed
   eaaad7646d3d afs: Deal with an empty callback array
   900048089cc1 afs: Adjust mode bits processing
   ba47c1597480 afs: Populate group ID from vnode status
   c250fae9ad4b afs: Fix missing put_page()
   b29c7b7c62d5 drm/radeon: reinstate oland workaround for sclk
   2a84fce9b039 mmc: mediatek: Fixed bug where clock frequency could be set wrong
   28714e962a71 sched/deadline: Use deadline instead of period when calculating overflow
   a2e29113f1ab sched/deadline: Throttle a constrained deadline task activated after the deadline
   9cc56a00eab7 sched/deadline: Make sure the replenishment timer fires in the next period
   0a4d4dac5e34 sched/deadline: Add missing update_rq_clock() in dl_task_timer()
   8d3a318194ec iwlwifi: mvm: cleanup pending frames in DQA mode
   a524bb57dd36 Drivers: hv: util: move waiting for release to hv_utils_transport itself
   da626b13ce32 drm/radeon/si: add dpm quirk for Oland
   1867eb805091 fjes: Fix wrong netdevice feature flags
   91510a623baa scsi: hpsa: do not timeout reset operations
   0f07e7611184 scsi: hpsa: limit outstanding rescans
   c81410a4353d scsi: hpsa: update check for logical volume status
   8652baa5a31d ASoC: rcar: clear DE bit only in PDMACHCR when it stops
   fd2530a4ee62 openrisc: fix issue handling 8 byte get_user calls
   18b39b61b2c6 intel_th: pci: Add Gemini Lake support
   3544f57578a6 drm: amd: remove broken include path
   4c9c0971271d qed: Fix interrupt flags on Rx LL2
   ac04ab9624b5 qed: Fix mapping leak on LL2 rx flow
   8de6d7b28d2f qed: Align CIDs according to DORQ requirement
   fddc3df7647e mlxsw: reg: Fix SPVMLR max record count
   4c8b4e60b575 mlxsw: reg: Fix SPVM max record count
   6c548e90a0bc net: Resend IGMP memberships upon peer notification.
   889163d75fe5 irqchip/mvebu-odmi: Select GENERIC_MSI_IRQ_DOMAIN
   e30ccb5f1c7e dmaengine: Fix array index out of bounds warning in __get_unmap_pool()
   46cbe3f51c51 net: wimax/i2400m: fix NULL-deref at probe
   2e70c4d5de87 writeback: fix memory leak in wb_queue_work()
   d28046fb8c43 blk-mq: Fix tagset reinit in the presence of cpu hot-unplug
   143d13d1e6c0 ASoC: rsnd: fix sound route path when using SRC6/SRC9
   97b75dad9dd1 netfilter: bridge: honor frag_max_size when refragmenting
   38780b9ae45a drm/omap: fix dmabuf mmap for dma_alloc'ed buffers
   8fb782bbd212 Input: i8042 - add TUXEDO BU1406 (N24_25BU) to the nomux list
   817f60ccf72c NFSD: fix nfsd_reset_versions for NFSv4.
   0154269f9c12 NFSD: fix nfsd_minorversion(.., NFSD_AVAIL)
   063c753ef78b drm/amdgpu: fix parser init error path to avoid crash in parser fini
   3d40364d333e iommu/io-pgtable-arm-v7s: Check for leaf entry before dereferencing it
   721c136ac278 net/mlx5: Don't save PCI state when PCI error is detected
   248cbd97be81 net/mlx5: Fix create autogroup prev initializer
   515d78dc0a89 rxrpc: Wake up the transmitter if Rx window size increases on the peer
   e85b9bc29b04 net: bcmgenet: Power up the internal PHY before probing the MII
   f9ac24794f2e net: bcmgenet: synchronize irq0 status between the isr and task
   4c3727f6add5 net: bcmgenet: power down internal phy if open or resume fails
   66e522ab02cc net: bcmgenet: reserved phy revisions must be checked first
   dc8d63c43af0 net: bcmgenet: correct MIB access of UniMAC RUNT counters
   bb5c42a5b1d2 net: bcmgenet: correct the RBUF_OVFL_CNT and RBUF_ERR_CNT MIB values
   72cd0c3f6616 bnxt_en: Ignore 0 value in autoneg supported speed from firmware.
   ae0ebdba9667 net: initialize msg.msg_flags in recvfrom
   6783015096dc userfaultfd: selftest: vm: allow to build in vm/ directory
   275314e90c5e userfaultfd: shmem: __do_fault requires VM_FAULT_NOPAGE
   9bcd15bdfb61 md-cluster: free md_cluster_info if node leave cluster
   9841d7b08ff6 usb: xhci-mtk: check hcc_params after adding primary hcd
   215df1f35542 KVM: nVMX: do not warn when MSR bitmap address is not backed
   50fc2d4152fb usb: phy: isp1301: Add OF device ID table
   bf864220a59c mac80211: Fix addition of mesh configuration element
   32e2ae03283b ext4: fix crash when a directory's i_size is too small
   6a851bb99e5c ext4: fix fdatasync(2) after fallocate(2) operation
   679dbeac0b6b dmaengine: dmatest: move callback wait queue to thread context
   744cb5ab3372 eeprom: at24: change nvmem stride to 1
   d266817f5028 sched/rt: Do not pull from current CPU if only one CPU to pull
   9c537f06d61a nfs: don't wait on commit in nfs_commit_inode() if there were no commit requests
   3bdb508d686e xhci: Don't add a virt_dev to the devs array before it's fully allocated
   7336f5481f6c Bluetooth: btusb: driver to enable the usb-wakeup feature
   cdfe4c0091a8 usb: xhci: fix TDS for MTK xHCI1.1
   e081bd0d70bd ceph: drop negative child dentries before try pruning inode's alias
   14513e49c43c usbip: fix stub_send_ret_submit() vulnerability to null transfer_buffer
   f3e957266ae5 usbip: fix stub_rx: harden CMD_SUBMIT path to handle malicious input
   b6dbace92ed7 usb: add helper to extract bits 12:11 of wMaxPacketSize
   20e825cdf7a1 usbip: fix stub_rx: get_pipe() to validate endpoint number
   99542e468b76 USB: core: prevent malicious bNumInterfaces overflow
   0d29ae4f5033 USB: uas and storage: Add US_FL_BROKEN_FUA for another JMicron JMS567 ID
   d760f9034195 tracing: Allocate mask_str buffer dynamically
   d1175423ce67 autofs: fix careless error in recent commit
   c32e053a11f2 crypto: salsa20 - fix blkcipher_walk API usage
   43259d07fceb crypto: hmac - require that the underlying hash algorithm is unkeyed
   cd9b59861f9c crypto: rsa - fix buffer overread when stripping leading zeroes
   1fb73eae9624 mfd: fsl-imx25: Clean up irq settings during removal
   ee52d08d2e09 Linux 4.9.70
   349130bb0391 RDMA/cxgb4: Annotate r2 and stag as __be32
   b7d3f2b5dca9 md: free unused memory after bitmap resize
   93dedcf5a177 audit: ensure that 'audit=1' actually enables audit for PID 1
   a625a16c8aea ipvlan: fix ipv6 outbound device
   97c668702126 kbuild: do not call cc-option before KBUILD_CFLAGS initialization
   eae3f3ab7fb3 powerpc/64: Fix checksum folding in csum_tcpudp_nofold and ip_fast_csum_nofold
   9414a6309c72 KVM: arm/arm64: vgic-its: Preserve the revious read from the pending table
   80c0f4777fd6 fix kcm_clone()
   16648cbcd332 usb: gadget: ffs: Forbid usb_ep_alloc_request from sleeping
   47273f0d398d s390: always save and restore all registers on context switch
   f8dac5bfbd8e ipmi: Stop timers before cleaning up the module
   0cab694ab7bc Fix handling of verdicts after NF_QUEUE
   cf00fd3d526c tipc: call tipc_rcv() only if bearer is up in tipc_udp_recv()
   0cfe6df93834 s390/qeth: fix thinko in IPv4 multicast address tracking
   1d55222b14bd s390/qeth: fix GSO throughput regression
   fbf0dfe7ad9f s390/qeth: build max size GSO skbs on L2 devices
   aa0080f1ad08 tcp/dccp: block bh before arming time_wait timer
   30985e3beb73 stmmac: reset last TSO segment size after device open
   564fe3e0e95e net: remove hlist_nulls_add_tail_rcu()
   80ad5bd1b45f usbnet: fix alignment for frames with no ethernet header
   5471afeef413 net/packet: fix a race in packet_bind() and packet_notifier()
   30c573affac8 packet: fix crash in fanout_demux_rollover()
   5f218c3fd11a sit: update frag_off info
   3259862dd73b rds: Fix NULL pointer dereference in __rds_rdma_map
   96b4a8ac9a55 tipc: fix memory leak in tipc_accept_from_sock()
   20610f5bbd23 s390/qeth: fix early exit from error path
   32436bf375b0 net: qmi_wwan: add Quectel BG96 2c7c:0296
   c91efc7862b3 Linux 4.9.69
   15b175223e53 afs: Connect up the CB.ProbeUuid
   9048b2420e32 IB/mlx5: Assign send CQ and recv CQ of UMR QP
   06fea09c0959 IB/mlx4: Increase maximal message size under UD QP
   6ceabde66643 xfrm: Copy policy family in clone_policy
   74b470ce478a jump_label: Invoke jump_label_test() via early_initcall()
   22d2456faefa atm: horizon: Fix irq release error
   c488c2e141bc clk: uniphier: fix DAPLL2 clock rate of Pro5
   f45f4f8a7cd8 bpf: fix lockdep splat
   9904da5a09ce sctp: use the right sk after waking up from wait_buf sleep
   1158ecd51ec1 sctp: do not free asoc when it is already dead in sctp_sendmsg
   1618400444d0 zsmalloc: calling zs_map_object() from irq is a bug
   7da67d1d98f6 sparc64/mm: set fields in deferred pages
   1a5a4c6e868f block: wake up all tasks blocked in get_request()
   c31bfe7de243 dt-bindings: usb: fix reg-property port-number range
   1eeb1edfd3c9 xfs: fix forgotten rcu read unlock when skipping inode reclaim
   acbe10423b1a sunrpc: Fix rpc_task_begin trace point
   509e9b805c52 NFS: Fix a typo in nfs_rename()
   a780a728475d dynamic-debug-howto: fix optional/omitted ending line number to be LARGE instead of 0
   a77c11607593 lib/genalloc.c: make the avail variable an atomic_long_t
   e9672477a5f0 drivers/rapidio/devices/rio_mport_cdev.c: fix resource leak in error handling path in 'rio_dma_transfer()'
   007e20bd0fdd route: update fnhe_expires for redirect when the fnhe exists
   7c4fa0c1c9ca route: also update fnhe_genid when updating a route cache
   2388d52d7256 gre6: use log_ecn_error module parameter in ip6_tnl_rcv()
   6a8ab06660dc mac80211_hwsim: Fix memory leak in hwsim_new_radio_nl()
   0965ed575190 x86/mpx/selftests: Fix up weird arrays
   b96d06e6d6e0 coccinelle: fix parallel build with CHECK=scripts/coccicheck
   55042e28b985 kbuild: pkg: use --transform option to prefix paths in tar
   7290cfeb4436 EDAC, i5000, i5400: Fix definition of NRECMEMB register
   62c12d671c49 EDAC, i5000, i5400: Fix use of MTR_DRAM_WIDTH macro
   d28faebe8b09 powerpc/powernv/ioda2: Gracefully fail if too many TCE levels requested
   92527dc32a69 drm/amd/amdgpu: fix console deadlock if late init failed
   e8d5b115c6ea axonram: Fix gendisk handling
   8818eb851c2d netfilter: don't track fragmented packets
   36a14374b568 zram: set physical queue limits to avoid array out of bounds accesses
   bc8859174d98 blk-mq: initialize mq kobjects in blk_mq_init_allocated_queue()
   567df7459e12 i2c: riic: fix restart condition
   e46126e51ee8 crypto: s5p-sss - Fix completing crypto request in IRQ handler
   05a59bc2f3c0 ipv6: reorder icmpv6_init() and ip6_mr_init()
   f191e15e4acd ibmvnic: Allocate number of rx/tx buffers agreed on by firmware
   f3b1f93ed23b ibmvnic: Fix overflowing firmware/hardware TX queue
   742e67d2b7ee rds: tcp: Sequence teardown of listen and acceptor sockets to avoid races
   d8f147ac75bb bnx2x: do not rollback VF MAC/VLAN filters we did not configure
   cdef3be8c7bb bnx2x: fix detection of VLAN filtering feature for VF
   f73fcb25f4bb bnx2x: fix possible overrun of VFPF multicast addresses array
   ae6b3452faf7 bnx2x: prevent crash when accessing PTP with interface down
   c72c7f244265 spi_ks8995: regs_size incorrect for some devices
   1ace4dabf624 spi_ks8995: fix "BUG: key accdaa28 not in .data!"
   b1f71147a188 KVM: arm/arm64: VGIC: Fix command handling while ITS being disabled
   aafb72d2ed55 arm64: KVM: Survive unknown traps from guests
   5e366aaec185 arm: KVM: Survive unknown traps from guests
   c886f281b9e0 KVM: nVMX: reset nested_run_pending if the vCPU is going to be reset
   54e1ae1f21f5 irqchip/crossbar: Fix incorrect type of register size
   d32c4dedcc6d scsi: lpfc: Fix crash during Hardware error recovery on SLI3 adapters
   1e7208d75928 scsi: qla2xxx: Fix ql_dump_buffer
   757e1845d6c3 workqueue: trigger WARN if queue_delayed_work() is called with NULL @wq
   da6a95b0ef82 libata: drop WARN from protocol error in ata_sff_qc_issue()
   29deec403d56 kvm: nVMX: VMCLEAR should not cause the vCPU to shut down
   2afb2d892c1d usb: gadget: udc: net2280: Fix tmp reusage in net2280 driver
   82f79a4423fc usb: gadget: pxa27x: Test for a valid argument pointer
   7abf66d78e89 usb: dwc3: gadget: Fix system suspend/resume on TI platforms
   8fe9ea81b1e9 USB: gadgetfs: Fix a potential memory leak in 'dev_config()'
   59682e70c980 usb: gadget: configs: plug memory leak
   881b5d4841fc HID: chicony: Add support for another ASUS Zen AiO keyboard
   1bc827aabc70 gpio: altera: Use handle_level_irq when configured as a level_high
   c7c866711799 ASoC: rcar: avoid SSI_MODEx settings for SSI8
   202c73946455 ARM: OMAP2+: Release device node after it is no longer needed.
   d3954c5ced8e ARM: OMAP2+: Fix device node reference counts
   4aff02804715 powerpc/64: Fix checksum folding in csum_add()
   d57cb693c592 module: set __jump_table alignment to 8
   f348a1030eb6 lirc: fix dead lock between open and wakeup_filter
   7ae7408c4352 powerpc: Fix compiling a BE kernel with a powerpc64le toolchain
   cd662c8e51a1 selftest/powerpc: Fix false failures for skipped tests
   0bf8f6e7205a powerpc/64: Invalidate process table caching after setting process table
   8c6ebeb4087e x86/hpet: Prevent might sleep splat on resume
   4e4a9ebe33a6 sched/fair: Make select_idle_cpu() more aggressive
   29dc610cfc7c x86/platform/uv/BAU: Fix HUB errors by remove initial write to sw-ack register
   b2cb09597b1f x86/selftests: Add clobbers for int80 on x86_64
   93247ff1fafe ARM: OMAP2+: gpmc-onenand: propagate error on initialization failure
   f14f6fabfb54 vti6: Don't report path MTU below IPV6_MIN_MTU.
   5d4d0a95437e ARM: 8657/1: uaccess: consistently check object sizes
   7c4615c853fa Revert "spi: SPI_FSL_DSPI should depend on HAS_DMA"
   b6c15a7c6e79 Revert "drm/armada: Fix compile fail"
   6a53078b9357 mm: drop unused pmdp_huge_get_and_clear_notify()
   c2edc33d4abf thp: fix MADV_DONTNEED vs. numa balancing race
   7bdd685cef4b thp: reduce indentation level in change_huge_pmd()
   5bcb9c842a53 ARM: avoid faulting on qemu
   6192f870abf2 ARM: BUG if jumping to usermode address in kernel mode
   112b8a8f558d usb: f_fs: Force Reserved1=1 in OS_DESC_EXT_COMPAT
   47ab72034e9d crypto: talitos - fix ctr-aes-talitos
   24ab6e7f6b61 crypto: talitos - fix use of sg_link_tbl_len
   6bf30e664221 crypto: talitos - fix AEAD for sha224 on non sha224 capable chips
   552f74cbd6ec crypto: talitos - fix setkey to check key weakness
   5272b0e1c382 crypto: talitos - fix memory corruption on SEC2
   bde6667a7df1 crypto: talitos - fix AEAD test failures
   3f0597ae9a38 bus: arm-ccn: fix module unloading Error: Removing state 147 which has instances left.
   793eed33da5f bus: arm-ccn: Fix use of smp_processor_id() in preemptible context
   595aca74c67a bus: arm-ccn: Check memory allocation failure
   a0a2f97d0375 bus: arm-cci: Fix use of smp_processor_id() in preemptible context
   a39224199e97 arm64: fpsimd: Prevent registers leaking from dead tasks
   7df3dbef3dd5 KVM: arm/arm64: vgic-its: Check result of allocation before use
   42c3f4c55f10 KVM: arm/arm64: vgic-irqfd: Fix MSI entry allocation
   cf6668d57a26 KVM: arm/arm64: Fix broken GICH_ELRSR big endian conversion
   6ead44d4b5b8 KVM: VMX: remove I/O port 0x80 bypass on Intel hosts
   6ed459712e26 arm: KVM: Fix VTTBR_BADDR_MASK BUG_ON off-by-one
   63fba9ff76f0 arm64: KVM: fix VTTBR_BADDR_MASK BUG_ON off-by-one
   730810d92327 media: dvb: i2c transfers over usb cannot be done from stack
   4f128c8aa35b drm/exynos: gem: Drop NONCONTIG flag for buffers allocated without IOMMU
   30b18ee253a0 kdb: Fix handling of kallsyms_symbol_next() return value
   4a70f07da853 brcmfmac: change driver unbind order of the sdio function devices
   8950c982fffd powerpc/64s: Initialize ISAv3 MMU registers before setting partition table
   ffb17c0cce84 KVM: s390: Fix skey emulation permission check
   bd6a7055b84b s390: fix compat system call table
   ff3d4fd5374f smp/hotplug: Move step CPUHP_AP_SMPCFD_DYING to the correct place
   e17f2b51617d iommu/vt-d: Fix scatterlist offset handling
   173c8c346587 ALSA: usb-audio: Add check return value for usb_string()
   c40457c952ec ALSA: usb-audio: Fix out-of-bound error
   20ca63e0968e ALSA: seq: Remove spurious WARN_ON() at timer check
   45ddff3ce4e9 ALSA: pcm: prevent UAF in snd_pcm_info
   8974b0320cc8 btrfs: fix missing error return in btrfs_drop_snapshot
   9cf0eaf88d74 KVM: x86: fix APIC page invalidation
   6662a55fa6eb x86/PCI: Make broadcom_postcore_init() check acpi_disabled
   3d4696248c08 X.509: fix comparisons of ->pkey_algo
   d4f134700c20 X.509: reject invalid BIT STRING for subjectPublicKey
   982707eb4ff8 KEYS: add missing permission check for request_key() destination
   44acfcb6dd73 ASN.1: check for error from ASN1_OP_END__ACT actions
   608845ad4986 ASN.1: fix out-of-bounds read when parsing indefinite length item
   8b5106e1d22c efi/esrt: Use memunmap() instead of kfree() to free the remapping
   29c3b7a85409 efi: Move some sysfs files to be read-only by root
   35b4bfbda54b scsi: libsas: align sata_device's rps_resp on a cacheline
   326ebe77f0c5 scsi: use dma_get_cache_alignment() as minimum DMA alignment
   4cb4d78c57f8 scsi: dma-mapping: always provide dma_get_cache_alignment
   1db069c057a1 isa: Prevent NULL dereference in isa_bus driver callbacks
   3aa6d7f8542e hv: kvp: Avoid reading past allocated blocks from KVP file
   893fab0c338b virtio: release virtio index when fail to device_register
   4b4e6f675846 can: usb_8dev: cancel urb on -EPIPE and -EPROTO
   0cdac09e6aee can: esd_usb2: cancel urb on -EPIPE and -EPROTO
   d3b72254789f can: ems_usb: cancel urb on -EPIPE and -EPROTO
   4665483e4797 can: kvaser_usb: cancel urb on -EPIPE and -EPROTO
   d724a677f0c1 can: kvaser_usb: ratelimit errors if incomplete messages are received
   561384a9cf17 can: kvaser_usb: Fix comparison bug in kvaser_usb_read_bulk_callback()
   f89682bb3cf2 can: kvaser_usb: free buf in error paths
   6a3a713880a5 can: ti_hecc: Fix napi poll return value for repoll
   fbe9a14180d6 usb: gadget: udc: renesas_usb3: fix number of the pipes
   3781db07c79e Linux 4.9.68
   3671e6728f79 xen-netfront: avoid crashing on resume after a failure in talk_to_netback()
   08dd03812e8b usb: host: fix incorrect updating of offset
   20c315ebabc5 USB: usbfs: Filter flags passed in from user space
   545c10375330 USB: devio: Prevent integer overflow in proc_do_submiturb()
   d6ab871c432d USB: Increase usbfs transfer limit
   05ffc7ed5527 USB: core: Add type-specific length check of BOS descriptors
   34ba2f04a480 usb: xhci: fix panic in xhci_free_virt_devices_depth_first
   e328dff288e6 usb: hub: Cycle HUB power when initialization fails
   0af23e49316d dma-buf: Update kerneldoc for sync_file_create
   3a83421d482e dma-buf/sync_file: hold reference to fence when creating sync_file
   424bdc5df002 dma-buf/sw_sync: force signal all unsignaled fences on dying timeline
   f5e0724e76c2 dma-fence: Introduce drm_fence_set_error() helper
   d3b029a44e14 dma-fence: Wrap querying the fence->status
   f55d17e9c3af dma-fence: Clear fence->status during dma_fence_init()
   9ae85fabdfc0 dma-buf/sw_sync: clean up list before signaling the fence
   4496b88c0674 dma-buf/sw_sync: move timeline_fence_ops around
   db767404ad09 dma-buf/sw-sync: Use an rbtree to sort fences in the timeline
   e82ecb230924 dma-buf/sw-sync: Fix locking around sync_timeline lists
   1bf0b23c07f1 dma-buf/sw-sync: sync_pt is private and of fixed size
   f14ad42b8743 dma-buf/sw-sync: Reduce irqsave/irqrestore from known context
   985b5b238436 dma-buf/sw-sync: Prevent user overflow on timeline advance
   fc839ecb8eda dma-buf/sw-sync: Fix the is-signaled test to handle u32 wraparound
   b53525eaac55 dma-buf/dma-fence: Extract __dma_fence_is_later()
   c13a05a8017b net: fec: fix multicast filtering hardware setup
   a767c866735c xen-netback: vif counters from int/long to u64
   959b8e0ba293 cec: initiator should be the same as the destination for, poll
   017a499be574 xen-netfront: Improve error handling during initialization
   c93c09a057b7 mm: avoid returning VM_FAULT_RETRY from ->page_mkwrite handlers
   3e550debcf75 vfio/spapr: Fix missing mutex unlock when creating a window
   6129fd988225 be2net: fix initial MAC setting
   6a9ffb5a87d8 net: thunderx: avoid dereferencing xcv when NULL
   3325615d2b50 net: phy: micrel: KSZ8795 do not set SUPPORTED_[Asym_]Pause
   c8d6f83d3b6e gtp: fix cross netns recv on gtp socket
   d812be828832 gtp: clear DF bit on GTP packet tx
   3976dd677e89 nvmet: cancel fatal error and flush async work before free controller
   6bd89953fb1f i2c: i2c-cadence: Initialize configuration before probing devices
   fe8bdc9b79ee tcp: correct memory barrier usage in tcp_check_space()
   49c3164e6d84 dmaengine: pl330: fix double lock
   aad54ba21dd8 tipc: fix cleanup at module unload
   6313adb8de02 tipc: fix nametbl_lock soft lockup at module exit
   e8240244880b RDMA/qedr: Fix RDMA CM loopback
   8d4198f8c66b RDMA/qedr: Return success when not changing QP state
   dee48e57ae22 mac80211: don't try to sleep in rate_control_rate_init()
   cab00a9c16c0 drm/amdgpu: fix unload driver issue for virtual display
   b75e47cf8439 x86/fpu: Set the xcomp_bv when we fake up a XSAVES area
   05071c058d20 net: sctp: fix array overrun read on sctp_timer_tbl
   2001ccb4dea4 drm/exynos/decon5433: set STANDALONE_UPDATE_F on output enablement
   4ee340c06bf2 drm/amdgpu: fix bug set incorrect value to vce register
   d8a544c92087 qla2xxx: Fix wrong IOCB type assumption
   57e76dbbc560 powerpc/mm: Fix memory hotplug BUG() on radix
   a88ff235e8ad perf/x86/intel: Account interrupts for PEBS errors
   72232a3bc5df NFSv4: Fix client recovery when server reboots multiple times
   cda72bbb7bac mac80211: prevent skb/txq mismatch
   ee01c59bf838 KVM: arm/arm64: Fix occasional warning from the timer work function
   72afbf76344f drm/exynos/decon5433: set STANDALONE_UPDATE_F also if planes are disabled
   cca6bca00973 drm/exynos/decon5433: update shadow registers iff there are active windows
   9f800573a31b nfs: Don't take a reference on fl->fl_file for LOCK operation
   c682ae717759 ravb: Remove Rx overflow log messages
   bc13325a2410 mac80211: calculate min channel width correctly
   fae478cd9311 mm: fix remote numa hits statistics
   71ab86262b66 net: qrtr: Mark 'buf' as little endian
   c4081f91981b libfs: Modify mount_pseudo_xattr to be clear it is not a userspace mount
   d9a4e70f23c3 net/appletalk: Fix kernel memory disclosure
   e3a252a9924c be2net: fix unicast list filling
   b4c3022e673a be2net: fix accesses to unicast list
   105b403ba0de vti6: fix device register to report IFLA_INFO_KIND
   08bd389c9ef8 ARM: OMAP1: DMA: Correct the number of logical channels
   9a777021eeb4 ARM: OMAP2+: Fix WL1283 Bluetooth Baud Rate
   a97b72427e5f net: systemport: Pad packet before inserting TSB
   bcc7511ef256 net: systemport: Utilize skb_put_padto()
   30bd002c454a libcxgb: fix error check for ip6_route_output()
   5eb97be87981 usb: gadget: f_fs: Fix ExtCompat descriptor validation
   7468e767d8f2 dmaengine: stm32-dma: Fix null pointer dereference in stm32_dma_tx_status
   000e7180633f dmaengine: stm32-dma: Set correct args number for DMA request from DT
   d2d74d0e58b2 l2tp: take remote address into account in l2tp_ip and l2tp_ip6 socket lookups
   55c050ae5165 net/mlx4_en: Fix type mismatch for 32-bit systems
   771c831c1bde dax: Avoid page invalidation races and unnecessary radix tree traversals
   2383ba62b535 iio: adc: ti-ads1015: add 10% to conversion wait time
   7aa534b8a33f tools include: Do not use poison with C++
   a65f24aac76b kprobes/x86: Disable preemption in ftrace-based jprobes
   a730e156bb75 perf test attr: Fix ignored test case result
   8f6e33aad048 usbip: tools: Install all headers needed for libusbip development
   5840a285a1a2 sysrq : fix Show Regs call trace on ARM
   7f44b524a0ad EDAC, sb_edac: Fix missing break in switch
   61b7a6f1cea3 x86/entry: Use SYSCALL_DEFINE() macros for sys_modify_ldt()
   a816a7e1e70b serial: 8250: Preserve DLD[7:4] for PORT_XR17V35X
   68dfd4dd0900 usb: phy: tahvo: fix error handling in tahvo_usb_probe()
   de139e81d350 mmc: sdhci-msm: fix issue with power irq
   e042fd0f0318 spi: spi-axi: fix potential use-after-free after deregistration
   b3d7cc5a84b4 spi: sh-msiof: Fix DMA transfer size check
   ee08fca9a14d staging: rtl8188eu: avoid a null dereference on pmlmepriv
   946d33e1e6cd serial: 8250_fintek: Fix rs485 disablement on invalid ioctl()
   510f6573ef5d m68k: fix ColdFire node shift size calculation
   e5f2421df135 staging: greybus: loopback: Fix iteration count on async path
   8a95afc48576 selftests/x86/ldt_get: Add a few additional tests for limits
   63074a793d69 s390/pci: do not require AIS facility
   b0a46089fe81 ima: fix hash algorithm initialization
   e4f12192d9e2 USB: serial: option: add Quectel BG96 id
   232b47b3c88a s390/runtime instrumentation: simplify task exit handling
   65e6599937d1 serial: 8250_pci: Add Amazon PCI serial device ID
   6ad14c9c646b usb: quirks: Add no-lpm quirk for KY-688 USB 3.1 Type-C Hub
   3789201628f5 uas: Always apply US_FL_NO_ATA_1X quirk to Seagate devices
   ee23ae915fa7 mm, oom_reaper: gather each vma to prevent leaking TLB entry
   0de12a778b92 Revert "crypto: caam - get rid of tasklet"
   cffc01d24d25 drm/fsl-dcu: enable IRQ before drm_atomic_helper_resume()
   48f4d1f7fe48 drm/fsl-dcu: avoid disabling pixel clock twice on suspend
   9db9b5f2b1b6 bcache: recover data from backing when data is clean
   322e659a03dc bcache: only permit to recovery read error when cache device is clean
   284bbc782445 Linux 4.9.67
   f990312aaa74 drm/i915: Prevent zero length "index" write
   838cdb26a538 drm/i915: Don't try indexed reads to alternate slave addresses
   daf3a68d5282 NFS: revalidate "." etc correctly on "open".
   a11ca51bf70c Revert "x86/entry/64: Add missing irqflags tracing to native_load_gs_index()"
   fb541279bbe0 drm/amd/pp: fix typecast error in powerplay.
   5b1c8c96dfab drm/ttm: once more fix ttm_buffer_object_transfer
   44df87e6dfad drm/hisilicon: Ensure LDI regs are properly configured.
   25abe3a9585e drm/panel: simple: Add missing panel_simple_unprepare() calls
   3405805db8bb drm/radeon: fix atombios on big endian
   9cd48ba5fc9d drm/amdgpu: Potential uninitialized variable in amdgpu_vm_update_directories()
   d316675a9da4 drm/amdgpu: potential uninitialized variable in amdgpu_vce_ring_parse_cs()
   b0f63389dab9 Revert "drm/radeon: dont switch vt on suspend"
   f425b050254e nvme-pci: add quirk for delay before CHK RDY for WDC SN200
   eafbee43b7ec hwmon: (jc42) optionally try to disable the SMBUS timeout
   8588eb0ce6a6 bcache: Fix building error on MIPS
   53cf83b3c734 i2c: i801: Fix Failed to allocate irq -2147483648 error
   19699abea321 eeprom: at24: check at24_read/write arguments
   d3da2efa6d9d eeprom: at24: correctly set the size for at24mac402
   388d8c9fa371 eeprom: at24: fix reading from 24MAC402/24MAC602
   c814d6701b08 mmc: core: prepend 0x to OCR entry in sysfs
   0bf4d0517667 mmc: core: Do not leave the block driver in a suspended state
   9aad75786e3d KVM: lapic: Fixup LDR on load in x2apic
   e02746e22d24 KVM: lapic: Split out x2apic ldr calculation
   67945527ee24 KVM: x86: inject exceptions produced by x86_decode_insn
   c0a4c22aad0f KVM: x86: Exit to user-mode on #UD intercept when emulator requires
   f5477da6c3b0 KVM: x86: pvclock: Handle first-time write to pvclock-page contains random junk
   e18a963b36a0 ARM: OMAP2+: Fix WL1283 Bluetooth Baud Rate
   dc554abdaee4 mfd: twl4030-power: Fix pmic for boards that need vmmc1 on reboot
   aa1a6cf1586b nfsd: fix panic in posix_unblock_lock called from nfs4_laundromat
   1c4042591644 nfsd: Fix another OPEN stateid race
   1c8ea4145097 nfsd: Fix stateid races between OPEN and CLOSE
   c251267c8826 btrfs: clear space cache inode generation always
   ba32d7dce43f mm/madvise.c: fix madvise() infinite loop under special circumstances
   cebe139e5712 mm, hugetlbfs: introduce ->split() to vm_operations_struct
   436f19a2e49e mm/cma: fix alloc_contig_range ret code/potential leak
   7031ae2ab37d mm, thp: Do not make page table dirty unconditionally in touch_p[mu]d()
   29bd7003134a ARM: dts: omap3: logicpd-torpedo-37xx-devkit: Fix MMC1 cd-gpio
   64e916dea413 ARM: dts: LogicPD Torpedo: Fix camera pin mux

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 99931b333da0..2fb2aa063874 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fef0184c3c1bcac27fe579bf2643c50bf861e40d"
-SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
+SRCREV_machine ?= "56b06caa70f42d31067f33204a89417b3818aa77"
+SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.65"
+LINUX_VERSION ?= "4.9.71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 7effda2febbd..3e6702977516 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.65"
+LINUX_VERSION ?= "4.9.71"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
+SRCREV_machine ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 82d9e4f11c69..e97355cbca20 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d4807f91ce5fd40b64e11c96fb83a27b99758175"
-SRCREV_machine_qemuarm64 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_qemumips ?= "27a5a33ab1bbb0838d2ccd446b1e29d797811d7b"
-SRCREV_machine_qemuppc ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_qemux86 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_qemux86-64 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_qemumips64 ?= "db1b582e665b95ddf87b75acce3a42660289d4ca"
-SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
+SRCREV_machine_qemuarm ?= "0638cb025fd0d8192dbc0acc09018d6fec9f1597"
+SRCREV_machine_qemuarm64 ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_machine_qemumips ?= "a8971e1548188eb07b88896c7f9d590abb92ed98"
+SRCREV_machine_qemuppc ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_machine_qemux86 ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_machine_qemux86-64 ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_machine_qemumips64 ?= "3cff06df7c72b53af99045fcbcdaf2f9285adc1a"
+SRCREV_machine ?= "3061011aade2678733665bccd553fdcd60165671"
+SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.65"
+LINUX_VERSION ?= "4.9.71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


