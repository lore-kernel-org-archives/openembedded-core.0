Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	by mail.openembedded.org (Postfix) with ESMTP id EEA4A78915
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=44129; q=dns/txt;
	s=iport; t=1521440769; x=1522650369;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=sQF2zHvQt4GzJDbuTjVy6JT15L1C+7oVY2xeTQIpwhM=;
	b=VIk6DFVFu5y0R0ZGsUbPL+0m6sAqUDeLhOVUUVv6N/bj2eFru9EkiJ5l
	Dyciv5J9nTWpZbpy+scV0twI/u98HDaqKyFJWOJGxqlx+kP2MPUzSQwKr
	qIotMtMWZog79hJ9zdvbmZttHLz/LfkQf7vKgMRiBaCP76dmZQykRephG Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DXAAAQV69a/5RdJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNQZnIojXdyjQeBWil7G5QAghILG4R1AoM6ITQYAQIBAQE?=
	=?us-ascii?q?BAQECayiFJQEBAQMBGgEMRA4FCwsRAwECL08IBhOFEAiqVzqIVYIOhTOCFYM?=
	=?us-ascii?q?pNII5M4UmhUkDh0EfhFZwixAJiGyIEoN8h2SKQYVNAgQLAhMBgSoeOIFSTSM?=
	=?us-ascii?q?VOoJDCYIpG44+IDSQQwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,329,1517875200"; d="scan'208";a="372449881"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 06:26:07 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w2J6Q6sT026701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 19 Mar 2018 06:26:07 GMT
Date: Sun, 18 Mar 2018 23:26:06 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
In-Reply-To: <87a7v4kj5g.fsf@linaro.org>
Message-ID: <alpine.LRH.2.00.1803181801370.18105@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
	<alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
	<CAFEAcA-d6-_tVRWKbZpVsQtece4fjuUqF+o+-m-AG4jPUHPY4g@mail.gmail.com>
	<alpine.LRH.2.00.1803111848530.64087@sjc-ads-6991.cisco.com>
	<alpine.LRH.2.00.1803171544580.27691@sjc-ads-6991.cisco.com>
	<87a7v4kj5g.fsf@linaro.org>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Mon, 19 Mar 2018 06:26:08 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-1690950369-1521421806=:18105"
Content-ID: <alpine.LRH.2.00.1803181820510.18105@sjc-ads-6991.cisco.com>

--504000474-1690950369-1521421806=:18105
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1803181820511.18105@sjc-ads-6991.cisco.com>



On Sun, 18 Mar 2018, Alex Bennée wrote:

>
> Victor Kamensky <kamensky@cisco.com> writes:
>
>> Hi Folks,
>>
>> I am back from ELC and I am looking at this issue again.
>>
>> Alex Bennée from Linaro QEMU team reported that he tried to
>> reproduce the issue, even he went and build the same OE images -
>> but he could not reproduce it. Alex, thank you for the effort.
>>
>> So since it is reprodicible on my machine I kept digging
>> myself. In no way I am qemu expert, but I think now I
>> understand what is happening. Long story with my debug notes
>> is below, but here is executive summery:
>>
>> Linux kernel loop waiting for jiffies to move on, while
>> calling yield instruction, in our case aarch64 target runs
>> under one CPU configuration, and after Alex's commit "c22edfe
>> target-arm: don't generate WFE/YIELD calls for MTTCG" qemu
>> logic of handling yield instruction changed in such way
>> that it is treated as simple nop. But since it is single CPU
>> configuration, we have qemu looping in generated code
>> forver without existing loop to process pending vtimer
>> interrupt in order to move jiffies forward. c22edfe implies
>> that it is not parallel CPU case, but in our case even if
>> we have single CPU target parallel execution is still turned
>> on.
>
> Hmm well my gut guess was right but I'm not sure how it is hanging.
>
> First of all could you confirm it hangs/works with the invocation:
>
>  --accel tcg,thread=single -smp 2

'--accel tcg,thread=single -smp 2' works fine. '--accel tcg,thread=single'
works fine too.

> The parallel_cpus variable only refers to the fact MTTCG is enabled or
> not. You can still model -smp > 1 systems without MTTCG but in this case
> each vCPU will be run round-robin style from a single thread.
>
> What is troubling is you are not seeing the timer IRQ fire. The whole
> point of the cpu_loop_exit(cs) is to ensure we start again on the next
> vCPU. Every time we enter a new block we check to see if an IRQ has
> fired and then process it then.

