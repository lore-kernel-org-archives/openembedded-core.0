Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 95E5D7E41B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:47 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h20so9586098itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AkCHNb3dB94mcosRCwzfSGYRTRj9xmK1YVmIsLVfsi0=;
	b=P4TjtjSkD7I9gc/KkX++IZJfxhOM9mrmpAk0W+d2ohMcYno0FQVF1GCmkRWaKmyLCZ
	sCYad+2gK03ewfaaB28cS0a0a66MOSLyMoLBtTEH4mhofKF2j+XqF29XTv/FeLePK2e3
	GLeXGwKofQt5mKZa8y+PbUCDuhpM/TiNH67fD7b970mqmdAnUOOmDph4P9YhSzORodl+
	s/Yqs6+KdsXzWjZtsyJEf8CkoG73peJPsL90rIoC0AdwF0UqK5KAXXoi1cIwDal8agvY
	PFEFw/QRPC5VqZYm6Vb0mkkqJ+BZNC0EPZHmSzYzOonjUQ+a3Ujn2rWy141J5Ir3Wx6P
	vsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AkCHNb3dB94mcosRCwzfSGYRTRj9xmK1YVmIsLVfsi0=;
	b=RvxzZ92swtBeC0yRv1C+7ZJjDysx0+EfRDuCCoKTiEoxG8s4mEfe/Zoa+cxCp2BzQG
	yRcLpc74UPL4lDrJCIxo44VnJLCyf2zkgM3DLwZw2vZhsR9jnUlmb+32aXIBqGfOExI7
	zPQUU9c4TwXigEgrqCeqOA5b7JhGO4AfzywH49QzhkAdbv+0vvcalT8w4Sm8FVs5CKau
	cABFYdwNFoCwwCbB4scYFN1keDgdDEjA+BSBwFeY45XbS7C+WuZIOQ6N7DYSmNJe+geg
	meoNRgKaXA3/TFsg7aKZuXz2ENRdPB0VI1j1e5NDKOtV+qob9GXbAHnbie8e2bbfOxP+
	cKMA==
X-Gm-Message-State: APjAAAUTt4PvEn9zECzgkqxs44Pu7SUV+ZGZLgA7tFDDsJQduodrnpFL
	WJ9CzxZisZMFhu8uu6rOa25ChdeuEvI=
X-Google-Smtp-Source: APXvYqxOQ5CtIsgz/UAYaGcJfLZSsVLKFSvAEGOuh1hpKzlSLmECu6wiUvrWl7H7fpeSRh/3tm3C/g==
X-Received: by 2002:a24:420d:: with SMTP id i13mr2656635itb.82.1559220287718; 
	Thu, 30 May 2019 05:44:47 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:35 -0400
