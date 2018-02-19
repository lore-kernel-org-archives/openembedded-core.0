Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4197E6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 03:23:59 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id h10so4956273plt.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 19:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=EPEpGhRTyhJPyfL6BpWHZat+sWqkpX3A7gaq9PNAvb4=;
	b=aTrWH/w2kQ10OyPZ59nV5wCicpXLYX3XOGMFTq0ATyBrgwW23zy1cv0wYQghve22qL
	ez8JuTshmxEJKCR+il5r8JYDnPVz/T/1+rVslOpCDHOXQRus6Xuz17NRwtJCHSlaJAxX
	KAL85QSmudcPCERtXN/nfjRLJ7LrG+JGBruL1Z2UWKVuRq2YStNHMqZ6/sV0FFvKZdSD
	sVM4+EJmSdC58xufw1T77gj7XJasyR7DkdXiOOj+A6q9C9kJQI7pY6MT6Zi7N5E8Eklm
	2WVp/j4ad010CLV0NekC/PC2NiLiAt8H9MX1rSnGeL8E8CVDEEVRFRY4MDzuslUKy45R
	dJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EPEpGhRTyhJPyfL6BpWHZat+sWqkpX3A7gaq9PNAvb4=;
	b=HHJS/TFhgwRXSQsiqIZP2rbdElQoAY3q+ziF8y4narLSn5s6ENvSGWnGay9nydp+64
	ewFBcvsrWawaOH+UQhRHNrYRW+0bmHtfrg/I4wLXl6IzQZLixvB+jReEHTfbJylZdjbE
	t6/tet0ujs/NEpxki3UJahtvPJ9J9CobZVOCAtJXU+rHB94eS50AHrWox5SBFFRGuPSS
	5MX7FqK+YfuLk+ZjF0qOWV+8PheypDA0qhFibgHs44Y+09PvPzTVeV9OsYhzKrNXPIcc
	5MbUv2yJyizbtYAibrBIHcx33mOYdxo/TIL6hjP2FwllHWij0uAiqFptrVjoAcdSgImx
	OmJw==
X-Gm-Message-State: APf1xPANgknfyaajP4tN4P0mD5SqJ+G1yev//CbIw3fNvUgrpPFgN4C5
	PlskJzK++ocEtRz1eqHMDoFtIQ==
X-Google-Smtp-Source: AH8x227Y/eKf7SJQE9exedthgPe6+qHTg3jmHBo7+HTuOPOs7jxq7NBL3rPAdF0eZUlrH2Df7j83vQ==
X-Received: by 2002:a17:902:5582:: with SMTP id
	g2-v6mr12552021pli.4.1519010640817; 
	Sun, 18 Feb 2018 19:24:00 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:445:eea1:c858:82d4?
	([2601:202:4000:1184:445:eea1:c858:82d4])
	by smtp.gmail.com with ESMTPSA id h75sm652573pfh.28.2018.02.18.19.23.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Feb 2018 19:24:00 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <1519007891-28056-1-git-send-email-bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <61b1c9b0-afcc-4b9e-0c4e-66e1c3c15614@gmail.com>
Date: Sun, 18 Feb 2018 19:23:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519007891-28056-1-git-send-email-bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][rocko] linux-yocto/4.12: update to v4.12.20
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
X-List-Received-Date: Mon, 19 Feb 2018 03:24:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Bruce,

Sorry, I just saw this one. it would not apply so I am hand applying it.
Arm64 and PPC hash still did not change.

I looked at
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/log/?h=3Dstand=
ard/qemuarm64
and its still on 4.12.19 and so is PPC. Check tiny too. Looks like .20
was not propagated to those branches.

- armin