Thank you for guidance. Now I see icount_decr.u16.high check
in start of every generated block. Setting icount_decr.u16.high to -1,
does drop target out of loop, but now I think that the code that acts
on it, cpu_handle_interrupt function, clears icount_decr.u16.high,
but it cannot really serve the interrupt because it is disabled by
target, as result code comes back with interupt_request set, and
icount_decr.u16.high cleared, and resume blocks execution which
hangs in sequence we discussed. But as before I could be missing
something again.

Please see more details and new gdb session log in line.

>> Revert of c22edfe fixes the issue, image boots OK. Booting
>> with more than one CPU "-smp 2" boots fine too. And possibly
>> could work as solid workaround for us. But how to fix the
>> issue without revert, while moving forward, I don't know.
>> I hope Alex and Linaro QEMU folks can come up with something.
>>
>> Now, long debugging notes with my comments:
>>
>> Kernel Hang Backtrace
>> ---------------------
>>
>> Looking at kernel hang under gdb attached to qemu (runqemu
>> qemuparams="-s -S" bootparams="nokaslr"):
>>
>> (gdb) bt
>> #0  vectors () at /usr/src/kernel/arch/arm64/kernel/entry.S:413
>> #1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
>> #2  raid6_select_algo () at /usr/src/kernel/lib/raid6/algos.c:253
>> #3  0xffffff8008083bdc in do_one_initcall (fn=0xffffff80089a35c8 <raid6_select_algo>) at /usr/src/kernel/init/main.c:832
>> #4  0xffffff8008970e80 in do_initcall_level (level=<optimized out>) at /usr/src/kernel/init/main.c:898
>> #5  do_initcalls () at /usr/src/kernel/init/main.c:906
>> #6  do_basic_setup () at /usr/src/kernel/init/main.c:924
>> #7  kernel_init_freeable () at /usr/src/kernel/init/main.c:1073
>> #8  0xffffff80087afd90 in kernel_init (unused=<optimized out>) at /usr/src/kernel/init/main.c:999
>> #9  0xffffff800808517c in ret_from_fork () at /usr/src/kernel/arch/arm64/kernel/entry.S:1154
>> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>> (gdb) f 1
>> #1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
>> 190					continue;
>> (gdb) x /12i $pc - 12
>>    0xffffff80089a374c <raid6_select_algo+388>:	cbz	x0, 0xffffff80089a37fc <raid6_select_algo+564>
>>    0xffffff80089a3750 <raid6_select_algo+392>:	mov	w0, #0x1                   	// #1
>>    0xffffff80089a3754 <raid6_select_algo+396>:	bl	0xffffff80080d07c8 <preempt_count_add>
>> => 0xffffff80089a3758 <raid6_select_algo+400>:	ldr	x0, [x23, #2688]
>>    0xffffff80089a375c <raid6_select_algo+404>:	ldr	x5, [x23, #2688]
>>    0xffffff80089a3760 <raid6_select_algo+408>:	cmp	x0, x5
>>    0xffffff80089a3764 <raid6_select_algo+412>:	b.ne	0xffffff80089a3770 <raid6_select_algo+424>  // b.any
>>    0xffffff80089a3768 <raid6_select_algo+416>:	yield
>>    0xffffff80089a376c <raid6_select_algo+420>:	b	0xffffff80089a375c <raid6_select_algo+404>
>>    0xffffff80089a3770 <raid6_select_algo+424>:	mov	x25, #0x0                   	// #0
>>    0xffffff80089a3774 <raid6_select_algo+428>:	ldr	x0, [x23, #2688]
>>    0xffffff80089a3778 <raid6_select_algo+432>:	mov	x4, x27
>>
>> Corresponsing Source
>> --------------------
>>
>> (gdb) b *0xffffff80089a3758
>> Breakpoint 1 at 0xffffff80089a3758: file /usr/src/kernel/lib/raid6/algos.c, line 191.
>>
>> This corresponds to this code in lib/raid6/algos.c
>>
>>    190                          preempt_disable();
>>    191                          j0 = jiffies;
>>    192                          while ((j1 = jiffies) == j0)
>>    193                                  cpu_relax();
>>    194                          while (time_before(jiffies,
>>    195                                              j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
>>    196                                  (*algo)->xor_syndrome(disks, start, stop,
>>    197                                                        PAGE_SIZE, *dptrs);
>>    198                                  perf++;
>>    199                          }
>>    200                          preempt_enable();
>>
>> I.e code grabs jiffies and then loops and checks whether jiffies moved
>> forward; it calls cpu_relax(), which translated to yield instruction on
>> aarch64.
>>
>> Yield Instruction Opcode
>> ------------------------
>>
>> (gdb) x /1wx 0xffffff80089a3768
>> 0xffffff80089a3768 <raid6_select_algo+416>:	0xd503203f
>> (gdb) x /1i 0xffffff80089a3768
>>    0xffffff80089a3768 <raid6_select_algo+416>:	yield
>>
>>
>> Backtrace in QEMU
>> -----------------
>>
>> After kernel hangs attached gdb to qemu, see that thread that
>> corresponds to target CPU stuck while repeatedly executing loop
>> that spans couple ranges in code_gen_buffer buffers. If I put
>> breakpoint in cpu_tb_exec right after control passed to generated
>> snippets, it never gets there. I.e qemu stack in infinite loop.
>>
>> (gdb) bt
>> #0  0x00007fffeca53827 in code_gen_buffer ()
>> #1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
>> #2  0x000000000048bd82 in cpu_loop_exec_tb (cpu=0x18c0190,
>> tb=0x7fffec95ed00 <code_gen_buffer+9755862>, last_tb=0x7fffec00faf8,
>> tb_exit=0x7fffec00faf0)
>
> At this point we have selected the next TB to run at so tb->pc should be
> where we are executing next. However we do chain TB's together so you
> can execute several TB's before coming back out. This can be disabled
> with -d nochain which will ensure we (slowly) exit to the outer run loop

If I just add '-d nochain' it boots fine.

> for every block we run.
>
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:627
>> #3  0x000000000048c091 in cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:736
>> #4  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
>> #5  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
>> #6  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
>> #7  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
>>
>> Dumping cpu and env state in QEMU
>> ---------------------------------
>>
>> Looking at cpu data structure one can see that there is
>> pending interrupt request 'interrupt_request = 2'
>>
>> (gdb) f 1
>> #1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
>> 167	    ret = tcg_qemu_tb_exec(env, tb_ptr);
>>
>> (gdb) p *cpu
>> $3 = {
>>   ...
>>   nr_cores = 1,
>>   nr_threads = 1,
>>   ...
>>   interrupt_request = 2,
>
> That is CPU_INTERRUPT_HARD which implies there is an IRQ pending. This
> should be enough to cause:
>
>  if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
>
> to handle the setup for servicing the IRQ (-d int should show this).
>
>>    ...
>>
>> Note 'pc' points in evn to the same instructions as we saw in gdb
>> with vmlinux session
>>
>> (gdb) p /x *env
>> $5 = {
>>   regs = {0x0 <repeats 16 times>},
>>   xregs = {0xfffedbcb, 0xffffff80087b6610, 0xffffffffffffffff, 0x0, 0x0, 0xfffedbcb, 0x54, 0x3436746e69203a36, 0x286e656720203278, 0xffffffd0, 0xffffff800800b940,
>>     0x5f5e0ff, 0xffffff8008a45000, 0xffffff8008b091c5, 0xffffff8088b091b7, 0xffffffffffffffff, 0xffffffc01ea57000, 0xffffff800800bd38, 0x10, 0xffffff8008824228,
>>     0xffffff8008811c98, 0x557, 0x5ab, 0xffffff8008a26000, 0xffffffc01ea56000, 0x5ab, 0xffffff80088fd690, 0xffffff800800bcc0, 0xffffff8008a26000, 0xffffff800800bc50,
>>     0xffffff80089a3758, 0xffffff800800bc50},
>>   pc = 0xffffff80089a3758,
>>   pstate = 0x5,
>>   aarch64 = 0x1,
>>   uncached_cpsr = 0x13,
>>
>> ARMGenericTimer sate that corresponds to Vtimer has ctl=5
>>
>> (gdb) p /x env->cp15.c14_timer[1]
>> $6 = {
>>   cval = 0xb601fb1,
>>   ctl = 0x5
>> }
>>
>> QEMU timer that handles vtimer is disarmed (ie pending interupt is already
>> set):
>>
>> (gdb) p *((struct ARMCPU *) cpu)->gt_timer[1]
>> $8 = {
>>   expire_time = 9223372036854775792,
>>   timer_list = 0x187fd00,
>>   cb = 0x5cf886 <arm_gt_vtimer_cb>,
>>   opaque = 0x18c0190,
>>   next = 0x0,
>>   scale = 16
>> }
>>
>> I.e what we have here qemu TCG code inifinitely loops executing
>> loop
>>
>>    192                          while ((j1 = jiffies) == j0)
>>    193                                  cpu_relax();
>>
>> in raid6_choose_gen function, but vtimer interrupt that is supposed
>> to move jiffies forward is pending and QEMU is not acting on it.
>>
>> Looking at 'int cpu_exec(CPUState *cpu)' it looks like interrupt and
>> exception handling is performed in the loop, but to do so it should
>> exit first from cpu_loop_exec_tb. I am still puzzled how it is
>> supposed to work if above kernel code instead of cpu_relax() (yield)
>> would just has nop instructions. But for now let's focus why QEMU
>> executing of 'yield' instruction does not bring control out of
>> cpu_loop_exec_tb and let QEMU to execute jump to pending interrupts.
>>
>>
>> yield instruction decoding in translate-a64.c handle_hint function
>> ------------------------------------------------------------------
>>
>> Let's put breakpoint in qemu under gdb session inside of handle_hint
>> function. We have the following function:
>>
>> /* HINT instruction group, including various allocated HINTs */
>> static void handle_hint(DisasContext *s, uint32_t insn,
>>                         unsigned int op1, unsigned int op2, unsigned int crm)
>> {
>>     unsigned int selector = crm << 3 | op2;
>>
>> <snip>
>>
>>     switch (selector) {
>>
>> <snip>
>>
>>     case 1: /* YIELD */
>>         if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>>             s->base.is_jmp = DISAS_YIELD;
>>         }
>>         return;
>>
>>
>> Thread 3 "qemu-system-aar" hit Breakpoint 1, handle_hint (s=0x7fffec00f880, insn=3573751871, op1=3, op2=1, crm=0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/translate-a64.c:1345
>> 1345	        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> (gdb) p /x insn
>> $12 = 0xd503203f
>> (gdb) p /x s->base.tb.cflags
>> $5 = 0x80000
>>
>> in s->base.tb.cflags CF_PARALLEL is set (but we are running
>> single CPU mode)
>>
>> #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
>>
>> gdb) n
>> [Thread 0x7fffeb5ff700 (LWP 13452) exited]
>> 1348	        return;
>> (gdb) p s->base.is_jmp
>> $14 = DISAS_NEXT
>> (gdb)
>>
>> I.e QEMU will execute yield instruction in our case as just regular
>> nop, that seems to explain why in qemu control never goes out of
>> cpu_loop_exec_tb.
>
> It should exit once the IRQ is raised. We check
> cpu->icount_decr.u16.high on entry to every block. So even a NOP will
> fall through and eventually pick up the IRQ on the start of the next
> block.

Thank you. Your explanation of cpu->icount_decr.u16.high role let me
dig further. I do see now each tc generated block does check 
cpu->icount_decr.u16.high.

Here is what I found more:

Execution of below sequence is triggered close to hang place.

Debugger for each breakpoint executes
    bt, p cpu->interrupt_request, env->daif, cont

I have following stop points
    watchpoint 7 for cpu->icount_decr.u16.high
    breakpoint 10 for arm_cpu_exec_interrupt
    breakpoint 9 for arm_cpu_do_interrupt

Below sequence we can see two variation events progression, normally
it is 1), 2), 3), 4). But in case of hang 4) is never reached.

1) qemu_cpu_kick through cpu_exit sets cpu->icount_decr.u16.high to -1