Message-Id: <f97eb0a3d8d11370e9228f3a12bebb5e12b01488.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/5.0: update to v5.0.13
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
X-List-Received-Date: Thu, 30 May 2019 12:44:47 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg stable commits that comprise the following
changes:

   e5b9547b1aa3 Linux 5.0.13
   d467f3acebc5 ath10k: Drop WARN_ON()s that always trigger during system resume
   3c13f6cd254d iwlwifi: mvm: properly check debugfs dentry before using it
   c391e6198768 ALSA: line6: use dynamic buffers
   4c38bd0d4cd6 KVM: nVMX: Fix size checks in vmx_set_nested_state
   119ac69c0772 KVM: x86: Whitelist port 0x7e for pre-incrementing %rip
   a31a8f55c8e8 net/tls: fix copy to fragments in reencrypt
   f7f4d4b85b83 net/tls: don't copy negative amounts of data in reencrypt
   126255f1ef2b bnxt_en: Fix uninitialized variable usage in bnxt_rx_pkt().
   95fc8b4b4367 bnxt_en: Fix statistics context reservation logic.
   1c38ed7b5ef6 bnxt_en: Pass correct extended TX port statistics size to firmware.
   4348cae3a6e1 bnxt_en: Fix possible crash in bnxt_hwrm_ring_free() under error conditions.
   76dba4d8d0db bnxt_en: Free short FW command HWRM memory in error path in bnxt_init_one()
   4aaaa658466a bnxt_en: Improve multicast address setup logic.
   7a0d81d12f62 udp: fix GRO packet of death
   8858d7234542 udp: fix GRO reception in case of length mismatch
   b58d12d306ae tcp: add sanity tests in tcp_add_backlog()
   4d5aaae5fa0e selftests: fib_rule_tests: Fix icmp proto with ipv6
   3362ece2719c packet: in recvmsg msg_name return at least sizeof sockaddr_ll
   3a0701b8d93a packet: validate msg_namelen in send directly
   02694885a2be selftests: fib_rule_tests: print the result and return 1 if any tests failed
   484d404fdc2a sctp: avoid running the sctp state machine recursively
   f8970584f08c rxrpc: Fix net namespace cleanup
   90cb17d3df6f net/tls: avoid NULL pointer deref on nskb->sk in fallback
   52c89e455b5c net: phy: marvell: Fix buffer overrun with stats counters
   801038cca48c net: dsa: bcm_sf2: fix buffer overflow doing set_rxnfc
   31f4cb2730d8 l2tp: use rcu_dereference_sk_user_data() in l2tp_udp_encap_recv()
   f86adc57e7db l2ip: fix possible use-after-free
   d1fa4f8784bb ipv6: invert flowlabel sharing check in process and user mode
   787a77cccb18 ipv6/flowlabel: wait rcu grace period before put_pid()
   d0aa794674e5 ipv6: fix races in ip6_dst_destroy()
   c61a4beb31f0 ipv6: A few fixes on dereferencing rt->from
   5a06ba5ed2ae ipv4: ip_do_fragment: Preserve skb_iif during fragmentation
   6006d5b02522 Linux 5.0.12
   310f9b1e52c0 leds: trigger: netdev: use memcpy in device_name_store
   004ec01370bc leds: pca9532: fix a potential NULL pointer dereference
   107cfb99c81f ptrace: take into account saved_sigmask in PTRACE{GET,SET}SIGMASK
   87eaf3d8ac51 kasan: fix variable 'tag' set but not used warning
   514860ee6633 iommu/amd: Reserve exclusion range in iova-domain
   8bd7d23a4a76 kconfig/[mn]conf: handle backspace (^H) key
   44fe72aeaae8 perf machine: Update kernel map address and re-order properly
   441d23c87644 perf cs-etm: Add missing case value
   b8bc52cd62e8 nvmet: fix error flow during ns enable
   163719bdcd9c nvmet: fix building bvec from sg list
   2e7d5b2e1fa0 nvme-multipath: relax ANA state check
   a72f60dbb557 gpio: of: Fix of_gpiochip_add() error path
   41a94b1909a4 KVM: selftests: complete IO before migrating guest state
   a312d0eaf90d KVM: selftests: disable stack protector for all KVM tests
   77507936fea3 KVM: selftests: explicitly disable PIE for tests
   e478d1c9b585 KVM: selftests: assert on exit reason in CR4/cpuid sync test
   02a7fc6c77d5 x86/kvm/hyper-v: avoid spurious pending stimer on vCPU init
   e10edda577cc kvm/x86: Move MSR_IA32_ARCH_CAPABILITIES to array emulated_msrs
   3d714ded80f6 KVM: SVM: Workaround errata#1096 (insn_len maybe zero on SMAP violation)
   5369433777ec KVM: nVMX: Do not inherit quadrant and invalid for the root shadow EPT
   e8b8dde69f81 gpio: of: Check for "spi-cs-high" in child instead of parent node
   0e48494c0edf gpio: of: Check propname before applying "cs-gpios" quirks
   fb853a4a7748 afs: Fix StoreData op marshalling
   c6d02b1ea4d7 kbuild: skip parsing pre sub-make code for recursion
   479e1afd232e libata: fix using DMA buffers on stack
   8d3c7282cec4 x86/mm: Don't exceed the valid physical address space
   ab4a5df699b5 scsi: zfcp: reduce flood of fcrscn1 trace records on multi-element RSCN
   b0921da055f1 ceph: fix use-after-free on symlink traversal
   1ab2566c5329 usb: u132-hcd: fix resource leak
   4f5d11bf2eca x86/realmode: Don't leak the trampoline kernel address
   89ae17728a98 SUNRPC: fix uninitialized variable warning
   ec44e4273006 leds: trigger: netdev: fix refcnt leak on interface rename
   facfcac8357d usb: usb251xb: fix to avoid potential NULL pointer dereference
   3ce3290dee84 scsi: qla4xxx: fix a potential NULL pointer dereference
   ab602d0043a4 scsi: aacraid: Insure we don't access PCIe space during AER/EEH
   9a5795520b91 scsi: mpt3sas: Fix kernel panic during expander reset
   08dd1acccb43 staging: vc04_services: Fix an error code in vchiq_probe()
   b2814ce32d47 sbitmap: order READ/WRITE freed instance and setting clear bit
   44a7849ecbd2 ARM: davinci: fix build failure with allnoconfig
   e24c5428060f drm/meson: Uninstall IRQ handler
   da9c64dc934a drm/meson: Fix invalid pointer in meson_drv_unbind()
   55a5c46268ff gpio: aspeed: fix a potential NULL pointer dereference
   e9917fd844ec drm: Fix drm_release() and device unplug
   c4cdbd4075a6 net: ethernet: ti: fix possible object reference leak
   6e4f7c129b24 net: ibm: fix possible object reference leak
   3da122192cde net: xilinx: fix possible object reference leak
   8dcf6dce4023 NFS: Fix a typo in nfs_init_timeout_values()
   4d88134c2f7c drm/tegra: hub: Fix dereference before check
   ec44a9a47e7e ARM: dts: imx6qdl: Fix typo in imx6qdl-icore-rqs.dtsi
   4da511ff427b net/sched: don't dereference a->goto_chain to read the chain index
   fe9fae9c5bff net: macb: Add null check for PCLK and HCLK
   ead946dc3824 net: phy: Add DP83825I to the DP83822 driver
   9bd87bbd2988 staging: rtlwifi: Fix potential NULL pointer dereference of kzalloc
   62d91f5a1ea4 staging: rtl8712: uninitialized memory in read_bbreg_hdl()
   6300a60f50b9 staging: rtlwifi: rtl8822b: fix to avoid potential NULL pointer dereference
   5fad07771fb8 staging: rtl8188eu: Fix potential NULL pointer dereference of kcalloc
   fe4e7a03c742 net: ks8851: Set initial carrier state to down
   372b41d6efe3 net: ks8851: Delay requesting IRQ until opened
   860fd08630a6 net: ks8851: Reassert reset pin if chip ID check fails
   75e3e76a45c6 net: ks8851: Dequeue RX packets explicitly
   07c5093a04f8 KVM: arm/arm64: Fix handling of stage2 huge mappings
   e68cc902c624 i2c: i801: Add support for Intel Comet Lake
   bcc78b63f0b4 ARM: dts: pfla02: increase phy reset duration
   2af87002a5e4 usb: gadget: net2272: Fix net2272_dequeue()
   202db3b5c17c usb: gadget: net2280: Fix net2280_dequeue()
   ad7be5bfe969 usb: gadget: net2280: Fix overrun of OUT messages
   e5a7f0905664 usb: dwc3: pci: add support for Comet Lake PCH ID
   7f482404c11e KVM: arm/arm64: vgic-its: Take the srcu lock when parsing the memslots
   d2eecdbc6eca KVM: arm/arm64: vgic-its: Take the srcu lock when writing to guest memory
   d6d23d335672 arm64: KVM: Always set ICH_HCR_EL2.EN if GICv4 is enabled
   e38694c6b9a8 KVM: arm64: Reset the PMU in preemptible context
   4343cbf52e36 serial: ar933x_uart: Fix build failure with disabled console
   d25b0c89b3b9 sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
   0bb1f79a1427 ARM: imx51: fix a leaked reference by adding missing of_node_put
   42ed22a8b969 s390/qeth: fix race when initializing the IP address table
   f0028f723428 netfilter: ip6t_srh: fix NULL pointer dereferences
   21fde4fcbbd2 netfilter: fix NETFILTER_XT_TARGET_TEE dependencies
   eb213c54aaac netfilter: bridge: set skb transport_header before entering NF_INET_PRE_ROUTING
   0f9c88c5ccc9 netfilter: nft_set_rbtree: check for inactive element after flag mismatch
   7f0d096410af staging, mt7621-pci: fix build without pci support
   6c41d389904c staging: axis-fifo: add CONFIG_OF dependency
   5227fe96b107 xsk: fix umem memory leak on cleanup
   9fc5c6e8fce8 qlcnic: Avoid potential NULL pointer dereference
   2e75be8dd6fa net: stmmac: fix jumbo frame sending with non-linear skbs
   53485ee41fc3 net: stmmac: don't set own bit too early for jumbo frames
   099a26557db9 Btrfs: fix file corruption after snapshotting due to mix of buffered/DIO writes
   61a9e0f4cc86 ieee802154: hwsim: propagate genlmsg_reply return code
   645dc42f97d8 net: ieee802154: fix a potential NULL pointer dereference
   edb616838408 mt76: mt76x2: fix 2.4 GHz channel gain settings
   63019ec07c61 mt76: mt76x2: fix external LNA gain settings
   a495f4c9afbf mt76x02: fix hdr pointer in write txwi for USB
   1d568d7476da s390: limit brk randomization to 32MB
   87240adabb46 ARM: dts: bcm283x: Fix hdmi hpd gpio pull
   9979cd3953b9 arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
   27f651142eec fs: prevent page refcount overflow in pipe_buf_get
   ad73e3a19906 mm: prevent get_user_pages() from overflowing page refcount
   bdc8dfd65873 mm: add 'try_get_page()' helper function
   258fc3baeb4b mm: make page ref count overflow check tighter and more explicit
   cc37cb69fbdc drm/i915: Do not enable FEC without DSC
   742c556944e1 Revert "ACPICA: Clear status of GPEs before enabling them"
   635e82b9bdc8 selinux: use kernel linux/socket.h for genheaders and mdp
   d5a2675b207d Linux 5.0.11
   bcf0c1f4d564 net/tls: don't leak IV and record seq when offload fails
   2adb99038ae4 net/tls: avoid potential deadlock in tls_set_device_offload_rx()
   c01e42fdccf5 net/mlx5e: Fix use-after-free after xdp_return_frame
   f9444b6aaa01 net/mlx5e: Fix the max MTU check in case of XDP
   a7b71fc253e8 mlxsw: spectrum: Put MC TCs into DWRR mode
   a3964a683ca1 mlxsw: pci: Reincrease PCI reset timeout
   72f71005903d net/ncsi: handle overflow when incrementing mac address
   19f6d3f49b28 net: socionext: replace napi_alloc_frag with the netdev variant on init
   af31849700e4 team: fix possible recursive locking when add slaves
   dc2b8b627802 stmmac: pci: Adjust IOT2000 matching
   3fd3574106de net/tls: fix refcount adjustment in fallback
   e39643c12d3f net: stmmac: move stmmac_check_ether_addr() to driver probe
   8de6f5e5b90d net/rose: fix unbound loop in rose_loopback_timer()
   b225e518109b net: rds: exchange of 8K and 1M pool
   283882b045ad net/mlx5e: ethtool, Remove unsupported SFP EEPROM high pages query
   f37782f2d708 mlxsw: spectrum: Fix autoneg status in ethtool
   d69b7c8c8ab5 ipv4: set the tcp_min_rtt_wlen range from 0 to one day
   617d24036564 ipv4: add sanity checks in ipv4_link_failure()
   7f909f520742 rdma: fix build errors on s390 and MIPS due to bad ZERO_PAGE use
   dee438745d74 x86/retpolines: Disable switch jump tables when retpolines are enabled
   6bd5637a3ebb x86, retpolines: Raise limit for generating indirect calls from switch-case
   b6dd51f041fa Fix aio_poll() races
   f6408361ded7 aio: store event at final iocb_put()
   a8a538aed4f9 aio: keep io_event in aio_kiocb
   636fa71ed5f7 aio: fold lookup_kiocb() into its sole caller
   199f34c1355b pin iocb through aio.
   e2f0a96eeb50 rxrpc: fix race condition in rxrpc_input_packet()
   4f2c07441634 net/rds: Check address length before reading address family
   d0d184559cb4 net: netrom: Fix error cleanup path of nr_proto_init
   d0cf85f49505 tipc: check link name with right length in tipc_nl_compat_link_set
   4ee29a10021f tipc: check bearer name with right length in tipc_nl_compat_bearer_enable
   a92526e257a5 fm10k: Fix a potential NULL pointer dereference
   0d41789ad820 netfilter: ebtables: CONFIG_COMPAT: drop a bogus WARN_ON
   becfa96eaecd NFS: Forbid setting AF_INET6 to "struct sockaddr_in"->sin_family.
   b5db8ea57de5 mac80211_hwsim: calculate if_combination.max_interfaces
   16de5d9b8f6b sched/deadline: Correctly handle active 0-lag timers
   bbb19ca082ce binder: fix handling of misaligned binder object
   8fe1600c91f9 workqueue: Try to catch flush_work() without INIT_WORK().
   abcbf3078130 slip: make slhc_free() silently accept an error pointer
   ba965c2c9808 tipc: handle the err returned from cmd header function
   2501b17f4f72 loop: do not print warn message if partition scan is successful
   acaec7f6e25d ext4: fix some error pointer dereferences
   2cd705091e36 USB: Consolidate LPM checks to avoid enabling LPM twice
   30d57be1f6eb USB: Add new USB LPM helpers
   6ec39721f131 drm/vc4: Fix compilation error reported by kbuild test bot
   3e869fd34856 Revert "drm/i915/fbdev: Actually configure untiled displays"
   6dca846c920d drm/ttm: fix re-init of global structures
   0b029ce3f4ee drm/vc4: Fix memory leak during gpu reset.
   aaceebbb71c5 powerpc/mm/radix: Make Radix require HUGETLB_PAGE
   b9a5bc4bb079 ARM: 8857/1: efi: enable CP15 DMB instructions before cleaning the cache
   aa5f016ba785 dmaengine: mediatek-cqdma: fix wrong register usage in mtk_cqdma_start
   9476c3ad5ee2 dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
   c46e14be004a dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
   16df9424ffaa vfio/type1: Limit DMA mappings per container
   4898e9b99795 Input: synaptics-rmi4 - write config register values to the right offset
   c704bba6dd36 perf/x86/intel: Update KBL Package C-state events to also include PC8/PC9/PC10 counters
   b2eeeb49027e sunrpc: don't mark uninitialised items as VALID.
   6d29f7c720c6 nfsd: wake blocked file lock waiters before sending callback
   6569ae328aa3 nfsd: wake waiters blocked on file_lock before deleting it
   5e4a20e631a7 nfsd: Don't release the callback slot unless it was actually held
   870588487197 ceph: fix ci->i_head_snapc leak
   d9061ef0ab17 ceph: ensure d_name stability in ceph_dentry_hash()
   bcd9cbffb98f ceph: only use d_name directly when parent is locked
   e548c9702d46 sched/numa: Fix a possible divide-by-zero
   c3e4c555ac86 RDMA/ucontext: Fix regression with disassociate
   52c44c4e81b3 RDMA/mlx5: Use rdma_user_map_io for mapping BAR pages
   92d6731e6a6f RDMA/mlx5: Do not allow the user to write to the clock page
   f4dba6bf743e IB/rdmavt: Fix frwr memory registration
   e7e378ed703e arm64: mm: Ensure tail of unaligned initrd is reserved
   e5f06bf8f46c mm: do not boost watermarks to avoid fragmentation for the DISCONTIG memory model
   655b464eeaa8 trace: Fix preempt_enable_no_resched() abuse
   0f73358dff40 MIPS: scall64-o32: Fix indirect syscall number load
   928962e99694 lib/Kconfig.debug: fix build error without CONFIG_BLOCK
   f4ab3de10c84 zram: pass down the bvec we need to read into in the work struct
   e6093c0212d0 gpio: eic: sprd: Fix incorrect irq type setting for the sync EIC
   0bb4e85bbd34 crypto: lrw - Fix atomic sleep when walking skcipher
   6506cdd4205b crypto: xts - Fix atomic sleep when walking skcipher
   8659a04c77e2 tracing: Fix buffer_ref pipe ops
   68ab802fb8cc tracing: Fix a memory leak by early error exit in trace_pid_write()
   90b70b3ed31b cifs: do not attempt cifs operation on smb2+ rename error
   e6302b845f2d cifs: fix page reference leak with readv/writev
   62cf691cdf74 cifs: fix memory leak in SMB2_read
   34fb6f5eb2cd block, bfq: fix use after free in bfq_bfqq_expire
   41e09d7eab07 fs/proc/proc_sysctl.c: Fix a NULL pointer dereference
   685550ad1192 ALSA: hda/realtek - Move to ACT_INIT state
   b6f3aa978866 powerpc/vdso32: fix CLOCK_MONOTONIC on PPC64
   92d4af2766a1 intel_th: gth: Fix an off-by-one in output unassigning
   0ccd99339030 netfilter: nf_tables: bogus EBUSY in helper removal from transaction
   5b3124548062 netfilter: nf_tables: bogus EBUSY when deleting set after flush
   d3da1f09fff2 Linux 5.0.10
   c735a988a9ca kernel/sysctl.c: fix out-of-bounds access when setting file-max
   822482bff7c5 percpu: stop printing kernel addresses
   b2c65593ea62 ALSA: info: Fix racy addition/deletion of nodes
   c3d0cf332bcd mm/vmstat.c: fix /proc/vmstat format for CONFIG_DEBUG_TLBFLUSH=y CONFIG_SMP=n
   4ae522890cc1 mm/memory_hotplug: do not unlock after failing to take the device_hotplug_lock
   c138ed72186a perf/ring_buffer: Fix AUX record suppression
   65fce15dbd87 device_cgroup: fix RCU imbalance in error case
   74b4ef5df590 mt76x02: avoid status_list.lock and sta->rate_ctrl_lock dependency
   edc94cb2c13b tpm: fix an invalid condition in tpm_common_poll
   6799f32fff63 sched/fair: Limit sched_cfs_period_timer() loop to avoid hard lockup
   fb9693679feb Revert "kbuild: use -Oz instead of -Os when using clang"
   18636692a1b4 tpm: Fix the type of the return value in calc_tpm2_event_size()
   03c1d8f8afd8 tpm/tpm_i2c_atmel: Return -E2BIG when the transfer is incomplete
   4a96e63f8f7d nfit/ars: Avoid stale ARS results
   33dcadf02c1f nfit/ars: Allow root to busy-poll the ARS state machine
   b49a9157c3ec nfit/ars: Introduce scrub_flags
   2cc8e8c230e8 nfit/ars: Remove ars_start_flags
   451fd88f62b9 timers/sched_clock: Prevent generic sched_clock wrap caused by tick_freeze()
   205c53cbe553 x86/speculation: Prevent deadlock on ssb_state::lock
   19867049334b perf/x86: Fix incorrect PEBS_REGS
   5e34d62b59dd x86/cpu/bugs: Use __initconst for 'const' init data
   35f288b72f64 perf/x86/amd: Add event map for AMD Family 17h
   22cc6e1b4fc0 drm/amdgpu/gmc9: fix VM_L2_CNTL3 programming
   5b05d7d6fd5b s390/mem_detect: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD)
   b1db090fb046 mac80211: do not call driver wake_tx_queue op during reconfig
   9a0748c55188 rt2x00: do not increment sequence number while re-transmitting
   44aa331f99b4 kprobes: Fix error check when reusing optimized probes
   ca61e51567a7 x86/kprobes: Avoid kretprobe recursion bug
   7b91f26c45b6 kprobes: Mark ftrace mcount handler functions nokprobe
   fbe6f067a3ad x86/kprobes: Verify stack frame on kretprobe
   f89f9d9636f0 arm64: futex: Restore oldval initialization to work around buggy compilers
   508b773175c7 drm/ttm: fix out-of-bounds read in ttm_put_pages() v2
   8223263d7c44 crypto: x86/poly1305 - fix overflow during partial reduction
   46c4f2375638 ipmi: fix sleep-in-atomic in free_user at cleanup SRCU user->release_barrier
   2f6919fdc23b x86/kvm: move kvm_load/put_guest_xcr0 into atomic context
   1eb719f09f7e coredump: fix race condition between mmget_not_zero()/get_task_mm() and core dumping
   e58a114d0746 Revert "svm: Fix AVIC incomplete IPI emulation"
   922270b4f018 i3c: Fix the verification of random PID
   33a3fff44a0f i3c: dw: Fix dw_i3c_master_disable controller by using correct mask
   e6200707e648 Revert "scsi: fcoe: clear FC_RP_STARTED flags when receiving a LOGO"
   ad1deea5c4c9 scsi: core: set result when the command cannot be dispatched
   c2116717884c vt: fix cursor when clearing the screen
   5ae77c340c52 serial: sh-sci: Fix HSCIF RX sampling point calculation
   333a81c16e4f serial: sh-sci: Fix HSCIF RX sampling point adjustment
   95df599f95f3 Input: elan_i2c - add hardware ID for multiple Lenovo laptops
   6ef122eb7956 ALSA: core: Fix card races between register and disconnect
   ffd87f87a9c1 ALSA: hda/realtek - add two more pin configuration sets to quirk table
   8834139083cd staging: comedi: ni_usb6501: Fix possible double-free of ->usb_rx_buf
   16b235e81d9d staging: comedi: ni_usb6501: Fix use of uninitialized mutex
   a47fd7121627 staging: comedi: vmk80xx: Fix possible double-free of ->usb_rx_buf
   bd3011021447 staging: comedi: vmk80xx: Fix use of uninitialized semaphore
   dcff1b3c1a1d staging: most: core: use device description as name
   68bbd7524a6f io: accel: kxcjk1013: restore the range after resume.
   3e13bb9782f5 iio: core: fix a possible circular locking dependency
   1f6b63285e2f iio: adc: at91: disable adc channel interrupt in timeout case
   2b70088e1509 iio: Fix scan mask selection
   5c526f27861f iio: dac: mcp4725: add missing powerdown bits in store eeprom
   50bc2c022b6e iio: ad_sigma_delta: select channel when reading register
   f65207cfee33 iio: cros_ec: Fix the maths for gyro scale calculation
   b4dd709ada6d iio:chemical:bme680: Fix SPI read interface
   fd3c6ad2a934 iio:chemical:bme680: Fix, report temperature in millidegrees
   5527e1e58007 iio/gyro/bmg160: Use millidegrees for temperature scale
   9efe152f769c iio: gyro: mpu3050: fix chip ID reading
   25a91f7b9810 staging: iio: ad7192: Fix ad7193 channel address
   80c1486b7e20 Staging: iio: meter: fixed typo
   739969f56e4f KVM: x86: svm: make sure NMI is injected after nmi_singlestep
   935fef82120f KVM: x86: Don't clear EFER during SMM transitions for 32-bit vCPU
   d12bcf87e6ff fs/dax: Deposit pagetable even when installing zero page
   f6846161e203 cifs: fix handle leak in smb2_query_symlink()
   76dbd554c273 cifs: Fix use-after-free in SMB2_read
   e8ac406c749e cifs: Fix use-after-free in SMB2_write
   9582ba401ef0 cifs: Fix lease buffer length error
   ebac4d0adf68 CIFS: keep FileInfo handle live during oplock break
   2cf17769d6b5 sch_cake: Simplify logic in cake_select_tin()
   5aa94a5b5641 nfc: nci: Potential off by one in ->pipes[] array
   a023c1a245a7 NFC: nci: Add some bounds checking in nci_hci_cmd_received()
   d58923dac952 sch_cake: Make sure we can write the IP header before changing DSCP bits
   064290d0f6c7 sch_cake: Use tc_skb_protocol() helper for getting packet protocol
   116ac142d2c6 nfp: flower: remove vlan CFI bit from push vlan action
   51db0d068057 nfp: flower: replace CFI with vlan present
   da86299fcccb route: Avoid crash from dereferencing NULL rt->from
   6ad8c35a70cc net/mlx5: FPGA, tls, idr remove on flow delete
   d3697f88a271 net/tls: prevent bad memory access in tls_is_sk_tx_device_offloaded()
   1d9005b96dce net/mlx5: FPGA, tls, hold rcu read lock a bit longer
   abe4a1328a78 Revert "net/mlx5e: Enable reporting checksum unnecessary also for L3 packets"
   acf4d270942a net/mlx5e: Rx, Check ip headers sanity
   3ce8793e03cd net/mlx5e: Rx, Fixup skb checksum for packets with tail padding
   af294d42d43e net/mlx5e: Switch to Toeplitz RSS hash by default
   6daad2e30e0b net/mlx5e: Protect against non-uplink representor for encap
   58f682514cb5 net/mlx5e: XDP, Avoid checksum complete when XDP prog is loaded
   0e4b3800c069 net: bridge: fix netlink export of vlan_stats_per_port option
   adfc12451123 net/tls: fix build without CONFIG_TLS_DEVICE
   5e7171bf8db7 net: strparser: partially revert "strparser: Call skb_unclone conditionally"
   96418eaa8e6a net/tls: don't leak partially sent record in device mode
   b30d9457b1dc net/tls: fix the IV leaks
   ae924f4e1c45 net: thunderx: don't allow jumbo frames with XDP
   a902fe6dd585 net: thunderx: raise XDP MTU to 1508
   9be4e8224cd6 mlxsw: spectrum_router: Do not check VRF MAC address
   61647856f32a mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw workqueue
   87ffb893490a mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw ordered workqueue
   565e18a0be10 mlxsw: core: Do not use WQ_MEM_RECLAIM for EMAD workqueue
   6f180e411c3e mlxsw: spectrum_switchdev: Add MDB entries in prepare phase
   ed112abe6795 ipv4: ensure rcu_read_lock() in ipv4_link_failure()
   6bd1ee0a993f ipv4: recompile ip options in ipv4_link_failure
   8cc6c4767e49 vhost: reject zero size iova range
   e35fa0016788 tipc: missing entries in name table of publications
   aad7db2b23c1 team: set slave to promisc if team is already in promisc mode
   8aa965e92750 tcp: tcp_grow_window() needs to respect tcp_space()
   1274905c8e1b net: fou: do not use guehdr after iptunnel_pull_offloads in gue_udp_recv
   49f472ba481b net: Fix missing meta data in skb with vlan packet
   a7a3382b1564 net: fec: manage ahb clock in runtime pm
   88f561ab1bd4 net: bridge: multicast: use rcu to access port list from br_multicast_start_querier
   88c58435304b net: bridge: fix per-port af_packet sockets
   11ba95c4503b net: atm: Fix potential Spectre v1 vulnerabilities
   b633f6580b62 failover: allow name change on IFF_UP slave interfaces
   7e2c712830d6 bonding: fix event handling for stacked bonds
   e4abcebedac3 Linux 5.0.9
   2db9f8d63d74 paride/pcd: Fix potential NULL pointer dereference and mem leak
   e78434f4dcd2 paride/pf: Fix potential NULL pointer dereference
   b59d92ac8a32 IB/hfi1: Failed to drain send queue when QP is put into error state
   b05baa9f19d0 bpf: fix use after free in bpf_evict_inode
   d05fb50b3d0c include/linux/swap.h: use offsetof() instead of custom __swapoffset macro
   1c108a1b6459 f2fs: fix to add refcount once page is tagged PG_private
   b5f51f7abb43 f2fs: fix to use kvfree instead of kzfree
   c55d13d94f8c f2fs: fix to dirty inode for i_mode recovery
   4fb70c2107e9 rxrpc: Fix client call connect/disconnect race
   78154e319888 lib/div64.c: off by one in shift
   f0f1c97f38b8 cifs: return -ENODATA when deleting an xattr that does not exist
   2fbb0171b13a appletalk: Fix use-after-free in atalk_proc_exit
   a33383757975 drm/amdkfd: use init_mqd function to allocate object for hid_mqd (CI)
   3835c46e6ff5 ARM: 8839/1: kprobe: make patch_lock a raw_spinlock_t
   ed3a6901a3d7 platform/x86: intel_pmc_core: Quirk to ignore XTAL shutdown
   36f268740bce drm/nouveau/volt/gf117: fix speedo readout register
   3b2457ce9997 f2fs: sync filesystem after roll-forward recovery
   b851a25507e2 PCI/ASPM: Save LTR Capability for suspend/resume
   75e3256e2309 PCI: Blacklist power management of Gigabyte X299 DESIGNARE EX PCIe ports
   dce48c5878ab coresight: cpu-debug: Support for CA73 CPUs
   cf56bb03ffa3 RDMA/hns: Fix the Oops during rmmod or insmod ko when reset occurs
   5ada4de03943 Revert "ACPI / EC: Remove old CLEAR_ON_RESUME quirk"
   41c3883dfadb crypto: axis - fix for recursive locking from bottom half
   b9563b52e802 net: hns3: Fix NULL deref when unloading driver
   f1a2397542f6 drm/panel: panel-innolux: set display off in innolux_panel_unprepare
   3fcb02749530 drm/amdgpu: psp_ring_destroy cause psp->km_ring.ring_mem NULL
   e7ab5c78e516 lkdtm: Add tests for NULL pointer dereference
   8167ea40725d lkdtm: Print real addresses
   8bc6ef890c86 ext4: prohibit fstrim in norecovery mode
   642530739f19 x86/gart: Exclude GART aperture from kcore
   14bec2dda7a0 cifs: Fix slab-out-of-bounds when tracing SMB tcon
   a419571b2da5 fix incorrect error code mapping for OBJECTID_NOT_FOUND
   21edc981053f cifs: fix that return -EINVAL when do dedupe operation
   92b646e27677 x86/hw_breakpoints: Make default case in hw_breakpoint_arch_parse() return an error
   aca4bd1a1cc6 iommu/vt-d: Save the right domain ID used by hardware
   d96516127498 iommu/vt-d: Check capability before disabling protected memory
   d9fb98c921a8 drm/nouveau/debugfs: Fix check of pm_runtime_get_sync failure
   f0a085e99ff7 x86/cpu/cyrix: Use correct macros for Cyrix calls on Geode processors
   aaddd952f3db x86/hyperv: Prevent potential NULL pointer dereference
   105d043fedcb x86/hpet: Prevent potential NULL pointer dereference
   1512c986c578 irqchip/mbigen: Don't clear eventid when freeing an MSI
   dc60ac49b040 irqchip/stm32: Don't set rising configuration registers at init
   d79220ee57b8 irqchip/stm32: Don't clear rising/falling config registers at init
   c24b1f67cea0 drm/exynos/mixer: fix MIXER shadow registry synchronisation code
   c43003451a01 blk-iolatency: #include "blk.h"
   8bd30e5e0ec5 PM / Domains: Avoid a potential deadlock
   66495ebfd4df ACPI / utils: Drop reference in test for device presence
   fd9f338db867 perf tests: Fix a memory leak in test__perf_evsel__tp_sched_test()
   26980cd03ea6 perf tests: Fix memory leak by expr__find_other() in test__expr()
   5ffefcfe9764 perf tests: Fix a memory leak of cpu_map object in the openat_syscall_event_on_all_cpus test
   ece1fd3f4023 perf evsel: Free evsel->counts in perf_evsel__exit()
   05fe1d5b6ed1 perf top: Fix global-buffer-overflow issue
   940df86f505d perf maps: Purge all maps from the 'names' tree
   60b7f41c4aea perf map: Remove map from 'names' tree in __maps__remove()
   d86bf97d119d perf hist: Add missing map__put() in error case
   4a66a027c1ba perf top: Fix error handling in cmd_top()
   29dddb32f56b perf build-id: Fix memory leak in print_sdt_events()
   86cb58f1a12f perf config: Fix a memory leak in collect_config()
   5bb92662f2f1 perf config: Fix an error in the config template documentation
   d41f87ee413f perf tools: Fix errors under optimization level '-Og'
   84b2a2ca6d41 perf list: Don't forget to drop the reference to the allocated thread_map
   0c6568492019 perf stat: Fix --no-scale
   c957d798c11c scsi: qla2xxx: Fix NULL pointer crash due to stale CPUID
   9ec3c84936f7 scsi: core: Also call destroy_rcu_head() for passthrough requests
   638bf55940b9 tools/power turbostat: return the exit status of a command
   4a45137bb2eb x86/mm: Don't leak kernel addresses
   8764542aa21c sched/core: Fix buffer overflow in cgroup2 property cpu.max
   02abd369fa77 sched/cpufreq: Fix 32-bit math overflow
   7aa9be519579 scsi: iscsi: flush running unbind operations when removing a session
   b0b05ab719c3 thermal/intel_powerclamp: fix truncated kthread name
   800e3fd7bfce thermal/int340x_thermal: fix mode setting
   891fea677cca thermal/int340x_thermal: Add additional UUIDs
   f1a315ca06be thermal: bcm2835: Fix crash in bcm2835_thermal_debugfs
   481c8a89e89a thermal: samsung: Fix incorrect check after code merge
   74920ee161d4 thermal/intel_powerclamp: fix __percpu declaration of worker_data
   6e684bd65a5c paride/pcd: cleanup queues when detection fails
   77323732005a paride/pf: cleanup queues when detection fails
   1f208b0adaee ALSA: opl3: fix mismatch between snd_opl3_drum_switch definition and declaration
   bdb43acc8858 mmc: davinci: remove extraneous __init annotation
   e52431f7547c i40iw: Avoid panic when handling the inetdev event
   221b45319d05 IB/mlx4: Fix race condition between catas error reset and aliasguid flows
   b21723eda4cc drm/udl: use drm_gem_object_put_unlocked.
   33550275bbcf auxdisplay: hd44780: Fix memory leak on ->remove()
   4c12b50fc86a ALSA: sb8: add a check for request_region
   b3a964aea086 ALSA: echoaudio: add a check for ioremap_nocache
   2c20533ea602 ext4: report real fs size after failed resize
   d45fc2ba0e39 ext4: add missing brelse() in add_new_gdb_meta_bg()
   e23981104716 ext4: avoid panic during forced reboot
   0a7ef6820970 mips: bcm47xx: Enable USB power on Netgear WNDR3400v2
   c5d7b6089be5 perf/core: Restore mmap record type correctly
   7f434180c880 inotify: Fix fsnotify_mark refcount leak in inotify_update_existing_watch()
   9005b534c2ba arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
   48de44356e07 ARC: u-boot args: check that magic number is correct
   0b9132ee7429 Linux 5.0.8
   eaa06ac5d1c1 drm/virtio: do NOT reuse resource ids
   7af79a36d188 KVM: x86: nVMX: fix x2APIC VTPR read intercept
   b564364f22ac KVM: x86: nVMX: close leak of L0's x2APIC MSRs (CVE-2019-3887)
   63bec9219c39 dm integrity: fix deadlock with overlapping I/O
   de022a3453e6 dm: disable DISCARD if the underlying storage no longer supports it
   ca7671084384 dm table: propagate BDI_CAP_STABLE_WRITES to fix sporadic checksum errors
   50b2e5c3b0a8 dm: revert 8f50e358153d ("dm: limit the max bio size as BIO_MAX_PAGES * PAGE_SIZE")
   556b7d910d5d dm integrity: change memcmp to strncmp in dm_integrity_ctr
   78dbc2482a78 powerpc/64s/radix: Fix radix segment exception handling
   49558542e0eb xprtrdma: Fix helper that drains the transport
   8af91139a0a8 PCI: pciehp: Ignore Link State Changes after powering off a slot
   9b63917c6a4c PCI: Add function 1 DMA alias quirk for Marvell 9170 SATA controller
   025768c171b8 x86/perf/amd: Remove need to check "running" bit in NMI handler
   ecb09f75a9b9 x86/perf/amd: Resolve NMI latency issues for active PMCs
   c583b4d08f3a x86/perf/amd: Resolve race condition when disabling PMC
   8b866ffe3d31 x86/asm: Use stricter assembly constraints in bitops
   3783a3b1e218 x86/asm: Remove dead __GNUC__ conditionals
   5866b5fc2b8a csky: Fix syscall_get_arguments() and syscall_set_arguments()
   b66f9a1ea65a xtensa: fix return_address
   e09deff8f8f4 sched/fair: Do not re-read ->h_load_next during hierarchical load calculation
   05acf6f5b81c xen: Prevent buffer overflow in privcmd ioctl
   e0e77b23a73d IB/mlx5: Reset access mask when looping inside page fault handler
   6b3b09cd4daa arm64/ftrace: fix inadvertent BUG() in trampoline check
   36078cae3790 arm64: backtrace: Don't bother trying to unwind the userspace stack
   de2e5ed04711 arm64: dts: rockchip: fix rk3328 rgmii high tx error rate
   7fcf2d915fa0 arm64: dts: rockchip: Fix vcc_host1_5v GPIO polarity on rk3328-rock64
   68a6a619ebd7 arm64: futex: Fix FUTEX_WAKE_OP atomic ops with non-zero result value
   b0266ece310d ARM: dts: at91: Fix typo in ISC_D0 on PC9
   a005242834ac ARM: dts: rockchip: Fix SD card detection on rk3288-tinker
   e74aa76752f4 ARM: dts: am335x-evm: Correct the regulators for the audio codec
   724d26349abf ARM: dts: am335x-evmsk: Correct the regulators for the audio codec
   4e34e23d5708 ARM: dts: rockchip: fix rk3288 cpu opp node reference
   f04200259be8 ARM: OMAP1: ams-delta: Fix broken GPIO ID allocation
   4e6f0d588cd2 drm/i915/dp: revert back to max link rate and lane count on eDP
   88fa815395e3 virtio: Honour 'may_reduce_num' in vring_create_virtqueue
   ec64558908d7 genirq: Initialize request_mutex if CONFIG_SPARSE_IRQ=n
   b8ad5278c4d3 genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
   fffb3e8b5920 block: fix the return errno for direct IO
   b4af1b3cb545 block: do not leak memory in bio_copy_user_iov()
   43d15c041ad7 block: Revert v5.0 blk_mq_request_issue_directly() changes
   6a184be78d3f riscv: Fix syscall_get_arguments() and syscall_set_arguments()
   ee02ae76d069 btrfs: prop: fix vanished compression property after failed set
   41cd8693bfcc btrfs: prop: fix zstd compression parameter validation
   ddb27d3b30f7 Btrfs: do not allow trimming when a fs is mounted with the nologreplay option
   4badea79434d ASoC: fsl_esai: fix channel swap issue when stream starts
   7c394c70a394 ASoC: intel: Fix crash at suspend/resume after failed codec registration
   3859d8fae2d8 mm: writeback: use exact memcg dirty counts
   c4727317b4e5 include/linux/bitrev.h: fix constant bitrev
   a1428aee0c69 kvm: svm: fix potential get_num_contig_pages overflow
   d2c5c9ea9a09 drm/udl: add a release method and delay modeset teardown
   7029188253fc drm/sun4i: DW HDMI: Lower max. supported rate for H6
   3e05b13e52e5 drm/i915/gvt: do not deliver a workload if its creation fails
   56487f7b8330 alarmtimer: Return correct remaining time
   b4dfbd47a494 parisc: also set iaoq_b in instruction_pointer_set()
   97ba69f22665 parisc: regs_return_value() should return gpr28
   d347bbea0668 parisc: Detect QEMU earlier in boot process
   af2abcc62e64 mmc: sdhci-omap: Don't finish_mrq() on a command error during tuning
   13771e12fb7d mmc: alcor: don't write data before command has completed
   8a3bb1553d5b arm64: dts: rockchip: fix rk3328 sdmmc0 write errors
   9e77cd4a9922 mm/huge_memory.c: fix modifying of page protection by insert_pfn_pmd()
   89944d7e95e3 ALSA: hda - Add two more machines to the power_save_blacklist
   3c20e6c50e03 ALSA: xen-front: Do not use stream buffer size before it is set
   97bf09839964 ALSA: hda/realtek - Add quirk for Tuxedo XC 1509
   acaf3a112008 ALSA: hda/realtek: Enable headset MIC of Acer TravelMate B114-21 with ALC233
   df828c33163f ALSA: seq: Fix OOB-reads from strlcpy
   cb11af93e626 ACPICA: Namespace: remove address node from global list after method termination
   da6a87fb0ad4 ACPICA: Clear status of GPEs before enabling them
   bee8b4b4c79b HID: logitech: Handle 0 scroll events for the m560
   0601ac3b4925 SMB3: Allow persistent handle timeout to be configurable on mount
   4d4ec04ed77e hwmon: (occ) Fix power sensor indexing
   026f98a1d51d hwmon: (w83773g) Select REGMAP_I2C to fix build error
   c231b6b0064d tty: ldisc: add sysctl to prevent autoloading of ldiscs
   e4ebae16792a tty: mark Siemens R3964 line discipline as BROKEN
   e2a0237494ce Revert "clk: meson: clean-up clock registration"
   62a23bbaee09 lib/string.c: implement a basic bcmp
   622902df9eba kbuild: clang: choose GCC_TOOLCHAIN_DIR not on LD
   396f116f6d0a net/mlx5e: Update xon formula
   29b4db4176da net/mlx5e: Update xoff formula
   68ef6f3e1a70 net: mlx5: Add a missing check on idr_find, free buf
   4fe853723d57 r8169: disable default rx interrupt coalescing on RTL8168
   4b780e0fc986 net: core: netif_receive_skb_list: unlist skb before passing to pt->func
   b5f69a5648b0 net: vrf: Fix ping failed when vrf mtu is set to 0
   c83447096390 net: thunderx: fix NULL pointer dereference in nicvf_open/nicvf_stop
   502de75b3b34 net: bridge: always clear mcast matching struct on reports and leaves
   f4473ccd883c net: ip6_gre: fix possible use-after-free in ip6erspan_rcv
   b49e1837b15e net: ip_gre: fix possible use-after-free in erspan_rcv
   eefa6c2464c8 bnxt_en: Reset device on RX buffer errors.
   aecbbae850ed bnxt_en: Improve RX consumer index validity check.
   c43bbe6d49f4 nfp: disable netpoll on representors
   c974a681e996 nfp: validate the return code from dev_queue_xmit()
   6fc42565470a net/mlx5e: Add a lock on tir list
   44bd84f1b5a5 net/mlx5e: Fix error handling when refreshing TIRs
   59c5f595a120 vrf: check accept_source_route on the original netdevice
   71707cc55c39 tcp: fix a potential NULL pointer dereference in tcp_sk_exit
   bc7167651e30 tcp: Ensure DCTCP reacts to losses
   cd1b7376d8a3 sctp: initialize _pad of sockaddr_in before copying to user memory
   3c36cc5bdf89 r8169: disable ASPM again
   cdeed1e0f47e qmi_wwan: add Olicard 600
   3bcad39f08ca openvswitch: fix flow actions reallocation
   48a1cd79cc7e net/sched: fix ->get helper of the matchall cls
   4edf174b821e net/sched: act_sample: fix divide by zero in the traffic path
   4e8d8e767f11 net: rds: force to destroy connection if t_sock is NULL in rds_tcp_kill_sock().
   ec7aeb6a0709 netns: provide pure entropy for net_hash_mix()
   6ced07adaead net/mlx5: Decrease default mr cache size
   67b0fbfaf828 net-gro: Fix GRO flush when receiving a GSO packet.
   88b9d6f6aff8 net: ethtool: not call vzalloc for zero sized memory request
   351ddbdf532c kcm: switch order of device registration to fix a crash
   472a290314f0 ipv6: sit: reset ip header pointer in ipip6_rcv
   ccec3a09c429 ipv6: Fix dangling pointer when ipv6 fragment
   fd4ecb124730 ip6_tunnel: Match to ARPHRD_TUNNEL6 for dev type
   4f90b9ca3cb2 ibmvnic: Fix completion structure initialization
   b68b3427a2a2 hv_netvsc: Fix unwanted wakeup after tx_disable
   5160fb3353f5 netfilter: nf_tables: add missing ->release_ops() in error path of newrule()
   19589530ec6d netfilter: nf_tables: use-after-free in dynamic operations
   43154d5c868c netfilter: nft_compat: use .release_ops and remove list of extension
   93f7f61ed079 kbuild: pkg: use -f $(srctree)/Makefile to recurse to top Makefile
   118003351916 drm/i915/gvt: do not let pin count of shadow mm go negative

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 54f86dac92..922db1e6e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "494384666b623a23e19cbbc54574d08e31496a03"
+SRCREV_machine ?= "36f6c28b2561bf4dcba5a326a51bc0aa6fc59330"
 SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0.7"
