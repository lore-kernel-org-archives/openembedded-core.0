Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55FF678848
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxZKJ012500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:35 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:21 -0500
Message-ID: <75de5c33fd98d0f8eff3111ff90ce3b359b81adf.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] linux-yocto/4.9: update to v4.9.78
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:34 -0000
Content-Type: text/plain

Integrating the korg 4.9 -stable updates. These include patches for
Spectre and meltdown mitigation. The changelog follows:

   79584a422125 Linux 4.9.78
   60249fe9050b MIPS: AR7: ensure the port type's FCR value is used
   06d7342d8498 x86/retpoline: Optimize inline assembler for vmexit_fill_RSB
   b9f8b5935394 x86/pti: Document fix wrong index
   4b71be496642 kprobes/x86: Disable optimizing on the function jumps to indirect thunk
   36ad6ba501d6 kprobes/x86: Blacklist indirect thunk functions for kprobes
   09402d83395f retpoline: Introduce start/end markers of indirect thunk
   c5aa687060a8 x86/mce: Make machine check speculation protected
   87ac29717de8 usbip: fix warning in vhci_hcd_probe/lockdep_init_map
   0d92cf7f29e6 x86/cpu, x86/pti: Do not enable PTI on AMD processors
   ddfaa7acd7a2 arm64: KVM: Fix SMCCC handling of unimplemented SMC/HVC calls
   2904adc5b1c0 dm thin metadata: THIN_MAX_CONCURRENT_LOCKS should be 6
   cabf6294a6dc dm btree: fix serious bug in btree_split_beneath()
   ca2d73686720 workqueue: avoid hard lockups in show_workqueue_state()
   d314f3bc7f3d libata: apply MAX_SEC_1024 to all LITEON EP1 series devices
   8a3f4baaa4c3 proc: fix coredump vs read /proc/*/stat race
   43c3e093c26d scripts/gdb/linux/tasks.py: fix get_thread_info
   23d68eddd857 can: peak: fix potential bug in packet fragmentation
   19f47eafe10c ARM: dts: kirkwood: fix pin-muxing of MPP7 on OpenBlocks A7
   1f32f15ec73c ARM: sunxi_defconfig: Enable CMA
   969e2145eb4a phy: work around 'phys' references to usb-nop-xceiv devices
   9a50ea0ce7cc tracing: Fix converting enum's from the map in trace_event_eval_update()
   cb513d1414f9 Input: twl4030-vibra - fix sibling-node lookup
   eaabab6468b3 Input: twl6040-vibra - fix child-node lookup
   9be13b3357e1 Input: 88pm860x-ts - fix child-node lookup
   607b86e17352 Input: ALPS - fix multi-touch decoding on SS4 plus touchpads
   9792f9b483cd perf tools: Fix build with ARCH=x86_64
   c557481a9491 x86/apic/vector: Fix off by one in error path
   5b13f593565f pipe: avoid round_pipe_size() nr_pages overflow on 32-bit
   02802dfc82a2 x86/tsc: Fix erroneous TSC rate on Skylake Xeon
   5ab44e8f0f0d x86/mm/pkeys: Fix fill_sig_info_pkey
   eee0cba7b02f module: Add retpoline tag to VERMAGIC
   a96cf98dda3f x86/cpufeature: Move processor tracing out of scattered features
   13ccac5de853 objtool: Improve error message for bad file argument
   b73d68788f79 x86/retpoline: Add LFENCE to the retpoline/RSB filling RSB macros
   abf67b1e7881 x86/retpoline: Fill RSB on context switch for affected CPUs
   1ad4f2872c3b sched/deadline: Zero out positive runtime after throttling constrained tasks
   997231f9fd7a scsi: hpsa: fix volume offline state
   d303d0ca9afb iser-target: Fix possible use-after-free in connection establishment error
   0476e6d0b752 af_key: fix buffer overread in parse_exthdrs()
   e4dc05ab8f5a af_key: fix buffer overread in verify_address_len()
   676109b28cad timers: Unconditionally check deferrable base
   4b6e681f5952 ALSA: hda - Apply the existing quirk to iMac 14,1
   fae704d5bd29 ALSA: hda - Apply headphone noise quirk for another Dell XPS 13 variant
   b9e168a0c629 ALSA: pcm: Remove yet superfluous WARN_ON()
   e4ff9f294629 ALSA: seq: Make ioctls race-free
   d8a3170db0de futex: Prevent overflow by strengthen input validation
   bb7119eea22c scsi: sg: disable SET_FORCE_LOW_DMA
   c9ca9d9d9b79 libnvdimm, btt: Fix an incompatibility in the log layout
   b8cf9ff79d63 Linux 4.9.77
   1b92c48a2eeb x86/pti/efi: broken conversion from efi to kernel page table
   92e8f2049474 objtool: Fix retpoline support for pre-ORC objtool
   44f1eae7fe65 x86/retpoline: Remove compile time warning
   c05d544d5343 selftests/x86: Add test_vsyscall
   c1ddd99a0296 x86/retpoline: Fill return stack buffer on vmexit
   276e30044710 x86/retpoline/irq32: Convert assembler indirect jumps
   a590960ae6ea x86/retpoline/checksum32: Convert assembler indirect jumps
   87a1fe36250d x86/retpoline/xen: Convert Xen hypercall indirect jumps
   9e37da4c3de1 x86/retpoline/hyperv: Convert assembler indirect jumps
   83d7658362cc x86/retpoline/ftrace: Convert ftrace assembler indirect jumps
   8b1bacc3218c x86/retpoline/entry: Convert entry assembler indirect jumps
   2adc2f74449f x86/retpoline/crypto: Convert crypto assembler indirect jumps
   8f96937ee304 x86/spectre: Add boot time option to select Spectre v2 mitigation
   2bb5de42f254 x86/retpoline: Add initial retpoline support
   4bf050da57d9 x86/asm: Use register variable to get stack pointer value
   4d8bd3e2f6b1 objtool: Allow alternatives to be ignored
   3adb52ab2976 objtool: Detect jumps to retpoline thunks
   35aee626fa63 objtool, modules: Discard objtool annotation sections for modules
   00bcb5ada638 x86/mm/32: Move setup_clear_cpu_cap(X86_FEATURE_PCID) earlier
   91b7e5cdc80a x86/alternatives: Add missing '\n' at end of ALTERNATIVE inline asm
   194dc04770f5 x86/alternatives: Fix optimize_nops() checking
   5ddd318a4715 sysfs/cpu: Fix typos in vulnerability documentation
   9c5e750c8e84 x86/cpu/AMD: Use LFENCE_RDTSC in preference to MFENCE_RDTSC
   abcc3e5f0079 x86/cpu/AMD: Make LFENCE a serializing instruction
   45a98824bd79 x86/cpu: Implement CPU vulnerabilites sysfs functions
   11ec2df9c020 sysfs/cpu: Add vulnerability folder
   56eff367e071 x86/cpu: Merge bugs.c and bugs_64.c
   26323fb4d717 x86/cpufeatures: Add X86_BUG_SPECTRE_V[12]
   43fe95308d27 x86/pti: Rename BUG_CPU_INSECURE to BUG_CPU_MELTDOWN
   d88f601b9ac9 x86/cpufeatures: Add X86_BUG_CPU_INSECURE
   c2cacde516a4 x86/cpufeatures: Make CPU bugs sticky
   ef463981018e x86/cpu: Factor out application of forced CPU caps
   4e6c2af2ba93 x86/Documentation: Add PTI description
   d598347989aa e1000e: Fix e1000_check_for_copper_link_ich8lan return value.
   3ba5d3a2cf40 uas: ignore UAS for Norelsys NS1068(X) chips
   6aebc2670ebf Bluetooth: Prevent stack info leak from the EFS element.
   c51d23dffc2e staging: android: ashmem: fix a race condition in ASHMEM_SET_SIZE ioctl
   8ab8c6e6607a usbip: vudc_tx: fix v_send_ret_submit() vulnerability to null xfer buffer
   86c8d58fc753 usbip: fix vudc_rx: harden CMD_SUBMIT path to handle malicious input
   6851ec74bfe4 usbip: remove kernel addresses from usb device and urb debug msgs
   435db24bb91f USB: fix usbmon BUG trigger
   9f6ca0ea7a7a usb: misc: usb3503: make sure reset is low for at least 100us
   11632d079e9e USB: serial: cp210x: add new device ID ELV ALC 8xxx
   4abe275c2dee USB: serial: cp210x: add IDs for LifeScan OneTouch Verio IQ
   820ef2a0e54c bpf, array: fix overflow in max_entries and undefined behavior in index_mask
   a9bfac14cde2 bpf: prevent out-of-bounds speculation
   f55093dccd3a bpf: refactor fixup_bpf_calls()
   28035366afe9 bpf: move fixup_bpf_calls() function
   60c7a9cd5050 target: Avoid early CMD_T_PRE_EXECUTE failures during ABORT_TASK
   748e1b6281f5 iscsi-target: Make TASK_REASSIGN use proper se_cmd->cmd_kref
   ec61bafb2abd kaiser: Set _PAGE_NX only if supported
   08a752581104 drm/vmwgfx: Potential off by one in vmw_view_add()
   012df71d2980 KVM: x86: Add memory barrier on vmcs field lookup
   431fd501aa3f x86/microcode/intel: Extend BDW late-loading with a revision check
   553a8b8c8d87 rbd: set max_segments to USHRT_MAX
   3752d2fb9a6d crypto: algapi - fix NULL dereference in crypto_remove_spawns()
   b28394cbb402 net/sched: Fix update of lastuse in act modules implementing stats_update
   e2b825e8de16 mlxsw: spectrum_router: Fix NULL pointer deref
   16d5b481d098 ethtool: do not print warning for applications using legacy API
   dde00c92245d ipv6: fix possible mem leaks in ipv6_make_skb()
   6f237183c7ca net: stmmac: enable EEE in MII, GMII or RGMII only
   7f4226ffcba0 sh_eth: fix SH7757 GEther initialization
   eb2f80e099d4 sh_eth: fix TSU resource handling
   ce31b6ac1111 RDS: null pointer dereference in rds_atomic_free_op
   cebb382931c4 RDS: Heap OOB write in rds_message_alloc_sgs()
   61196a67cac4 net: core: fix module type in sock_diag_bind
   ca5681b723d3 ip6_tunnel: disable dst caching if tunnel is dual-stack
   fe71f34fbf83 8021q: fix a memory leak for VLAN 0 device
   66bb6c2c4445 xhci: Fix ring leak in failure path of xhci_alloc_virt_device()
   135f98084eac cx82310_eth: use skb_cow_head() to deal with cloned skbs
   7c5015409bef smsc75xx: use skb_cow_head() to deal with cloned skbs
   ab4fd7a2ddc5 sr9700: use skb_cow_head() to deal with cloned skbs
   542bcc549379 lan78xx: use skb_cow_head() to deal with cloned skbs
   1ecdfc1ee99d zswap: don't param_set_charp while holding spinlock
   5c1b80f674e9 x86/acpi: Reduce code duplication in mp_override_legacy_irq()
   43ff00f87377 ALSA: aloop: Fix racy hw constraints adjustment
   5af666d0ddb7 ALSA: aloop: Fix inconsistent format due to incomplete rule
   01046dd834ac ALSA: aloop: Release cable upon open error path
   bee3f2d5c02a ALSA: pcm: Allow aborting mutex lock at OSS read/write loops
   3a00564cb49f ALSA: pcm: Abort properly at pending signal in OSS read/write loops
   8e81425e80c9 ALSA: pcm: Add missing error checks in OSS emulation plugin builder
   83da0245eda2 ALSA: pcm: Remove incorrect snd_BUG_ON() usages
   0199927a8e51 x86/acpi: Handle SCI interrupts above legacy space gracefully
   64ab063b7193 platform/x86: wmi: Call acpi_wmi_init() later
   491c0ca3dbd5 kvm: vmx: Scrub hardware GPRs at VM-exit
   78c00f597ba8 MIPS: Disallow outsized PTRACE_SETREGSET NT_PRFPREG regset accesses
   1f4cff1c364b MIPS: Also verify sizeof `elf_fpreg_t' with PTRACE_SETREGSET
   cfc5c63a38ca MIPS: Fix an FCSR access API regression with NT_PRFPREG and MSA
   f616180a8720 MIPS: Consistently handle buffer counter with PTRACE_SETREGSET
   5b593a81fddd MIPS: Guard against any partial write attempt with PTRACE_SETREGSET
   8eb5655aacdd MIPS: Factor out NT_PRFPREG regset access helpers
   14e1c579acba MIPS: Validate PR_SET_FP_MODE prctl(2) requests against the ABI of the task
   30191718645d IB/srpt: Disable RDMA access by the initiator
   02f201f78fb9 can: gs_usb: fix return value of the "set_bittiming" callback
   c781e3be97a1 KVM: Fix stack-out-of-bounds read in write_mmio
   c5ab9ee144d8 ath10k: rebuild crypto header in rx data frames
   234c8e60437d mac80211: Add RX flag to indicate ICV stripped
   b58aa24edb62 dm bufio: fix shrinker scans when (nr_to_scan < retain_target)
   7bbc6ca48877 Linux 4.9.76
   5e1f377fc810 mtd: nand: pxa3xx: Fix READOOB implementation
   beca4e2d9944 Map the vsyscall page with _PAGE_USER
   47f3cea393ab x86/tlb: Drop the _GPL from the cpu_tlbstate export
   91dfc41e753b parisc: qemu idle sleep support
   14c06206b98f parisc: Fix alignment of pa_tlb_lock in assembly on 32-bit SMP kernel
   dd43c465ba24 x86/microcode/AMD: Add support for fam17h microcode loading
   2b009d33f427 Input: elantech - add new icbody type 15
   cc1349fa9c22 ARC: uaccess: dont use "l" gcc inline asm constraint modifier
   e6a897a684c2 iommu/arm-smmu-v3: Cope with duplicated Stream IDs
   03975faee7ce iommu/arm-smmu-v3: Don't free page table ops twice
   4d53eb494950 kernel/signal.c: remove the no longer needed SIGNAL_UNKILLABLE check in complete_signal()
   794ac8ef9b06 kernel/signal.c: protect the SIGNAL_UNKILLABLE tasks from !sig_kernel_only() signals
   1453b3ac6cf8 kernel/signal.c: protect the traced SIGNAL_UNKILLABLE tasks from SIGKILL
   79258d983480 kernel: make groups_sort calling a responsibility group_info allocators
   3a381abc5b70 nbd: fix use-after-free of rq/bio in the xmit path
   2b9b2002e05d fscache: Fix the default for fscache_maybe_release_page()
   34fa2eede095 sunxi-rsb: Include OF based modalias in device uevent
   c195a4c0230d crypto: pcrypt - fix freeing pcrypt instances
   868f50b95dbe crypto: chacha20poly1305 - validate the digest size
   f6db86f31b47 crypto: n2 - cure use after free
   790080ce0e32 kernel/acct.c: fix the acct->needcheck check in check_free_space()
   9f74755895f9 Linux 4.9.75
   92fd81f77267 kaiser: Set _PAGE_NX only if supported
   ea6cd39d230f KPTI: Report when enabled
   e71fac01727a KPTI: Rename to PAGE_TABLE_ISOLATION
   59094faf3f61 x86/kaiser: Move feature detection up
   402e63de94af kaiser: disabled on Xen PV
   2c2721754a7f x86/kaiser: Reenable PARAVIRT
   1817d2c2fac1 x86/paravirt: Dont patch flush_tlb_single
   fe5cb75fd2dd kaiser: kaiser_flush_tlb_on_return_to_user() check PCID
   b72c26e911c5 kaiser: asm/tlbflush.h handle noPGE at lower level
   8c2f8a5cc15b kaiser: drop is_atomic arg to kaiser_pagetable_walk()
   169b369f99af kaiser: use ALTERNATIVE instead of x86_cr3_pcid_noflush
   8018307a45a9 x86/kaiser: Check boottime cmdline params
   50624dd12d6d x86/kaiser: Rename and simplify X86_FEATURE_KAISER handling
   23e09439aa46 kaiser: add "nokaiser" boot option, using ALTERNATIVE
   cb7d8d7e6737 kaiser: fix unlikely error in alloc_ldt_struct()
   3df146178706 kaiser: kaiser_remove_mapping() move along the pgd
   05ddad146d02 kaiser: paranoid_entry pass cr3 need to paranoid_exit
   d0142ceb7926 kaiser: x86_cr3_pcid_noflush and x86_cr3_pcid_user
   6a2b4117614c kaiser: PCID 0 for kernel and 128 for user
   0b5ca9d99599 kaiser: load_new_mm_cr3() let SWITCH_USER_CR3 flush user
   2684b12a169e kaiser: enhanced by kernel and user PCIDs
   1972bb9d9206 kaiser: vmstat show NR_KAISERTABLE as nr_overhead
   1ce27de4011e kaiser: delete KAISER_REAL_SWITCH option
   c27cdea56c54 kaiser: name that 0x1000 KAISER_SHADOW_PGD_OFFSET
   61b7a404fa13 kaiser: cleanups while trying for gold link
   604db4961085 kaiser: align addition to x86/mm/Makefile
   be6bf01f4caa kaiser: tidied up kaiser_add/remove_mapping slightly
   67fab0d4acb3 kaiser: tidied up asm/kaiser.h somewhat
   f43f386f0bf0 kaiser: ENOMEM if kaiser_pagetable_walk() NULL
   f881e626849c kaiser: fix perf crashes
   19377944317f kaiser: fix regs to do_nmi() ifndef CONFIG_KAISER
   639c005daeeb kaiser: KAISER depends on SMP
   7a92e20d157f kaiser: fix build and FIXME in alloc_ldt_struct()
   0994a2cf8fe4 kaiser: stack map PAGE_SIZE at THREAD_SIZE-PAGE_SIZE
   ac2f1018ac21 kaiser: do not set _PAGE_NX on pgd_none
   8f0baadf2bea kaiser: merged update
   13be4483bb48 KAISER: Kernel Address Isolation
   b5fd58e997cf x86/boot: Add early cmdline parsing for options with arguments
   8824b2d7abfb tcp_bbr: reset long-term bandwidth sampling on loss recovery undo
   61c51da2b4bd tcp_bbr: reset full pipe detection on loss recovery undo
   07bcb2489b96 Linux 4.9.74
   181a832c2e26 mm/vmstat: Make NR_TLB_REMOTE_FLUSH_RECEIVED available even on UP
   d76dabb5af06 tty: fix tty_ldisc_receive_buf() documentation
   00fc57ae06c3 n_tty: fix EXTPROC vs ICANON interaction with TIOCINQ (aka FIONREAD)
   404ae546c7d1 x86/smpboot: Remove stale TLB flush invocations
   e8119ac05d71 nohz: Prevent a timer interrupt storm in tick_nohz_stop_sched_tick()
   249d4a9b3246 timers: Reinitialize per cpu bases on hotplug
   574e543ff970 timers: Invoke timer_start_debug() where it makes sense
   d840687aa8a3 timers: Use deferrable base independent of base::nohz_active
   09d3e69305b3 usb: xhci: Add XHCI_TRUST_TX_LENGTH for Renesas uPD720201
   ab1fbfecd330 USB: Fix off by one in type-specific length check of BOS SSP capability
   425d2f15338d usb: add RESET_RESUME for ELSA MicroLink 56K
   0f2e9cbc231c usb: Add device quirk for Logitech HD Pro Webcam C925e
   d98f4d4d0283 USB: serial: option: adding support for YUGA CLM920-NC5
   192cdf5ecaf8 USB: serial: option: add support for Telit ME910 PID 0x1101
   6ab3d87ad702 USB: serial: qcserial: add Sierra Wireless EM7565
   0af1aebb6a8b USB: serial: ftdi_sio: add id for Airbus DS P8GR
   03dce0573d38 usbip: vhci: stop printing kernel pointer addresses in messages
   9e9f4255c0d3 usbip: stub: stop printing kernel pointer addresses in messages
   1ef5c433b3b9 usbip: prevent leaking socket pointer address in messages
   3c579d0b4f0f usbip: fix usbip bind writing random string after command in match_busid
   67b539cab43c s390/qeth: update takeover IPs after configuration change
   476d7d693295 s390/qeth: lock IP table while applying takeover changes
   475018c79742 s390/qeth: don't apply takeover changes to RXIP
   6ed7c48e93bb s390/qeth: apply takeover changes when mode is toggled
   7493d98ea84c net/mlx5: Fix error flow in CREATE_QP command
   c844a4589487 net/mlx5e: Prevent possible races in VXLAN control flow
   604225824f06 net/mlx5e: Add refcount to VXLAN structure
   d1614fd9cd10 net/mlx5e: Fix possible deadlock of VXLAN lock
   9424a79ec11d net/mlx5e: Fix features check of IPv6 traffic
   138723912343 net/mlx5: Fix rate limit packet pacing naming and struct
   e74fe7268e7e tcp: invalidate rate samples during SACK reneging
   58f6ebbd3424 sock: free skb in skb_complete_tx_timestamp on error
   a746fadd5e31 net: phy: micrel: ksz9031: reconfigure autoneg after phy autoneg workaround
   03c93293a83a net: Fix double free and memory corruption in get_net_ns_by_id()
   8c38f3190fd6 net: fec: Allow reception of frames bigger than 1522 bytes
   243adaa4eaea net: bridge: fix early call to br_stp_change_bridge_id and plug newlink leaks
   e4f669802775 ipv4: Fix use-after-free when flushing FIB tables
   e51abae8458a adding missing rcu_read_unlock in ipxip6_rcv
   ae67e5486b97 sctp: Replace use of sockets_allocated with specified macro.
   99cf2daf0da3 net: mvmdio: disable/unprepare clocks in EPROBE_DEFER case
   f75f910ffa90 net: ipv4: fix for a race condition in raw_sendmsg
   484369ff9715 tg3: Fix rx hang on MTU change with 5717/5719
   7887a700ce61 tcp md5sig: Use skb's saddr when replying to an incoming segment
   a4bf8efd2bcb tcp_bbr: record "full bw reached" decision in new full_bw_reached bit
   53288d82188b RDS: Check cmsg_len before dereferencing CMSG_DATA
   8b032bde2899 ptr_ring: add barriers
   b3b56038bab0 net: reevalulate autoflowlabel setting after sysctl setting
   8baa58c5d536 net: qmi_wwan: add Sierra EM7565 1199:9091
   0b18782288a2 netlink: Add netns check on taps
   2c1a0b2e2bac net: igmp: Use correct source address on IGMPv3 reports
   930882f8b831 net: fec: unmap the xmit buffer that are not transferred by DMA
   f6d7cdbb0285 ipv6: mcast: better catch silly mtu values
   c2f78bf8ca3a ipv4: igmp: guard against silly MTU values
   b929ccccbc8c kbuild: add '-fno-stack-check' to kernel build options
   04bdf71d9f74 x86/mm/64: Fix reboot interaction with CR4.PCIDE
   b52f937eccd4 x86/mm: Enable CR4.PCIDE on supported systems
   e6a29320de00 x86/mm: Add the 'nopcid' boot option to turn off PCID
   1e7f3d8875ee x86/mm: Disable PCID on 32-bit kernels
   3e5daacf6517 x86/mm: Remove the UP asm/tlbflush.h code, always use the (formerly) SMP code
   a94af050080f x86/mm: Reimplement flush_tlb_page() using flush_tlb_mm_range()
   113980c002eb x86/mm: Make flush_tlb_mm_range() more predictable
   219acedb061c x86/mm: Remove flush_tlb() and flush_tlb_current_task()
   72b812d5b874 x86/vm86/32: Switch to flush_tlb_mm_range() in mark_screen_rdonly()
   65ca46e5fe12 ALSA: hda - fix headset mic detection issue on a Dell machine
   a1dbcd823a30 ALSA: hda: Drop useless WARN_ON()
   d30d1761bc43 ASoC: tlv320aic31xx: Fix GPIO1 register definition
   b04640a450d3 ASoC: twl4030: fix child-node lookup
   00add00ed2c0 ASoC: fsl_ssi: AC'97 ops need regmap, clock and cleaning up on failure
   35f87d45cba3 ASoC: da7218: fix fix child-node lookup
   125e81b5afcb ASoC: wm_adsp: Fix validation of firmware and coeff lengths
   72d5e020c0ef iw_cxgb4: Only validate the MSN for successful completions
   2e0d458c315a ring-buffer: Mask out the info bits when returning buffer page length
   81e155e7b023 tracing: Fix crash when it fails to alloc ring buffer
   5dc4cd2688e3 tracing: Fix possible double free on failure of allocating trace buffer
   6edea15d120c tracing: Remove extra zeroing out of the ring buffer page
   3d16a1315add sync objtool's copy of x86-opcode-map.txt
   b3e88217e2f9 Linux 4.9.73
   37435f7e80ef bpf/verifier: Fix states_equal() comparison of pointer and UNKNOWN
   69cf72b28791 net: mvneta: eliminate wrong call to handle rx descriptor error
   a57f99f484e5 net: mvneta: use proper rxq_number in loop on rx queues
   405f3d7946fd net: mvneta: clear interface link status on port disable
   423716cf2815 libnvdimm, pfn: fix start_pad handling for aligned namespaces
   77b318a4e558 powerpc/perf: Dereference BHRB entries safely
   2635a64d0e94 clk: sunxi: sun9i-mmc: Implement reset callback for reset controls
   18276e9bcd49 kvm: x86: fix RSM when PCID is non-zero
   e5c73b3b60e1 KVM: X86: Fix load RFLAGS w/o the fixed bit
   418dfce4fa63 pinctrl: cherryview: Mask all interrupts on Intel_Strago based systems
   cb8b2fd1909e spi: xilinx: Detect stall with Unknown commands
   373386ec3f70 parisc: Hide Diva-built-in serial aux and graphics card
   10b4a621f367 PCI / PM: Force devices to D0 in pci_pm_thaw_noirq()
   3176065495e1 ALSA: usb-audio: Fix the missing ctl name suffix at parsing SU
   beab14a3eeb8 ALSA: usb-audio: Add native DSD support for Esoteric D-05X
   cec92448c58e ALSA: rawmidi: Avoid racy info ioctl via ctl device
   becf7d87cda9 mfd: twl6040: Fix child-node lookup
   f4c0796fdc8b mfd: twl4030-audio: Fix sibling-node lookup
   2db85cb211d0 mfd: cros ec: spi: Don't send first message too soon
   e81cff1cedef crypto: mcryptd - protect the per-CPU queue with a lock
   d31a207aaf07 acpi, nfit: fix health event notification
   54c74d38819d ACPI: APEI / ERST: Fix missing error handling in erst_reader()
   2df397931072 Linux 4.9.72
   6430e166aee8 sparc32: Export vac_cache_size to fix build error
   3695b3b18519 bpf: fix incorrect sign extension in check_alu_op()
   d75d3ee237ce bpf: reject out-of-bounds stack pointer calculation
   7b5b73ea87a0 bpf: fix branch pruning logic
   565f012f5abb bpf: adjust insn_aux_data when patching insns
   3b6c84bc6449 Revert "Bluetooth: btusb: driver to enable the usb-wakeup feature"
   dbeb719e24c3 platform/x86: asus-wireless: send an EV_SYN/SYN_REPORT between state changes
   00ecb4b1a599 MIPS: math-emu: Fix final emulation phase for certain instructions
   3cff90788e28 thermal/drivers/hisi: Fix multiple alarm interrupts firing
   1b2c46a6be45 thermal/drivers/hisi: Simplify the temperature/step computation
   2dac559df962 thermal/drivers/hisi: Fix kernel panic on alarm interrupt
   b679b8d7bad0 thermal/drivers/hisi: Fix missing interrupt enablement
   82bf76afa8af thermal: hisilicon: Handle return value of clk_prepare_enable
   b86c7b8c5dfb cpuidle: fix broadcast control when broadcast can not be entered
   15319d2a49ca rtc: set the alarm to the next expiring timer
   acc96729e1d8 tcp: fix under-evaluated ssthresh in TCP Vegas
   5859027994f9 clk: sunxi-ng: sun6i: Rename HDMI DDC clock to avoid name collision
   bb0618ac2302 staging: greybus: light: Release memory obtained by kasprintf
   4bf42a2ec12a net: ipv6: send NS for DAD when link operationally up
   52d0a601aec4 fm10k: ensure we process SM mbx when processing VF mbx
   76d83bfc1158 vfio/pci: Virtualize Maximum Payload Size
   de5a4c816d31 scsi: lpfc: PLOGI failures during NPIV testing
   b438d2f7e23c scsi: lpfc: Fix secure firmware updates
   fc9d6386a9a3 fm10k: fix mis-ordered parameters in declaration for .ndo_set_vf_bw
   bd0feaac155f ASoC: img-parallel-out: Add pm_runtime_get/put to set_fmt callback
   6af9b18a2e48 tracing: Exclude 'generic fields' from histograms
   fbb2d72a54c6 PCI/AER: Report non-fatal errors only to the affected endpoint
   1d4b32bee9c7 IB/rxe: check for allocation failure on elem
   2141182852b8 ixgbe: fix use of uninitialized padding
   700053c8733e igb: check memory allocation failure
   c236525bae02 PM / OPP: Move error message to debug level
   164a941c031b PCI: Create SR-IOV virtfn/physfn links before attaching driver
   b40eeea31afd scsi: mpt3sas: Fix IO error occurs on pulling out a drive from RAID1 volume created on two SATA drive
   fd1d9dccc01d scsi: cxgb4i: fix Tx skb leak
   241833a3a90d PCI: Avoid bus reset if bridge itself is broken
   d3469e616668 net: phy: at803x: Change error to EINVAL for invalid MAC
   206e1621ba72 kvm, mm: account kvm related kmem slabs to kmemcg
   bdb33bb5e2ce rtc: pl031: make interrupt optional
   1525e330d646 crypto: crypto4xx - increase context and scatter ring buffer elements
   291c7e488f64 backlight: pwm_bl: Fix overflow condition
   d14718c9f434 bnxt_en: Fix NULL pointer dereference in reopen failure path
   9e1771368a98 cpuidle: powernv: Pass correct drv->cpumask for registration
   5460e4672b81 ARM: dma-mapping: disallow dma_get_sgtable() for non-kernel managed memory
   9c1433b5dd2b Btrfs: fix an integer overflow check
   0708a476810d netfilter: nfnetlink_queue: fix secctx memory leak
   54420c1ac421 xhci: plat: Register shutdown for xhci_plat
   55b6a5d080aa net: moxa: fix TX overrun memory leak
   ce19146a0de0 isdn: kcapi: avoid uninitialized data
   bb011a451387 virtio_balloon: prevent uninitialized variable use
   c6f9090929dc virtio-balloon: use actual number of stats for stats queue buffers
   808ed3bd9d42 KVM: pci-assign: do not map smm memory slot pages in vt-d page tables
   29c4f517ff5b net: ipconfig: fix ic_close_devs() use-after-free
   e9a1ba292fff cpufreq: Fix creation of symbolic links to policy directories
   e0d13153057e ARM: dts: am335x-evmsk: adjust mmc2 param to allow suspend
   b5ed572a1b7d netfilter: nf_nat_snmp: Fix panic when snmp_trap_helper fails to register
   01060acf6aab netfilter: nfnl_cthelper: fix a race when walk the nf_ct_helper_hash table
   9e6398184a4d irda: vlsi_ir: fix check for DMA mapping errors
   37f41dac70ca RDMA/iser: Fix possible mr leak on device removal event
   661f5348696a i40e: Do not enable NAPI on q_vectors that have no rings
   2eb783a705b0 IB/rxe: increment msn only when completing a request
   2f0e39f2e3d7 IB/rxe: double free on error
   7f077afe94d9 net: Do not allow negative values for busy_read and busy_poll sysctl interfaces
   521a7e3dad6b nbd: set queue timeout properly
   f4fcc56632cf infiniband: Fix alignment of mmap cookies to support VIPT caching
   cd083d5bcafd IB/core: Protect against self-requeue of a cq work item
   26452a5033dc i40iw: Receive netdev events post INET_NOTIFIER state
   102a8a163449 bna: avoid writing uninitialized data into hw registers
   51533c4bf144 s390/qeth: no ETH header for outbound AF_IUCV
   118b0404d68d s390/qeth: size calculation outbound buffers
   60d59823046a r8152: prevent the driver from transmitting packets with carrier off
   b89e229112c0 ASoC: STI: Fix reader substream pointer set
   347848e0bb99 HID: xinmo: fix for out of range for THT 2P arcade controller.
   afa055f2a1d0 hwmon: (asus_atk0110) fix uninitialized data access
   5700ffc4accb ARM: dts: ti: fix PCI bus dtc warnings
   2df19698db73 KVM: VMX: Fix enable VPID conditions
   e0249c023448 KVM: x86: correct async page present tracepoint
   8386ff5203e0 kvm: vmx: Flush TLB when the APIC-access address changes
   3bd2017b6a20 scsi: lpfc: Fix PT2PT PRLI reject
   0f4aa1f0f576 pinctrl: st: add irq_request/release_resources callbacks
   7656871eff6a inet: frag: release spinlock before calling icmp_send()
   e6e8067ec34a tipc: fix nametbl deadlock at tipc_nametbl_unsubscribe
   bfb38fbd868d r8152: fix the rx early size of RTL8153
   7171aa2680b2 iommu/exynos: Workaround FLPD cache flush issues for SYSMMU v5
   0f0ac218057f netfilter: nfnl_cthelper: Fix memory leak
   ec38fb443a09 netfilter: nfnl_cthelper: fix runtime expectation policy updates
   02197d86c56d usb: gadget: udc: remove pointer dereference after free
   2b943bed33e7 usb: gadget: f_uvc: Sanity check wMaxPacketSize for SuperSpeed
   2101ccbc2a91 hwmon: (max31790) Set correct PWM value
   4ee082a72731 net: qmi_wwan: Add USB IDs for MDM6600 modem on Motorola Droid 4
   9ed8f0fabae5 sctp: out_qlen should be updated when pruning unsent queue
   b4cf187a1bc5 bna: integer overflow bug in debugfs
   b3f662ccd367 sch_dsmark: fix invalid skb_cow() usage
   98d20e590266 vsock: cancel packets when failing to connect
   482b3f92aea2 vhost-vsock: add pkt cancel capability
   6f1848e778d9 vsock: track pkt owner vsock
   7ff28d3307b6 crypto: deadlock between crypto_alg_sem/rtnl_mutex/genl_mutex
   ddfc9f75993e r8152: fix the list rx_done may be used without initialization
   9712b2b73d7c cpuidle: Validate cpu_dev in cpuidle_add_sysfs()
   8f21b63c9dcf nvme-loop: handle cpu unplug when re-establishing the controller
   c9bbd2727d1e arm: kprobes: Align stack to 8-bytes in test code
   d0ee8d5b86b8 arm: kprobes: Fix the return address of multiple kretprobes
   6e2a6941fa4b HID: corsair: Add driver Scimitar Pro RGB gaming mouse 1b1c:1b3e support to hid-corsair
   e93ea3a50cc6 HID: corsair: support for K65-K70 Rapidfire and Scimitar Pro RGB
   2a7eee3d72b0 kvm: fix usage of uninit spinlock in avic_vm_destroy()
   2d9a34c064ad ALSA: hda - add support for docking station for HP 840 G3
   52c3323e4141 ALSA: hda - add support for docking station for HP 820 G2
   bb95f1caee61 arm64: Initialise high_memory global variable earlier
   76fcdc8cbbce cxl: Check if vphb exists before iterating over AFU devices

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 3e08cd6fe645..af68e9070910 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c83e63d1a6da1218b61d352a866bc174554f71a9"
-SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
+SRCREV_machine ?= "7b2a74f272ef0a6e292b259872d47e891d7b2a20"
+SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.71"
+LINUX_VERSION ?= "4.9.78"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 398209ef9a3c..5c9a26098863 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.71"
+LINUX_VERSION ?= "4.9.78"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
+SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 1fdd7bf1d54f..871d87000373 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7e0dc801cf0ab19827fd33214fe6036d80258653"
-SRCREV_machine_qemuarm64 ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_machine_qemumips ?= "69371c276be034fff40b5652184401d8dc2262a1"
-SRCREV_machine_qemuppc ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_machine_qemux86 ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_machine_qemux86-64 ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_machine_qemumips64 ?= "b3159328d2dd0c53cf81b702c4f9cd520649c84a"
-SRCREV_machine ?= "a87b8d53730b5736575c738390abc498a31ba735"
-SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
+SRCREV_machine_qemuarm ?= "801a684d5e769ca18e6ad9758806a528eccdcb73"
+SRCREV_machine_qemuarm64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_machine_qemumips ?= "8235c7fda39963abbf6347390fd460e18a7e47b5"
+SRCREV_machine_qemuppc ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_machine_qemux86 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_machine_qemux86-64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_machine_qemumips64 ?= "bd9d169cd29aa5f2397ff383cd29f84a1043a693"
+SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.71"
+LINUX_VERSION ?= "4.9.78"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


