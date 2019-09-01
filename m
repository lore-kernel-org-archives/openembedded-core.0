Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 47B997F459
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:48 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id n190so5950848pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QZeDJbbOESq11kr0YmS04az7S/bHM8YFkHYv14p4/lE=;
	b=JACvCVSSLgP32bp2b81eEvJIc4aslKeafha4T8mXxAFixOMPIY91w+GkbaIz7RIuXA
	u8gqo/l5l8pjTyD2hCevlfdLIRXgvvnMg10vv1rh2/RgYw+xh6dSvi7/A9lKDUtGGyE4
	kj1kn4YI7LzN+ho4NSwbGy7GrX+5xmFliphXOMkK68uON0+Ba966g4orzLsRmnNfl5pG
	uqQ7Zd+MB1QL90myS7c34NWu4SCSVzxiGmZmCInF1iaLrnl6OHF5kh4ulcUW46De6FPm
	3dbPB/Mm5wMDa64z9ela1BFor4f61hbksx2XYfKRHyhFlZl5Bfp0moGoaRWABCKfYdll
	z6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QZeDJbbOESq11kr0YmS04az7S/bHM8YFkHYv14p4/lE=;
	b=kaL9SK7q0ZBFe7go0hlwgBG4mfNcVeJXg/HyEIYZrmD7c8Cz/4KDtVLOVrCUpmURoc
	T/cuLzduoc9VLW7aQTENlgG3CMLNITYxtTSv3tcFm57oIcG6+36/HqV5wEE+55oeVXds
	/KQ2AJ6OxMR11uqvjnOugZxHmKrOK9KEawpAWDnuMNY8aU3t68rlm+NNbOUMDSqauItr
	nuzbC8EIkwS95WGStEBZJVip05GZDKF81zgXoRThMmt1AQvHTYIqylvaE9a0APXrxv3I
	DxUAiDYQ7nCrYQwwsLH7GOiERbdVxLFuyLhctjeTUYYlLEPju1zPYI+ELJvHF9RufAYj
	gHBQ==
X-Gm-Message-State: APjAAAXYtrVqNa59H6cjko3A1OwXA5NmUw1WR+o1MnUCLCoWQC6yBYfP
	vhKaYaBCSqgCtKuES96ZTw+fg9my
X-Google-Smtp-Source: APXvYqyj75CMBXj2LSsi/jiBQHRTTDc8OmfLG8gLEdjgtqhv0JtE2YzmZ2lur9kYfQUrwGB533ae1w==
X-Received: by 2002:a17:90a:8914:: with SMTP id
	u20mr8192901pjn.111.1567348607193; 
	Sun, 01 Sep 2019 07:36:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:01 -0700
Message-Id: <a2d3d262f6d18fdc1a702d71cdc322842f21996d.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 23/43] linux-yocto/4.19: update to 4.19.57 and -rt22
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:48 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the linux-yocto 4.19 recipe to the latest -stable and -rt
releases.

We also integrate a configuration change to support ptests on scsci
targets:

  scsi-debug: include core scsi support for standalone inclusion