2) cpu_handle_interrupt sets cpu->icount_decr.u16.high to 0

3) cpu_handle_interrupt checks cpu->interrupt_request and if set
calls arm_cpu_exec_interrupt

4) arm_cpu_exec_interrupt checks whether interrupts on target are
enabled and if so it calls arm_cpu_do_interrupt. In case of hang
is never reached.

When I look at state of hanged execution I see that
cpu->interrupt_request=2 and cpu->icount_decr.u16.high=0

So I think we have a logic problem here: icount_decr.u16.high was
cleared at 2) but interrupt cannot be really served since it is
disabled by target, so any subsequent tc block execution does not
return to main loop, and hangs ... I've tried to look around,
but could not find yet and running out of time today, maybe it is
already there or worth to have logic of handling instructions that
reenable interupts to check whether cpu->interrupt_request is on,
so it can set cpu->icount_decr.u16.high to -1 to reenable target
drop out of main loop.

As before I could be missing something else, so further guidance
is appreicated.

Gdb session log (note it runs with '-d int')

Thread 1 "qemu-system-aar" hit Hardware watchpoint 7: $90->icount_decr.u16.high

Old value = 0
New value = 65535
cpu_exit (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/cpu.c:149
149	}
1: x/i $pc
=> 0x8811d1 <cpu_exit+43>:	nop
#0  cpu_exit (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/cpu.c:149
#1  0x000000000044b09a in qemu_cpu_kick (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1547
#2  0x0000000000476fc0 in tcg_handle_interrupt (cpu=0x18c0180, mask=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/tcg-all.c:52
#3  0x00000000005e3b9f in cpu_interrupt (cpu=0x18c0180, mask=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/include/qom/cpu.h:857
#4  0x00000000005e511a in arm_cpu_set_irq (opaque=0x18c0180, irq=0, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:418
#5  0x00000000006da4bd in qemu_set_irq (irq=0x18df0e0, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/irq.c:45
#6  0x0000000000744493 in gic_update (s=0x1949e90) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/intc/arm_gic.c:133
#7  0x000000000074493f in gic_set_irq (opaque=0x1949e90, irq=27, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/intc/arm_gic.c:217
#8  0x00000000006da4bd in qemu_set_irq (irq=0x1975b80, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/irq.c:45
#9  0x00000000005cf031 in gt_recalc_timer (cpu=0x18c0180, timeridx=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:1679
#10 0x00000000005cf8ab in arm_gt_vtimer_cb (opaque=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:1911
#11 0x00000000009d7472 in timerlist_run_timers (timer_list=0x187fd00) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:536
#12 0x00000000009d74be in qemu_clock_run_timers (type=QEMU_CLOCK_VIRTUAL) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:547
#13 0x00000000009d7870 in qemu_clock_run_all_timers () at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:662
#14 0x00000000009d8011 in main_loop_wait (nonblocking=0) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/main-loop.c:521
#15 0x00000000006365e0 in main_loop () at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:1995
#16 0x000000000063e408 in main (argc=26, argv=0x7fffffffdb78, envp=0x7fffffffdc50) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:4911
$33235 = 2
$33236 = 0
[Switching to Thread 0x7fffec010700 (LWP 21370)]