On 02/18/2018 06:38 PM, Bruce Ashfield wrote:
> Updating to Paul Gortmaker's 4.12.20 release, which comprises
> the following commits:
>
>    26041ea62c10 Linux 4.12.20
>    80da9fc42759 kvm: x86: fix RSM when PCID is non-zero
>    94ff73e84af3 x86/pti: Rename BUG_CPU_INSECURE to BUG_CPU_MELTDOWN
>    1c6aaef6e08f x86/alternatives: Add missing '\n' at end of ALTERNATIV=
E inline asm
>    a14ac5bc4953 x86/tlb: Drop the _GPL from the cpu_tlbstate export
>    a95cc558c4ba x86/events/intel/ds: Use the proper cache flush method =
for mapping ds buffers
>    e94e2440d266 x86/kaslr: Fix the vaddr_end mess
>    ec2c4771ab78 x86/mm: Map cpu_entry_area at the same place on 4/5 lev=
el
>    21390d1cf697 x86/mm: Set MODULES_END to 0xffffffffff000000
>    a657f6bde81f x86/process: Define cpu_tss_rw in same section as decla=
ration
>    f0ca9ecfacd8 x86/pti: Switch to kernel CR3 at early in entry_SYSCALL=
_compat()
>    882c46ebc1eb x86/pti: Make sure the user/kernel PTEs match
>    0920dd036f51 x86/cpu, x86/pti: Do not enable PTI on AMD processors
>    2832199b24b5 x86/pti: Enable PTI by default
>    abe84bdf0450 mm/mprotect: add a cond_resched() inside change_pmd_ran=
ge()
>    79c74e87dd70 kernel/acct.c: fix the acct->needcheck check in check_f=
ree_space()
>    8097b1b3ed8e x86/espfix/64: Fix espfix double-fault handling on 5-le=
vel systems
>    1a698b5094c6 x86/decoder: Fix and update the opcodes map
>    3bc0a0230c85 x86/idt: Load idt early in start_secondary
>    96523a6b3c9f x86/ldt: Make LDT pgtable free conditional
>    0930c225b7fd x86/ldt: Plug memory leak in error path
>    7b392c0fd57c x86/mm: Remove preempt_disable/enable() from __native_f=
lush_tlb()
>    a569be19aca4 x86/smpboot: Remove stale TLB flush invocations
>    171c680cd430 x86/ldt: Make the LDT mapping RO
>    b20a4e9c0824 x86/mm/dump_pagetables: Allow dumping current pagetable=
s
>    4cb373d5878c x86/mm/dump_pagetables: Check user space page table for=
 WX pages
>    419aaf9950b0 x86/mm/dump_pagetables: Add page table directory to the=
 debugfs VFS hierarchy
>    f2ea744855ef x86/mm/pti: Add Kconfig
>    21ee6ef0b6da x86/dumpstack: Indicate in Oops whether PTI is configur=
ed and enabled
>    4792df02eaa2 x86/mm: Clarify the whole ASID/kernel PCID/user PCID na=
ming
>    079aafe7e55e x86/mm: Use INVPCID for __native_flush_tlb_single()
>    f82db33b19f6 x86/mm: Optimize RESTORE_CR3
>    156823d62b52 x86/mm: Use/Fix PCID to optimize user/kernel switches
>    3c6ddf8979d7 x86/mm: Abstract switching CR3
>    842c1304aa61 x86/mm: Allow flushing for future ASID switches
>    54ccd28274b7 x86/pti: Map the vsyscall page if needed
>    05347c693d0a x86/pti: Put the LDT in its own PGD if PTI is on
>    86aa46082664 x86/mm/64: Make a full PGD-entry size hole in the memor=
y map
>    bd91c7622d4b x86/events/intel/ds: Map debug buffers in cpu_entry_are=
a
>    f2a19cac5364 x86/cpu_entry_area: Add debugstore entries to cpu_entry=
_area
>    788856fff986 x86/mm/pti: Map ESPFIX into user space
>    2946dc511e38 x86/mm/pti: Share entry text PMD
>    8f01f3ca70af x86/entry: Align entry text section to PMD boundary
>    419ac1b145f8 x86/mm/pti: Share cpu_entry_area with user space page t=
ables
>    43ac2d12a830 x86/mm/pti: Force entry through trampoline when PTI act=
ive
>    c0226c119bb4 x86/mm/pti: Add functions to clone kernel PMDs
>    0de21941f44c x86/mm/pti: Populate user PGD
>    dc46e9eafde8 x86/mm/pti: Allocate a separate user PGD
>    a3293057588e x86/mm/pti: Allow NX poison to be set in p4d/pgd
>    b51aa0399145 x86/mm/pti: Add mapping helper functions
>    66d1447e7cd8 x86/pti: Add the pti=3D cmdline option and documentatio=
n
>    399981179cc2 x86/mm/pti: Add infrastructure for page table isolation=