+LINUX_VERSION ?= "5.0.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 720192152b..f407111307 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.0.7"
+LINUX_VERSION ?= "5.0.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f07da0a13d6f503b72594776b5e8a9795da6d6a0"
-SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemuarm ?= "9e6c0e79debd9bb85ef44a93927fbe504e42c5a1"
+SRCREV_machine ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
 SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index ae8f643e9f..466e9298bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "99f3821bdc8718af3ef6e96d594b593d644ab2e4"
-SRCREV_machine_qemuarm64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
-SRCREV_machine_qemumips ?= "1128cfe6c7915535c4066b75342c952640e65d72"
-SRCREV_machine_qemuppc ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
-SRCREV_machine_qemux86 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
-SRCREV_machine_qemux86-64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
-SRCREV_machine_qemumips64 ?= "55e385d52db438df1ff7ad3845c9076b2bb221eb"
-SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemuarm ?= "74c4e04f742af858253252ae4160ee0fc5a65608"
+SRCREV_machine_qemuarm64 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
+SRCREV_machine_qemumips ?= "dd9de85be86c3af916d5d9fde9cff70896aa72d8"
+SRCREV_machine_qemuppc ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
+SRCREV_machine_qemux86 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
+SRCREV_machine_qemux86-64 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
+SRCREV_machine_qemumips64 ?= "4fc49a67d100bf80ac969b7e8889f419628df97b"
+SRCREV_machine ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
 SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0.7"
+LINUX_VERSION ?= "5.0.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