The -stable changes comprise the following commits:

   1a0592436669 Linux 4.19.57
   3919d91f4d36 arm64: insn: Fix ldadd instruction encoding
   9c423fd89a2b usb: dwc3: Reset num_trbs after skipping
   2bbb6b547fbe tipc: pass tunnel dev as NULL to udp_tunnel(6)_xmit_skb
   89c49e7b6b0a RDMA: Directly cast the sockaddr union to sockaddr
   a319c8ff4f09 futex: Update comments and docs about return values of arch futex code
   4423a82cbde3 bpf, arm64: use more scalable stadd over ldxr / stxr loop in xadd
   436869e0cd6d arm64: futex: Avoid copying out uninitialised stack in failed cmpxchg()
   ba6340a7297f bpf: udp: ipv6: Avoid running reuseport's bpf_prog from __udp6_lib_err
   79c6a8c09978 bpf: udp: Avoid calling reuseport's bpf_prog from udp_gro
   613bc37f74c9 bpf: fix unconnected udp hooks
   a7177b94aff4 bpf: fix nested bpf tracepoints with per-cpu data
   4992d4af5881 bpf: lpm_trie: check left child of last leftmost node for NULL
   5e558f9a6d7b bpf: simplify definition of BPF_FIB_LOOKUP related flags
   7d2c0ec20cb2 tun: wake up waitqueues after IFF_UP is set
   a08b915457d6 tipc: check msg->req data len in tipc_nl_compat_bearer_disable
   fdf3e98e1fd9 tipc: change to use register_pernet_device
   32b711f57ce7 team: Always enable vlan tx offload
   eeb770d6ab77 sctp: change to hold sk after auth shkey is created successfully
   9b7b0aab4750 net: stmmac: set IC bit when transmitting frames with HW timestamp
   a373bf728188 net: stmmac: fixed new system time seconds value calculation
   7d76fc211609 net: remove duplicate fetch in sock_getsockopt
   05dceb60e5dd net/packet: fix memory leak in packet_set_ring()
   7c92f3efbad0 ipv4: Use return value of inet_iif() for __raw_v4_lookup in the while loop
   0f3451723ddc bonding: Always enable vlan tx offload
   a4709127e5dd af_packet: Block execution of tasks waiting for transmit to complete in AF_PACKET
   64032e2d9ba8 eeprom: at24: fix unexpected timeout under high load
   c22cea5a21b2 irqchip/mips-gic: Use the correct local interrupt map registers
   dd9f2fb59e01 SUNRPC: Clean up initialisation of the struct rpc_rqst
   b78ad2169282 cpu/speculation: Warn on unsupported mitigations= parameter
   27380331755f NFS/flexfiles: Use the correct TCP timeout for flexfiles I/O
   01a02a98ab1c KVM: x86/mmu: Allocate PAE root array when using SVM's 32-bit NPT
   327460322c7c x86/resctrl: Prevent possible overrun during bitmap operations
   1746dc529104 x86/microcode: Fix the microcode load on CPU hotplug for real
   690049eddb0c x86/speculation: Allow guests to use SSBD even if host does not
   ee71e97285c2 scsi: vmw_pscsi: Fix use-after-free in pvscsi_queue_lck()
   2ba0a5009607 dm log writes: make sure super sector log updates are written in order
   87cf811ab6fb mm/page_idle.c: fix oops because end_pfn is larger than max_pfn
   1192fb703d09 mm: hugetlb: soft-offline: dissolve_free_huge_page() return zero on !PageHuge
   aab629188848 mm: soft-offline: return -EBUSY if set_hwpoison_free_buddy_page() fails
   bcfed145e583 clk: socfpga: stratix10: fix divider entry for the emac clocks
   75f5d78d9fbe fs/binfmt_flat.c: make load_flat_shared_library() work
   49e9b499a34d mm/mempolicy.c: fix an incorrect rebind node in mpol_rebind_nodemask
   6a811c099186 fs/proc/array.c: allow reporting eip/esp for all coredumping threads
   385cacd953b9 usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup
   6edcdd0e6d8f usb: dwc3: gadget: remove wait_end_transfer
   d7ff2e3ff0e0 usb: dwc3: gadget: move requests to cancelled_list
   bba5f9878f67 usb: dwc3: gadget: introduce cancelled_list
   65e1f3403108 usb: dwc3: gadget: extract dwc3_gadget_ep_skip_trbs()
   56092bd50eb9 usb: dwc3: gadget: use num_trbs when skipping TRBs on ->dequeue()
   2a2b1c4dc510 usb: dwc3: gadget: track number of TRBs per request
   420b1237c79f usb: dwc3: gadget: combine unaligned and zero flags
   62805d31969b Revert "usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup"
   3726d8d0b60f qmi_wwan: Fix out-of-bounds read
   cfbe930c7142 net/9p: include trans_common.h to fix missing prototype warning.
   6518b4126b3f 9p/trans_fd: put worker reqs on destroy
   6fad469c84fc 9p/trans_fd: abort p9_read_work if req status changed
   39bf142ae0ca 9p: potential NULL dereference
   6490cdf9d29d 9p: p9dirent_read: check network-provided name length
   e48e7e27e4df 9p/rdma: remove useless check in cm_event_handler
   fb0cbbd8dec7 9p: acl: fix uninitialized iattr access
   3dc511c9ccb9 9p: Rename req to rreq in trans_fd
   04ee7e7b4795 9p/rdma: do not disconnect on down_interruptible EAGAIN
   3665a4d9dca1 9p: Add refcount to p9_req_t
   fa3625794f1a 9p: rename p9_free_req() function
   be87f21e6b25 9p: add a per-client fcall kmem_cache
   1555583b63b3 9p: embed fcall in req to round down buffer allocs
   3ea4cf422323 9p: Use a slab for allocating requests
   f8bc5f1a3aba 9p/xen: fix check for xenbus_read error in front_probe
   a8782ce02687 IB/hfi1: Close PSM sdma_progress sleep window
   fec1a13bdfa9 Revert "x86/uaccess, ftrace: Fix ftrace_likely_update() vs. SMAP"
   85a3b1ef969b arm64: Don't unconditionally add -Wno-psabi to KBUILD_CFLAGS
   6461a4543b34 perf header: Fix unchecked usage of strncpy()
   0bf5d53b53c8 perf help: Remove needless use of strncpy()
   6e75d9272c92 perf ui helpline: Use strlcpy() as a shorter form of strncpy() + explicit set nul
   aec3002d07fd Linux 4.19.56
   cd3e49394cb0 powerpc/mm/64s/hash: Reallocate context ids on fork
   8c4fe20091cd x86/resctrl: Don't stop walking closids when a locksetup group is found
   d451b505b676 mac80211: Do not use stack memory with scatterlist for GMAC
   72dc6786d77a nl80211: fix station_info pertid memory leak
   1e1007ac47d8 mac80211: handle deauthentication/disassociation from TDLS peer
   ccf6a155844b {nl,mac}80211: allow 4addr AP operation on crypto controlled devices
   0e879ef1cb5b mac80211: drop robust management frames from unknown TA
   17d941dc3033 cfg80211: fix memory leak of wiphy device name
   5293c79c6f60 SMB3: retry on STATUS_INSUFFICIENT_RESOURCES instead of failing write
   db7f1076c0bd Bluetooth: Fix regression with minimum encryption key size alignment
   5e9a6c68de0f Bluetooth: Align minimum encryption key size for LE and BR/EDR connections
   64e370233a07 staging: erofs: add requirements field in superblock
   e6803ce36d49 drm/vmwgfx: Use the backdoor port if the HB port is not available
   7499528bb078 arm64: ssbd: explicitly depend on <linux/prctl.h>
   3e16b5c25466 arm64/sve: <uapi/asm/ptrace.h> should not depend on <uapi/linux/prctl.h>
   2296fd59eb30 ARM: dts: am57xx-idk: Remove support for voltage switching for SD card
   cc87ab841bb1 ARM: dts: dra76x: Update MMC2_HS200_MANUAL1 iodelay values
   03426208d1f9 ARM: imx: cpuidle-imx6sx: Restrict the SW2ISO increase to i.MX6SX
   48ee85dc9c52 powerpc/bpf: use unsigned division instruction for 64-bit operations
   a96ac5cb8a56 riscv: mm: synchronize MMU after pte change
   5ad9a23e6dae can: purge socket error queue on sock destruct
   4ea81cc49c59 can: flexcan: fix timeout when set small bitrate
   f6a2c8b3c24a can: xilinx_can: use correct bittiming_const for CAN FD core
   c592b1c3a994 btrfs: start readahead also in seed devices
   17f1dca21d16 nvme: Fix u32 overflow in the number of namespace list calculation
   71d019a6dae9 arm64: Silence gcc warnings about arch ABI drift
   d72a4c78c124 hwmon: (pmbus/core) Treat parameters as paged if on multiple pages
   6029e5818805 hwmon: (core) add thermal sensors only if dev->of_node is present
   153f2d97d0d7 s390/qeth: fix VLAN attribute in bridge_hostnotify udev event
   cedb209bfa5a net: ipvlan: Fix ipvlan device tso disabled while NETIF_F_IP_CSUM is set
   5327e985e61e scsi: smartpqi: unlock on error in pqi_submit_raid_request_synchronous()
   04ceb1348973 scsi: ufs: Check that space was properly alloced in copy_query_response
   e1a101a9dae9 scripts/checkstack.pl: Fix arm64 wrong or unknown architecture
   1f74977c2740 nvmet: fix data_len to 0 for bdev-backed write_zeroes
   8388af891e0e drm/arm/hdlcd: Allow a bit of clock tolerance
   7c7c88deb14d drm/arm/hdlcd: Actually validate CRTC modes
   1fcb0e389538 drm/arm/mali-dp: Add a loop around the second set CVAL and try 5 times
   377958c3ff2c net: ethernet: mediatek: Use NET_IP_ALIGN to judge if HW RX_2BYTE_OFFSET is enabled
   ee2f9878bc04 net: ethernet: mediatek: Use hw_feature to judge if HWLRO is supported
   16cdab63987c sparc: perf: fix updated event period in response to PERF_EVENT_IOC_PERIOD
   7b460a9bb13d mdesc: fix a missing-check bug in get_vdev_port_node_info()
   6bf97a6cb6ce net: hns: Fix loopback test failed at copper ports
   4336ba249b7d net: dsa: mv88e6xxx: avoid error message on remove from VLAN 0
   bf51ec92a35e selftests: vm: install test_vmalloc.sh for run_vmtests
   a0e8215eb9f8 kselftest/cgroup: fix incorrect test_core skip
   59243d6fb45c kselftest/cgroup: fix unexpected testing failure on test_core
   9c2eebe31d75 kselftest/cgroup: fix unexpected testing failure on test_memcontrol
   ae0d1c08843d xtensa: Fix section mismatch between memblock_reserve and mem_reserve
   3089c0ea8a1f MIPS: uprobes: remove set but not used variable 'epc'
   63542eb24ab9 IB/hfi1: Validate page aligned for a given virtual address
   4d61fc383bb5 IB/{qib, hfi1, rdmavt}: Correct ibv_devinfo max_mr value
   830991121773 IB/hfi1: Insure freeze_work work_struct is canceled on shutdown
   3fe551cc9e4e IB/rdmavt: Fix alloc_qpn() WARN_ON()
   3333e0409424 parisc: Fix compiler warnings in float emulation code
   f9dd0f0928a3 parport: Fix mem leak in parport_register_dev_model
   4c950c8bb31a fpga: dfl: Add lockdep classes for pdata->lock
   505de32ea952 fpga: dfl: afu: Pass the correct device to dma_mapping_error()
   7b2145e22247 ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node
   15004afd9845 ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC node
   8f3793bfa3ea dmaengine: sprd: Fix block length overflow
   e478abd4ebf7 dmaengine: dw-axi-dmac: fix null dereference when pointer first is null
   4c21b761b40e ARC: fix build warnings
   d64f99ef010d brcmfmac: sdio: Don't tune while the card is off
   0ad82f2eb3f6 brcmfmac: sdio: Disable auto-tuning around commands expected to fail
   31c99580687a apparmor: enforce nullbyte at end of tag string
   eb2b0bf5c4a4 apparmor: fix PROFILE_MEDIATES for untrusted input
   1d08fe254fd6 Input: silead - add MSSL0017 to acpi_device_id
   ebd7dda84ec2 Input: uinput - add compat ioctl number translation for UI_*_FF_UPLOAD
   9f3559e4f6cd Input: synaptics - enable SMBus on ThinkPad E480 and E580
   e61e41ffcfeb iio: temperature: mlx90632 Relax the compatibility check
   303386b31bfb IB/hfi1: Silence txreq allocation warnings
   7cc9c9930947 IB/hfi1: Validate fault injection opcode user input
   17027034a47b usb: xhci: Don't try to recover an endpoint if port is in error state.
   d606a82ccc0a xhci: detect USB 3.2 capable host controllers correctly
   e6563039674d usb: chipidea: udc: workaround for endpoint conflict issue
   0746b2f50142 scsi: ufs: Avoid runtime suspend possibly being blocked forever
   98467b8fda41 mmc: core: Prevent processing SDIO IRQs when the card is suspended
   0349dbebbb0b mmc: core: Add sdio_retune_hold_now() and sdio_retune_release()
   7ed49e1bf5b3 mmc: core: API to temporarily disable retuning for SDIO CRC errors
   4b6d290cc1c1 mmc: sdhci: sdhci-pci-o2micro: Correctly set bus width when tuning
   4c15ded55979 s390/ap: rework assembler functions to use unions for in/out register variables
   fb48fb155e1b s390/jump_label: Use "jdd" constraint on gcc9
   0319ef1d40ff ovl: fix bogus -Wmaybe-unitialized warning
   639e8c2f0910 ovl: don't fail with disconnected lower NFS
   f1c5aa5eda08 ovl: detect overlapping layers
   a00f405e133f ovl: make i_ino consistent with st_ino in more cases
   d6623379d895 ovl: fix wrong flags check in FS_IOC_FS[SG]ETXATTR ioctls
   3cb5d7fa8f7d ovl: support the FS_IOC_FS[SG]ETXATTR ioctls
   76343a1363f8 gcc-9: silence 'address-of-packed-member' warning
   6a997c3a239a objtool: Support per-function rodata sections
   c493ead38adb tracing: Silence GCC 9 array bounds warning
   78778071092e Linux 4.19.55
   dad3a9314ac9 tcp: refine memory limit test in tcp_fragment()
   63bbbcd8ed53 Linux 4.19.54
   e8e448b08450 Abort file_remove_privs() for non-reg. files
   465ce9a50f8a coredump: fix race condition between collapse_huge_page() and core dumping
   c7fb6b75def2 ocfs2: fix error path kobject memory leak
   fedb1b9c9191 mlxsw: spectrum: Prevent force of 56G
   114e8135ae00 scsi: libsas: delete sas port if expander discover failed
   89ede9d8b5b8 scsi: scsi_dh_alua: Fix possible null-ptr-deref
   cb7c6c33d3bb scsi: smartpqi: properly set both the DMA mask and the coherent DMA mask
   214c5933ffcf scsi: libcxgbi: add a check for NULL pointer in cxgbi_check_route()
   7b9e10944f0d net: phy: dp83867: Set up RGMII TX delay
   7698ad8c14c7 net: phylink: ensure consistent phy interface mode
   8fb2c7969009 net: sh_eth: fix mdio access in sh_eth_close() for R-Car Gen2 and RZ/A1 SoCs
   467f902643f5 arm64: use the correct function type for __arm64_sys_ni_syscall
   98fd62e0a157 arm64: use the correct function type in SYSCALL_DEFINE0
   c5fdfaedecc2 arm64: fix syscall_fn_t type
   df6384e0f42e KVM: PPC: Book3S HV: Don't take kvm->lock around kvm_for_each_vcpu
   b376683f6ab1 KVM: PPC: Book3S: Use new mutex to synchronize access to rtas token list
   4acce744284c xenbus: Avoid deadlock during suspend due to open transactions
   66f33b2bd2d8 xen/pvcalls: Remove set but not used variable
   d92ebe0c1d26 ia64: fix build errors by exporting paddr_to_nid()
   60a3e3b9e5ec perf record: Fix s390 missing module symbol and warning for non-root users
   be0e62666da1 perf namespace: Protect reading thread's namespace
   7d523e33f4b6 perf data: Fix 'strncat may truncate' build failure with recent gcc
   e9fcebe01822 configfs: Fix use-after-free when accessing sd->s_dentry
   ab7a3d9accae ALSA: hda - Force polling mode on CNL for fixing codec communication
   7bea5618eaf9 i2c: dev: fix potential memory leak in i2cdev_ioctl_rdwr
   197501af7ff3 net: aquantia: fix LRO with FCS error
   388534d45f04 net: aquantia: tx clean budget logic error
   b7ca3f331d57 drm/etnaviv: lock MMU while dumping core
   ee61fb4de955 ACPI/PCI: PM: Add missing wakeup.flags.valid checks
   bc19b50b80ca net: tulip: de4x5: Drop redundant MODULE_DEVICE_TABLE()
   9a3208b66cc1 net: stmmac: update rx tail pointer register to fix rx dma hang issue.
   3fbcef3350ab gpio: fix gpio-adp5588 build errors
   991ea848a5c9 perf/ring-buffer: Always use {READ,WRITE}_ONCE() for rb->user_page data
   c133c9db233d perf/ring_buffer: Add ordering to rb->nest increment
   cca19ab29a1a perf/ring_buffer: Fix exposing a temporarily decreased data_head
   a35e78220a9f x86/CPU/AMD: Don't force the CPB cap when running under a hypervisor
   8e5666cdb36b mISDN: make sure device name is NUL terminated
   f3885eecd253 usb: xhci: Fix a potential null pointer dereference in xhci_debugfs_create_endpoint()
   930d31a6f344 powerpc/powernv: Return for invalid IMC domain
   00ed897d618e clk: ti: clkctrl: Fix clkdm_clk handling
   ef4ffa0f0b67 selftests: netfilter: missing error check when setting up veth interface
   61c83de6e622 ipvs: Fix use-after-free in ip_vs_in
   883ce78cded5 netfilter: nf_queue: fix reinject verdict handling
   5a9c29cc2140 perf/x86/intel/ds: Fix EVENT vs. UEVENT PEBS constraints
   dd9b6de79b67 Staging: vc04_services: Fix a couple error codes
   97605ba68790 net: mvpp2: prs: Use the correct helpers when removing all VID filters
   b6a1eabf72a0 net: mvpp2: prs: Fix parser range for VID filtering
   4642a659ab96 net/mlx5: Avoid reloading already removed devices
   1b201b63b647 vsock/virtio: set SOCK_DONE on peer shutdown
   b86a5ccda5c3 tipc: purge deferredq list for each grp member in tipc_group_delete
   e1b0c311b790 sunhv: Fix device naming inconsistency between sunhv_console and sunhv_reg
   d7fcb54ed2a9 sctp: Free cookie before we memdup a new one
   4bb4ba362cc1 nfc: Ensure presence of required attributes in the deactivate_target handler
   7530c3f3d5b9 net: openvswitch: do not free vport if register_netdevice() is failed.
   fc762c999768 net: dsa: rtl8366: Fix up VLAN filtering
   103835df6821 neigh: fix use-after-free read in pneigh_get_next
   2980196db6c1 lapb: fixed leak of control-blocks.
   7eadfacd2be2 ipv6: flowlabel: fl6_sock_lookup() must use atomic_inc_not_zero
   a5ae5920426e hv_netvsc: Set probe mode to sync
   674dc77bd3ec be2net: Fix number of Rx queues used for flow hashing
   10faaa359b41 ax25: fix inconsistent lock state in ax25_destroy_timer
   9f31eb60d7a2 Linux 4.19.53
   90fc261d509e rtc: pcf8523: don't return invalid date when battery is low
   04757d0e3789 drm: add fallback override/firmware EDID modes workaround
   29a6026624cd drm/edid: abstract override/firmware EDID retrieval
   e93ce57f60ca x86/resctrl: Prevent NULL pointer dereference when local MBM is disabled
   0257fc9aa53f x86/mm/KASLR: Compute the size of the vmemmap section properly
   5e3d10d9375d x86/kasan: Fix boot with 5-level paging and KASAN
   ecec31ce4f33 x86/microcode, cpuhotplug: Add a microcode loader CPU hotplug callback
   fa982c692b2f RAS/CEC: Fix binary search function
   e40db40e45cc RAS/CEC: Convert the timer callback to a workqueue
   ca4c34037bb9 timekeeping: Repair ktime_get_coarse*() granularity
   0fcd1432f8b0 USB: serial: option: add Telit 0x1260 and 0x1261 compositions
   5080fb4b3828 USB: serial: option: add support for Simcom SIM7500/SIM7600 RNDIS mode
   d5f20ee10ac0 USB: serial: pl2303: add Allied Telesis VT-Kit3
   c00cd066a024 USB: usb-storage: Add new ID to ums-realtek
   3c7439e2eab9 USB: Fix chipmunk-like voice when using Logitech C270 for recording audio.
   f05b0bf073ef usb: dwc2: host: Fix wMaxPacketSize handling (fix webcam regression)
   63feb7e69fdc usb: dwc2: Fix DMA cache alignment issues
   15bc8e8d4dad drm/vmwgfx: NULL pointer dereference from vmw_cmd_dx_view_define()
   328648ac6aa5 drm/vmwgfx: integer underflow in vmw_cmd_dx_set_shader() leading to an invalid read
   2399b2ac2be7 tools/kvm_stat: fix fields filter for child events
   f69f5679ff8f KVM: s390: fix memory slot handling for KVM_SET_USER_MEMORY_REGION
   9d8f338c92cc KVM: x86/pmu: do not mask the value that is written to fixed PMUs
   04d2a113a283 KVM: x86/pmu: mask the result of rdpmc according to the width of the counters
   60b300975e5f KVM: arm/arm64: Move cc/it checks under hyp's Makefile to avoid instrumentation
   9366f5dc8409 usbnet: ipheth: fix racing condition
   86895090621c tracing: Prevent hist_field_var_ref() from accessing NULL tracing_map_elts
   b64df8133c2e selftests/timers: Add missing fflush(stdout) calls
   3e1d7417b4d6 selftests: fib_rule_tests: fix local IPv4 address typo
   90a564549b4a libnvdimm: Fix compilation warnings with W=1
   ccc9ba8d2508 scsi: bnx2fc: fix incorrect cast to u64 on shift operation
   d7a32c8a1ce1 platform/x86: pmc_atom: Add several Beckhoff Automation boards to critclk_systems DMI table
   1a80d9ff8253 platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table
   c0d3e166e16a nvme: fix memory leak for power latency tolerance
   ddda7e850bf1 nvme: release namespace SRCU protection before performing controller ioctls
   3188fcebbcbd nvme: merge nvme_ns_ioctl into nvme_ioctl
   54261634bdf8 nvme: remove the ifdef around nvme_nvm_ioctl
   a6515af9b839 nvme: fix srcu locking on error return in nvme_get_ns_from_disk
   c4e97af6bff4 arm64/mm: Inhibit huge-vmap with ptdump
   0e50da1e7ced scsi: lpfc: add check for loss of ndlp when sending RRQ
   334d1a2373af scsi: lpfc: correct rcu unlock issue in lpfc_nvme_info_show
   32d3f7d9dec1 scsi: qedi: remove set but not used variables 'cdev' and 'udev'
   f3a7a1137ffc scsi: qedi: remove memset/memcpy to nfunc and use func instead
   ae3787d433f7 f2fs: fix to avoid accessing xattr across the boundary
   32f26da4b769 Drivers: misc: fix out-of-bounds access in function param_set_kgdbts_var
   fcc1ce5b4f42 s390/kasan: fix strncpy_from_user kasan checks
   eddfe9672ed2 Revert "ALSA: seq: Protect in-kernel ioctl calls with mutex"
   731ebeeda51f ALSA: seq: Fix race of get-subscription call vs port-delete ioctls
   b52fd8af8db3 ALSA: seq: Protect in-kernel ioctl calls with mutex
   82055ad3d3ed x86/uaccess, kcov: Disable stack protector
   b08ec06c94fc drm/i915/sdvo: Implement proper HDMI audio support for SDVO
   b7398f45e3d6 ASoC: fsl_asrc: Fix the issue about unsupported rate
   d7d15ac38ba6 ASoC: cs42xx8: Add regcache mask dirty
   c3b85bda41f0 cgroup: Use css_tryget() instead of css_tryget_online() in task_get_css()
   e599bfe54305 bcache: only set BCACHE_DEV_WB_RUNNING when cached device attached
   973fc2b3434b bcache: fix stack corruption by PRECEDING_KEY()
   da3b915a57c3 i2c: acorn: fix i2c warning
   d3e58022c017 iommu/arm-smmu: Avoid constant zero in TLBI writes
   31e216cf9dc2 ptrace: restore smp_rmb() in __ptrace_may_access()
   662b831dde61 signal/ptrace: Don't leak unitialized kernel memory with PTRACE_PEEK_SIGINFO
   54a20289cbfb mm/vmscan.c: fix trying to reclaim unevictable LRU page
   6b9aa7ac48d7 fs/ocfs2: fix race in ocfs2_dentry_attach_lock()
   553a1f0d3c69 mm/list_lru.c: fix memory leak in __memcg_init_list_lru_node
   b7f8bbbbb973 libata: Extend quirks for the ST1000LM024 drives with NOLPM quirk
   88fe03076062 ALSA: firewire-motu: fix destruction of data for isochronous resources
   786b1b40dfb9 ALSA: hda/realtek - Update headset mode for ALC256
   27effeff4533 ALSA: oxfw: allow PCM capture for Stanton SCS.1m
   b59c93226489 Revert "ALSA: hda/realtek - Improve the headset mic for Acer Aspire laptops"
   9fbd67c56529 HID: wacom: Sync INTUOSP2_BT touch state after each frame if necessary
   dd1d71ad57a4 HID: wacom: Correct button numbering 2nd-gen Intuos Pro over Bluetooth
   529013533d73 HID: wacom: Send BTN_TOUCH in response to INTUOSP2_BT eraser contact
   3e9c0eb15932 HID: wacom: Don't report anything prior to the tool entering range
   52a7d604615a HID: wacom: Don't set tool type until we're in range
   fa212dd5a604 HID: multitouch: handle faulty Elo touch device
   9ae306d8dbc8 nouveau: Fix build with CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT disabled
   d54e1b848e99 drm/nouveau: add kconfig option to turn off nouveau legacy contexts. (v3)
   6500aa436df4 Linux 4.19.52
   59222807fcc9 tcp: enforce tcp_min_snd_mss in tcp_mtu_probing()
   7f9f8a37e563 tcp: add tcp_min_snd_mss sysctl
   ec83921899a5 tcp: tcp_fragment() should apply sane memory limits
   c09be31461ed tcp: limit payload size of sacked skbs
   7aa823a959e1 Linux 4.19.51
   b323914cd033 ALSA: seq: Cover unsubscribe_port() in list_mutex
   3af96f3497b7 drm/vc4: fix fb references in async update
   afec706807cd ovl: support stacked SEEK_HOLE/SEEK_DATA
   22dac6cc9549 ovl: check the capability before cred overridden
   b616b9dbc5f6 Revert "drm/nouveau: add kconfig option to turn off nouveau legacy contexts. (v3)"
   8e5483aeae0d Revert "Bluetooth: Align minimum encryption key size for LE and BR/EDR connections"
   526972e95ef9 percpu: do not search past bitmap when allocating an area
   d4d5dce6d329 gpio: vf610: Do not share irq_chip
   28229df6ad13 soc: renesas: Identify R-Car M3-W ES1.3
   db54e08c5832 usb: typec: fusb302: Check vconn is off when we start toggling
   ce183fad3aa8 ARM: exynos: Fix undefined instruction during Exynos5422 resume
   384642ff6465 pwm: Fix deadlock warning when removing PWM device
   7905b2331338 ARM: dts: exynos: Always enable necessary APIO_1V8 and ABB_1V8 regulators on Arndale Octa
   78002e383be7 pwm: tiehrpwm: Update shadow register for disabling PWMs
   9fdcb04e80e1 dmaengine: idma64: Use actual device for DMA transfers
   da00c89fce7a ice: Add missing case in print_link_msg for printing flow control
   456e3563725a gpio: gpio-omap: add check for off wake capable gpios
   47d281bbbff9 PCI: xilinx: Check for __get_free_pages() failure
   b5a185ee30d7 block, bfq: increase idling for weight-raised queues
   e06d7a92796c video: imsttfb: fix potential NULL pointer dereferences
   1f2611af4581 video: hgafb: fix potential NULL pointer dereference
   5957f6f5aaa6 scsi: qla2xxx: Reset the FCF_ASYNC_{SENT|ACTIVE} flags
   c2c7b6fee389 PCI: rcar: Fix 64bit MSI message address handling
   dd54e70c47de PCI: rcar: Fix a potential NULL pointer dereference
   272f8c3ddd31 net: hns3: return 0 and print warning when hit duplicate MAC
   5a286ced4911 power: supply: max14656: fix potential use-before-alloc
   901daed2f173 platform/x86: intel_pmc_ipc: adding error handling
   613752b3a8fb ARM: OMAP2+: pm33xx-core: Do not Turn OFF CEFUSE as PPA may be using it
   668440f6ee3f drm/amd/display: Use plane->color_space for dpp if specified
   671fc9007c48 PCI: rpadlpar: Fix leaked device_node references in add/remove paths
   b531acbd86d2 ARM: dts: imx6qdl: Specify IMX6QDL_CLK_IPG as "ipg" clock to SDMA
   584cabc69aee ARM: dts: imx6sx: Specify IMX6SX_CLK_IPG as "ipg" clock to SDMA
   02936545fbea ARM: dts: imx6ul: Specify IMX6UL_CLK_IPG as "ipg" clock to SDMA
   36a7fda0595b ARM: dts: imx7d: Specify IMX7D_CLK_IPG as "ipg" clock to SDMA
   c84911bb39d1 ARM: dts: imx6sll: Specify IMX6SLL_CLK_IPG as "ipg" clock to SDMA
   a2e661f99c4d ARM: dts: imx6sx: Specify IMX6SX_CLK_IPG as "ahb" clock to SDMA
   461f4183926c ARM: dts: imx53: Specify IMX5_CLK_IPG as "ahb" clock to SDMA
   998860d0384d ARM: dts: imx50: Specify IMX5_CLK_IPG as "ahb" clock to SDMA
   70465bbbaeae ARM: dts: imx51: Specify IMX5_CLK_IPG as "ahb" clock to SDMA
   57f89084a7e1 soc: rockchip: Set the proper PWM for rk3288
   b16594860a30 clk: rockchip: Turn on "aclk_dmac1" for suspend on rk3288
   8e9dd864d6a7 soc: mediatek: pwrap: Zero initialize rdata in pwrap_init_cipher
   f7c0e67054d8 PCI: keystone: Prevent ARM32 specific code to be compiled for ARM64
   a357310a5774 platform/chrome: cros_ec_proto: check for NULL transfer function
   b78a9b2818d5 i40e: Queues are reserved despite "Invalid argument" error
   aeb743dbe936 x86/PCI: Fix PCI IRQ routing table memory leak
   47e6a354e248 net: thunderbolt: Unregister ThunderboltIP protocol handler when suspending
   31aa2a7a8566 switchtec: Fix unintended mask of MRPC event
   4b19a45eed4d iommu/arm-smmu-v3: Don't disable SMMU in kdump kernel
   f7883f9b5a67 vfio: Fix WARNING "do not call blocking ops when !TASK_RUNNING"
   806e83958482 nfsd: avoid uninitialized variable warning
   b4330e4a7c12 nfsd: allow fh_want_write to be called twice
   ae35c325d8fd fuse: retrieve: cap requested size to negotiated max_write
   1c2e974628d1 nvmem: sunxi_sid: Support SID on A83T and H5
   0412a8857198 nvmem: core: fix read buffer in place
   962ce4023178 ALSA: hda - Register irq handler after the chip initialization
   028b3d8d549e netfilter: nf_flow_table: fix netdev refcnt leak
   650a4b7c5d66 netfilter: nf_flow_table: check ttl value in flow offload data path
   52d7b067fadf nvme-pci: shutdown on timeout during deletion
   6ce2ad24ae9c nvme-pci: unquiesce admin queue on shutdown
   e9db931283fd PCI: designware-ep: Use aligned ATU window for raising MSI interrupts
   a7f27994b207 misc: pci_endpoint_test: Fix test_reg_bar to be updated in pci_endpoint_test
   ed6efdb74438 iommu/vt-d: Set intel_iommu_gfx_mapped correctly
   525b5265fd75 blk-mq: move cancel of requeue_work into blk_mq_release
   d6c80b609d81 watchdog: fix compile time error of pretimeout governors
   0f50c30c8470 watchdog: imx2_wdt: Fix set_timeout for big timeout values
   dc58e4027430 netfilter: nf_tables: fix base chain stat rcu_dereference usage
   2d433cc9bd31 mips: Make sure dt memory regions are valid
   2aed9dfe1e5d netfilter: nf_conntrack_h323: restore boundary check correctness
   d0941980fd81 netfilter: nf_flow_table: fix missing error check for rhashtable_insert_fast
   217ec4a6e4ef mmc: mmci: Prevent polling for busy detection in IRQ context
   06382ad6cf31 ovl: do not generate duplicate fsnotify events for "fake" path
   5fbe39bfd1e0 PCI: dwc: Free MSI IRQ page in dw_pcie_free_msi()
   a6b79e2c7c02 PCI: dwc: Free MSI in dw_pcie_host_init() error path
   a4aa02826701 uml: fix a boot splat wrt use of cpu_all_mask
   4dc146d47fea configfs: fix possible use-after-free in configfs_register_group
   5329dcafead2 percpu: remove spurious lock dependency between percpu and sched
   8d7ebdd109b4 f2fs: fix to do checksum even if inode page is uptodate
   640248545436 f2fs: fix to do sanity check on valid block count of segment
   101e48feb661 f2fs: fix to use inline space only if inline_xattr is enable
   45624f0e8142 f2fs: fix to avoid panic in dec_valid_block_count()
   47a92acf9ebf f2fs: fix to clear dirty inode in error path of f2fs_iget()
   ca9fcbc5a5f5 f2fs: fix to do sanity check on free nid
   f3aa313d0d4f f2fs: fix to avoid panic in f2fs_remove_inode_page()
   0325c5cce544 f2fs: fix to avoid panic in f2fs_inplace_write_data()
   8490bf2d6176 f2fs: fix to avoid panic in do_recover_data()
   0b50d08c5d85 ntp: Allow TAI-UTC offset to be set to zero
   102f6e1249fb mailbox: stm32-ipcc: check invalid irq
   c5b2c8249ff3 pwm: meson: Use the spin-lock only to protect register modifications
   689fe88d51aa EDAC/mpc85xx: Prevent building as a module
   f9ee13ce21db bpf: fix undefined behavior in narrow load handling
   991b51048c49 drm/nouveau/kms/gv100-: fix spurious window immediate interlocks
   20e1a16702d9 objtool: Don't use ignore flag for fake jumps
   124c23dca3ac drm/bridge: adv7511: Fix low refresh rate selection
   2a3f2b43a9e3 drm/nouveau/kms/gf119-gp10x: push HeadSetControlOutputResource() mthd when encoders change
   f9706dd945e9 perf/x86/intel: Allow PEBS multi-entry in watermark mode
   5540d0146151 mfd: twl6040: Fix device init errors for ACCCTL register
   3b8892bea9eb drm/nouveau/disp/dp: respect sink limits when selecting failsafe link configuration
   e9a8c9805f58 mfd: intel-lpss: Set the device in reset state when init
   12c57327a128 mfd: tps65912-spi: Add missing of table registration
   1196b79a20f7 drivers: thermal: tsens: Don't print error message on -EPROBE_DEFER
   fd77a5117721 thermal: rcar_gen3_thermal: disable interrupt in .remove
   c50c4fb0cb62 kernel/sys.c: prctl: fix false positive in validate_prctl_map()
   515d18ced8e1 mm/slab.c: fix an infinite loop in leaks_show()
   13e1ea0881da mm/cma_debug.c: fix the break condition in cma_maxchunk_get()
   38c5fce7fc48 mm: page_mkclean vs MADV_DONTNEED race
   77a01e33570c mm/cma.c: fix the bitmap status to show failed allocation reason
   25511676362d initramfs: free initrd memory if opening /initrd.image fails
   e5f8857ea972 mm/cma.c: fix crash on CMA allocation if bitmap allocation fails
   5094a85d6d93 mem-hotplug: fix node spanned pages when we have a node with only ZONE_MOVABLE
   ffaafd27b067 hugetlbfs: on restore reserve error path retain subpool reservation
   85e1a6c4b3e5 mm/hmm: select mmu notifier when selecting HMM
   e0c3fc1f8fe3 ARM: prevent tracing IPI_CPU_BACKTRACE
   4d3811a60e10 drm/pl111: Initialize clock spinlock early
   20de754a7d88 ipc: prevent lockup on alloc_msg and free_msg
   91ae202e2c88 sysctl: return -EINVAL if val violates minmax
   5b6619b4d206 fs/fat/file.c: issue flush after the writeback of FAT
   2a89e4c5ee2e rapidio: fix a NULL pointer dereference when create_workqueue() fails
   768292d05361 Linux 4.19.50
   51dc284e2a87 ethtool: check the return value of get_regs_len
   645fa685bb20 ipv4: Define __ipv4_neigh_lookup_noref when CONFIG_INET is disabled
   ec8a9eb2a6c1 TTY: serial_core, add ->install
   6bdc692f5c9e drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
   fbb7e114e6e6 drm: don't block fb changes for async plane updates
   6600ec2600d6 drm/i915: Maintain consistent documentation subsection ordering
   360e00e290a3 drm/i915/fbc: disable framebuffer compression on GeminiLake
   554f4253700e drm/i915: Fix I915_EXEC_RING_MASK
   f3dcc88d531f drm/amdgpu: remove ATPX_DGPU_REQ_POWER_FOR_DISPLAYS check when hotplug-in
   84c82ab8f133 drm/radeon: prefer lower reference dividers
   748a97ec6c15 drm/amdgpu/psp: move psp version specific function pointers to early_init
   98a8cb0282ab drm: add non-desktop quirks to Sensics and OSVR headsets.
   610382337557 drm/nouveau: add kconfig option to turn off nouveau legacy contexts. (v3)
   490290b0415f drm: add non-desktop quirk for Valve HMDs
   ac222e8a50af drm/msm: fix fb references in async update
   6470aa05ae15 drm/gma500/cdv: Check vbt config bits when detecting lvds panels
   7fbcb7d1031d test_firmware: Use correct snprintf() limit
   67bdeb0c6f5c genwqe: Prevent an integer overflow in the ioctl
   221c44d2d7fa Revert "MIPS: perf: ath79: Fix perfcount IRQ assignment"
   2d9d3ab541a6 MIPS: pistachio: Build uImage.gz by default
   eee609635076 MIPS: Bounds check virt_addr_valid
   b9b75a460076 xen-blkfront: switch kcalloc to kvcalloc for large array allocation
   7aad9269a6e8 s390/mm: fix address space detection in exception handling
   7737eff01711 i2c: xiic: Add max_read_len quirk
   b598ddc7b9fc x86/insn-eval: Fix use-after-free access to LDT entry
   4d166206cf41 x86/power: Fix 'nosmt' vs hibernation triple fault during resume
   f4d0227ff170 pstore/ram: Run without kernel crash dump region
   aa73a3b205a4 pstore: Set tfm to NULL on free_buf_for_compression
   d4128a1b580c pstore: Convert buf_lock to semaphore
   c63ce7166daf pstore: Remove needless lock during console writes
   a3b8b4ad6db7 fuse: fallocate: fix return with locked inode
   56e3f73e838a NFSv4.1: Fix bug only first CB_NOTIFY_LOCK is handled
   ea0327b47754 NFSv4.1: Again fix a race where CB_NOTIFY_LOCK fails to wake a waiter
   384c1d931b5e parisc: Use implicit space register selection for loading the coherence index of I/O pdirs
   6726307d2008 rcu: locking and unlocking need to always be at least barriers
   39e597d283b0 mtd: spinand: macronix: Fix ECC Status Read
   2488b9f9afde ipv6: fix EFAULT on sendto with icmpv6 and hdrincl
   0b16d956ee5b ipv6: use READ_ONCE() for inet->hdrincl as in ipv4
   d769853dbdaa Revert "fib_rules: return 0 directly if an exactly same rule exists when NLM_F_EXCL not supplied"
   396244b6ecf0 pktgen: do not sleep with the thread lock held.
   da096fe1a6a4 packet: unconditionally free po->rollover
   be0343af1291 net/tls: replace the sleeping lock around RX resync with a bit lock
   9740f4ff1a66 net: sfp: read eeprom in maximum 16 byte increments
   7700d5afff30 net: rds: fix memory leak in rds_ib_flush_mr_pool
   c6a020e0117f net: mvpp2: Use strscpy to handle stat strings
   d305d61fcf96 net/mlx4_en: ethtool, Remove unsupported SFP EEPROM high pages query
   831d6d077874 net: ethernet: ti: cpsw_ethtool: fix ethtool ring param set
   893e2a5f5cf6 neighbor: Call __ipv4_neigh_lookup_noref in neigh_xmit
   9fd19a3b4f61 ipv6: fix the check before getting the cookie in rt6_get_cookie
   daa11cc841d6 ipv4: not do cache for local delivery if bc_forwarding is enabled
   05b933f25a83 Fix memory leak in sctp_process_init
   d6782b8c5c18 ethtool: fix potential userspace buffer overflow
   bb7b450e61a1 Linux 4.19.49
   9861e2cd4616 media: uvcvideo: Fix uvc_alloc_entity() allocation alignment
   b52ca352489b of: overlay: set node fields from properties when add new overlay node
   15151d0013c9 of: overlay: validate overlay properties #address-cells and #size-cells
   26dace362e7f scsi: lpfc: Fix backport of faf5a744f4f8 ("scsi: lpfc: avoid uninitialized variable warning")
   ca309fef7a69 x86/kprobes: Set instruction page as executable
   b49ca4bf1b9c x86/ftrace: Set trampoline pages as executable
   6fa953c94882 x86/ftrace: Do not call function graph from dynamic trampolines
   9d57cfd4e9d8 binder: fix race between munmap() and direct reclaim
   137c838f177b Revert "binder: fix handling of misaligned binder object"
   385dab299c8a Revert "x86/build: Move _etext to actual end of .text"
   9468870f7cbd include/linux/module.h: copy __init/__exit attrs to init/cleanup_module
   2a0f719db71c Compiler Attributes: add support for __copy (gcc >= 9)
   390a0fd31b02 drm/lease: Make sure implicit planes are leased
   699f0e9d24c8 drm/rockchip: shutdown drm subsystem on shutdown
   1ca811507e41 drm/sun4i: Fix sun8i HDMI PHY configuration for > 148.5 MHz
   1f1372206e0b drm/sun4i: Fix sun8i HDMI PHY clock initialization
   3a20515c3c44 drm/vmwgfx: Don't send drm sysfs hotplug events on initial master set
   1715a46322fa drm/tegra: gem: Fix CPU-cache maintenance for BO's allocated using get_pages()
   132137d1bfa1 gcc-plugins: Fix build failures under Darwin host
   873041930dab Revert "lockd: Show pid of lockd for remote locks"
   297a251062c0 CIFS: cifs_read_allocate_pages: don't iterate through whole page array on ENOMEM
   32d57c0c063c cifs: fix memory leak of pneg_inbuf on -EOPNOTSUPP ioctl case
   f6a39f877feb staging: wlan-ng: fix adapter initialization failure
   27a4b6c8c1cf staging: vc04_services: prevent integer overflow in create_pagelist()
   3078e80b03c8 serial: sh-sci: disable DMA for uart_console
   ff818b449a5b vt/fbcon: deinitialize resources in visual_init() after failed memory allocation
   6e322a9e42cd evm: check hash algorithm passed to init_desc()
   f85b87a9a2a8 ima: show rules with IMA_INMASK correctly
   21158982f6b7 doc: Cope with Sphinx logging deprecations
   c0742228bba6 doc: Cope with the deprecation of AutoReporter
   301b18edbf56 docs: Fix conf.py for Sphinx 2.0
   871953434bd9 arm64: Fix the arm64_personality() syscall wrapper redirection
   6f8d26270ce3 kernel/signal.c: trace_signal_deliver when signal_group_exit
   8b057ad846c5 memcg: make it work on sparse non-0-node systems
   4e29e2ecf186 tty: max310x: Fix external crystal register setup
   a071517b85cc tty: serial: msm_serial: Fix XON/XOFF
   bb03290431bc i2c: synquacer: fix synquacer_i2c_doxfer() return value
   d2d8f6401254 i2c: mlxcpld: Fix wrong initialization order in probe
   88ad86b80782 drm/nouveau/i2c: Disable i2c bus access after ->fini()
   6a2fbec70766 KVM: s390: Do not report unusabled IDs via KVM_CAP_MAX_VCPU_ID
   3834630ef4d3 ALSA: hda/realtek - Improve the headset mic for Acer Aspire laptops
   9cfd6c36759b ALSA: hda/realtek - Set default power save node to 0
   eb2eeec920fb ALSA: line6: Assure canceling delayed work at disconnection
   ca221cf9ab6f powerpc/perf: Fix MMCRA corruption by bhrb_filter
   55a94d81f536 KVM: PPC: Book3S HV: XIVE: Do not clear IRQ data of passthrough interrupts
   badbe1abbd59 s390/crypto: fix possible sleep during spinlock aquired
   83c874cf6861 s390/crypto: fix gcm-aes-s390 selftest failures
   5dede5c9e605 iio: adc: ti-ads8688: fix timestamp is not updated in buffer
   06c5ec6fd0b1 iio: dac: ds4422/ds4424 fix chip verification
   8a652fd142c3 Btrfs: incremental send, fix file corruption when no-holes feature is enabled
   a81071110d25 Btrfs: fix fsync not persisting changed attributes of a directory
   37fe038328a2 Btrfs: fix race updating log root item during fsync
   7301bbeae98f Btrfs: fix wrong ctime and mtime of a directory after log replay
   da32e0303d5f tracing: Avoid memory leak in predicate_parse()
   9756c7e0cdc7 scsi: zfcp: fix to prevent port_remove with pure auto scan LUNs (only sdevs)
   e8bd0dffe816 scsi: zfcp: fix missing zfcp_port reference put on -EBUSY from port_remove
   c18a0ecc411a brcmfmac: fix NULL pointer derefence during USB disconnect
   1f64751af190 media: smsusb: better handle optional alignment
   e6df98cafc9c media: usb: siano: Fix false-positive "uninitialized variable" warning
   35b104456652 media: usb: siano: Fix general protection fault in smsusb
   b4c1b4a61f78 USB: rio500: fix memory leak in close after disconnect
   d2d93077bac3 USB: rio500: refuse more than one device at a time
   d8c1703932bc USB: Add LPM quirk for Surface Dock GigE adapter
   d27ea5e9eb4a USB: sisusbvga: fix oops in error path of sisusb_probe
   a43bb9e83155 USB: Fix slab-out-of-bounds write in usb_get_bos_descriptor
   2fc485b0008e usbip: usbip_host: fix stub_dev lock context imbalance regression
   e3724d69b732 usbip: usbip_host: fix BUG: sleeping function called from invalid context
   9690202da222 usb: xhci: avoid null pointer deref when bos field is NULL
   8e30ba04a20a xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()
   32adfa3d92e7 xhci: Use %zu for printing size_t type
   eebcff780603 xhci: update bounce buffer with correct sg num
   759766bf2aec include/linux/bitops.h: sanitize rotate primitives
   89156c1005d2 sparc64: Fix regression in non-hypervisor TLB flush xcall
   e109a984cf38 Linux 4.19.48
   ca75a9fc5ba4 tipc: fix modprobe tipc failed after switch order of device registration
   ab69a2304210 Revert "tipc: fix modprobe tipc failed after switch order of device registration"
   99dcf4a4dd2e xen/pciback: Don't disable PCI_COMMAND on PCI device reset.
   0276ebf16675 jump_label: move 'asm goto' support test to Kconfig
   753328727cab compiler.h: give up __compiletime_assert_fallback()
   fd45cd4530eb include/linux/compiler*.h: define asm_volatile_goto
   2bb9c7e42836 crypto: vmx - ghash: do nosimd fallback manually
   fb6cf4f3704b net/tls: don't ignore netdev notifications if no TLS features
   fb69403ec2ff net/tls: fix state removal with feature flags off
   27d8ad1d8ea9 bnxt_en: Fix aggregation buffer leak under OOM condition.
   a1a926fc68c7 net: stmmac: dma channel control register need to be init first
   1db0bcc27c78 net/mlx5e: Disable rxhash when CQE compress is enabled
   e0d95806b05d net/mlx5: Allocate root ns memory using kzalloc to match kfree
   4421d31753ec tipc: Avoid copying bytes beyond the supplied data
   06442f45e5cf net/mlx5: Avoid double free in fs init error unwinding path
   fb836d014e37 usbnet: fix kernel crash after disconnect
   191989817df9 net: stmmac: fix reset gpio free missing
   6ab968473140 net: sched: don't use tc_action->order during action dump
   33f737a4307d net: phy: marvell10g: report if the PHY fails to boot firmware
   c2d4b2feb057 net: mvpp2: fix bad MVPP2_TXQ_SCHED_TOKEN_CNTR_REG queue value
   de9d6a730cc0 net: mvneta: Fix err code path of probe
   39fd0dc4a556 net-gro: fix use-after-free read in napi_gro_frags()
   4294c3475035 net: fec: fix the clk mismatch in failed_reset path
   566dc17b993d net: dsa: mv88e6xxx: fix handling of upper half of STATS_TYPE_PORT
   2d04f32c8861 llc: fix skb leak in llc_build_and_send_ui_pkt()
   442176668ecf ipv6: Fix redirect with VRF
   ed753b394321 ipv6: Consider sk_bound_dev_if when binding a raw socket to an address
   46702dd5d504 ipv4/igmp: fix build error if !CONFIG_IP_MULTICAST
   e9f94e480f3e ipv4/igmp: fix another memory leak in igmpv3_del_delrec()
   07480da0c8a1 inet: switch IP ID generator to siphash
   9c9144e78996 cxgb4: offload VLAN flows regardless of VLAN ethtype
   3cde0a250845 bonding/802.3ad: fix slave link initialization transition states
   0df021b2e841 Linux 4.19.47
   26433652f0e4 NFS: Fix a double unlock from nfs_match,get_client
   1a686177acde drm/sun4i: dsi: Enforce boundaries on the start delay
   6956c0e3cf33 vfio-ccw: Prevent quiesce function going into an infinite loop
   476e87eb7f78 drm/sun4i: dsi: Change the start delay calculation
   00734a9e7329 drm: Wake up next in drm_read() chain if we are forced to putback the event
   d6dea92a4862 drm/drv: Hold ref on parent device during drm_device lifetime
   473bc1af7a22 drm/v3d: Handle errors from IRQ setup.
   b9c8f86f50ac ASoC: davinci-mcasp: Fix clang warning without CONFIG_PM
   cc211863ac79 spi: Fix zero length xfer bug
   8f7f333af9f6 spi: imx: stop buffer overflow in RX FIFO flush
   3ae1817a29e7 spi: rspi: Fix sequencer reset during initialization
   676aec9b8f11 drm/omap: dsi: Fix PM for display blank with paired dss_pll calls
   bdc095631d50 spi : spi-topcliff-pch: Fix to handle empty DMA buffers
   98eb1b80fea7 scsi: lpfc: Fix SLI3 commands being issued on SLI4 devices
   755dc83020a5 media: saa7146: avoid high stack usage with clang
   584e06c0ed20 scsi: lpfc: Fix fc4type information for FDMI
   aecb245fdd90 scsi: lpfc: Fix FDMI manufacturer attribute value
   4192c77f50dc media: vimc: zero the media_device on probe
   fd1ade15f299 media: go7007: avoid clang frame overflow warning with KASAN
   6d16d2e130e4 media: gspca: do not resubmit URBs when streaming has stopped
   acf41fb8df45 media: vimc: stream: fix thread state before sleep
   aeea87865aa7 scsi: ufs: fix a missing check of devm_reset_control_get
   62e79f4c6bc0 drm/amd/display: Set stream->mode_changed when connectors change
   fc5293ab6c48 drm/amd/display: Fix Divide by 0 in memory calculations
   91435fce9b24 media: staging: davinci_vpfe: disallow building with COMPILE_TEST
   f51db48c1220 media: m88ds3103: serialize reset messages in m88ds3103_set_frontend
   e93677055a5a media: dvbsky: Avoid leaking dvb frontend
   ab934f0ac158 media: si2165: fix a missing check of return value
   561bd5615604 igb: Exclude device from suspend direct complete optimization
   b6bc20249423 tinydrm/mipi-dbi: Use dma-safe buffers for all SPI transfers
   5ec9ba494db2 e1000e: Disable runtime PM on CNP+
   495e34e62c3b thunderbolt: property: Fix a NULL pointer dereference
   70611b1b81c4 drm/amd/display: fix releasing planes when exiting odm
   988dab7f5778 thunderbolt: Fix to check for kmemdup failure
   877a202f9b27 thunderbolt: Fix to check return value of ida_simple_get
   b9291078edce hwrng: omap - Set default quality
   6b2d1934d1f9 dmaengine: tegra210-adma: use devm_clk_*() helpers
   25204fe6a3f8 batman-adv: allow updating DAT entry timeouts on incoming ARP Replies
   a2ace9b24387 selinux: avoid uninitialized variable warning
   c7595096daf9 scsi: lpfc: avoid uninitialized variable warning
   ac9149bc1402 scsi: qla4xxx: avoid freeing unallocated dma memory
   239156e0c04a usb: core: Add PM runtime calls to usb_hcd_platform_shutdown
   506b28fb9982 rcuperf: Fix cleanup path for invalid perf_type strings
   75a96196d4c4 x86/mce: Handle varying MCA bank counts
   aa7919e37fee rcutorture: Fix cleanup path for invalid torture_type strings
   3d036cbaab92 x86/mce: Fix machine_check_poll() tests for error types
   3c2b1ae4410c overflow: Fix -Wtype-limits compilation warnings
   19ae270d1ce0 tty: ipwireless: fix missing checks for ioremap
   3392cc5f3ce3 virtio_console: initialize vtermno value for ports
   e819d4a13688 scsi: qedf: Add missing return in qedf_post_io_req() in the fcport offload check
   dc0f37b780e9 timekeeping: Force upper bound for setting CLOCK_REALTIME
   ee40c8a3efc2 thunderbolt: Fix to check the return value of kmemdup
   c8eecd658220 thunderbolt: property: Fix a missing check of kzalloc
   1de8f9653585 efifb: Omit memory map check on legacy boot
   356f05fdd490 media: gspca: Kill URBs on USB device disconnect
   2a9331ced525 media: wl128x: prevent two potential buffer overflows
   6b5693f20dd8 media: video-mux: fix null pointer dereferences
   bc75207a54dd kobject: Don't trigger kobject_uevent(KOBJ_REMOVE) twice.
   ba906246e38b spi: tegra114: reset controller on probe
   2cd236c27157 HID: logitech-hidpp: change low battery level threshold from 31 to 30 percent
   fb2c65b4a279 cxgb3/l2t: Fix undefined behaviour
   71efe4c70afc ASoC: fsl_utils: fix a leaked reference by adding missing of_node_put
   b6b7a78cf997 ASoC: eukrea-tlv320: fix a leaked reference by adding missing of_node_put
   69f67200cfd6 HID: core: move Usage Page concatenation to Main item
   256f63c6806d sh: sh7786: Add explicit I/O cast to sh7786_mm_sel()
   8ea279184619 RDMA/hns: Fix bad endianess of port_pd variable
   65ec64f28a88 chardev: add additional check for minor range overlap
   fc242af86d07 x86/uaccess: Fix up the fixup
   5007453c7144 x86/ia32: Fix ia32_restore_sigcontext() AC leak
   4614b0bb8f65 x86/uaccess, signal: Fix AC=1 bloat
   1a3188d737ce x86/uaccess, ftrace: Fix ftrace_likely_update() vs. SMAP
   da30c277c4fd wil6210: fix return code of wmi_mgmt_tx and wmi_mgmt_tx_ext
   e667aef54f8a arm64: cpu_ops: fix a leaked reference by adding missing of_node_put
   e3980dbef43a drm/panel: otm8009a: Add delay at the end of initialization
   cb5946e5c86a scsi: ufs: Avoid configuring regulator with undefined voltage range
   31318d4ae3ae scsi: ufs: Fix regulator load and icc-level configuration
   c9e44a1a734a rtlwifi: fix potential NULL pointer dereference
   bd2ab045df4a rtc: xgene: fix possible race condition
   e29aba14e8db brcmfmac: fix Oops when bringing up interface during USB disconnect
   8a412ed97184 brcmfmac: fix race during disconnect when USB completion is in progress
   ce55a5941ed4 brcmfmac: fix WARNING during USB disconnect in case of unempty psq
   4b2f0ebc306b brcmfmac: convert dev_init_lock mutex to completion
   59ec3ad30ab8 b43: shut up clang -Wuninitialized variable warning
   7c9d97f3b11d brcmfmac: fix missing checks for kmemdup
   a27ce4840f89 mwifiex: Fix mem leak in mwifiex_tm_cmd
   7be8d4251bf7 rtlwifi: fix a potential NULL pointer dereference
   f8f54929bd23 selftests/bpf: ksym_search won't check symbols exists
   ef8e5a78406d iio: adc: ti-ads7950: Fix improper use of mlock
   36a59a036896 iio: common: ssp_sensors: Initialize calculated_time in ssp_common_process_data
   dd106d198dee iio: hmc5843: fix potential NULL pointer dereferences
   d7c773412f4b iio: ad_sigma_delta: Properly handle SPI bus locking vs CS assertion
   ce59174d4e69 drm/pl111: fix possible object reference leak
   e758471be038 x86/build: Keep local relocations with ld.lld
   2b18febc8cdc block: sed-opal: fix IOC_OPAL_ENABLE_DISABLE_MBR
   9d8b1d5db780 cpufreq: kirkwood: fix possible object reference leak
   f9ead9f4d145 cpufreq: pmac32: fix possible object reference leak
   513a7f8e8929 cpufreq/pasemi: fix possible object reference leak
   9612f4040f05 cpufreq: ppc_cbe: fix possible object reference leak
   f8a91441b2a1 qmi_wwan: Add quirk for Quectel dynamic config
   1b6141cd052b selftests: cgroup: fix cleanup path in test_memcg_subtree_control()
   9c594cae285c s390: cio: fix cio_irb declaration
   c3c614380548 s390/mm: silence compiler warning when compiling without CONFIG_PGSTE
   a07de9b98fbf x86/microcode: Fix the ancient deprecated microcode loading method
   a3713f2cebdc s390: zcrypt: initialize variables before_use
   e91146984939 clk: rockchip: Make rkpwm a critical clock on rk3288
   c9aa87e5f345 extcon: arizona: Disable mic detect if running when driver is removed
   822342658459 clk: rockchip: Fix video codec clocks on rk3288
   cbaab786ee67 PM / core: Propagate dev->power.wakeup_path when no callbacks
   d8a36f841803 drm/amdgpu: fix old fence check in amdgpu_fence_emit
   e107bc69cc59 mmc: sdhci-of-esdhc: add erratum eSDHC-A001 and A-008358 support
   019ca0bf8d91 mmc: sdhci-of-esdhc: add erratum A-009204 support
   80118cba1f78 mmc: sdhci-of-esdhc: add erratum eSDHC5 support
   fa291e89997a mmc_spi: add a status check for spi_sync_locked
   059c2f5326a0 mmc: core: make pwrseq_emmc (partially) support sleepy GPIO controllers
   aa06e61237ab scsi: libsas: Do discovery on empty PHY to update PHY info
   4e98f3b11a7a hwmon: (f71805f) Use request_muxed_region for Super-IO accesses
   8cfe000d0a69 hwmon: (pc87427) Use request_muxed_region for Super-IO accesses
   48b31e8a025f hwmon: (smsc47b397) Use request_muxed_region for Super-IO accesses
   e7dbe597ea55 hwmon: (smsc47m1) Use request_muxed_region for Super-IO accesses
   fbdce79e7c3b hwmon: (vt1211) Use request_muxed_region for Super-IO accesses
   1cd4902d9088 perf/x86/intel/cstate: Add Icelake support
   ea6ff1bb3d00 perf/x86/intel/rapl: Add Icelake support
   3a9a1fd14b27 perf/x86/msr: Add Icelake support
   9754bab2057e RDMA/cxgb4: Fix null pointer dereference on alloc_skb failure
   b0f6ac8c81e0 arm64: vdso: Fix clock_getres() for CLOCK_REALTIME
   9082058b549a ACPI/IORT: Reject platform device creation on NUMA node mapping failure
   4a9c84499e11 i40e: don't allow changes to HW VLAN stripping on active port VLANs
   e3e8cdacdcce i40e: Able to add up to 16 MAC filters on an untrusted VF
   267b3c6b3f45 phy: mapphone-mdm6600: add gpiolib dependency
   3ecda6884660 phy: sun4i-usb: Make sure to disable PHY0 passby for peripheral mode
   63b4f89d03c2 drm: etnaviv: avoid DMA API warning when importing buffers
   f843f848c567 x86/irq/64: Limit IST stack overflow check to #DB stack
   97abdfa81f1c USB: core: Don't unbind interfaces following device reset failure
   3711c9885278 s390/qeth: handle error from qeth_update_from_chp_desc()
   5d5652b51c87 thunderbolt: Take domain lock in switch sysfs attribute callbacks
   afee27f38253 irq_work: Do not raise an IPI when queueing work on the local CPU
   dee2faf0ac0c drm/msm: a5xx: fix possible object reference leak
   e0b75a798651 staging: vc04_services: handle kzalloc failure
   355673f80835 sched/core: Handle overflow in cpu_shares_write_u64
   7053046e350f sched/rt: Check integer overflow at usec to nsec conversion
   925275d0cc5d sched/core: Check quota and period overflow at usec to nsec conversion
   4e4d5cea79a7 cgroup: protect cgroup->nr_(dying_)descendants by css_set_lock
   944c58523731 random: add a spinlock_t to struct batched_entropy
   6fa6381a2da0 random: fix CRNG initialization when random.trust_cpu=1
   fec8a09f79ec powerpc/64: Fix booting large kernels with STRICT_KERNEL_RWX
   f488832c2099 powerpc/numa: improve control of topology updates
   ad393793794e block: fix use-after-free on gendisk
   30f8da71c730 iio: adc: stm32-dfsdm: fix unmet direct dependencies detected
   11ad52770a42 media: pvrusb2: Prevent a buffer overflow
   a90ce66af211 media: au0828: Fix NULL pointer dereference in au0828_analog_stream_enable()
   2096b3ba3274 media: stm32-dcmi: fix crash when subdev do not expose any formats
   6c21fa849a5a audit: fix a memory leak bug
   9fcfaab61420 media: ov2659: make S_FMT succeed even if requested format doesn't match
   e3a9d646ecf2 media: au0828: stop video streaming only when last user stops
   3ccd89123b67 media: ov6650: Move v4l2_clk_get() to ov6650_video_probe() helper
   81a0b6ff0209 media: coda: clear error return value before picture run
   83544b04a406 dmaengine: at_xdmac: remove BUG_ON macro in tasklet
   bfb9e836cf26 perf/arm-cci: Remove broken race mitigation
   2d1df7fada2d clk: rockchip: undo several noc and special clocks as critical on rk3288
   86a1de9c8d76 pinctrl: samsung: fix leaked of_node references
   c3933fd4a8ee pinctrl: pistachio: fix leaked of_node references
   12e7faac49e2 HID: logitech-hidpp: use RAP instead of FAP to get the protocol version
   1eafabe144f4 Bluetooth: hci_qca: Give enough time to ROME controller to bootup.
   189b396a2580 mm/uaccess: Use 'unsigned long' to placate UBSAN warnings on older GCC versions
   f46ae1cd7cec x86/mm: Remove in_nmi() warning from 64-bit implementation of vmalloc_fault()
   3dc1e338ae5f smpboot: Place the __percpu annotation correctly
   0fcb3cd5af98 x86/build: Move _etext to actual end of .text
   58a0c2194bac vfio-ccw: Release any channel program when releasing/removing vfio-ccw mdev
   8c1c78109a74 vfio-ccw: Do not call flush_workqueue while holding the spinlock
   e0d25d17841a RDMA/cma: Consider scope_id while binding to ipv6 ll address
   06740892db92 bcache: avoid clang -Wunintialized warning
   330b67980381 bcache: add failure check to run_cache_set() for journal replay
   cd83c78897d5 bcache: fix failure in journal relplay
   29b166da7a4e bcache: return error immediately in bch_journal_replay()
   8034a6b89990 bcache: avoid potential memleak of list of journal_replay(s) in the CACHE_SYNC branch of run_cache_set
   e82df5f1e54a crypto: sun4i-ss - Fix invalid calculation of hash end
   213e152316ed nvme-rdma: fix a NULL deref when an admin connect times out
   c24860f40b66 nvme: set 0 capacity if namespace block size exceeds PAGE_SIZE
   31de7f1d07b5 net: cw1200: fix a NULL pointer dereference
   eacec4367998 rsi: Fix NULL pointer dereference in kmalloc
   9d54cca8f939 mwifiex: prevent an array overflow
   c2582f213897 ASoC: fsl_sai: Update is_slave_mode with correct value
   67d812fbe303 slimbus: fix a potential NULL pointer dereference in of_qcom_slim_ngd_register
   0cbef22f67ba libbpf: fix samples/bpf build failure due to undefined UINT32_MAX
   ca5b9d63e9b1 mac80211/cfg80211: update bss channel on channel switch
   1d057fefa045 dmaengine: pl330: _stop: clear interrupt status
   cadb16d9e0f3 s390: qeth: address type mismatch warning
   99079ceefb7c w1: fix the resume command API
   07da741d48c4 sched/nohz: Run NOHZ idle load balancer on HK_FLAG_MISC CPUs
   216155aab507 s390/kexec_file: Fix detection of text segment in ELF loader
   6697d0b3f5b5 scsi: qedi: Abort ep termination if offload not scheduled
   bc90af686912 rtc: stm32: manage the get_irq probe defer case
   7fd0d9d10e5d rtc: 88pm860x: prevent use-after-free on device remove
   0ea8b7cf9436 iwlwifi: pcie: don't crash on invalid RX interrupt
   bd3d8f4cb956 btrfs: Don't panic when we can't find a root key
   431cbaec1287 btrfs: fix panic during relocation after ENOSPC before writeback happens
   1084fc9afbe3 Btrfs: fix data bytes_may_use underflow with fallocate due to failed quota reserve
   8715ce033eb3 x86/modules: Avoid breaking W^X while loading modules
   34f3a58f06da scsi: qla2xxx: Fix hardirq-unsafe locking
   6ce116871011 scsi: qla2xxx: Avoid that lockdep complains about unsafe locking in tcm_qla2xxx_close_session()
   55b95ce89ce7 scsi: qla2xxx: Fix abort handling in tcm_qla2xxx_write_pending()
   de3cd35f5195 scsi: qla2xxx: Fix a qla24xx_enable_msix() error path
   73026db866db sched/cpufreq: Fix kobject memleak
   0fe8ed038e88 powerpc/watchdog: Use hrtimers for per-CPU heartbeat
   efa336f785df arm64: Fix compiler warning from pte_unmap() with -Wunused-but-set-variable
   9152b0815430 ARM: vdso: Remove dependency with the arch_timer driver internals
   2d2017675b1a media: stm32-dcmi: return appropriate error codes during probe
   5744fd7fa1d1 drm/nouveau/bar/nv50: ensure BAR is mapped
   07bb9a71ee27 ACPI / property: fix handling of data_nodes in acpi_get_next_subnode()
   c00f0fbd2e85 brcm80211: potential NULL dereference in brcmf_cfg80211_vndr_cmds_dcmd_handler()
   57667dc86bef spi: pxa2xx: fix SCR (divisor) calculation
   5cf668cf1110 ASoC: imx: fix fiq dependencies
   b8bd069f855f powerpc/perf: Fix loop exit condition in nest_imc_event_init
   1a6767f5f152 powerpc/boot: Fix missing check of lseek() return value
   741853944fea powerpc/perf: Return accordingly on invalid chip-id in
   49c0fa1f35c1 ASoC: hdmi-codec: unlock the device on startup errors
   663411719895 usb: dwc3: move synchronize_irq() out of the spinlock protected block
   1a7be0fe0777 usb: dwc2: gadget: Increase descriptors count for ISOC's
   fc8c5907d8fc ASoC: Intel: kbl_da7219_max98357a: Map BTN_0 to KEY_PLAYPAUSE
   b676f6c0b552 pinctrl: zte: fix leaked of_node references
   8603d49906b2 Bluetooth: Ignore CC events not matching the last HCI command
   6d9cfab853ca hv_netvsc: fix race that may miss tx queue wakeup
   83eaba87e73e net: ena: gcc 8: fix compilation warning
   19c2dd5025bb dmaengine: tegra210-dma: free dma controller in remove()
   7ffd692bfce7 bpftool: exclude bash-completion/bpftool from .gitignore pattern
   6d9f8909e540 selftests/bpf: set RLIMIT_MEMLOCK properly for test_libbpf_open.c
   f3ed010f2bfe tools/bpf: fix perf build error with uClibc (seen on ARC)
   d96a6c31e42e mmc: core: Verify SD bus width
   c4b51dbcccfc gfs2: Fix occasional glock use-after-free
   fa4aaa09d17e IB/hfi1: Fix WQ_MEM_RECLAIM warning
   36296b0034ae NFS: make nfs_match_client killable
   506961a7a4ef cxgb4: Fix error path in cxgb4_init_module
   bac852089281 gfs2: Fix lru_count going negative
   06a67c0f4abb Revert "btrfs: Honour FITRIM range constraints during free space trim"
   7c2bcb3cca03 acct_on(): don't mess with freeze protection
   7d562a90a88b at76c50x-usb: Don't register led_trigger if usb_register_driver failed
   363aa80a51c9 batman-adv: mcast: fix multicast tt/tvlv worker locking
   003e2d74c554 bpf: devmap: fix use-after-free Read in __dev_map_entry_free
   3de79cb0ceb2 ssb: Fix possible NULL pointer dereference in ssb_host_pcmcia_exit
   c8275cbe2bd8 media: vivid: use vfree() instead of kfree() for dev->bitmap_cap
   0595e0d173f0 media: vb2: add waiting_in_dqbuf flag
   aec118ecf579 media: serial_ir: Fix use-after-free in serial_ir_init_module
   bdf3da72ae79 media: cpia2: Fix use-after-free in cpia2_exit
   de2d09ebff2f fbdev: fix WARNING in __alloc_pages_nodemask bug
   86c43c40fe05 ovl: relax WARN_ON() for overlapping layers use case
   9c0339dd381d btrfs: honor path->skip_locking in backref code
   2eefb4a3894e arm64: errata: Add workaround for Cortex-A76 erratum #1463225
   8783c4128c37 brcmfmac: add subtype check for event handling in data path
   cc240e057c1d brcmfmac: assure SSID length from firmware is limited
   43caa29c99db bpf: add bpf_jit_limit knob to restrict unpriv allocations
   cc1afc1050a9 NFSv4.1 fix incorrect return value in copy_file_range
   e1eed6928b3e NFSv4.2 fix unnecessary retry in nfs4_copy_file_range
   0bad28e92ced fbdev: fix divide error in fb_var_to_videomode
   b8304d918c02 udlfb: fix some inconsistent NULL checking
   94e1f96667b4 btrfs: sysfs: don't leak memory when failing add fsid
   946ad2ecef61 btrfs: sysfs: Fix error path kobject memory leak
   92f907d7d63b Btrfs: fix race between ranged fsync and writeback of adjacent ranges
   4f9a774dda97 Btrfs: avoid fallback to transaction commit during fsync of files with holes
   7ec747c811ab Btrfs: do not abort transaction at btrfs_update_root() after failure to COW path
   ce21e6586eec btrfs: don't double unlock on error in btrfs_punch_hole
   fdc78eedc54d gfs2: Fix sign extension bug in gfs2_update_stats
   53cd8ae3eeb1 arm64/iommu: handle non-remapped addresses in ->mmap and ->get_sgtable
   9c15fff28194 arm64/kernel: kaslr: reduce module randomization range to 2 GB
   ee6d3eb31112 libnvdimm/pmem: Bypass CONFIG_HARDENED_USERCOPY overhead
   709a93054118 kvm: svm/avic: fix off-by-one in checking host APIC ID
   5b69ceee2196 mmc: sdhci-iproc: Set NO_HISPD bit to fix HS50 data hold time problem
   227e01537baf mmc: sdhci-iproc: cygnus: Set NO_HISPD bit to fix HS50 data hold time problem
   792d65fc49a7 crypto: vmx - CTR: always increment IV as quadword
   136b8cef4e4f Revert "scsi: sd: Keep disk read-only when re-reading partition"
   ac7480a5b504 sbitmap: fix improper use of smp_mb__before_atomic()
   b78255d6cffb bio: fix improper use of smp_mb__before_atomic()
   432ec4fa6cd2 KVM: x86: fix return value for reserved EFER
   70d33cce97f0 f2fs: Fix use of number of devices
   5220582c427b ext4: wait for outstanding dio during truncate in nojournal mode
   71e430fd593b ext4: do not delete unlinked inode from orphan list on failed truncate
   1d84eb87efce x86: Hide the int3_emulate_call/jmp functions from UML
   8b2fc0058255 Linux 4.19.46
   fcac71697a15 fbdev: sm712fb: fix memory frequency by avoiding a switch/case fallthrough
   107e215c2962 bpf, lru: avoid messing with eviction heuristics upon syscall lookup
   2bb3c5470aaf bpf: add map_lookup_elem_sys_only for lookups from syscall side
   3ded3aaa4aa8 bpf: relax inode permission check for retrieving bpf program
   c33563e9ec87 Revert "selftests/bpf: skip verifier tests for unsupported program types"
   90110ffd86ae driver core: Postpone DMA tear-down until after devres release for probe failure
   430908054540 md/raid: raid5 preserve the writeback action after the parity check
   3d25b7f5c3be Revert "Don't jump to compute_result state from check_result state"
   a0b1dde1e686 perf/x86/intel: Fix race in intel_pmu_disable_event()
   7aea2f94cc64 perf bench numa: Add define for RUSAGE_THREAD if not present
   a06fdd99a339 ufs: fix braino in ufs_get_inode_gid() for solaris UFS flavour
   f037116fe05b x86/mm/mem_encrypt: Disable all instrumentation for early SME setup
   290da8e79c83 sched/cpufreq: Fix kobject memleak
   2da19da7abb8 iwlwifi: mvm: check for length correctness in iwl_mvm_create_skb()
   7341daa0548e qmi_wwan: new Wistron, ZTE and D-Link devices
   c1528193f643 bpf: Fix preempt_enable_no_resched() abuse
   aea54f613534 power: supply: sysfs: prevent endless uevent loop with CONFIG_POWER_SUPPLY_DEBUG
   a1251522a522 KVM: arm/arm64: Ensure vcpu target is unset on reset failure
   36ae546a0046 net: ieee802154: fix missing checks for regmap_update_bits
   9c045d8c9739 mac80211: Fix kernel panic due to use of txq after free
   a0a49d8712de x86: kvm: hyper-v: deal with buggy TLB flush requests from WS2012
   a469646862aa PCI: Fix issue with "pci=disable_acs_redir" parameter being ignored
   b21ca2769b0f apparmorfs: fix use-after-free on symlink traversal
   9a0467e1f671 securityfs: fix use-after-free on symlink traversal
   900bf351dd84 power: supply: cpcap-battery: Fix division by zero
   b7771cb0143b clk: sunxi-ng: nkmp: Avoid GENMASK(-1, 0)
   a654a73de29f xfrm4: Fix uninitialized memory read in _decode_session4
   6faa62060624 xfrm: Honor original L3 slave device in xfrmi policy lookup
   3716c2625099 esp4: add length check for UDP encapsulation
   d410ef75886a xfrm: clean up xfrm protocol checks
   159269cc6456 vti4: ipip tunnel deregistration fixes.
   64f214ce563f xfrm6_tunnel: Fix potential panic when unloading xfrm6_tunnel module
   c9516503fe53 xfrm: policy: Fix out-of-bound array accesses in __xfrm_policy_unlink
   fea685000caf fuse: Add FOPEN_STREAM to use stream_open()
   f9eccf6ca1e0 dm mpath: always free attached_handler_name in parse_path()
   9407680a7bb7 dm integrity: correctly calculate the size of metadata area
   3b92ff729cb3 dm delay: fix a crash when invalid device is specified
   90cc71127a3c dm zoned: Fix zone report handling
   ff0699a5e5d0 dm cache metadata: Fix loading discard bitset
   d5c352305d42 PCI: Work around Pericom PCIe-to-PCI bridge Retrain Link erratum
   b51a033317cd PCI: Factor out pcie_retrain_link() function
   7bc992e215c8 PCI: rcar: Add the initialization of PCIe link in resume_noirq()
   2e7574982502 PCI/AER: Change pci_aer_init() stub to return void
   8c30e1499335 PCI: Init PCIe feature bits for managed host bridge alloc
   29d031402718 PCI: Mark Atheros AR9462 to avoid bus reset
   f4be6b7ee294 PCI: Mark AMD Stoney Radeon R7 GPU ATS as broken
   2cf1dce1bfa5 fbdev: sm712fb: fix crashes and garbled display during DPMS modesetting
   27968d821368 fbdev: sm712fb: use 1024x768 by default on non-MIPS, fix garbled display
   f1c97f633375 fbdev: sm712fb: fix support for 1024x768-16 mode
   b415308ae49a fbdev: sm712fb: fix crashes during framebuffer writes by correctly mapping VRAM
   02f89dd99c83 fbdev: sm712fb: fix boot screen glitch when sm712fb replaces VGA
   7e1b9659a43a fbdev: sm712fb: fix white screen of death on reboot, don't set CR3B-CR3F
   b0f08070903d fbdev: sm712fb: fix VRAM detection, don't set SR70/71/74/75
   d30768975973 fbdev: sm712fb: fix brightness control on reboot, don't set SR30
   702156cd1a9a fbdev/efifb: Ignore framebuffer memmap entries that lack any memory types
   e738fb38cf2e objtool: Allow AR to be overridden with HOSTAR
   9ae0f86ceaa7 MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000 enabled
   05fab3457210 perf intel-pt: Fix sample timestamp wrt non-taken branches
   ba86f8f84fd5 perf intel-pt: Fix improved sample timestamp
   3ed850ab2a9c perf intel-pt: Fix instructions sampling rate
   5e011f3319fe memory: tegra: Fix integer overflow on tick value calculation
   fb8c9c900d4e tracing: Fix partial reading of trace event's id file
   07b487eb5762 ftrace/x86_64: Emulate call function while updating in breakpoint handler
   ba246f64b0a5 x86_64: Allow breakpoints to emulate call instructions
   01b6fdcecd5a x86_64: Add gap to int3 to allow for call emulation
   77ca91441696 ceph: flush dirty inodes before proceeding with remount
   b18339bc1d05 iommu/tegra-smmu: Fix invalid ASID bits on Tegra30/114
   a9676c96e7e0 ovl: fix missing upper fs freeze protection on copy up for ioctl
   979d2433b873 fuse: honor RLIMIT_FSIZE in fuse_file_fallocate
   a452f733f93e fuse: fix writepages on 32bit
   42f59b83f0cf udlfb: introduce a rendering mutex
   fb36a97654a7 udlfb: fix sleeping inside spinlock
   1b8c955691d4 udlfb: delete the unused parameter for dlfb_handle_damage
   3487804cf6dc clk: rockchip: fix wrong clock definitions for rk3328
   fe082b99d57b clk: mediatek: Disable tuner_en before change PLL rate
   5bfba9529cea clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides divider
   1a7adc2edb98 clk: hi3660: Mark clk_gate_ufs_subsys as critical
   04f34b76368f PNFS fallback to MDS if no deviceid found
   d3dd6057d2d6 NFS4: Fix v4.0 client state corruption when mount
   5e7f9e905ff8 media: imx: Clear fwnode link struct for each endpoint iteration
   ef12f5b54da4 media: imx: csi: Allow unknown nearest upstream entities
   77e178708136 media: ov6650: Fix sensor possibly not detected on probe
   86d67dbdf0a0 phy: ti-pipe3: fix missing bit-wise or operator when assigning val
   939db6fdbea6 cifs: fix strcat buffer overflow and reduce raciness in smb21_set_oplock_level()
   a29b8829291e of: fix clang -Wunsequenced for be32_to_cpu()
   a36430769ee5 p54: drop device reference count if fails to enable device
   88cfd822f9d0 intel_th: msu: Fix single mode with IOMMU
   c939121b5435 dcache: sort the freeing-without-RCU-delay mess for good.
   10cb519c3e34 md: add mddev->pers to avoid potential NULL pointer dereference
   3deaa1dc2f70 md: batch flush requests.
   7f6b9285cada Revert "MD: fix lock contention for flush bios"
   7928396df91e proc: prevent changes to overridden credentials
   bbd559ad3ca7 brd: re-enable __GFP_HIGHMEM in brd_insert_page()
   d9ec75d048d7 stm class: Fix channel bitmap on 32-bit systems
   44bc4e8815a4 stm class: Fix channel free in stm output free path
   85b94de88046 parisc: Rename LEVEL to PA_ASM_LEVEL to avoid name clash with DRBD code
   e5621f7e13f6 parisc: Use PA_ASM_LEVEL in boot code
   615260c947b4 parisc: Skip registering LED when running in QEMU
   9aabffe8c2a6 parisc: Export running_on_qemu symbol for modules
   b11efd3262ef net/mlx5e: Fix ethtool rxfh commands when CONFIG_MLX5_EN_RXNFC is disabled
   79742133aff2 net/mlx5: Imply MLXFW in mlx5_core
   9f12f4c922d4 vsock/virtio: Initialize core virtio vsock before registering the driver
   4b900077784f tipc: fix modprobe tipc failed after switch order of device registration
   4af8a327aeba vsock/virtio: free packets during the socket release
   2f7025b0a3b3 tipc: switch order of device registration to fix a crash
   2636da604e76 rtnetlink: always put IFLA_LINK for links with a link-netnsid
   c73ed24c385a ppp: deflate: Fix possible crash in deflate_init
   e4a6df16b441 nfp: flower: add rcu locks when accessing netdev for tunnels
   948cd616504c net: usb: qmi_wwan: add Telit 0x1260 and 0x1261 compositions
   3620e546b177 net: test nouarg before dereferencing zerocopy pointers
   0495c8b03545 net/mlx4_core: Change the error print to info print
   746f8cd570ba net: avoid weird emergency message
   466cadba6013 net: Always descend into dsa/
   6bc3240adde5 ipv6: prevent possible fib6 leaks
   81a61a95812e ipv6: fix src addr routing with the exception table
   c3a072597748 Linux 4.19.45
   e8816d3bc595 ext4: don't update s_rev_level if not required
   6172ae55a187 ext4: fix compile error when using BUFFER_TRACE
   953e826e8d0f pstore: Refactor compression initialization
   fea8b84765a1 pstore: Allocate compression during late_initcall()
   f4bf101be366 pstore: Centralize init/exit routines
   627bb2d93b4d iov_iter: optimize page_copy_sane()
   866f011181ff libnvdimm/namespace: Fix label tracking error
   756eda9bc8b7 xen/pvh: set xen_domain_type to HVM in xen_pvh_init
   98bdd33883db kbuild: turn auto.conf.cmd into a mandatory include file
   38f114887ca4 KVM: lapic: Busy wait for timer to expire when using hv_timer
   3b5ea2df6cf6 KVM: x86: Skip EFER vs. guest CPUID checks for host-initiated writes
   5b8567682489 jbd2: fix potential double free
   95482af27161 ALSA: hda/realtek - Fix for Lenovo B50-70 inverted internal microphone bug
   e0e1dc65bb13 ALSA: hda/realtek - Fixup headphone noise via runtime suspend
   ae3155123704 ALSA: hda/realtek - Corrected fixup for System76 Gazelle (gaze14)
   316063bf7d11 ext4: avoid panic during forced reboot due to aborted journal
   c19db366c0a8 ext4: fix use-after-free in dx_release()
   0db24122bd7f ext4: fix data corruption caused by overlapping unaligned and aligned IO
   25d010f4e0ec ext4: zero out the unused memory region in the extent tree block
   c907ce3fd552 tty: Don't force RISCV SBI console as preferred console
   986d3453bee4 fs/writeback.c: use rcu_barrier() to wait for inflight wb switches going into workqueue when umount
   a80da82d0840 crypto: ccm - fix incompatibility between "ccm" and "ccm_base"
   f6de0a3b1e66 ipmi:ssif: compare block number correctly for multi-part return messages
   88681649ed8c bcache: never set KEY_PTRS of journal key to 0 in journal_reclaim()
   ecfc882f6441 bcache: fix a race between cache register and cacheset unregister
   8a8f671b3dad Btrfs: do not start a transaction at iterate_extent_inodes()
   0388d45afc50 Btrfs: do not start a transaction during fiemap
   74ca0a7671cc Btrfs: send, flush dellaloc in order to avoid data loss
   8b13bb911f0c btrfs: Honour FITRIM range constraints during free space trim
   87dcf0c61985 btrfs: Correctly free extent buffer in case btree_read_extent_buffer_pages fails
   d8925a1fee71 btrfs: Check the first key and level for cached extent buffer
   45123ae534e0 ext4: fix ext4_show_options for file systems w/o journal
   f795247578aa ext4: actually request zeroing of inode table after grow
   2a18c9c76718 ext4: fix use-after-free race with debug_want_extra_isize
   b12a8d80a46e ext4: avoid drop reference to iloc.bh twice
   f0f805f8b9e7 ext4: ignore e_value_offs for xattrs with value-in-ea-inode
   71478ef67d7c ext4: make sanity check in mballoc more strict
   001fe0dab4ea jbd2: check superblock mapped prior to committing
   0fd2df64f142 tty/vt: fix write/write race in ioctl(KDSKBSENT) handler
   d90824ecb887 tty: vt.c: Fix TIOCL_BLANKSCREEN console blanking if blankinterval == 0
   6a01793e0763 mtd: spi-nor: intel-spi: Avoid crossing 4K address boundary on read/write
   dc6d69bde829 mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
   5185672f2acf mfd: da9063: Fix OTP control register names to match datasheets for DA9063/63L
   770e46b38ebe ACPI: PM: Set enable_for_wake for wakeup GPEs during suspend-to-idle
   8bae43985571 userfaultfd: use RCU to free the task struct when fork fails
   3574bc98e2fe ocfs2: fix ocfs2 read inode data panic in ocfs2_iget
   a3ccc156f365 hugetlb: use same fault hash key for shared and private mappings
   0b16b09a723e mm/hugetlb.c: don't put_page in lock of hugetlb_lock
   58db3813680e mm/huge_memory: fix vmf_insert_pfn_{pmd, pud}() crash, handle unaligned addresses
   f580a54bbd52 mm/mincore.c: make mincore() more conservative
   681f3695d514 crypto: ccree - handle tee fips error during power management resume
   4fb3d87ee7b7 crypto: ccree - add function to handle cryptocell tee fips error
   65f5c14a6011 crypto: ccree - HOST_POWER_DOWN_EN should be the last CC access during suspend
   1a4fc3d29632 crypto: ccree - pm resume first enable the source clk
   120ab825c6fd crypto: ccree - don't map AEAD key and IV on stack
   ca687cdb6159 crypto: ccree - use correct internal state sizes for export
   766121a0a798 crypto: ccree - don't map MAC key on stack
   7560c0adad34 crypto: ccree - fix mem leak on error path
   642de1c00a14 crypto: ccree - remove special handling of chained sg
   1bfceb375034 bpf, arm64: remove prefetch insn in xadd mapping
   f3714257c422 ASoC: codec: hdac_hdmi add device_link to card device
   975ef5c2f6ca ASoC: fsl_esai: Fix missing break in switch statement
   df9f111db871 ASoC: RT5677-SPI: Disable 16Bit SPI Transfers
   7295359bd6ac ASoC: max98090: Fix restore of DAPM Muxes
   e13bac4031eb ALSA: hdea/realtek - Headset fixup for System76 Gazelle (gaze14)
   d33f6063b7c3 ALSA: hda/realtek - EAPD turn on later
   4ac6316a7c0f ALSA: hda/hdmi - Consider eld_valid when reporting jack event
   8c827cda2864 ALSA: hda/hdmi - Read the pin sense from register when repolling
   30dda277333e ALSA: usb-audio: Fix a memory leak bug
   741e3efd8174 ALSA: line6: toneport: Fix broken usage of timer for delayed execution
   003cf675eb07 mmc: core: Fix tag set memory leak
   d42d342022b1 crypto: arm64/aes-neonbs - don't access already-freed walk.iv
   69b9d32d5139 crypto: arm/aes-neonbs - don't access already-freed walk.iv
   b7d2adfd0512 crypto: rockchip - update IV buffer to contain the next IV
   9a61ab689867 crypto: gcm - fix incompatibility between "gcm" and "gcm_base"
   63efe31cf544 crypto: arm64/gcm-aes-ce - fix no-NEON fallback code
   e7fd8a2862e0 crypto: x86/crct10dif-pcl - fix use via crypto_shash_digest()
   7a19a4bef218 crypto: crct10dif-generic - fix use via crypto_shash_digest()
   aabf86f24d9f crypto: skcipher - don't WARN on unprocessed data after slow walk step
   66f5de68cb61 crypto: vmx - fix copy-paste error in CTR mode
   07d677ae4db4 crypto: ccp - Do not free psp_master when PLATFORM_INIT fails
   fe632ee5ade8 crypto: chacha20poly1305 - set cra_name correctly
   3b5ddd5ea016 crypto: salsa20 - don't access already-freed walk.iv
   7a32ad34b889 crypto: crypto4xx - fix cfb and ofb "overran dst buffer" issues
   c1ec6beac625 crypto: crypto4xx - fix ctr-aes missing output IV
   2ea1a37d0138 sched/x86: Save [ER]FLAGS on context switch
   d8d751efec28 arm64: Save and restore OSDLR_EL1 across suspend/resume
   f273cd16554a arm64: Clear OSDLR_EL1 on CPU boot
   26e7d2ad97b9 arm64: compat: Reduce address limit
   6d696ceb15a3 arm64: arch_timer: Ensure counter register reads occur with seqlock held
   222abad906ba arm64: mmap: Ensure file offset is treated as unsigned
   592127e9c1bb power: supply: axp288_fuel_gauge: Add ACEPC T8 and T11 mini PCs to the blacklist
   26eb5e7fa08d power: supply: axp288_charger: Fix unchecked return value
   921bc15462e2 ARM: exynos: Fix a leaked reference by adding missing of_node_put
   6eaeee1e7845 mmc: sdhci-of-arasan: Add DTS property to disable DCMDs.
   e2c436d9268f ARM: dts: exynos: Fix audio (microphone) routing on Odroid XU3
   abea1fb53266 ARM: dts: exynos: Fix interrupt for shared EINTs on Exynos5260
   8cf1bbca4467 arm64: dts: rockchip: Disable DCMDs on RK3399's eMMC controller.
   7b72ca6312ab objtool: Fix function fallthrough detection
   b185029f5c41 x86/speculation/mds: Improve CPU buffer clear documentation
   393ca9ea37fb x86/speculation/mds: Revert CPU buffer clear on double fault exit
   7761dbf58d22 locking/rwsem: Prevent decrement of reader count before increment
   dafc674bbcb1 Linux 4.19.44
   9fa23ea14e8f PCI: hv: Add pci_destroy_slot() in pci_devices_present_work(), if necessary
   76888d135c4e PCI: hv: Add hv_pci_remove_slots() when we unload the driver
   a47e0054253f PCI: hv: Fix a memory leak in hv_eject_device_work()
   4179b8580219 powerpc/booke64: set RI in default MSR
   71b20cdb4353 powerpc/powernv/idle: Restore IAMR after idle
   69c2b71cb0c1 powerpc/book3s/64: check for NULL pointer in pgd_alloc()
   e9ec5073c90d drivers/virt/fsl_hypervisor.c: prevent integer overflow in ioctl
   ee3b53d89967 drivers/virt/fsl_hypervisor.c: dereferencing error pointers in ioctl
   afa485dc6f17 tipc: fix hanging clients using poll with EPOLLOUT flag
   98652e0b0a1b isdn: bas_gigaset: use usb_fill_int_urb() properly
   17d8a9ebaa99 tuntap: synchronize through tfiles array instead of tun->numqueues
   9c79732f98a8 tuntap: fix dividing by zero in ebpf queue selection
   737713e6d835 vrf: sit mtu should not be updated when vrf netdev is the link
   e38406070729 vlan: disable SIOCSHWTSTAMP in container
   dfdfad3d188f selinux: do not report error on connect(AF_UNSPEC)
   9f51d6f72063 packet: Fix error path in packet_init
   2e95eb9c92f7 net: ucc_geth - fix Oops when changing number of buffers in the ring
   210057b79e71 net: seeq: fix crash caused by not set dev.parent
   dfd919285f27 net: macb: Change interrupt and napi enable order in open
   68df8383f3ca net: ethernet: stmmac: dwmac-sun8i: enable support of unicast filtering
   9284895b7ee6 net: dsa: Fix error cleanup path in dsa_init_module
   da2e770f0c4a ipv4: Fix raw socket lookup for local traffic
   947fec630c41 fib_rules: return 0 directly if an exactly same rule exists when NLM_F_EXCL not supplied
   c7b5e55be825 dpaa_eth: fix SG frame cleanup
   a79feef32392 bridge: Fix error path for kobject_init_and_add()
   9c2cda31196a bonding: fix arp_validate toggling in active-backup mode
   0dc9ad4e904d powerpc/64s: Include cpu header
   db1b4aa651df um: Don't hardcode path as it is architecture dependent
   85f347944a6b Don't jump to compute_result state from check_result state
   ace28a8efdd4 rtlwifi: rtl8723ae: Fix missing break in switch statement
   d756d1dea670 mwl8k: Fix rate_idx underflow
   c300c98a94b4 cw1200: fix missing unlock on error in cw1200_hw_scan()
   575260507647 x86/kprobes: Avoid kretprobe recursion bug
   322a57551d06 nfc: nci: Potential off by one in ->pipes[] array
   f5e60565e6bd NFC: nci: Add some bounds checking in nci_hci_cmd_received()
   21e9515b7d16 net: strparser: partially revert "strparser: Call skb_unclone conditionally"
   85b9e8694f9c net/tls: fix the IV leaks
   e38c6748d1cc mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw workqueue
   835ae6cc28d9 mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw ordered workqueue
   880a328e197b mlxsw: core: Do not use WQ_MEM_RECLAIM for EMAD workqueue
   a80f62f781c2 mlxsw: spectrum_switchdev: Add MDB entries in prepare phase
   fb7c783b3139 net: fec: manage ahb clock in runtime pm
   c18731c2786c netfilter: nf_tables: add missing ->release_ops() in error path of newrule()
   5014aa937422 netfilter: nf_tables: use-after-free in dynamic operations
   9965da064e9a usb: typec: Fix unchecked return value
   68321994225d mm/memory.c: fix modifying of page protection by insert_pfn()
   bc3361461fcb net: dsa: mv88e6xxx: fix few issues in mv88e6390x_port_set_cmode
   19f4f94fdb2a powerpc/smp: Fix NMI IPI xmon timeout
   f8bd34d1d399 powerpc/smp: Fix NMI IPI timeout
   6a60fb62c82a mm/memory_hotplug.c: drop memory device reference after find_memory_block()
   fb67c97c4e2f RDMA/hns: Bugfix for mapping user db
   afc7cebbbb5e Input: synaptics-rmi4 - fix possible double free
   f621bc1bd7f4 drm/sun4i: Unbind components before releasing DRM and memory
   21b71e191bd8 spi: ST ST95HF NFC: declare missing of table
   09185e359827 spi: Micrel eth switch: declare missing of table
   3835cb5a911f ARM: 8856/1: NOMMU: Fix CCR register faulty initialization when MPU is disabled
   521ae4da71cc drm/imx: don't skip DP channel disable for background plane
   df3a97d197a3 gpu: ipu-v3: dp: fix CSC handling
   3a53fa469d60 netfilter: fix nf_l4proto_log_invalid to log invalid packets
   5bc3d4491821 selftests/net: correct the return value for run_netsocktests
   24b1c849ce9d drm/sun4i: Fix component unbinding and component master deletion
   1973df1ec5bc drm/sun4i: Set device driver data at bind time for use in unbind
   005325b7f026 s390: ctcm: fix ctcm_new_device error return code
   ca8648816e3d MIPS: perf: ath79: Fix perfcount IRQ assignment
   743a5a951d4d netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
   7b115755fb9d netfilter: ctnetlink: don't use conntrack/expect object addresses as id
   4e1994ef6365 ipvs: do not schedule icmp errors from tunnels
   cb9a11d017c6 selftests: netfilter: check icmp pkttoobig errors are set as related
   74e9b761fba0 init: initialize jump labels before command line option parsing
   6536de8232c8 mm: fix inactive list balancing between NUMA nodes and cgroups
   1134736869ef scsi: aic7xxx: fix EISA support
   ba87f547b0f7 ocelot: Don't sleep in atomic context (irqs_disabled())
   9e4fd5e0b81a ipmi: ipmi_si_hardcode.c: init si_type array to fix a crash
   7d4d8683e925 tools lib traceevent: Fix missing equality check for strcmp
   0c8afd514df0 KVM: x86: avoid misreporting level-triggered irqs as edge-triggered in tracing
   d39f3cc71382 KVM: fix spectrev1 gadgets
   4074bc379b1f x86/reboot, efi: Use EFI reboot for Acer TravelMate X514-51T
   3b51d71365e0 x86/build/lto: Fix truncated .bss with -fdata-sections
   8eb64692d6e2 s390/pkey: add one more argument space for debug feature entry
   e360515f41fc drm/amd/display: If one stream full updates, full update all planes
   58be7c109cea afs: Unlock pages for __pagevec_release()
   08f2c299b38c qede: fix write to free'd pointer error and double free of ptp
   090b74020014 vxge: fix return of a free'd memblock on a failed dma mapping
   f83beff28048 mISDN: Check address length before reading address family
   e4525c9d9ada selftests: fib_tests: Fix 'Command line is not complete' errors
   7828986b84ba clocksource/drivers/oxnas: Fix OX820 compatible
   6a414ef36840 clocksource/drivers/npcm: select TIMER_OF
   068d1cce7801 drm/amd/display: extending AUX SW Timeout
   2773e7454f4f s390/3270: fix lockdep false positive on view->lock
   4c8c9d514917 libnvdimm/pmem: fix a possible OOB access when read and write pmem
   f2565d0e5277 nl80211: Add NL80211_FLAG_CLEAR_SKB flag for other NL commands
   1d918120e37d mac80211: fix memory accounting with A-MSDU aggregation
   9d4da01f7d66 cfg80211: Handle WMM rules in regulatory domain intersection
   35e2abbaffa2 mac80211: Increase MAX_MSG_LEN
   bbe1ab38e1a2 mac80211: fix unaligned access in mesh table hash function
   e28e5055eacd s390/dasd: Fix capacity calculation for large volumes
   af5b7a150ef8 libnvdimm/btt: Fix a kmemdup failure check
   f7ab4818f74e HID: input: add mapping for "Toggle Display" key
   bbdccc170adf HID: input: add mapping for keyboard Brightness Up/Down/Toggle keys
   dc30867da997 HID: input: add mapping for Expose/Overview key
   e94f852e2034 libnvdimm/namespace: Fix a potential NULL pointer dereference
   5f72e3a021a6 acpi/nfit: Always dump _DSM output payload
   f07db1f1f54c iio: adc: xilinx: prevent touching unclocked h/w on remove
   6400212ae3b6 iio: adc: xilinx: fix potential use-after-free on probe
   06d5ea398e55 iio: adc: xilinx: fix potential use-after-free on remove
   5640d0781267 USB: serial: fix unthrottle races
   4c416eef65a7 virt: vbox: Sanity-check parameter types for hgcm-calls coming from userspace
   e361ccccdd51 kernfs: fix barrier usage in __kernfs_new_node()
   f1917f21c8f6 hwmon: (pwm-fan) Disable PWM if fetching cooling data fails
   87cc345aefc9 platform/x86: dell-laptop: fix rfkill functionality
   381eaca5017f platform/x86: thinkpad_acpi: Disable Bluetooth for some machines
   efe6802e812b platform/x86: sony-laptop: Fix unintentional fall-through
   824c212908b6 bfq: update internal depth state when queue depth changes
   3351e9d39947 Linux 4.19.43
   b21bde49d386 x86/speculation/mds: Fix documentation typo
   8e65568e9d23 Documentation: Correct the possible MDS sysfs values
   2e4c54890226 x86/mds: Add MDSUM variant to the MDS documentation
   12a0dad799fb x86/speculation/mds: Add 'mitigations=' support for MDS
   59a14fb5832c s390/speculation: Support 'mitigations=' cmdline option
   74857f69fec5 powerpc/speculation: Support 'mitigations=' cmdline option
   af5332dd991e x86/speculation: Support 'mitigations=' cmdline option
   8cb932aca5d6 cpu/speculation: Add 'mitigations=' cmdline option
   7ba793ae7b9f x86/speculation/mds: Print SMT vulnerable on MSBDS with mitigations off
   e9ae32266605 x86/speculation/mds: Fix comment
   b9faa4652867 x86/speculation/mds: Add SMT warning message
   b3a63d9c7453 x86/speculation: Move arch_smt_update() call to after mitigation decisions
   f7a119a762ef x86/speculation/mds: Add mds=full,nosmt cmdline option
   cfaa3d76301e Documentation: Add MDS vulnerability documentation
   e3803099d2f4 Documentation: Move L1TF to separate directory
   c50e81fe8a13 x86/speculation/mds: Add mitigation mode VMWERV
   8230c2028dce x86/speculation/mds: Add sysfs reporting for MDS
   2951067089a3 x86/speculation/mds: Add mitigation control for MDS
   4df98b3f3161 x86/speculation/mds: Conditionally clear CPU buffers on idle entry
   b39dc9a8cced x86/kvm/vmx: Add MDS protection when L1D Flush is not active
   e4fa775b5606 x86/speculation/mds: Clear CPU buffers on exit to user
   1f7c31be1e04 x86/speculation/mds: Add mds_clear_cpu_buffers()
   de89ff6f1674 x86/kvm: Expose X86_FEATURE_MD_CLEAR to guests
   aca9e8d8e2ce x86/speculation/mds: Add BUG_MSBDS_ONLY
   2e9104aa2633 x86/speculation/mds: Add basic bug infrastructure for MDS
   00b76324bd35 x86/speculation: Consolidate CPU whitelists
   e09450ffa980 x86/msr-index: Cleanup bit defines
   ca0056d97840 kvm: x86: Report STIBP on GET_SUPPORTED_CPUID
   1f1bc8222ce7 x86/cpu: Sanitize FAM6_ATOM naming
   34aae15cb179 Documentation/l1tf: Fix small spelling typo

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 6604bdf..a431773 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4dbcaca4c9ff89e866d2b5d01df005f317c618a4"
-SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
+SRCREV_machine ?= "dac3a011d5832c5f94ffac569559f05014746f01"
+SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.44"
+LINUX_VERSION ?= "4.19.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 4ca11d7..993f294 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.44"
+LINUX_VERSION ?= "4.19.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a3cd9d732b27e78f94634924b7232b6280dae002"
-SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
+SRCREV_machine_qemuarm ?= "36a736baed7fedb11c7c39b3e8d06e165e9e4d06"
+SRCREV_machine ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index a5fdafe..7ee67cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c12bc1a098be009c44582e75af630ff573155473"
-SRCREV_machine_qemuarm64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_machine_qemumips ?= "18ba7160ac7a094bf9659649c537303201eb022e"
-SRCREV_machine_qemuppc ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_machine_qemux86 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_machine_qemux86-64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_machine_qemumips64 ?= "d9c77fe2a6038848fbadd660882b78e590c3252e"
-SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
+SRCREV_machine_qemuarm ?= "c093532d256a8c46a4e73a940998ddec916f63be"
+SRCREV_machine_qemuarm64 ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_machine_qemumips ?= "8bac53c36a72ab7dc343f754a76094c41c633c77"
+SRCREV_machine_qemuppc ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_machine_qemux86 ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_machine_qemux86-64 ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_machine_qemumips64 ?= "bbc2fcd94ccdb48977a7bf3fcbbc56ef785a0bd1"
+SRCREV_machine ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
+SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.44"
+LINUX_VERSION ?= "4.19.57"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