>    ff4703d2378d x86/mm/pti: Prepare the x86/entry assembly code for ent=
ry/exit CR3 switching
>    6eb83fa9c76d x86/mm/pti: Disable global pages if PAGE_TABLE_ISOLATIO=
N=3Dy
>    0cbc392772c6 x86/cpufeatures: Add X86_BUG_CPU_INSECURE
>    bb426b09a2b3 nohz: Prevent a timer interrupt storm in tick_nohz_stop=
_sched_tick()
>    f8da34e6aea2 ring-buffer: Do no reuse reader page if still in use
>    f56cc813891f ring-buffer: Mask out the info bits when returning buff=
er page length
>    99df0a6bd678 x86/cpu_entry_area: Prevent wraparound in setup_cpu_ent=
ry_area_ptes() on 32bit
>    dd6eac2b6f66 init: Invoke init_espfix_bsp() from mm_init()
>    fc78bbdec893 x86/cpu_entry_area: Move it out of the fixmap
>    b73f4c11bfb7 x86/cpu_entry_area: Move it to a separate unit
>    90383f5be7ac x86/mm: Create asm/invpcid.h
>    f7938aecc9e1 x86/mm: Put MMU to hardware ASID translation in one pla=
ce
>    21c7af3777f8 x86/mm: Remove hard-coded ASID limit checks
>    546fe7d48686 x86/mm: Move the CR3 construction functions to tlbflush=
=2Eh
>    029ed77f57b6 x86/mm: Add comments to clarify which TLB-flush functio=
ns are supposed to flush what
>    c786774ceccb x86/mm: Remove superfluous barriers
>    f0c8c4bd2347 x86/mm: Use __flush_tlb_one() for kernel memory
>    c1d18bf3f32b x86/microcode: Dont abuse the TLB-flush interface
>    cba3ab6a6841 x86/uv: Use the right TLB-flush API
>    8a7c2006beba x86/entry: Rename SYSENTER_stack to CPU_ENTRY_AREA_entr=
y_stack
>    d6a432d4d3a0 x86/doc: Remove obvious weirdnesses from the x86 MM lay=
out documentation
>    07e8a63c2c4f x86/mm/64: Improve the memory map documentation
>    1dddc45476c4 x86/ldt: Prevent LDT inheritance on exec
>    93439585326e x86/ldt: Rework locking
>    315b737482ac arch, mm: Allow arch_dup_mmap() to fail
>    3cd977c67053 x86/vsyscall/64: Warn and fail vsyscall emulation in NA=
TIVE mode
>    e5667337a507 x86/vsyscall/64: Explicitly set _PAGE_USER in the paget=
able hierarchy
>    4664833b9c38 x86/mm/dump_pagetables: Make the address hints correct =
and readable
>    9ed67a029dd7 x86/mm/dump_pagetables: Check PAGE_PRESENT for real
>    0f9f378903ae x86/Kconfig: Limit NR_CPUS on 32-bit to a sane amount
>    358a83a1de54 x86/cpufeatures: Make CPU bugs sticky
>    ae16a824dd62 x86/paravirt: Provide a way to check for hypervisors
>    93231925335a x86/paravirt: Dont patch flush_tlb_single
>    3e9cf8fb4db0 x86/entry/64: Make cpu_entry_area.tss read-only
>    47cb726a9600 x86/entry: Clean up the SYSENTER_stack code
>    ff29cda6c2f2 x86/entry/64: Remove the SYSENTER stack canary
>    33e8a0a90105 x86/entry/64: Move the IST stacks into struct cpu_entry=
_area
>    8aa71a5cdc32 x86/entry/64: Create a per-CPU SYSCALL entry trampoline=