Thread 3 "qemu-system-aar" hit Hardware watchpoint 7: $90->icount_decr.u16.high

Old value = 65535
New value = 0
cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:535
535	    if (unlikely(insns_left < 0)) {
1: x/i $pc
=> 0x48bafc <cpu_handle_interrupt+99>:	mov    -0xc(%rbp),%eax
#0  cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:535
#1  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#2  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#3  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#4  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#5  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33237 = 2
$33238 = 0

Thread 3 "qemu-system-aar" hit Breakpoint 10, arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
320	    CPUClass *cc = CPU_GET_CLASS(cs);
1: x/i $pc
=> 0x5e4d91 <arm_cpu_exec_interrupt+15>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
#1  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#2  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#3  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#4  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#5  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#6  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33239 = 2
$33240 = 0

Thread 3 "qemu-system-aar" hit Breakpoint 9, arm_cpu_do_interrupt (cs=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:7795
7795	    ARMCPU *cpu = ARM_CPU(cs);
1: x/i $pc
=> 0x5da0fc <arm_cpu_do_interrupt+12>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_do_interrupt (cs=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:7795
#1  0x00000000005e4ed8 in arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:344
#2  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#3  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#4  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#5  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#6  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#7  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33241 = 2
$33242 = 0
Taking exception 5 [IRQ]
...from EL1 to EL1
...with ESR 0x25/0x96000005
...with ELR 0xffffff80084f7404
...to EL1 PC 0xffffff8008082280 PSTATE 0x3c5

Thread 3 "qemu-system-aar" hit Breakpoint 10, arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
320	    CPUClass *cc = CPU_GET_CLASS(cs);
1: x/i $pc
=> 0x5e4d91 <arm_cpu_exec_interrupt+15>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
#1  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#2  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#3  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#4  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#5  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#6  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33243 = 2
$33244 = 960

Thread 3 "qemu-system-aar" hit Breakpoint 10, arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
320	    CPUClass *cc = CPU_GET_CLASS(cs);
1: x/i $pc
=> 0x5e4d91 <arm_cpu_exec_interrupt+15>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
#1  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#2  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#3  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#4  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#5  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#6  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33245 = 2
$33246 = 128
Exception return from AArch64 EL1 to AArch64 EL1 PC 0xffffff80084f7404
[Switching to Thread 0x7ffff7fc4ac0 (LWP 21367)]

Thread 1 "qemu-system-aar" hit Hardware watchpoint 7: $90->icount_decr.u16.high

Old value = 0
New value = 65535
cpu_exit (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/cpu.c:149
149	}
1: x/i $pc
=> 0x8811d1 <cpu_exit+43>:	nop
#0  cpu_exit (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/cpu.c:149
#1  0x000000000044b09a in qemu_cpu_kick (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1547
#2  0x0000000000476fc0 in tcg_handle_interrupt (cpu=0x18c0180, mask=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/tcg-all.c:52
#3  0x00000000005e3b9f in cpu_interrupt (cpu=0x18c0180, mask=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/include/qom/cpu.h:857
#4  0x00000000005e511a in arm_cpu_set_irq (opaque=0x18c0180, irq=0, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:418
#5  0x00000000006da4bd in qemu_set_irq (irq=0x18df0e0, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/irq.c:45
#6  0x0000000000744493 in gic_update (s=0x1949e90) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/intc/arm_gic.c:133
#7  0x000000000074493f in gic_set_irq (opaque=0x1949e90, irq=27, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/intc/arm_gic.c:217
#8  0x00000000006da4bd in qemu_set_irq (irq=0x1975b80, level=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/irq.c:45
#9  0x00000000005cf031 in gt_recalc_timer (cpu=0x18c0180, timeridx=1) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:1679
#10 0x00000000005cf8ab in arm_gt_vtimer_cb (opaque=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:1911
#11 0x00000000009d7472 in timerlist_run_timers (timer_list=0x187fd00) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:536
#12 0x00000000009d74be in qemu_clock_run_timers (type=QEMU_CLOCK_VIRTUAL) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:547
#13 0x00000000009d7870 in qemu_clock_run_all_timers () at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/qemu-timer.c:662
#14 0x00000000009d8011 in main_loop_wait (nonblocking=0) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/util/main-loop.c:521
#15 0x00000000006365e0 in main_loop () at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:1995
#16 0x000000000063e408 in main (argc=26, argv=0x7fffffffdb78, envp=0x7fffffffdc50) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:4911
$33247 = 2
$33248 = 128
[Switching to Thread 0x7fffec010700 (LWP 21370)]

Thread 3 "qemu-system-aar" hit Hardware watchpoint 7: $90->icount_decr.u16.high

Old value = 65535
New value = 0
cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:535
535	    if (unlikely(insns_left < 0)) {
1: x/i $pc
=> 0x48bafc <cpu_handle_interrupt+99>:	mov    -0xc(%rbp),%eax
#0  cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:535
#1  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#2  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#3  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#4  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#5  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33249 = 2
$33250 = 128

Thread 3 "qemu-system-aar" hit Breakpoint 10, arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
320	    CPUClass *cc = CPU_GET_CLASS(cs);
1: x/i $pc
=> 0x5e4d91 <arm_cpu_exec_interrupt+15>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
#1  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#2  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#3  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#4  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#5  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#6  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33251 = 2
$33252 = 128

Thread 3 "qemu-system-aar" hit Breakpoint 10, arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
320	    CPUClass *cc = CPU_GET_CLASS(cs);
1: x/i $pc
=> 0x5e4d91 <arm_cpu_exec_interrupt+15>:	mov    -0x28(%rbp),%rax
#0  arm_cpu_exec_interrupt (cs=0x18c0180, interrupt_request=2) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:320
#1  0x000000000048bc51 in cpu_handle_interrupt (cpu=0x18c0180, last_tb=0x7fffec00faf8)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:590
#2  0x000000000048c0b7 in cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:720
#3  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#4  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0180) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#5  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#6  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$33253 = 2
$33254 = 128

Thanks,
Victor

>>
>> runqemu qemuparams="-smp 2" - boots fine, so booting with
>> "-smp 2" looks as reasonable workaround
>>
>> Experimental fix
>> ----------------
>>
>> If I apply the following patch, image boots fine
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 625ef2d..faf0e1f 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1342,9 +1342,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
>>           * spin unnecessarily we would need to do something more involved.
>>           */
>>      case 1: /* YIELD */
>> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> -            s->base.is_jmp = DISAS_YIELD;
>> -        }
>> +        s->base.is_jmp = DISAS_YIELD;
>>          return;
>>      case 2: /* WFE */
>>          if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>>
>>
>> Commit that brough up !parallel logic into yield handling
>> ---------------------------------------------------------
>>
>> I revert (provided below) this commit image boots fine.
>>
>> commit c22edfebff29f63d793032e4fbd42a035bb73e27
>> Author: Alex Bennée <alex.bennee@linaro.org>
>> Date:   Thu Feb 23 18:29:24 2017 +0000
>>
>>     target-arm: don't generate WFE/YIELD calls for MTTCG
>>
>>     The WFE and YIELD instructions are really only hints and in TCG's case
>>     they were useful to move the scheduling on from one vCPU to the next. In
>>     the parallel context (MTTCG) this just causes an unnecessary cpu_exit
>>     and contention of the BQL.
>>
>>     Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>     Reviewed-by: Richard Henderson <rth@twiddle.net>
>>     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
>> index 5f3e3bd..d64c867 100644
>> --- a/target/arm/op_helper.c
>> +++ b/target/arm/op_helper.c
>> @@ -436,6 +436,13 @@ void HELPER(yield)(CPUARMState *env)
>>      ARMCPU *cpu = arm_env_get_cpu(env);
>>      CPUState *cs = CPU(cpu);
>>
>> +    /* When running in MTTCG we don't generate jumps to the yield and
>> +     * WFE helpers as it won't affect the scheduling of other vCPUs.
>> +     * If we wanted to more completely model WFE/SEV so we don't busy
>> +     * spin unnecessarily we would need to do something more involved.
>> +     */
>> +    g_assert(!parallel_cpus);
>> +
>>      /* This is a non-trappable hint instruction that generally indicates
>>       * that the guest is currently busy-looping. Yield control back to the
>>       * top level loop so that a more deserving VCPU has a chance to run.
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index e61bbd6..e15eae6 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1328,10 +1328,14 @@ static void handle_hint(DisasContext *s, uint32_t insn,
>>          s->is_jmp = DISAS_WFI;
>>          return;
>>      case 1: /* YIELD */
>> -        s->is_jmp = DISAS_YIELD;
>> +        if (!parallel_cpus) {
>> +            s->is_jmp = DISAS_YIELD;
>> +        }
>>          return;
>>      case 2: /* WFE */
>>
>> But why even we boot with one cpu, qemu has parallel_cpus is true
>> ------------------------------------------------------------------
>
> This is correct. MTTCG is enabled although we only have one CPU. It just
> means we are not doing round robin executions in a single thread which
> is why you would need to force an exit of the loop in yield.
>
>>
>> Putting watchpoint on parallel_cpus:
>>
>> Old value = false
>> New value = true
>> qemu_tcg_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1695
>> 1695	            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
>> (gdb) bt
>> #0  qemu_tcg_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1695
>> #1  0x000000000044b92b in qemu_init_vcpu (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1798
>> #2  0x00000000005e64dc in arm_cpu_realizefn (dev=0x18c0190, errp=0x7fffffffcd30)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/cpu.c:932
>> #3  0x00000000006d607e in device_set_realized (obj=0x18c0190, value=true, errp=0x0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/qdev.c:914
>> #4  0x00000000008cb986 in property_set_bool (obj=0x18c0190, v=0x18e1db0, name=0xb00953 "realized", opaque=0x18a0ef0, errp=0x0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1906
>> #5  0x00000000008c9cfb in object_property_set (obj=0x18c0190, v=0x18e1db0, name=0xb00953 "realized", errp=0x0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1102
>> #6  0x00000000008cccc3 in object_property_set_qobject (obj=0x18c0190, value=0x18e1d30, name=0xb00953 "realized", errp=0x0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/qom-qobject.c:27
>> #7  0x00000000008c9f90 in object_property_set_bool (obj=0x18c0190, value=true, name=0xb00953 "realized", errp=0x0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/qom/object.c:1171
>> #8  0x00000000005575ec in machvirt_init (machine=0x1880fa0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/arm/virt.c:1405
>> #9  0x00000000006de738 in machine_run_board_init (machine=0x1880fa0)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/hw/core/machine.c:793
>> #10 0x000000000063e08b in main (argc=24, argv=0x7fffffffdb98, envp=0x7fffffffdc60)
>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/vl.c:4753
>> (gdb) list
>> 1690	        qemu_cond_init(cpu->halt_cond);
>> 1691 1692	        if (qemu_tcg_mttcg_enabled()) {
>> 1693	            /* create a thread per vCPU with TCG (MTTCG) */
>> 1694	            parallel_cpus = true;
>> 1695	            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
>> 1696	                 cpu->cpu_index);
>> 1697
>>
>> Here is I am a bit lost - it looks like logic of running separate thread for CPU
>> implies parallel_cpus=true, even number of CPUs is one.
>>
>> Now sure how to fix it that by moving forward. Hopefully Alex and other
>> Linaro QEMU folks can chip in.
>>
>> Revert of c22edfe with resolved conflicts
>> -----------------------------------------
>>
>> Image boots OK if this applied:
>>
>> From 3322ab069015da3d3c2f80ce714d4fb99b7d3b7f Mon Sep 17 00:00:00 2001
>> From: Victor Kamensky <kamensky@cisco.com>
>> Date: Sat, 17 Mar 2018 15:05:39 -0700
>> Subject: [PATCH] Revert "target-arm: don't generate WFE/YIELD calls for MTTCG"
>>
>> This reverts commit c22edfebff29f63d793032e4fbd42a035bb73e27.
>>
>> On single CPU aarch64 target loop with cpu_relax (yield) stuck
>> in loop forever, while pending vtimer interrupt raised
>> un-processed by outside loop.
>>
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>>  target/arm/translate-a64.c |  8 ++------
>>  target/arm/translate.c     | 20 ++++----------------
>>  2 files changed, 6 insertions(+), 22 deletions(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 625ef2d..b0cdb64 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1342,14 +1342,10 @@ static void handle_hint(DisasContext *s, uint32_t insn,
>>           * spin unnecessarily we would need to do something more involved.
>>           */
>>      case 1: /* YIELD */
>> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> -            s->base.is_jmp = DISAS_YIELD;
>> -        }
>> +        s->base.is_jmp = DISAS_YIELD;
>>          return;
>>      case 2: /* WFE */
>> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> -            s->base.is_jmp = DISAS_WFE;
>> -        }
>> +        s->base.is_jmp = DISAS_WFE;
>>          return;
>>      case 4: /* SEV */
>>      case 5: /* SEVL */
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index f120932..130ab50 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -4531,14 +4531,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
>>      gen_rfe(s, pc, load_cpu_field(spsr));
>>  }
>>
>> -/*
>> - * For WFI we will halt the vCPU until an IRQ. For WFE and YIELD we
>> - * only call the helper when running single threaded TCG code to ensure
>> - * the next round-robin scheduled vCPU gets a crack. In MTTCG mode we
>> - * just skip this instruction. Currently the SEV/SEVL instructions
>> - * which are *one* of many ways to wake the CPU from WFE are not
>> - * implemented so we can't sleep like WFI does.
>> - */
>>  static void gen_nop_hint(DisasContext *s, int val)
>>  {
>>      switch (val) {
>> @@ -4548,20 +4540,16 @@ static void gen_nop_hint(DisasContext *s, int val)
>>           * spin unnecessarily we would need to do something more involved.
>>           */
>>      case 1: /* yield */
>> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> -            gen_set_pc_im(s, s->pc);
>> -            s->base.is_jmp = DISAS_YIELD;
>> -        }
>> +        gen_set_pc_im(s, s->pc);
>> +        s->base.is_jmp = DISAS_YIELD;
>>          break;
>>      case 3: /* wfi */
>>          gen_set_pc_im(s, s->pc);
>>          s->base.is_jmp = DISAS_WFI;
>>          break;
>>      case 2: /* wfe */
>> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>> -            gen_set_pc_im(s, s->pc);
>> -            s->base.is_jmp = DISAS_WFE;
>> -        }
>> +        gen_set_pc_im(s, s->pc);
>> +        s->base.is_jmp = DISAS_WFE;
>>          break;
>>      case 4: /* sev */
>>      case 5: /* sevl */
>
>
> --
> Alex Bennée
>

--504000474-1690950369-1521421806=:18105--
