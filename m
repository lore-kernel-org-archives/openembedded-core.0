Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3A578824
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0QDxYrC011522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 Jan 2018 05:59:34 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:33 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:20 -0500
Message-ID: <9e657ced556bccfc7d622d56c03d966f2f3fc77b.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] linux-yocto/4.4: update to v4.4.113
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:33 -0000
Content-Type: text/plain

Integrating the korg 4.4 -stable releases up to 113. These include
Spectre and Meltdown mitigation patches. Changelog follows:

   f0d0a93b0e81 Linux 4.4.113
   38bc402237f8 MIPS: AR7: ensure the port type's FCR value is used
   11e619414b69 x86/retpoline: Optimize inline assembler for vmexit_fill_RSB
   58f96ac5dba6 x86/pti: Document fix wrong index
   6cb73eb80451 kprobes/x86: Disable optimizing on the function jumps to indirect thunk
   9b8bd0d35868 kprobes/x86: Blacklist indirect thunk functions for kprobes
   799dc737680a retpoline: Introduce start/end markers of indirect thunk
   f59e7ce17ba3 x86/mce: Make machine check speculation protected
   ff535919c136 kbuild: modversions for EXPORT_SYMBOL() for asm
   6b1c99e275c0 x86/cpu, x86/pti: Do not enable PTI on AMD processors
   5ecd5c8388f0 arm64: KVM: Fix SMCCC handling of unimplemented SMC/HVC calls
   7e7b086ef2fe dm thin metadata: THIN_MAX_CONCURRENT_LOCKS should be 6
   9c7755af771a dm btree: fix serious bug in btree_split_beneath()
   b7bd013a3fe0 libata: apply MAX_SEC_1024 to all LITEON EP1 series devices
   082dfe6141f3 can: peak: fix potential bug in packet fragmentation
   2d5523bf47b4 ARM: dts: kirkwood: fix pin-muxing of MPP7 on OpenBlocks A7
   d5276c013713 phy: work around 'phys' references to usb-nop-xceiv devices
   cf3625004e6c tracing: Fix converting enum's from the map in trace_event_eval_update()
   b6306f3fdcaa Input: twl4030-vibra - fix sibling-node lookup
   a89e1ac9b0da Input: twl6040-vibra - fix child-node lookup
   8e70d4862271 Input: twl6040-vibra - fix DT node memory management
   47970b4ea09c Input: 88pm860x-ts - fix child-node lookup
   7fd133539289 x86/apic/vector: Fix off by one in error path
   aa041f13f8c6 pipe: avoid round_pipe_size() nr_pages overflow on 32-bit
   1782af2835fe module: Add retpoline tag to VERMAGIC
   fba063e6dfb4 x86/retpoline: Add LFENCE to the retpoline/RSB filling RSB macros
   8bd58b61d2fa sched/deadline: Zero out positive runtime after throttling constrained tasks
   ec7a002d7796 scsi: hpsa: fix volume offline state
   b78f2d36e737 af_key: fix buffer overread in parse_exthdrs()
   48907f2535aa af_key: fix buffer overread in verify_address_len()
   478a7fa82ff7 ALSA: hda - Apply the existing quirk to iMac 14,1
   a4d7639d5fb6 ALSA: hda - Apply headphone noise quirk for another Dell XPS 13 variant
   80547bb6154d ALSA: pcm: Remove yet superfluous WARN_ON()
   58c82be944f5 futex: Prevent overflow by strengthen input validation
   f1fcb9d2926c scsi: sg: disable SET_FORCE_LOW_DMA
   451725c3e785 x86/retpoline: Remove compile time warning
   eebc3f8adee0 x86/retpoline: Fill return stack buffer on vmexit
   f72655b837eb x86/retpoline/irq32: Convert assembler indirect jumps
   7e5bb301bd2f x86/retpoline/checksum32: Convert assembler indirect jumps
   6b222e7483af x86/retpoline/xen: Convert Xen hypercall indirect jumps
   d2beed45635e x86/retpoline/hyperv: Convert assembler indirect jumps
   7153a6d5ff05 x86/retpoline/ftrace: Convert ftrace assembler indirect jumps
   028083cb02db x86/retpoline/entry: Convert entry assembler indirect jumps
   9fe55976f0c8 x86/retpoline/crypto: Convert crypto assembler indirect jumps
   9f789bc5711b x86/spectre: Add boot time option to select Spectre v2 mitigation
   3c5e10905263 x86/retpoline: Add initial retpoline support
   675901851fd2 kconfig.h: use __is_defined() to check if MODULE is defined
   a88693d00698 EXPORT_SYMBOL() for asm
   b8e7a489b518 x86/asm: Make asm/alternative.h safe from assembly
   b76ac90af34d x86/kbuild: enable modversions for symbols exported from asm
   cfc8c1d61e46 x86/asm: Use register variable to get stack pointer value
   416f66509fce x86/mm/32: Move setup_clear_cpu_cap(X86_FEATURE_PCID) earlier
   642ce1bb5ea6 x86/cpu/AMD: Use LFENCE_RDTSC in preference to MFENCE_RDTSC
   20c28c04a6bc x86/cpu/AMD: Make LFENCE a serializing instruction
   e6c591e7a430 gcov: disable for COMPILE_TEST
   42375c1120d5 Linux 4.4.112
   125d76412866 selftests/x86: Add test_vsyscall
   999d4f1961fa x86/alternatives: Add missing '\n' at end of ALTERNATIVE inline asm
   e997d991ab2b x86/alternatives: Fix optimize_nops() checking
   433d7851e5ca sysfs/cpu: Fix typos in vulnerability documentation
   72cf81e43ba4 x86/cpu: Implement CPU vulnerabilites sysfs functions
   73492b686012 sysfs/cpu: Add vulnerability folder
   9718bf5f4ebb x86/cpu: Merge bugs.c and bugs_64.c
   caae411b6ee0 x86/cpufeatures: Add X86_BUG_SPECTRE_V[12]
   6349cab425ce x86/pti: Rename BUG_CPU_INSECURE to BUG_CPU_MELTDOWN
   07c7aa5e7e8a x86/cpufeatures: Add X86_BUG_CPU_INSECURE
   65b28590de24 x86/cpufeatures: Make CPU bugs sticky
   18b849b18d1c x86/cpu: Factor out application of forced CPU caps
   d013f41d0cc5 x86/Documentation: Add PTI description
   cf9f240627b4 e1000e: Fix e1000_check_for_copper_link_ich8lan return value.
   10a4324500ff uas: ignore UAS for Norelsys NS1068(X) chips
   0ae86454c435 Bluetooth: Prevent stack info leak from the EFS element.
   b4106c55b574 staging: android: ashmem: fix a race condition in ASHMEM_SET_SIZE ioctl
   27a194bc8d21 usbip: remove kernel addresses from usb device and urb debug msgs
   3f577093c511 USB: fix usbmon BUG trigger
   92e8ba1ea050 usb: misc: usb3503: make sure reset is low for at least 100us
   e4c9428d035b USB: serial: cp210x: add new device ID ELV ALC 8xxx
   a962c95895a7 USB: serial: cp210x: add IDs for LifeScan OneTouch Verio IQ
   531a2595ce1a target: Avoid early CMD_T_PRE_EXECUTE failures during ABORT_TASK
   694c1ed559c8 iscsi-target: Make TASK_REASSIGN use proper se_cmd->cmd_kref
   095b0ba360ff bpf, array: fix overflow in max_entries and undefined behavior in index_mask
   9a7fad4c0e21 bpf: prevent out-of-bounds speculation
   648064515d0d bpf: adjust insn_aux_data when patching insns
   19614eee0644 bpf: refactor fixup_bpf_calls()
   14c7c55f4527 bpf: move fixup_bpf_calls() function
   0748b80e4325 bpf: don't (ab)use instructions to store state
   087a92287dba bpf: add bpf_patch_insn_single helper
   c18b1bda4933 kaiser: Set _PAGE_NX only if supported
   0b6231faa212 drm/vmwgfx: Potential off by one in vmw_view_add()
   6785f955bcb6 KVM: x86: Add memory barrier on vmcs field lookup
   7d1bef0f6037 x86/microcode/intel: Extend BDW late-loading with a revision check
   c77dd7b425cd rbd: set max_segments to USHRT_MAX
   68829e75666e crypto: algapi - fix NULL dereference in crypto_remove_spawns()
   608644ac89aa ipv6: fix possible mem leaks in ipv6_make_skb()
   b188ce30cc1b net: stmmac: enable EEE in MII, GMII or RGMII only
   f574e2e8c6cf sh_eth: fix SH7757 GEther initialization
   29ca856bb76a sh_eth: fix TSU resource handling
   44496521c6bd RDS: null pointer dereference in rds_atomic_free_op
   10d06ed9a189 RDS: Heap OOB write in rds_message_alloc_sgs()
   d19b5ed46cce net: core: fix module type in sock_diag_bind
   b9f16497eec2 ip6_tunnel: disable dst caching if tunnel is dual-stack
   0e1cadec4187 8021q: fix a memory leak for VLAN 0 device
   7ec5d87df34a x86/pti/efi: broken conversion from efi to kernel page table
   cc0e36105661 Revert "userfaultfd: selftest: vm: allow to build in vm/ directory"
   3ae43090f13b xhci: Fix ring leak in failure path of xhci_alloc_virt_device()
   6321e1753563 sysrq: Fix warning in sysrq generated crash.
   6f61bd5c4ff5 hwrng: core - sleep interruptible in read
   f065b5f78d17 x86/mm/pat, /dev/mem: Remove superfluous error message
   146001aeb9af cx82310_eth: use skb_cow_head() to deal with cloned skbs
   be48b6ee6d07 smsc75xx: use skb_cow_head() to deal with cloned skbs
   36a1c87f57f6 sr9700: use skb_cow_head() to deal with cloned skbs
   efca4f469475 lan78xx: use skb_cow_head() to deal with cloned skbs
   ad196359a6d1 r8152: adjust ALDPS function
   a37ff616d720 r8152: use test_and_clear_bit
   9d614746ea0b r8152: fix the wake event
   ea6f411117e1 usb: musb: ux500: Fix NULL pointer dereference at system PM
   829b82508c55 usbvision fix overflow of interfaces array
   bd44e3f19d14 locking/mutex: Allow next waiter lockless wakeup
   1920b8a6a6ed futex: Replace barrier() in unqueue_me() with READ_ONCE()
   e143f5d26258 locks: don't check for race with close when setting OFD lock
   c4eafbc2ba11 zswap: don't param_set_charp while holding spinlock
   eeca23f21cfb mm/zswap: use workqueue to destroy pool
   45c26b0736ef mm/page-writeback: fix dirty_ratelimit calculation
   9780795fc1e5 mm/compaction: pass only pageblock aligned range to pageblock_pfn_to_page
   756000bec7c1 mm/compaction: fix invalid free_pfn and compact_cached_free_pfn
   0e82bbca5896 x86/acpi: Reduce code duplication in mp_override_legacy_irq()
   d091a2bb8c2e ALSA: aloop: Fix racy hw constraints adjustment
   a9cad56436f4 ALSA: aloop: Fix inconsistent format due to incomplete rule
   3d3b2c61e1be ALSA: aloop: Release cable upon open error path
   fa6c1876ecf7 ALSA: pcm: Allow aborting mutex lock at OSS read/write loops
   9bb4bb18ccff ALSA: pcm: Abort properly at pending signal in OSS read/write loops
   1ee7bc5526d8 ALSA: pcm: Add missing error checks in OSS emulation plugin builder
   3074fe070a89 ALSA: pcm: Remove incorrect snd_BUG_ON() usages
   f511ba8a5084 iommu/arm-smmu-v3: Don't free page table ops twice
   745a0d9c1a8e x86/acpi: Handle SCI interrupts above legacy space gracefully
   1a699374533b x86/vsdo: Fix build on PARAVIRT_CLOCK=y, KVM_GUEST=n
   8d383ff7deaa kvm: vmx: Scrub hardware GPRs at VM-exit
   0753661d5b17 net/mac80211/debugfs.c: prevent build failure with CONFIG_UBSAN=y
   f2c131d05d86 MIPS: Disallow outsized PTRACE_SETREGSET NT_PRFPREG regset accesses
   725679dc78a9 MIPS: Also verify sizeof `elf_fpreg_t' with PTRACE_SETREGSET
   9584ae52bd7e MIPS: Fix an FCSR access API regression with NT_PRFPREG and MSA
   a6972f8bd2b6 MIPS: Consistently handle buffer counter with PTRACE_SETREGSET
   e68049f6a9e8 MIPS: Guard against any partial write attempt with PTRACE_SETREGSET
   b1e808b9de5c MIPS: Factor out NT_PRFPREG regset access helpers
   1e918a43cbf0 MIPS: Validate PR_SET_FP_MODE prctl(2) requests against the ABI of the task
   6c2c83eb1b0d IB/srpt: Disable RDMA access by the initiator
   a71d6de9718e can: gs_usb: fix return value of the "set_bittiming" callback
   eb91461daa77 KVM: Fix stack-out-of-bounds read in write_mmio
   cbb1cc722aaa dm bufio: fix shrinker scans when (nr_to_scan < retain_target)
   c5ae3a6aa1a3 Linux 4.4.111
   516fa79e77f7 Fix build error in vma.c
   6dcf5491e01c Map the vsyscall page with _PAGE_USER
   90191f71d749 proc: much faster /proc/vmstat
   c819a67f7ee9 module: Issue warnings when tainting kernel
   7e35bc655ec1 module: keep percpu symbols in module's symtab
   104fd57d391a genksyms: Handle string literals with spaces in reference files
   a4c1c75373bf x86/tlb: Drop the _GPL from the cpu_tlbstate export
   d5bbffc0501d parisc: Fix alignment of pa_tlb_lock in assembly on 32-bit SMP kernel
   3db597feef08 x86/microcode/AMD: Add support for fam17h microcode loading
   0a99730ae0cc Input: elantech - add new icbody type 15
   30ce9c8dbc42 ARC: uaccess: dont use "l" gcc inline asm constraint modifier
   5f1aa83c58aa kernel/signal.c: remove the no longer needed SIGNAL_UNKILLABLE check in complete_signal()
   7a7f54f8e390 kernel/signal.c: protect the SIGNAL_UNKILLABLE tasks from !sig_kernel_only() signals
   be95f1308f79 kernel/signal.c: protect the traced SIGNAL_UNKILLABLE tasks from SIGKILL
   58330ec2fecd kernel: make groups_sort calling a responsibility group_info allocators
   d1698dc8a590 fscache: Fix the default for fscache_maybe_release_page()
   7cbb4a2305f8 sunxi-rsb: Include OF based modalias in device uevent
   3ad85176e78d crypto: pcrypt - fix freeing pcrypt instances
   869994e0bd29 crypto: chacha20poly1305 - validate the digest size
   0b72e17dde6e crypto: n2 - cure use after free
   83875f582596 kernel/acct.c: fix the acct->needcheck check in check_free_space()
   b17b901f0fea x86/kasan: Write protect kasan zero shadow
   b3e3db15b450 Linux 4.4.110
   b33c3c64c478 kaiser: Set _PAGE_NX only if supported
   2b24fe5c57af x86/kasan: Clear kasan_zero_page after TLB flush
   755bd549d932 x86/vdso: Get pvclock data from the vvar VMA instead of the fixmap
   64e239804e21 x86, vdso, pvclock: Simplify and speed up the vdso pvclock reader
   bfd51a4d715b KPTI: Report when enabled
   3e1457d6bf26 KPTI: Rename to PAGE_TABLE_ISOLATION
   7f79599df9c4 x86/kaiser: Move feature detection up
   e4ba212ec641 kaiser: disabled on Xen PV
   750fb627d764 x86/kaiser: Reenable PARAVIRT
   3e809caffdd7 x86/paravirt: Dont patch flush_tlb_single
   8eaca4c7d9f1 kaiser: kaiser_flush_tlb_on_return_to_user() check PCID
   0651b3ad99dd kaiser: asm/tlbflush.h handle noPGE at lower level
   28c6de544174 kaiser: drop is_atomic arg to kaiser_pagetable_walk()
   2dff99eb0335 kaiser: use ALTERNATIVE instead of x86_cr3_pcid_noflush
   e405a064bd7d x86/kaiser: Check boottime cmdline params
   dea9aa9ffae1 x86/kaiser: Rename and simplify X86_FEATURE_KAISER handling
   e345dcc94815 kaiser: add "nokaiser" boot option, using ALTERNATIVE
   500943e57db8 kaiser: fix unlikely error in alloc_ldt_struct()
   d41f46f77895 kaiser: _pgd_alloc() without __GFP_REPEAT to avoid stalls
   fc8334e6b3e5 kaiser: paranoid_entry pass cr3 need to paranoid_exit
   20268a10ffec kaiser: x86_cr3_pcid_noflush and x86_cr3_pcid_user
   3b4ce0e1a172 kaiser: PCID 0 for kernel and 128 for user
   0731188fc74c kaiser: load_new_mm_cr3() let SWITCH_USER_CR3 flush user
   eb82151d0b1d kaiser: enhanced by kernel and user PCIDs
   3e3d38fd9832 kaiser: vmstat show NR_KAISERTABLE as nr_overhead
   b9d2ccc54e17 kaiser: delete KAISER_REAL_SWITCH option
   aeda21d77e22 kaiser: name that 0x1000 KAISER_SHADOW_PGD_OFFSET
   c52e55a2a82d kaiser: cleanups while trying for gold link
   f127705d26b3 kaiser: kaiser_remove_mapping() move along the pgd
   0c68228f7b39 kaiser: tidied up kaiser_add/remove_mapping slightly
   5fbd46c4be78 kaiser: tidied up asm/kaiser.h somewhat
   407c3ff6a24c kaiser: ENOMEM if kaiser_pagetable_walk() NULL
   20cbe9a3aa2e kaiser: fix perf crashes
   487f0b73d826 kaiser: fix regs to do_nmi() ifndef CONFIG_KAISER
   d94df20135cc kaiser: KAISER depends on SMP
   9b94cf97f42c kaiser: fix build and FIXME in alloc_ldt_struct()
   003e47671690 kaiser: stack map PAGE_SIZE at THREAD_SIZE-PAGE_SIZE
   edde73205b3f kaiser: do not set _PAGE_NX on pgd_none
   bed9bb7f3e6d kaiser: merged update
   8a43ddfb93a0 KAISER: Kernel Address Isolation
   0fa147b40747 x86/boot: Add early cmdline parsing for options with arguments
   e68d6189c787 Linux 4.4.109
   5d67dbef745b mm/vmstat: Make NR_TLB_REMOTE_FLUSH_RECEIVED available even on UP
   2e3883922530 n_tty: fix EXTPROC vs ICANON interaction with TIOCINQ (aka FIONREAD)
   977614061c3d x86/smpboot: Remove stale TLB flush invocations
   458ed3179948 nohz: Prevent a timer interrupt storm in tick_nohz_stop_sched_tick()
   46e9398c96af usb: xhci: Add XHCI_TRUST_TX_LENGTH for Renesas uPD720201
   0ceb7a66392d USB: Fix off by one in type-specific length check of BOS SSP capability
   c359123bfdd2 usb: add RESET_RESUME for ELSA MicroLink 56K
   955ae55f2d16 usb: Add device quirk for Logitech HD Pro Webcam C925e
   e8cd11a935dd USB: serial: option: adding support for YUGA CLM920-NC5
   140cfcc8b093 USB: serial: option: add support for Telit ME910 PID 0x1101
   232972f73936 USB: serial: qcserial: add Sierra Wireless EM7565
   24162c1781c1 USB: serial: ftdi_sio: add id for Airbus DS P8GR
   76f611cbdbb4 usbip: vhci: stop printing kernel pointer addresses in messages
   feeae6411a1a usbip: stub: stop printing kernel pointer addresses in messages
   e0362688b4fa usbip: fix usbip bind writing random string after command in match_busid
   3f54a6d41d44 sock: free skb in skb_complete_tx_timestamp on error
   623bfb5818ab net: phy: micrel: ksz9031: reconfigure autoneg after phy autoneg workaround
   5854ca90c6c6 net: Fix double free and memory corruption in get_net_ns_by_id()
   dd1e454c4d74 net: bridge: fix early call to br_stp_change_bridge_id and plug newlink leaks
   169a9861c638 ipv4: Fix use-after-free when flushing FIB tables
   4033c396f80c sctp: Replace use of sockets_allocated with specified macro.
   ca57949d169e net: mvmdio: disable/unprepare clocks in EPROBE_DEFER case
   be27b620a861 net: ipv4: fix for a race condition in raw_sendmsg
   6dfc02ba5149 tg3: Fix rx hang on MTU change with 5717/5719
   6925223ab320 tcp md5sig: Use skb's saddr when replying to an incoming segment
   e0bdd21a86c5 net: reevalulate autoflowlabel setting after sysctl setting
   06525d5b8ea8 net: qmi_wwan: add Sierra EM7565 1199:9091
   f778ce6faa0d netlink: Add netns check on taps
   373b423038a8 net: igmp: Use correct source address on IGMPv3 reports
   0a8cb76e11d9 ipv6: mcast: better catch silly mtu values
   3d406a18bd94 ipv4: igmp: guard against silly MTU values
   1cd09d4b38a2 kbuild: add '-fno-stack-check' to kernel build options
   6c4db09c291a x86/mm/64: Fix reboot interaction with CR4.PCIDE
   fd0504525efd x86/mm: Enable CR4.PCIDE on supported systems
   dcccd3c266e2 x86/mm: Add the 'nopcid' boot option to turn off PCID
   78043e5b6fb2 x86/mm: Disable PCID on 32-bit kernels
   b2e24274d50e x86/mm: Remove the UP asm/tlbflush.h code, always use the (formerly) SMP code
   3efba6062a41 x86/mm: Reimplement flush_tlb_page() using flush_tlb_mm_range()
   9f4d1ba1d407 x86/mm: Make flush_tlb_mm_range() more predictable
   227d6f0e79f8 x86/mm: Remove flush_tlb() and flush_tlb_current_task()
   6ce9d1e6819e x86/vm86/32: Switch to flush_tlb_mm_range() in mark_screen_rdonly()
   c04ed3a84961 ALSA: hda - fix headset mic detection issue on a Dell machine
   0ba2ebc9f355 ALSA: hda: Drop useless WARN_ON()
   5251932b974d ASoC: twl4030: fix child-node lookup
   3096ced5a939 ASoC: fsl_ssi: AC'97 ops need regmap, clock and cleaning up on failure
   becb0c6409ad iw_cxgb4: Only validate the MSN for successful completions
   9dc9648942b1 ring-buffer: Mask out the info bits when returning buffer page length
   25fade614be3 tracing: Fix crash when it fails to alloc ring buffer
   c2a62f84d49f tracing: Fix possible double free on failure of allocating trace buffer
   075242101627 tracing: Remove extra zeroing out of the ring buffer page
   87060303469c net: mvneta: clear interface link status on port disable
   b7aac649af10 powerpc/perf: Dereference BHRB entries safely
   5a62acc900e9 kvm: x86: fix RSM when PCID is non-zero
   c9b5338394f2 KVM: X86: Fix load RFLAGS w/o the fixed bit
   0bf0c45449c3 spi: xilinx: Detect stall with Unknown commands
   46865ecdd061 parisc: Hide Diva-built-in serial aux and graphics card
   727b641b35dd PCI / PM: Force devices to D0 in pci_pm_thaw_noirq()
   6b08ff879603 ALSA: usb-audio: Fix the missing ctl name suffix at parsing SU
   af1195354355 ALSA: rawmidi: Avoid racy info ioctl via ctl device
   e7f1c0da02fb mfd: twl6040: Fix child-node lookup
   ee54e7a18e56 mfd: twl4030-audio: Fix sibling-node lookup
   381d368c9954 mfd: cros ec: spi: Don't send first message too soon
   2e234e707f7f crypto: mcryptd - protect the per-CPU queue with a lock
   db09203e3252 ACPI: APEI / ERST: Fix missing error handling in erst_reader()
   03028e068a1f Linux 4.4.108
   1cfeaadfd1b4 alpha: fix build failures
   d126c47656da ALSA: hda - Fix yet another i915 pointer leftover in error path
   3b67b56ea770 ALSA: hda - Degrade i915 binding failure message
   ef24d642e92a ALSA: hda - Clear the leftover component assignment at snd_hdac_i915_exit()
   7f3e85d820fd Revert "Bluetooth: btusb: driver to enable the usb-wakeup feature"
   9c631278a9c6 MIPS: math-emu: Fix final emulation phase for certain instructions
   69dd89a1f919 thermal: hisilicon: Handle return value of clk_prepare_enable
   c0303e4ffd3a cpuidle: fix broadcast control when broadcast can not be entered
   8e6e8ec18d95 rtc: set the alarm to the next expiring timer
   1e52ede8e1ed tcp: fix under-evaluated ssthresh in TCP Vegas
   ab8e096eed2f fm10k: ensure we process SM mbx when processing VF mbx
   0705d3b83699 scsi: lpfc: PLOGI failures during NPIV testing
   e4dff872fe97 scsi: lpfc: Fix secure firmware updates
   eb7b86ec94a4 PCI/AER: Report non-fatal errors only to the affected endpoint
   aa6d09cea6df ixgbe: fix use of uninitialized padding
   cffbf0ffc47c igb: check memory allocation failure
   1e91b0d64e92 PCI: Create SR-IOV virtfn/physfn links before attaching driver
   a916c4152a4b scsi: mpt3sas: Fix IO error occurs on pulling out a drive from RAID1 volume created on two SATA drive
   e9151f9d4b6f scsi: cxgb4i: fix Tx skb leak
   8f376337c637 PCI: Avoid bus reset if bridge itself is broken
   3190a0623c58 net: phy: at803x: Change error to EINVAL for invalid MAC
   a0ca85d4895a rtc: pl031: make interrupt optional
   d7ae9928a25d crypto: crypto4xx - increase context and scatter ring buffer elements
   78ffab9744ad backlight: pwm_bl: Fix overflow condition
   0ec5f7a3c9b6 bnxt_en: Fix NULL pointer dereference in reopen failure path
   7432a60515da cpuidle: powernv: Pass correct drv->cpumask for registration
   1779b33294da ARM: dma-mapping: disallow dma_get_sgtable() for non-kernel managed memory
   bec60b446b52 netfilter: nfnetlink_queue: fix secctx memory leak
   ff1ddbb38b19 xhci: plat: Register shutdown for xhci_plat
   ea9e1ca40939 isdn: kcapi: avoid uninitialized data
   f15394085d11 KVM: pci-assign: do not map smm memory slot pages in vt-d page tables
   27c2fa1ae0ea ARM: dts: am335x-evmsk: adjust mmc2 param to allow suspend
   17b1ff10a1fc netfilter: nf_nat_snmp: Fix panic when snmp_trap_helper fails to register
   7c9316d2f263 netfilter: nfnl_cthelper: fix a race when walk the nf_ct_helper_hash table
   3af547339068 irda: vlsi_ir: fix check for DMA mapping errors
   52cd7920b7ac RDMA/iser: Fix possible mr leak on device removal event
   85e54ef781b6 i40e: Do not enable NAPI on q_vectors that have no rings
   6a04a7798a3e net: Do not allow negative values for busy_read and busy_poll sysctl interfaces
   359f7020464f bna: avoid writing uninitialized data into hw registers
   8acee491cfbd s390/qeth: no ETH header for outbound AF_IUCV
   8ce4313f1279 r8152: prevent the driver from transmitting packets with carrier off
   19b1ad3a2e68 HID: xinmo: fix for out of range for THT 2P arcade controller.
   ebfb08395800 hwmon: (asus_atk0110) fix uninitialized data access
   2e114c7b4562 ARM: dts: ti: fix PCI bus dtc warnings
   f1fdf68b4f94 KVM: VMX: Fix enable VPID conditions
   caa4cfd173b7 KVM: x86: correct async page present tracepoint
   2849ef5dcefd scsi: lpfc: Fix PT2PT PRLI reject
   bc9aec2faddf pinctrl: st: add irq_request/release_resources callbacks
   1d75c214cebc inet: frag: release spinlock before calling icmp_send()
   aba55cb03579 netfilter: nfnl_cthelper: Fix memory leak
   b9fd3306a5af netfilter: nfnl_cthelper: fix runtime expectation policy updates
   e598cdd240a0 usb: gadget: udc: remove pointer dereference after free
   0c8496bfdb0e usb: gadget: f_uvc: Sanity check wMaxPacketSize for SuperSpeed
   d6c0e23a7fef net: qmi_wwan: Add USB IDs for MDM6600 modem on Motorola Droid 4
   b9a4a18a01fc bna: integer overflow bug in debugfs
   ffde339b95f5 sch_dsmark: fix invalid skb_cow() usage
   4bf8a4f179ed crypto: deadlock between crypto_alg_sem/rtnl_mutex/genl_mutex
   a88b064826f0 r8152: fix the list rx_done may be used without initialization
   125325fe1c19 cpuidle: Validate cpu_dev in cpuidle_add_sysfs()
   a23a447e47cc arm: kprobes: Align stack to 8-bytes in test code
   3f7855a52222 arm: kprobes: Fix the return address of multiple kretprobes
   779214d0eaca ALSA: hda - add support for docking station for HP 840 G3
   9a66598014db ALSA: hda - add support for docking station for HP 820 G2
   3b9d9ec0d826 x86/irq: Do not substract irq_tlb_count from irq_call_count
   18a5348d49af sched/core: Idle_task_exit() shouldn't use switch_mm_irqs_off()
   c22d4b4d1c7f ARM: Hide finish_arch_post_lock_switch() from modules
   4ead44fd2525 x86/mm, sched/core: Turn off IRQs in switch_mm()
   70a39c7fd167 x86/mm, sched/core: Uninline switch_mm()
   83cc4b50e3a9 x86/mm: Build arch/x86/mm/tlb.c even on !SMP
   425f13a36652 sched/core: Add switch_mm_irqs_off() and use it in the scheduler
   dfe513a4e8dd mm/mmu_context, sched/core: Fix mmu_context.h assumption
   8d5ee51a6bce mm/rmap: batched invalidations should use existing api
   85d3700c744a x86/mm: If INVPCID is available, use it to flush global mappings
   791a0f3fecda x86/mm: Add a 'noinvpcid' boot option to turn off INVPCID
   04ec428b15f1 x86/mm: Fix INVPCID asm constraint
   becf292446e9 x86/mm: Add INVPCID helpers
   5fc8d62d1921 cxl: Check if vphb exists before iterating over AFU devices
   9e1485b1b570 arm64: Initialise high_memory global variable earlier
   96c00ece76be Linux 4.4.107
   a815c0a370cf ath9k: fix tx99 potential info leak
   26c66554d7bf IB/ipoib: Grab rtnl lock on heavy flush when calling ndo_open/stop
   112814db6ec4 RDMA/cma: Avoid triggering undefined behavior
   4bbb49138f4a macvlan: Only deliver one copy of the frame to the macvlan interface
   b8d510ff7165 udf: Avoid overflow when session starts at large offset
   a114af87c0ba scsi: bfa: integer overflow in debugfs
   798f08501424 scsi: sd: change allow_restart to bool in sysfs interface
   c387c02d604d scsi: sd: change manage_start_stop to bool in sysfs interface
   2e03af22f65c vt6655: Fix a possible sleep-in-atomic bug in vt6655_suspend
   930fb06d1617 scsi: scsi_devinfo: Add REPORTLUN2 to EMC SYMMETRIX blacklist entry
   24bc48af0aee raid5: Set R5_Expanded on parity devices as well as data.
   09379498aff0 pinctrl: adi2: Fix Kconfig build problem
   5f2dbdff20e0 usb: musb: da8xx: fix babble condition handling
   68d3bc40f5ca tty fix oops when rmmod 8250
   afa8f0a7af70 powerpc/perf/hv-24x7: Fix incorrect comparison in memord
   28a5b0e438f1 scsi: hpsa: destroy sas transport properties before scsi_host
   942eb7dd5e42 scsi: hpsa: cleanup sas_phy structures in sysfs when unloading
   ec662d656073 PCI: Detach driver before procfs & sysfs teardown on device remove
   02922f3bb37f xfs: fix incorrect extent state in xfs_bmap_add_extent_unwritten_real
   f267a1390b41 xfs: fix log block underflow during recovery cycle verification
   92eff81ad96a l2tp: cleanup l2tp_tunnel_delete calls
   230c4ba404d3 bcache: fix wrong cache_misses statistics
   271252373027 bcache: explicitly destroy mutex while exiting
   ab9b3db40828 GFS2: Take inode off order_write list when setting jdata flag
   2a5bb1284e72 thermal/drivers/step_wise: Fix temperature regulation misbehavior
   561b9d998e65 ppp: Destroy the mutex when cleanup
   083dd685aebd clk: tegra: Fix cclk_lp divisor register
   f56be2ce49c1 clk: imx6: refine hdmi_isfr's parent to make HDMI work on i.MX6 SoCs w/o VPU
   22a1e337ed68 clk: mediatek: add the option for determining PLL source clock
   b59614cfd2d3 mm: Handle 0 flags in _calc_vm_trans() macro
   44de70ecec2d crypto: tcrypt - fix buffer lengths in test_aead_speed()
   b397507641fb arm-ccn: perf: Prevent module unload while PMU is in use
   75ee360a5114 target/file: Do not return error for UNMAP if length is zero
   646191449e76 target:fix condition return in core_pr_dump_initiator_port()
   e14086b2c9bc iscsi-target: fix memory leak in lio_target_tiqn_addtpg()
   7d93603ddb65 target/iscsi: Fix a race condition in iscsit_add_reject_from_cmd()
   09f29c7a953d powerpc/ipic: Fix status get and status clear
   c6c3637ee8ab powerpc/opal: Fix EBUSY bug in acquiring tokens
   59720463cf28 netfilter: ipvs: Fix inappropriate output of procfs
   f46b4bab4e93 powerpc/powernv/cpufreq: Fix the frequency read by /proc/cpuinfo
   ef476a74f8ed PCI/PME: Handle invalid data when reading Root Status
   e6d8207a84b0 dmaengine: ti-dma-crossbar: Correct am335x/am43xx mux value type
   600b973fc56f rtc: pcf8563: fix output clock rate
   ac0468efee60 video: fbdev: au1200fb: Return an error code if a memory allocation fails
   033d20b727f3 video: fbdev: au1200fb: Release some resources if a memory allocation fails
   314ce0575795 video: udlfb: Fix read EDID timeout
   2f5427451738 fbdev: controlfb: Add missing modes to fix out of bounds access
   57fa76a46673 sfc: don't warn on successful change of MAC
   c9b79738c0ab target: fix race during implicit transition work flushes
   dfd6deed8313 target: fix ALUA transition timeout handling
   7f5084b98f89 target: Use system workqueue for ALUA transitions
   f9b4a2e04c22 btrfs: add missing memset while reading compressed inline extents
   248aa3accad9 NFSv4.1 respect server's max size in CREATE_SESSION
   a49aa7aadbd3 efi/esrt: Cleanup bad memory map log messages
   dc81417eedf5 perf symbols: Fix symbols__fixup_end heuristic for corner cases
   acc7d1bd901c net/mlx4_core: Avoid delays during VF driver device shutdown
   5e469e44c8fd afs: Fix afs_kill_pages()
   80f74cef482f afs: Fix page leak in afs_write_begin()
   c58d7796ab93 afs: Populate and use client modification time
   fa034538cb04 afs: Fix the maths in afs_fs_store_data()
   1efae6ca3418 afs: Prevent callback expiry timer overflow
   43e68e3725df afs: Migrate vlocation fields to 64-bit
   9d8d20570f39 afs: Flush outstanding writes when an fd is closed
   549d7b98f55e afs: Adjust mode bits processing
   bb7a7cd6194f afs: Populate group ID from vnode status
   1c277e9ebba6 afs: Fix missing put_page()
   fec8348008b5 drm/radeon: reinstate oland workaround for sclk
   6a51e93b2fe3 mmc: mediatek: Fixed bug where clock frequency could be set wrong
   51b3eac39a6c sched/deadline: Use deadline instead of period when calculating overflow
   ca91884bcf7d sched/deadline: Throttle a constrained deadline task activated after the deadline
   cd0e18d2f24b sched/deadline: Make sure the replenishment timer fires in the next period
   4c6567f5af9a drm/radeon/si: add dpm quirk for Oland
   c383ebf1acd6 fjes: Fix wrong netdevice feature flags
   a33a9d0c705f scsi: hpsa: limit outstanding rescans
   0a609298214b scsi: hpsa: update check for logical volume status
   b0def6f1e26b openrisc: fix issue handling 8 byte get_user calls
   1236cc3664dc intel_th: pci: Add Gemini Lake support
   d270d24ee596 mlxsw: reg: Fix SPVMLR max record count
   e934e13550a0 mlxsw: reg: Fix SPVM max record count
   677a7aac2ec6 net: Resend IGMP memberships upon peer notification.
   26af6a8b51f1 dmaengine: Fix array index out of bounds warning in __get_unmap_pool()
   9cd4b8684621 net: wimax/i2400m: fix NULL-deref at probe
   b424289863d0 writeback: fix memory leak in wb_queue_work()
   fbdf477fcff6 netfilter: bridge: honor frag_max_size when refragmenting
   7edb2d2d8680 drm/omap: fix dmabuf mmap for dma_alloc'ed buffers
   dbfba339c729 Input: i8042 - add TUXEDO BU1406 (N24_25BU) to the nomux list
   df5678476040 NFSD: fix nfsd_reset_versions for NFSv4.
   5b0334584ad6 NFSD: fix nfsd_minorversion(.., NFSD_AVAIL)
   067cb6b2f716 net: bcmgenet: Power up the internal PHY before probing the MII
   a33e082dcaf4 net: bcmgenet: power down internal phy if open or resume fails
   8aaed873f3b9 net: bcmgenet: reserved phy revisions must be checked first
   c25da696fca1 net: bcmgenet: correct MIB access of UniMAC RUNT counters
   296b584763f7 net: bcmgenet: correct the RBUF_OVFL_CNT and RBUF_ERR_CNT MIB values
   accbd99507b1 net: initialize msg.msg_flags in recvfrom
   b5213e1e9f25 userfaultfd: selftest: vm: allow to build in vm/ directory
   ee9be9963039 userfaultfd: shmem: __do_fault requires VM_FAULT_NOPAGE
   0d0456ec2b08 md-cluster: free md_cluster_info if node leave cluster
   a1d72bc18e77 usb: phy: isp1301: Add OF device ID table
   75252bfe9e49 mac80211: Fix addition of mesh configuration element
   13e86efb2eee KEYS: add missing permission check for request_key() destination
   ef7ce82bc280 ext4: fix crash when a directory's i_size is too small
   2c367edaba65 ext4: fix fdatasync(2) after fallocate(2) operation
   52425e042843 dmaengine: dmatest: move callback wait queue to thread context
   af36d95af55f sched/rt: Do not pull from current CPU if only one CPU to pull
   f98ee9c0007b xhci: Don't add a virt_dev to the devs array before it's fully allocated
   ffc7565746bb Bluetooth: btusb: driver to enable the usb-wakeup feature
   8c7c3d5b785f ceph: drop negative child dentries before try pruning inode's alias
   2862cfca3989 usbip: fix stub_send_ret_submit() vulnerability to null transfer_buffer
   dfdf5fa3e664 USB: core: prevent malicious bNumInterfaces overflow
   05de6fa5c0e2 USB: uas and storage: Add US_FL_BROKEN_FUA for another JMicron JMS567 ID
   a34419b3f6a2 tracing: Allocate mask_str buffer dynamically
   c60db4f68593 autofs: fix careless error in recent commit
   8a311b0462b5 crypto: salsa20 - fix blkcipher_walk API usage
   43cd7f38612d crypto: hmac - require that the underlying hash algorithm is unkeyed
   4231b6a98fce Linux 4.4.106
   5c6db4afbd9f usb: gadget: ffs: Forbid usb_ep_alloc_request from sleeping
   a5fa9efe4e01 arm: KVM: Fix VTTBR_BADDR_MASK BUG_ON off-by-one
   9f5a8d610dd3 Revert "x86/mm/pat: Ensure cpa->pfn only contains page frame numbers"
   34933c2ce99c Revert "x86/efi: Hoist page table switching code into efi_call_virt()"
   1dfe268df584 Revert "x86/efi: Build our own page table structures"
   b90f87c641bc net/packet: fix a race in packet_bind() and packet_notifier()
   f50e9c872cb5 packet: fix crash in fanout_demux_rollover()
   d6189fa45c6d sit: update frag_off info
   6c154d536d94 rds: Fix NULL pointer dereference in __rds_rdma_map
   827fd89bc552 tipc: fix memory leak in tipc_accept_from_sock()
   047a7bb12d63 more bio_map_user_iov() leak fixes
   3a620404e24a s390: always save and restore all registers on context switch
   99962affcb8f ipmi: Stop timers before cleaning up the module
   b34957127058 audit: ensure that 'audit=1' actually enables audit for PID 1
   1b9baf30673c ipvlan: fix ipv6 outbound device
   cdfe2d0a4834 afs: Connect up the CB.ProbeUuid
   452ae0913614 IB/mlx5: Assign send CQ and recv CQ of UMR QP
   3d1d4642fc55 IB/mlx4: Increase maximal message size under UD QP
   8bfafc972a34 xfrm: Copy policy family in clone_policy
   5c15c5c8ebc5 jump_label: Invoke jump_label_test() via early_initcall()
   1b85cd5d9262 atm: horizon: Fix irq release error
   dde5bbd52a28 sctp: use the right sk after waking up from wait_buf sleep
   1ad621272bd7 sctp: do not free asoc when it is already dead in sctp_sendmsg
   59e52050b17c sparc64/mm: set fields in deferred pages
   7b99b00cf3f0 block: wake up all tasks blocked in get_request()
   5a54dcc51a4a sunrpc: Fix rpc_task_begin trace point
   c02608144e79 NFS: Fix a typo in nfs_rename()
   640192431a29 dynamic-debug-howto: fix optional/omitted ending line number to be LARGE instead of 0
   24c98ec494c2 lib/genalloc.c: make the avail variable an atomic_long_t
   90ec232a3911 route: update fnhe_expires for redirect when the fnhe exists
   41dee81f22c9 route: also update fnhe_genid when updating a route cache
   32f8870cc9a9 mac80211_hwsim: Fix memory leak in hwsim_new_radio_nl()
   0aab426757d3 kbuild: pkg: use --transform option to prefix paths in tar
   8f72d29e7024 EDAC, i5000, i5400: Fix definition of NRECMEMB register
   222de157ccd0 EDAC, i5000, i5400: Fix use of MTR_DRAM_WIDTH macro
   f1ff979f97bd powerpc/powernv/ioda2: Gracefully fail if too many TCE levels requested
   d42ebf56380f drm/amd/amdgpu: fix console deadlock if late init failed
   40b2b6453f89 axonram: Fix gendisk handling
   f2396d60746f netfilter: don't track fragmented packets
   ca6d40bb082a zram: set physical queue limits to avoid array out of bounds accesses
   39c626c1f9e3 i2c: riic: fix restart condition
   a836e1952f28 crypto: s5p-sss - Fix completing crypto request in IRQ handler
   7c5deeccc664 ipv6: reorder icmpv6_init() and ip6_mr_init()
   84bc40c4b31b bnx2x: do not rollback VF MAC/VLAN filters we did not configure
   871e4b11eba2 bnx2x: fix possible overrun of VFPF multicast addresses array
   1aead0538b89 bnx2x: prevent crash when accessing PTP with interface down
   6bbc908cfc1c spi_ks8995: fix "BUG: key accdaa28 not in .data!"
   687121453005 arm64: KVM: Survive unknown traps from guests
   5dc5c8e65515 arm: KVM: Survive unknown traps from guests
   ccf72fe2e5cc KVM: nVMX: reset nested_run_pending if the vCPU is going to be reset
   0a12875fa51f irqchip/crossbar: Fix incorrect type of register size
   8a15c626996c scsi: lpfc: Fix crash during Hardware error recovery on SLI3 adapters
   d9d47a6d6862 workqueue: trigger WARN if queue_delayed_work() is called with NULL @wq
   14a7aa2ae61e libata: drop WARN from protocol error in ata_sff_qc_issue()
   f9b291aed2a9 kvm: nVMX: VMCLEAR should not cause the vCPU to shut down
   ef21f3a12bb1 USB: gadgetfs: Fix a potential memory leak in 'dev_config()'
   4036947a43a0 usb: gadget: configs: plug memory leak
   24e9fc7ef051 HID: chicony: Add support for another ASUS Zen AiO keyboard
   3aec56b81960 gpio: altera: Use handle_level_irq when configured as a level_high
   c52017de0ba6 ARM: OMAP2+: Release device node after it is no longer needed.
   14c396184529 ARM: OMAP2+: Fix device node reference counts
   d180639d86e1 module: set __jump_table alignment to 8
   23f9e8448219 selftest/powerpc: Fix false failures for skipped tests
   3bf3fc6cbc8b x86/hpet: Prevent might sleep splat on resume
   0500c6d35274 ARM: OMAP2+: gpmc-onenand: propagate error on initialization failure
   572b639bde31 vti6: Don't report path MTU below IPV6_MIN_MTU.
   3771241e5bc3 Revert "s390/kbuild: enable modversions for symbols exported from asm"
   e891a29531d4 Revert "spi: SPI_FSL_DSPI should depend on HAS_DMA"
   f854e2099915 Revert "drm/armada: Fix compile fail"
   5327f9badacd mm: drop unused pmdp_huge_get_and_clear_notify()
   47c53ccca4a0 thp: fix MADV_DONTNEED vs. numa balancing race
   d4443b53732e thp: reduce indentation level in change_huge_pmd()
   696fbe191acd scsi: storvsc: Workaround for virtual DVD SCSI version
   dd8c78e2501e ARM: avoid faulting on qemu
   af1d17239682 ARM: BUG if jumping to usermode address in kernel mode
   750f60edebac arm64: fpsimd: Prevent registers leaking from dead tasks
   477b837533a2 KVM: VMX: remove I/O port 0x80 bypass on Intel hosts
   11030654676b arm64: KVM: fix VTTBR_BADDR_MASK BUG_ON off-by-one
   a0b99544dde8 media: dvb: i2c transfers over usb cannot be done from stack
   81bf294f5f7b drm/exynos: gem: Drop NONCONTIG flag for buffers allocated without IOMMU
   74b6030355a4 drm: extra printk() wrapper macros
   d6ff4cce9aa3 kdb: Fix handling of kallsyms_symbol_next() return value
   bb47cf7f8e47 s390: fix compat system call table
   dc41b6e35f93 iommu/vt-d: Fix scatterlist offset handling
   90a20a81dc1c ALSA: usb-audio: Add check return value for usb_string()
   9f5c6b108850 ALSA: usb-audio: Fix out-of-bound error
   e1d3b7d04d9d ALSA: seq: Remove spurious WARN_ON() at timer check
   659e7d2588f0 ALSA: pcm: prevent UAF in snd_pcm_info
   5986c9685f1e x86/PCI: Make broadcom_postcore_init() check acpi_disabled
   2c2e4b7d279a X.509: reject invalid BIT STRING for subjectPublicKey
   1471d1258921 ASN.1: check for error from ASN1_OP_END__ACT actions
   621dac1d6991 ASN.1: fix out-of-bounds read when parsing indefinite length item
   481efb4c7256 efi: Move some sysfs files to be read-only by root
   7e0091c2951f scsi: libsas: align sata_device's rps_resp on a cacheline
   98448333588c isa: Prevent NULL dereference in isa_bus driver callbacks
   90e2ea6dc851 hv: kvp: Avoid reading past allocated blocks from KVP file
   94739ddf35cb virtio: release virtio index when fail to device_register
   d73fcef16da0 can: usb_8dev: cancel urb on -EPIPE and -EPROTO
   191b419bd0b1 can: esd_usb2: cancel urb on -EPIPE and -EPROTO
   af11f3afc2c2 can: ems_usb: cancel urb on -EPIPE and -EPROTO
   bd424bd17572 can: kvaser_usb: cancel urb on -EPIPE and -EPROTO
   3e3dabd83630 can: kvaser_usb: ratelimit errors if incomplete messages are received
   816bc7dffea2 can: kvaser_usb: Fix comparison bug in kvaser_usb_read_bulk_callback()
   b6fa54c18e8d can: kvaser_usb: free buf in error paths
   a68e3c90dfb1 can: ti_hecc: Fix napi poll return value for repoll
   69b0bf95a51e Linux 4.4.105
   da57b1f7e74f xen-netfront: avoid crashing on resume after a failure in talk_to_netback()
   e1cadf7c4af2 usb: host: fix incorrect updating of offset
   43135100f117 USB: usbfs: Filter flags passed in from user space
   c0493eb552e0 USB: devio: Prevent integer overflow in proc_do_submiturb()
   2ee8d2acf3ef USB: Increase usbfs transfer limit
   9d812f7bef8c USB: core: Add type-specific length check of BOS descriptors
   f044af8c1dc3 usb: ch9: Add size macro for SSP dev cap descriptor
   ddaa1ae2eb7f usb: Add USB 3.1 Precision time measurement capability descriptor support
   a1f03a9bcfa4 usb: xhci: fix panic in xhci_free_virt_devices_depth_first
   6a85ba4157a0 usb: hub: Cycle HUB power when initialization fails
   40012163e52a Revert "ocfs2: should wait dio before inode lock in ocfs2_setattr()"
   33621da4d4ef net: fec: fix multicast filtering hardware setup
   5d036ccddc5d xen-netfront: Improve error handling during initialization
   cc4add389789 mm: avoid returning VM_FAULT_RETRY from ->page_mkwrite handlers
   1b7dbabf0242 tcp: correct memory barrier usage in tcp_check_space()
   bc42f67b73cb dmaengine: pl330: fix double lock
   ca0836061019 tipc: fix cleanup at module unload
   e5afc84f644c net: sctp: fix array overrun read on sctp_timer_tbl
   7e9236c00152 drm/exynos/decon5433: set STANDALONE_UPDATE_F on output enablement
   e26d58f897ca NFSv4: Fix client recovery when server reboots multiple times
   48222dd037f5 KVM: arm/arm64: Fix occasional warning from the timer work function
   f2fb416f4af6 nfs: Don't take a reference on fl->fl_file for LOCK operation
   7228df818d90 ravb: Remove Rx overflow log messages
   1bb50d02a8d3 net/appletalk: Fix kernel memory disclosure
   c73b58cfa83e vti6: fix device register to report IFLA_INFO_KIND
   e6533243f74f ARM: OMAP1: DMA: Correct the number of logical channels
   e6f105531992 net: systemport: Pad packet before inserting TSB
   3a44ade54473 net: systemport: Utilize skb_put_padto()
   8633eec0ee08 kprobes/x86: Disable preemption in ftrace-based jprobes
   7317cb116754 perf test attr: Fix ignored test case result
   1c4d7600390b sysrq : fix Show Regs call trace on ARM
   c86fa9ed3a0f EDAC, sb_edac: Fix missing break in switch
   c2e1be144805 x86/entry: Use SYSCALL_DEFINE() macros for sys_modify_ldt()
   ecd996c24a79 serial: 8250: Preserve DLD[7:4] for PORT_XR17V35X
   86b9d66d1f3f usb: phy: tahvo: fix error handling in tahvo_usb_probe()
   b6ca48b5cd08 spi: sh-msiof: Fix DMA transfer size check
   a96c19f5ba09 serial: 8250_fintek: Fix rs485 disablement on invalid ioctl()
   429feb597df3 selftests/x86/ldt_get: Add a few additional tests for limits
   93f45d8c67dc s390/pci: do not require AIS facility
   80f93e24ecfc ima: fix hash algorithm initialization
   71ce1cac5b4d USB: serial: option: add Quectel BG96 id
   9e51ee1b76ef s390/runtime instrumentation: simplify task exit handling
   ef3567cc5284 serial: 8250_pci: Add Amazon PCI serial device ID
   a8293de0ee1f usb: quirks: Add no-lpm quirk for KY-688 USB 3.1 Type-C Hub
   636b080991ee uas: Always apply US_FL_NO_ATA_1X quirk to Seagate devices
   3f7477e64478 bcache: recover data from backing when data is clean
   f80f34d8ba92 bcache: only permit to recovery read error when cache device is clean
   bd3799391822 Linux 4.4.104
   bd249dd07827 nfsd: Fix another OPEN stateid race
   54298082dbac nfsd: Fix stateid races between OPEN and CLOSE
   d7f5f10f5159 nfsd: Make init_open_stateid() a bit more whole
   68e6cd9a0547 drm/i915: Prevent zero length "index" write
   e6bcff7b6aa1 drm/i915: Don't try indexed reads to alternate slave addresses
   a61474fa8749 NFS: revalidate "." etc correctly on "open".
   c8ea49b690ee mtd: nand: Fix writing mtdoops to nand flash.
   a155a9568d9a drm/panel: simple: Add missing panel_simple_unprepare() calls
   c7716f65721a drm/radeon: fix atombios on big endian
   4d027a8bcc7f Revert "drm/radeon: dont switch vt on suspend"
   5a7391b6d898 bcache: Fix building error on MIPS
   6b4901e0e349 eeprom: at24: check at24_read/write arguments
   5c65b739389f mmc: core: Do not leave the block driver in a suspended state
   a6493ad6fc89 KVM: x86: inject exceptions produced by x86_decode_insn
   1e9e6bdccb80 KVM: x86: Exit to user-mode on #UD intercept when emulator requires
   ab29b6b818aa KVM: x86: pvclock: Handle first-time write to pvclock-page contains random junk
   591ddc92d756 btrfs: clear space cache inode generation always
   0d05a5593f63 mm/madvise.c: fix madvise() infinite loop under special circumstances
   2b7ef6bdd286 mm, thp: Do not make page table dirty unconditionally in touch_p[mu]d()
   f97fc9ab1ce2 x86/efi-bgrt: Replace early_memremap() with memremap()
   e85c6907b2b4 x86/efi-bgrt: Fix kernel panic when mapping BGRT data
   44ff3af83ee1 ARM: dts: omap3: logicpd-torpedo-37xx-devkit: Fix MMC1 cd-gpio
   36e0f05afd4e x86/efi: Build our own page table structures
   b73adb608520 x86/efi: Hoist page table switching code into efi_call_virt()
   87e2bd898d3a x86/mm/pat: Ensure cpa->pfn only contains page frame numbers
   b377c453b363 ipsec: Fix aborted xfrm policy dump crash
   27248d2fa77f netlink: add a start callback for starting a netlink dump
   08c15ad2e627 Linux 4.4.103
   3d7214a338d7 Revert "sctp: do not peel off an assoc from one netns to another one"
   c73eb1e0cc56 xen: xenbus driver must not accept invalid transaction ids
   eedd29f51078 s390/kbuild: enable modversions for symbols exported from asm
   681b2239862d ASoC: wm_adsp: Don't overrun firmware file buffer when reading region data
   b63209c78f9e btrfs: return the actual error value from from btrfs_uuid_tree_iterate
   e88f3fb0e340 ASoC: rsnd: don't double free kctrl
   47b99a3306d0 netfilter: nf_tables: fix oob access
   a1e4f6a15103 netfilter: nft_queue: use raw_smp_processor_id()
   85f286d6f8cd spi: SPI_FSL_DSPI should depend on HAS_DMA
   8537e96e4351 staging: iio: cdc: fix improper return value
   266913b390c3 iio: light: fix improper return value
   7e927748d4db mac80211: Suppress NEW_PEER_CANDIDATE event if no room
   9825826ed7bd mac80211: Remove invalid flag operations in mesh TSF synchronization
   f0d8fb74479b drm: Apply range restriction after color adjustment when allocation
   31447ebb1a86 ALSA: hda - Apply ALC269_FIXUP_NO_SHUTUP on HDA_FIXUP_ACT_PROBE
   7e920566c352 ath10k: set CTS protection VDEV param only if VDEV is up
   ef751ca54602 ath10k: fix potential memory leak in ath10k_wmi_tlv_op_pull_fw_stats()
   b24769300a00 ath10k: ignore configuring the incorrect board_id
   64b22ee723ee ath10k: fix incorrect txpower set by P2P_DEVICE interface
   c4cf731af838 drm/armada: Fix compile fail
   7f69dc100400 net: 3com: typhoon: typhoon_init_one: fix incorrect return values
   609797646f9b net: 3com: typhoon: typhoon_init_one: make return values more specific
   d7c3d5333e39 net: Allow IP_MULTICAST_IF to set index to L3 slave
   778395506a7f dmaengine: zx: set DMA_CYCLIC cap_mask bit
   37a48e6d83f5 PCI: Apply _HPX settings only to relevant devices
   57d2ce160310 RDS: RDMA: return appropriate error on rdma map failures
   bbb1fc744894 e1000e: Separate signaling for link check/link up
   5df4097cfc70 e1000e: Fix return value test
   fbb2d8000a8f e1000e: Fix error path in link detection
   d6968bc56e44 PM / OPP: Add missing of_node_put(np)
   fd3c395d4d46 net/9p: Switch to wait_event_killable()
   91bd72dd8c72 fscrypt: lock mutex before checking for bounce page pool
   cb1831a83e54 sched/rt: Simplify the IPI based RT balancing logic
   5a11b8458b35 media: v4l2-ctrl: Fix flags field on Control events
   0870fb4c3566 cx231xx-cards: fix NULL-deref on missing association descriptor
   d758f4d8bf20 media: rc: check for integer overflow
   878c0f9a7c69 media: Don't do DMA on stack for firmware upload in the AS102 driver
   a2943ce580f5 powerpc/signal: Properly handle return value from uprobe_deny_signal()
   937a91cd3992 parisc: Fix validity check of pointer size argument in new CAS implementation
   aef7cdb6a6ff ixgbe: Fix skb list corruption on Power systems
   bb923a81c33e fm10k: Use smp_rmb rather than read_barrier_depends
   b4ca98b7a803 i40evf: Use smp_rmb rather than read_barrier_depends
   a8e699dfca04 ixgbevf: Use smp_rmb rather than read_barrier_depends
   2f7de4d5f525 igbvf: Use smp_rmb rather than read_barrier_depends
   391cdaaaa9d9 igb: Use smp_rmb rather than read_barrier_depends
   146d53371385 i40e: Use smp_rmb rather than read_barrier_depends
   76c389ca1331 NFC: fix device-allocation error return
   ecc5e8914766 IB/srp: Avoid that a cable pull can trigger a kernel crash
   3e32b40435b9 IB/srpt: Do not accept invalid initiator port names
   54a8d930b93f libnvdimm, namespace: make 'resource' attribute only readable by root
   4dae2f771fa7 libnvdimm, namespace: fix label initialization to use valid seq numbers
   037646313522 clk: ti: dra7-atl-clock: fix child-node lookups
   eca460c485f9 clk: ti: dra7-atl-clock: Fix of_node reference counting
   36d2f19430e2 SUNRPC: Fix tracepoint storage issues with svc_recv and svc_rqst_status
   a694b1f85aea KVM: SVM: obey guest PAT
   8293dc75de47 KVM: nVMX: set IDTR and GDTR limits when loading L1 host state
   4e426ed57cd2 target: Fix QUEUE_FULL + SCSI task attribute handling
   63bfc4c90a87 iscsi-target: Fix non-immediate TMR reference leak
   8709c5386109 fs/9p: Compare qid.path in v9fs_test_inode
   1b11593eb742 fix a page leak in vhost_scsi_iov_to_sgl() error recovery
   509ab500a240 ALSA: hda/realtek - Fix ALC700 family no sound issue
   ef6745531648 ALSA: timer: Remove kernel warning at compat ioctl error paths
   3532750d20f5 ALSA: usb-audio: Add sanity checks in v2 clock parsers
   0b6cede2e455 ALSA: usb-audio: Fix potential out-of-bound access at parsing SU
   d1316b9d83de ALSA: usb-audio: Add sanity checks to FE parser
   b71cf750ddd3 ALSA: pcm: update tstamp only if audio_tstamp changed
   db12d9b5a181 ext4: fix interaction between i_size, fallocate, and delalloc after a crash
   189bc689547a ata: fixes kernel crash while tracing ata_eh_link_autopsy event
   f1be21021099 rtlwifi: fix uninitialized rtlhal->last_suspend_sec time
   3c260c60d20c rtlwifi: rtl8192ee: Fix memory leak when loading firmware
   a8b8ab79ca4f nfsd: deal with revoked delegations appropriately
   2a2d4b41472c nfs: Fix ugly referral attributes
   ab33df42eb3c NFS: Fix typo in nomigration mount option
   4e23be616976 isofs: fix timestamps beyond 2027
   85c79043808d bcache: check ca->alloc_thread initialized before wake up it
   9c093a258350 eCryptfs: use after free in ecryptfs_release_messaging()
   7d7b05e4ffd5 nilfs2: fix race condition that causes file system corruption
   9a4e08c634ce autofs: don't fail mount for transient error
   153142963ca1 MIPS: BCM47XX: Fix LED inversion for WRT54GSv1
   00fd53bc378f MIPS: Fix an n32 core file generation regset support regression
   4e82464aa4a3 dm: fix race between dm_get_from_kobject() and __dm_destroy()
   36c4819abc92 dm bufio: fix integer overflow when limiting maximum cache size
   a9f066404fd0 ALSA: hda: Add Raven PCI ID
   0c1faf9df0c8 MIPS: ralink: Fix typo in mt7628 pinmux function
   84c785ed786a MIPS: ralink: Fix MT7628 pinmux
   36a082ce590f ARM: 8721/1: mm: dump: check hardware RO bit for LPAE
   5f8046f7c9e3 ARM: 8722/1: mm: make STRICT_KERNEL_RWX effective for LPAE
   29c4b6b4f46d x86/decoder: Add new TEST instruction pattern
   4fdb1637b208 lib/mpi: call cond_resched() from mpi_powm() loop
   8ff3471878f3 sched: Make resched_cpu() unconditional
   3223ea129170 vsock: use new wait API for vsock_stream_sendmsg()
   df24d6c22460 AF_VSOCK: Shrink the area influenced by prepare_to_wait
   2417da3f4d6b ipv6: only call ip6_route_dev_notify() once for NETDEV_UNREGISTER
   5c2607d3e7cd s390/disassembler: increase show_code buffer size
   4337fa2425f6 s390/disassembler: add missing end marker for e7 table
   04bc7a273264 s390/runtime instrumention: fix possible memory corruption
   7ddbe701076d s390: fix transactional execution control register handling
   29ffb9c1fb4a Linux 4.4.102
   0208fabf7256 mm, hwpoison: fixup "mm: check the return value of lookup_page_ext for all call sites"
   5baf0fb260fc Linux 4.4.101
   a3805b10de80 mm/pagewalk.c: report holes in hugetlb ranges
   3630b2801907 mm/page_ext.c: check if page_ext is not prepared
   e34e744f70a6 mm: check the return value of lookup_page_ext for all call sites
   7b7a1c39e839 coda: fix 'kernel memory exposure attempt' in fsync
   c1b3703b643f mm/page_alloc.c: broken deferred calculation
   4ecf752738ac ipmi: fix unsigned long underflow
   c4baa4a5870c ocfs2: should wait dio before inode lock in ocfs2_setattr()
   8c325770546a nvme: Fix memory order on async queue deletion
   4310b6bfa8e0 arm64: fix dump_instr when PAN and UAO are in use
   1df403abfa9e serial: omap: Fix EFR write on RTS deassertion
   a9100b6f1a8a ima: do not update security.ima if appraisal status is not INTEGRITY_PASS
   51b8aea7abde net/sctp: Always set scope_id in sctp_inet6_skb_msgname
   ae93cefb9430 fealnx: Fix building error on MIPS
   2a0e60907e54 sctp: do not peel off an assoc from one netns to another one
   4cfc0b41af03 af_netlink: ensure that NLMSG_DONE never fails in dumps
   ef206ea779a9 vlan: fix a use-after-free in vlan_device_event()
   3bb6245e14ea bonding: discard lowest hash bit for 802.3ad layer3+4
   001e9cbe1dae netfilter/ipvs: clear ipvs_property flag when SKB net namespace changed
   0c1282c7f046 tcp: do not mangle skb->cb[] in tcp_make_synack()
   26d6298789e6 Linux 4.4.100
   f119ff8e5b6b USB: serial: garmin_gps: fix memory leak on probe errors
   8b36209e93df USB: serial: garmin_gps: fix I/O after failed probe and remove
   5cd938508c81 USB: serial: qcserial: add pid/vid for Sierra Wireless EM7355 fw update
   302dd596822a USB: Add delay-init quirk for Corsair K70 LUX keyboards
   965003b311e0 USB: usbfs: compute urb->actual_length for isochronous
   834a5d880a54 uapi: fix linux/rds.h userspace compilation errors
   16e7973f8e47 uapi: fix linux/rds.h userspace compilation error
   f5e303d54ac2 Revert "uapi: fix linux/rds.h userspace compilation errors"
   d9c8d4adb5a7 Revert "crypto: xts - Add ECB dependency"
   d2d72c0ee4c9 MIPS: Netlogic: Exclude netlogic,xlp-pic code from XLR builds
   9a8ef143951f MIPS: init: Ensure reserved memory regions are not added to bootmem
   034347aca034 MIPS: init: Ensure bootmem does not corrupt reserved memory
   a904ebe92a05 mm: add PHYS_PFN, use it in __phys_to_pfn()
   7f5eb098ef95 MIPS: End asm function prologue macros with .insn
   b15877443a93 staging: rtl8712: fixed little endian problem
   ade72053f452 ixgbe: do not disable FEC from the driver
   b6e7fb0be1e5 ixgbe: add mask for 64 RSS queues
   12ec51aaafe3 ixgbe: Reduce I2C retry count on X550 devices
   9d51db4caff9 ixgbe: handle close/suspend race with netif_device_detach/present
   f12976ce82cd ixgbe: fix AER error handling
   865fe71c0a06 arm64: dts: NS2: reserve memory for Nitro firmware
   e2d12bdaed6b ALSA: hda/realtek - Add new codec ID ALC299
   b1e8e6d4c065 gpu: drm: mgag200: mgag200_main:- Handle error from pci_iomap
   3e899991b99e backlight: adp5520: Fix error handling in adp5520_bl_probe()
   d6f21ea25118 backlight: lcd: Fix race condition during register
   fe21a3d68819 ALSA: vx: Fix possible transfer overflow
   3b985d39ed4f ALSA: vx: Don't try to update capture stream before running
   51abb2a73f16 scsi: lpfc: Clear the VendorVersion in the PLOGI/PLOGI ACC payload
   8d8723c8c187 scsi: lpfc: Correct issue leading to oops during link reset
   44eb947094c4 scsi: lpfc: Correct host name in symbolic_name field
   a7e7d319cc96 scsi: lpfc: FCoE VPort enable-disable does not bring up the VPort
   18477baf599e scsi: lpfc: Add missing memory barrier
   fdc1e9d553e1 staging: rtl8188eu: fix incorrect ERROR tags from logs
   0c098158785b scsi: ufs: add capability to keep auto bkops always enabled
   469e75ddff14 scsi: ufs-qcom: Fix module autoload
   bb848b61967f igb: Fix hw_dbg logging in igb_update_flash_i210
   ba83011a470c igb: close/suspend race in netif_device_detach
   559a20802838 igb: reset the PHY before reading the PHY ID
   7878dca7ca24 drm/sti: sti_vtg: Handle return NULL error from devm_ioremap_nocache
   b9ea0af4793b ata: SATA_MV should depend on HAS_DMA
   11cb9dedb2e6 ata: SATA_HIGHBANK should depend on HAS_DMA
   2066882df749 ata: ATA_BMDMA should depend on HAS_DMA
   4fd669feacd3 ARM: dts: Fix omap3 off mode pull defines
   955840ea5035 ARM: OMAP2+: Fix init for multiple quirks for the same SoC
   4a23041fa533 ARM: dts: Fix am335x and dm814x scm syscon to probe children
   84a97ea8b7b1 ARM: dts: Fix compatible for ti81xx uarts for 8250
   62641014202e fm10k: request reset when mbx->state changes
   2bb04f1ff63d extcon: palmas: Check the parent instance to prevent the NULL
   8d9142ff444e dmaengine: dmatest: warn user when dma test times out
   ec4f8a71c0fc Bluetooth: btusb: fix QCA Rome suspend/resume
   977784638f76 arm: crypto: reduce priority of bit-sliced AES cipher
   e455048c7ae9 net: qmi_wwan: fix divide by 0 on bad descriptors
   caeeef8438c3 net: cdc_ether: fix divide by 0 on bad descriptors
   46bdabbca02e sctp: do not peel off an assoc from one netns to another one
   11e8e55be18c xen-blkback: don't leak stack data via response ring
   49630dd2e10a bpf: don't let ldimm64 leak map addresses on unprivileged
   07e3aff243cd KVM: x86: fix singlestepping over syscall
   ceb5c560e2e4 ext4: fix data exposure after a crash
   0a418e57717d media: dib0700: fix invalid dvb_detach argument
   c344019c48a9 media: imon: Fix null-ptr-deref in imon_probe

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 6c6beb62b834..9a4bba1b5e2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eba5ff0bad4f443ffa9a4b08b882b3ffbea831c3"
-SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
+SRCREV_machine ?= "d5efeeeb928a0111fc187fd1e8d03d2e4e35d4a0"
+SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.99"
+LINUX_VERSION ?= "4.4.113"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index de1dbb82ed42..8a98189d4c74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.99"
+LINUX_VERSION ?= "4.4.113"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
+SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 6fe3b395efe9..97c16d59dd18 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d22bf871c41b0b4e2836df7acebca295e98fa0b6"
-SRCREV_machine_qemuarm64 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_machine_qemumips ?= "7c682b7ad6d0c847593c65feb1df651fa0300b1a"
-SRCREV_machine_qemuppc ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_machine_qemux86 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_machine_qemux86-64 ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_machine_qemumips64 ?= "3b14a56cdca5182621ec88eabe10456256a95e80"
-SRCREV_machine ?= "c6fa2d220b5fb9b01134a06df9679436531042cf"
-SRCREV_meta ?= "72b622cacfda96e79477909518795dbcce6b1593"
+SRCREV_machine_qemuarm ?= "400c0f39b954cd8fffdf53e6ec97852b73fea7af"
+SRCREV_machine_qemuarm64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_machine_qemumips ?= "fb03a9472367b6c177729ac631326aafd5d17c92"
+SRCREV_machine_qemuppc ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_machine_qemux86 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_machine_qemux86-64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_machine_qemumips64 ?= "26b8ba186a6d39728fc1510bd2264110c75842f5"
+SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
+SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.99"
+LINUX_VERSION ?= "4.4.113"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