>    077a04534cc4 x86/entry/64: Return to userspace from the trampoline s=
tack
>    698892158210 x86/entry/64: Use a per-CPU trampoline stack for IDT en=
tries
>    7df5dc38dc29 x86/espfix/64: Stop assuming that pt_regs is on the ent=
ry stack
>    7b6d319e2616 x86/entry/64: Separate cpu_current_top_of_stack from TS=
S.sp0
>    e75df8aedce8 x86/entry: Remap the TSS into the CPU entry area
>    0e0055bbeb2a x86/entry: Move SYSENTER_stack to the beginning of stru=
ct tss_struct
>    d9e17c57f62a x86/dumpstack: Handle stack overflow on all stacks
>    b6645c3c626e x86/entry: Fix assumptions that the HW TSS is at the be=
ginning of cpu_tss
>    99a47d22f1fa x86/kasan/64: Teach KASAN about the cpu_entry_area
>    0863f76db090 x86/mm/fixmap: Generalize the GDT fixmap mechanism, int=
roduce struct cpu_entry_area
>    3b825a015513 x86/entry/gdt: Put per-CPU GDT remaps in ascending orde=
r
>    8e905774d607 x86/dumpstack: Add get_stack_info() support for the SYS=
ENTER stack
>    ca02a72c9150 x86/entry/64: Allocate and enable the SYSENTER stack
>    4eec07ec7a5c x86/irq/64: Print the offending IP in the stack overflo=
w warning
>    a7b282cd43ba x86/irq: Remove an old outdated comment about context t=
racking races
>    d2408cf269d1 x86/entry/64/paravirt: Use paravirt-safe macro to acces=
s eflags
>    6a99c031df60 x86/mm/kasan: Don't use vmemmap_populate() to initializ=
e shadow
>    b3f96767d068 locking/barriers: Convert users of lockless_dereference=
() to READ_ONCE()
>    c1763d787577 locking/barriers: Add implicit smp_read_barrier_depends=
() to READ_ONCE()
>    756428416ce0 perf/x86: Enable free running PEBS for REGS_USER/INTR
>    2eecb0acd97a x86: Make X86_BUG_FXSAVE_LEAK detectable in CPUID on AM=
D
>    493513aefcc5 x86/cpufeature: Add User-Mode Instruction Prevention de=
finitions
>    019141d42ebe drivers/misc/intel/pti: Rename the header file to free =
up the namespace
>    871d6926064c x86/xen: Fix xen head ELF annotations
>    d20c9ba72b8f x86/boot: Annotate verify_cpu() as a callable function
>    d32d0f94a7ee x86/head: Fix head ELF function annotations
>    18f077dfae1c x86/head: Remove unused 'bad_address' code
>    d5d921a047b9 x86/head: Remove confusing comment
>    f6dd6567d09d kernel/signal.c: remove the no longer needed SIGNAL_UNK=
ILLABLE check in complete_signal()
>    cf2791ad9e53 kernel/signal.c: protect the SIGNAL_UNKILLABLE tasks fr=
om !sig_kernel_only() signals
>    2071cfd700f6 kernel/signal.c: protect the traced SIGNAL_UNKILLABLE t=
asks from SIGKILL
>    806424fd3065 kvm, mm: account kvm related kmem slabs to kmemcg
>    9575a6ffb4b7 x86/virt: Add enum for hypervisors to replace x86_hyper=

>    e8baad3e5158 x86/virt, x86/platform: Merge 'struct x86_hyper' into '=
struct x86_platform' and 'struct x86_init'
>    cb995fcf5ae2 x86/mm/64: Rename the register_page_bootmem_memmap() 's=
ize' parameter to 'nr_pages'
>    c94b6dded6eb x86/xen: Drop 5-level paging support code from the XEN_=
PV code
>    119347a0ef41 x86/xen: Provide pre-built page tables only for CONFIG_=
XEN_PV=3Dy and CONFIG_XEN_PVH=3Dy
>    199e4741c8b9 x86/kasan: Use the same shadow offset for 4- and 5-leve=
l paging
>    1c5ea732a936 mm/sparsemem: Allocate mem_section at runtime for CONFI=
G_SPARSEMEM_EXTREME=3Dy
>    8915a13ca5a4 mm, x86/mm: Fix performance regression in get_user_page=
s_fast()
>    66ea32e385a8 x86/insn-eval: Add a utility function to get register o=
ffsets
>    7ce86fc1e901 x86/insn-eval: Do not BUG on invalid register type
>    c958c84cf7c2 x86/mpx, x86/insn: Relocate insn util functions to a ne=
w insn-eval file
>    8d8f073eaa31 x86/mpx: Do not use SIB.base if its value is 101b and M=
odRM.mod =3D 0
>    ec1786527e7f x86/mpx: Do not use SIB.index if its value is 100b and =
ModRM.mod is not 11b
>    897aeabaf3c1 x86/mpx: Use signed variables to compute effective addr=
esses
>    bdc345828604 x86/mpx: Simplify handling of errors when computing lin=
ear addresses
>    d35dbe818a6a ptrace,x86: Make user_64bit_mode() available to 32-bit =
builds
>    ef02e49ac1a7 x86/boot: Relocate definition of the initial state of C=
R0
>    1542a015ace2 x86/mm: Relocate page fault error codes to traps.h
>    7edfe87940e2 selftests/x86/ldt_gdt: Run most existing LDT test cases=
 against the GDT as well
>    be33b76702d9 selftests/x86/ldt_gdt: Add infrastructure to test set_t=
hread_area()
>    738b110511ba selftests/x86/ldt_gdt: Robustify against set_thread_are=
a() and LAR oddities
>    1f9e12c2e81e x86/cpufeatures: Fix various details in the feature def=
initions
>    14fe162f996f x86/cpufeatures: Re-tabulate the X86_FEATURE definition=
s
>    be9780fb7a30 x86/build: Beautify build log of syscall headers
>    601a71aa8028 x86/mm: Define _PAGE_TABLE using _KERNPG_TABLE
>    6a9dda277c24 bitops: Revert cbe96375025e ("bitops: Add clear/set_bit=
32() to linux/bitops.h")
>    c3e13e28aa72 x86/cpuid: Replace set/clear_bit32()
>    a87fa3721441 x86/cpufeatures: Enable new SSE/AVX/AVX512 CPU features=

>    8bf58a744e9a x86/cpuid: Prevent out of bound access in do_clear_cpu_=
cap()
>    5dd037e50e83 x86/fpu: Remove the explicit clearing of XSAVE dependen=
t features
>    691bb62c5c87 x86/fpu: Make XSAVE check the base CPUID features befor=
e enabling
>    384a2d7af44d x86/fpu: Parse clearcpuid=3D as early XSAVE argument
>    36381d76b645 x86/cpuid: Add generic table for CPUID dependencies
>    50c6c061f4d6 bitops: Add clear/set_bit32() to linux/bitops.h
>    4ef351ff7bab x86/fpu/debug: Remove unused 'x86_fpu_state' and 'x86_f=
pu_deactivate_state' tracepoints
>    cc2b5786a84b x86/entry/64: Shorten TEST instructions
>    d26fc8d39309 x86/traps: Use a new on_thread_stack() helper to clean =
up an assertion
>    f475d79e9115 x86/entry/64: Remove thread_struct::sp0
>    ee2f1a81b613 x86/entry/32: Fix cpu_current_top_of_stack initializati=
on at boot
>    a69652f6e628 x86/entry/64: Remove all remaining direct thread_struct=
::sp0 reads
>    f7945199711d x86/entry/64: Stop initializing TSS.sp0 at boot
>    3476ab68a9bf x86/xen/64, x86/entry/64: Clean up SP code in cpu_initi=
alize_context()
>    c2e6ce4b2921 x86/entry: Add task_top_of_stack() to find the top of a=
 task's stack
>    45c4053bf8d4 x86/entry/64: Pass SP0 directly to load_sp0()
>    1acf96028d04 x86/entry/32: Pull the MSR_IA32_SYSENTER_CS update code=
 out of native_load_sp0()
>    ab80fe6f16d3 x86/entry/64: De-Xen-ify our NMI code
>    d067fb259523 xen, x86/entry/64: Add xen NMI trap entry
>    13ead6fcd2ab x86/entry/64: Remove the RESTORE_..._REGS infrastructur=
e
>    6793d49993e4 x86/entry/64: Use POP instead of MOV to restore regs on=
 NMI return
>    ba46462c7964 x86/entry/64: Merge the fast and slow SYSRET paths
>    905d20dd5054 x86/entry/64: Use pop instead of movq in syscall_return=
_via_sysret
>    99bc33079304 x86/entry/64: Shrink paranoid_exit_restore and make lab=
els local
>    3c16e0932979 x86/entry/64: Simplify reg restore code in the standard=
 IRET paths
>    4fc1d8b76f21 x86/entry/64: Move SWAPGS into the common IRET-to-userm=
ode path
>    f32123527bed x86/entry/64: Split the IRET-to-user and IRET-to-kernel=
 paths
>    3b475309f976 x86/entry/64: Remove the restore_c_regs_and_iret label
>    f3bd88849f88 x86/asm: Don't use the confusing '.ifeq' directive
>    d36e0d395ca2 x86/entry: Use SYSCALL_DEFINE() macros for sys_modify_l=
dt()
>    ca024e7d1862 x86/asm: Remove unnecessary \n\t in front of CC_SET() f=
rom asm templates
>    dcc5f2f8c5db x86/mm/64: Remove the last VM_BUG_ON() from the TLB cod=
e
>    c01d65a2df94 x86/mm: Flush more aggressively in lazy TLB mode
>    71570531a921 x86/mm/32: Load a sane CR3 before cpu_init() on seconda=
ry CPUs
>    7896047cb4de x86/mm/32: Move setup_clear_cpu_cap(X86_FEATURE_PCID) e=
arlier
>    557c6cb2e892 x86/mm/64: Stop using CR3.PCID =3D=3D 0 in ASID-aware c=
ode
>    bdf06611e863 x86/mm: Factor out CR3-building code
>    28dfb0cf1cd6 x86/mm/64: Initialize CR4.PCIDE early
>    c45360a1779f x86/mm: Get rid of VM_BUG_ON in switch_tlb_irqs_off()
>    50522881fb0b x86/mm: Document how CR4.PCIDE restore works
>    d8fa770e4331 x86/mm: Reinitialize TLB state on hotplug and resume
>    223590ce02fa x86/xen: Get rid of paravirt op adjust_exception_frame
>    9148019af215 x86/mm, mm/hwpoison: Clear PRESENT bit for kernel 1:1 m=
appings of poison pages
>    93753465c1fb x86/mm/dump_pagetables: Speed up page tables dump for C=
ONFIG_KASAN=3Dy
>    866ec7bd5055 x86/mm: Implement PCID based optimization: try to prese=
rve old TLB entries using PCID
>    0ca4a0dcd2b1 x86/mpx: Do not allow MPX if we have mappings above 47-=
bit
>    69fa7265508d x86/mm/dump_pagetables: Fix printout of p4d level
>    172774bfa3ef x86/boot: Add early cmdline parsing for options with ar=
guments
>    47c915550f9e x86/mm: Enable CR4.PCIDE on supported systems
>    4bda31395beb x86/mm: Add the 'nopcid' boot option to turn off PCID
>    ae3c78546a4d x86/mm: Disable PCID on 32-bit kernels
>    a506eb1a28ee x86/mm: Stop calling leave_mm() in idle code
>    8d640d568fc8 x86/mm: Rework lazy TLB mode and TLB freshness tracking=

>    6856a6907443 x86/mm: Track the TLB's tlb_gen and update the flushing=
 algorithm
>    75309cc8a392 x86/mm: Give each mm TLB flush generation a unique ID
>    90d8521ed090 x86/xen/64: Rearrange the SYSCALL entries
>    cd77afb4a51a x86/asm: Add suffix macro for GEN_*_RMWcc()
>    5d4c36800831 x86/entry/64: Refactor IRQ stacks and make them NMI-saf=
e
>    9b1ff5eeadc1 irq: Make the irqentry text section unconditional
>    2df8e4dd8ad5 x86: provide an init_mem_mapping hypervisor hook
>    03a415bbc469 x86/kasan: don't allocate extra shadow memory
>    e5881507ab4b x86/mm: Delete a big outdated comment about TLB flushin=
g
>    2612885620dc x86/mm: Don't reenter flush_tlb_func_common()
>    8c33de3d1431 x86/mm: Remove reset_lazy_tlbstate()
>    22e8e068200a x86/ldt: Simplify the LDT switching logic
>    306b70104b69 x86/boot/64: Put __startup_64() into .head.text
>    6785f222adc3 x86/mm: Add support for 5-level paging for KASLR
>    3591558ac071 x86/mm: Make kernel_physical_mapping_init() support 5-l=
evel paging
>    e93998d5a995 x86/mm: Add sync_global_pgds() for configuration with 5=
-level paging
>    8d08f0f9511a x86/boot/64: Add support of additional page table level=
 during early boot
>    08ef52fc8c27 x86/boot/64: Rename init_level4_pgt and early_level4_pg=
t
>    8e3d8cc05bab x86/boot/64: Rewrite startup_64() in C
>    40029728da7c x86/boot/compressed: Enable 5-level paging during decom=
pression stage
>    9f9cc4499abe x86/boot/efi: Define __KERNEL32_CS GDT on 64-bit config=
urations
>    f56c74bc479b x86/asm: Fix comment in return_from_SYSCALL_64()
>    37edb519e13e x86/mm: Split read_cr3() into read_cr3_pa() and __read_=
cr3()
>    ae39e66a6c22 x86/ldt: Rename ldt_struct::size to ::nr_entries
>    8e9fceb46493 mm/vmstat: Make NR_TLB_REMOTE_FLUSH_RECEIVED available =
even on UP
>    73c1f133b39a x86/mm, KVM: Teach KVM's VMX code that CR3 isn't a cons=
tant
>    6652b39ab9a7 x86/mm: Be more consistent wrt PAGE_SHIFT vs PAGE_SIZE =
in tlb flush code
>    5f8577a5dfcb x86/mm: Rework lazy TLB to track the actual loaded mm
>    0444036bd674 x86/mm: Remove the UP asm/tlbflush.h code, always use t=
he (formerly) SMP code
>    a8c7f8a7a0b3 x86/mm: Use new merged flush logic in arch_tlbbatch_flu=
sh()
>    d47f84368847 x86/mm: Refactor flush_tlb_mm_range() to merge local an=
d remote cases
>    5a32e49af880 x86/mm: Change the leave_mm() condition for local TLB f=
lushes
>    c2c97859bbc5 x86/mm: Pass flush_tlb_info to flush_tlb_others() etc
>    30210c7c83b5 mm, x86/mm: Make the batched unmap TLB flush API more g=
eneric
>    a56dacbe25a0 x86/mm: Reduce indentation in flush_tlb_func()
>    4e69fbba04b0 x86/mm: Reimplement flush_tlb_page() using flush_tlb_mm=
_range()
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----=
------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/re=
cipes-kernel/linux/linux-yocto-rt_4.12.bb
> index 51de1e29d1c7..a471d1abea98 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/ker=
nel to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "f095b0588b491bb81854fbc168479cf5ff8a03ff"
> -SRCREV_meta ?=3D "44a22d45cbcd7e14ea635d36949e14135f540fe0"
> +SRCREV_machine ?=3D "8bade20d734f0b5e6ed13414b96cecaabe0c8039"
> +SRCREV_meta ?=3D "19d815d5a34bfaad95d87cc097cef18b594daac8"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=3D=
${KBRANCH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-4.12;destsuffix=3D${KMETA}"
> =20
> -LINUX_VERSION ?=3D "4.12.19"
> +LINUX_VERSION ?=3D "4.12.20"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/=
recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> index c516d5de69af..f5e906291925 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE =3D "--allnoconfig"
> =20
>  require recipes-kernel/linux/linux-yocto.inc
> =20
> -LINUX_VERSION ?=3D "4.12.19"
> +LINUX_VERSION ?=3D "4.12.20"
> =20
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
> -SRCREV_machine ?=3D "257f843ea367744620f1d92910afd2f454e31483"
> -SRCREV_meta ?=3D "44a22d45cbcd7e14ea635d36949e14135f540fe0"
> +SRCREV_machine ?=3D "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"
> +SRCREV_meta ?=3D "19d815d5a34bfaad95d87cc097cef18b594daac8"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recip=
es-kernel/linux/linux-yocto_4.12.bb
> index d7b6e2750d50..d44eb75f71b5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?=3D "standard/base"
>  KBRANCH_qemux86-64 ?=3D "standard/base"
>  KBRANCH_qemumips64 ?=3D "standard/mti-malta64"
> =20
> -SRCREV_machine_qemuarm ?=3D "dafca619b2bd44966042bba76aa00edb0ca002df"=

> -SRCREV_machine_qemuarm64 ?=3D "257f843ea367744620f1d92910afd2f454e3148=
3"
> -SRCREV_machine_qemumips ?=3D "99c30bfd13f4cc364e55b67138705976bab193c9=
"
> -SRCREV_machine_qemuppc ?=3D "257f843ea367744620f1d92910afd2f454e31483"=

> -SRCREV_machine_qemux86 ?=3D "257f843ea367744620f1d92910afd2f454e31483"=

> -SRCREV_machine_qemux86-64 ?=3D "257f843ea367744620f1d92910afd2f454e314=
83"
> -SRCREV_machine_qemumips64 ?=3D "135d85c1f8cded6b68d533a0018b2897230b88=
0c"
> -SRCREV_machine ?=3D "257f843ea367744620f1d92910afd2f454e31483"
> -SRCREV_meta ?=3D "44a22d45cbcd7e14ea635d36949e14135f540fe0"
> +SRCREV_machine_qemuarm ?=3D "9728502c1fc96a1348ff06e1be8df75bee168032"=

> +SRCREV_machine_qemuarm64 ?=3D "4b7a5c1b4ec5536806942340755bcfbf6f3584d=
9"
> +SRCREV_machine_qemumips ?=3D "b04e654320e56fa42e477698dbf61d99f0bb4501=
"
> +SRCREV_machine_qemuppc ?=3D "4b7a5c1b4ec5536806942340755bcfbf6f3584d9"=

> +SRCREV_machine_qemux86 ?=3D "1c4ad569af3e23a77994235435040e322908687f"=

> +SRCREV_machine_qemux86-64 ?=3D "1c4ad569af3e23a77994235435040e32290868=
7f"
> +SRCREV_machine_qemumips64 ?=3D "7a297c3848d02c46acd40e3d2f285c7905f813=
4c"
> +SRCREV_machine ?=3D "1c4ad569af3e23a77994235435040e322908687f"
> +SRCREV_meta ?=3D "19d815d5a34bfaad95d87cc097cef18b594daac8"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.12.git;name=3Dma=
chine;branch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-4.12;destsuffix=3D${KMETA}"
> =20
> -LINUX_VERSION ?=3D "4.12.19"
> +LINUX_VERSION ?=3D "4.12.20"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20



