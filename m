Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	by mail.openembedded.org (Postfix) with ESMTP id 9A907789A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=18460; q=dns/txt;
	s=iport; t=1521481615; x=1522691215;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=t+aUlHvmBB7ofaDs5jKBJAL1a2m9NCj4Ys81+wT9ZW8=;
	b=V9jD5tV8iaIW+rlrynMS7EEYDWa3vUFWwbK1HtvGFQVRnKY945yStRGX
	rHs2rJ2J64vf2+3IPjfWa4cUE2E5FtWUgsoojcWEjxnHRGWi0nA1hY4Fb
	AIQxUZC0ZmJRDLiV1IKOAmkrHrnQouUMF4BEC6DX/Z/w9zs4Y+pmGG7LK A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AcAQAQ969a/4cNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNQZkExKI15co0JgVopexuUAIISCxuEdQKDQCE0GAECAQE?=
	=?us-ascii?q?BAQEBAmsohSUBAQEDASdEDhALGC5XBhOFEAirFTqIWIIOhTOCFYMpNII5M4p?=
	=?us-ascii?q?vA4dBH4VGixAJiGyIEoN8h2SKQYVNAgQLAhMBgSoeOIFSTSMVgn0Jgikbjj4?=
	=?us-ascii?q?gNJBYAQEB?=
X-IronPort-AV: E=Sophos;i="5.48,331,1517875200"; d="scan'208";a="372701331"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 17:46:53 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w2JHkr6j016394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 19 Mar 2018 17:46:53 GMT
Date: Mon, 19 Mar 2018 10:46:52 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
In-Reply-To: <87605sjvk4.fsf@linaro.org>
Message-ID: <alpine.LRH.2.00.1803190744140.44401@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
	<alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
	<CAFEAcA-d6-_tVRWKbZpVsQtece4fjuUqF+o+-m-AG4jPUHPY4g@mail.gmail.com>
	<alpine.LRH.2.00.1803111848530.64087@sjc-ads-6991.cisco.com>
	<alpine.LRH.2.00.1803171544580.27691@sjc-ads-6991.cisco.com>
	<87a7v4kj5g.fsf@linaro.org>
	<alpine.LRH.2.00.1803181801370.18105@sjc-ads-6991.cisco.com>
	<87605sjvk4.fsf@linaro.org>
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
X-List-Received-Date: Mon, 19 Mar 2018 17:46:53 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="504000474-246938886-1521472492=:44401"
Content-ID: <alpine.LRH.2.00.1803190828000.44401@sjc-ads-6991.cisco.com>

--504000474-246938886-1521472492=:44401
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1803190828001.44401@sjc-ads-6991.cisco.com>



On Mon, 19 Mar 2018, Alex Bennée wrote:

>
> Victor Kamensky <kamensky@cisco.com> writes:
>
>> On Sun, 18 Mar 2018, Alex Bennée wrote:
>>
>>>
>>> Victor Kamensky <kamensky@cisco.com> writes:
>>>
>>>> Hi Folks,
>>>>
>>>> I am back from ELC and I am looking at this issue again.
>>>>
>>>> Alex Bennée from Linaro QEMU team reported that he tried to
>>>> reproduce the issue, even he went and build the same OE images -
>>>> but he could not reproduce it. Alex, thank you for the effort.
>>>>
>>>> So since it is reprodicible on my machine I kept digging
>>>> myself. In no way I am qemu expert, but I think now I
>>>> understand what is happening. Long story with my debug notes
>>>> is below, but here is executive summery:
>>>>
>>>> Linux kernel loop waiting for jiffies to move on, while
>>>> calling yield instruction, in our case aarch64 target runs
>>>> under one CPU configuration, and after Alex's commit "c22edfe
>>>> target-arm: don't generate WFE/YIELD calls for MTTCG" qemu
>>>> logic of handling yield instruction changed in such way
>>>> that it is treated as simple nop. But since it is single CPU
>>>> configuration, we have qemu looping in generated code
>>>> forver without existing loop to process pending vtimer
>>>> interrupt in order to move jiffies forward. c22edfe implies
>>>> that it is not parallel CPU case, but in our case even if
>>>> we have single CPU target parallel execution is still turned
>>>> on.
>>>
>>> Hmm well my gut guess was right but I'm not sure how it is hanging.
>>>
>>> First of all could you confirm it hangs/works with the invocation:
>>>
>>>  --accel tcg,thread=single -smp 2
>>
>> '--accel tcg,thread=single -smp 2' works fine. '--accel tcg,thread=single'
>> works fine too.
>>
>>> The parallel_cpus variable only refers to the fact MTTCG is enabled or
>>> not. You can still model -smp > 1 systems without MTTCG but in this case
>>> each vCPU will be run round-robin style from a single thread.
>>>
>>> What is troubling is you are not seeing the timer IRQ fire. The whole
>>> point of the cpu_loop_exit(cs) is to ensure we start again on the next
>>> vCPU. Every time we enter a new block we check to see if an IRQ has
>>> fired and then process it then.
>>
>> Thank you for guidance. Now I see icount_decr.u16.high check
>> in start of every generated block. Setting icount_decr.u16.high to -1,
>> does drop target out of loop, but now I think that the code that acts
>> on it, cpu_handle_interrupt function, clears icount_decr.u16.high,
>> but it cannot really serve the interrupt because it is disabled by
>> target, as result code comes back with interupt_request set, and
>> icount_decr.u16.high cleared, and resume blocks execution which
>> hangs in sequence we discussed. But as before I could be missing
>> something again.
>>
>> Please see more details and new gdb session log in line.
>>
>>>> Revert of c22edfe fixes the issue, image boots OK. Booting
>>>> with more than one CPU "-smp 2" boots fine too. And possibly
>>>> could work as solid workaround for us. But how to fix the
>>>> issue without revert, while moving forward, I don't know.
>>>> I hope Alex and Linaro QEMU folks can come up with something.
>>>>
>>>> Now, long debugging notes with my comments:
>>>>
>>>> Kernel Hang Backtrace
>>>> ---------------------
>>>>
>>>> Looking at kernel hang under gdb attached to qemu (runqemu
>>>> qemuparams="-s -S" bootparams="nokaslr"):
>>>>
>>>> (gdb) bt
>>>> #0  vectors () at /usr/src/kernel/arch/arm64/kernel/entry.S:413
>>>> #1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
>>>> #2  raid6_select_algo () at /usr/src/kernel/lib/raid6/algos.c:253
>>>> #3  0xffffff8008083bdc in do_one_initcall (fn=0xffffff80089a35c8 <raid6_select_algo>) at /usr/src/kernel/init/main.c:832
>>>> #4  0xffffff8008970e80 in do_initcall_level (level=<optimized out>) at /usr/src/kernel/init/main.c:898
>>>> #5  do_initcalls () at /usr/src/kernel/init/main.c:906
>>>> #6  do_basic_setup () at /usr/src/kernel/init/main.c:924
>>>> #7  kernel_init_freeable () at /usr/src/kernel/init/main.c:1073
>>>> #8  0xffffff80087afd90 in kernel_init (unused=<optimized out>) at /usr/src/kernel/init/main.c:999
>>>> #9  0xffffff800808517c in ret_from_fork () at /usr/src/kernel/arch/arm64/kernel/entry.S:1154
>>>> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>>>> (gdb) f 1
>>>> #1  0xffffff80089a3758 in raid6_choose_gen (disks=<optimized out>, dptrs=<optimized out>) at /usr/src/kernel/lib/raid6/algos.c:190
>>>> 190					continue;
>>>> (gdb) x /12i $pc - 12
>>>>    0xffffff80089a374c <raid6_select_algo+388>:	cbz	x0, 0xffffff80089a37fc <raid6_select_algo+564>
>>>>    0xffffff80089a3750 <raid6_select_algo+392>:	mov	w0, #0x1                   	// #1
>>>>    0xffffff80089a3754 <raid6_select_algo+396>:	bl	0xffffff80080d07c8 <preempt_count_add>
>>>> => 0xffffff80089a3758 <raid6_select_algo+400>:	ldr	x0, [x23, #2688]
>>>>    0xffffff80089a375c <raid6_select_algo+404>:	ldr	x5, [x23, #2688]
>>>>    0xffffff80089a3760 <raid6_select_algo+408>:	cmp	x0, x5
>>>>    0xffffff80089a3764 <raid6_select_algo+412>:	b.ne	0xffffff80089a3770 <raid6_select_algo+424>  // b.any
>>>>    0xffffff80089a3768 <raid6_select_algo+416>:	yield
>>>>    0xffffff80089a376c <raid6_select_algo+420>:	b	0xffffff80089a375c <raid6_select_algo+404>
>>>>    0xffffff80089a3770 <raid6_select_algo+424>:	mov	x25, #0x0                   	// #0
>>>>    0xffffff80089a3774 <raid6_select_algo+428>:	ldr	x0, [x23, #2688]
>>>>    0xffffff80089a3778 <raid6_select_algo+432>:	mov	x4, x27
>>>>
>>>> Corresponsing Source
>>>> --------------------
>>>>
>>>> (gdb) b *0xffffff80089a3758
>>>> Breakpoint 1 at 0xffffff80089a3758: file /usr/src/kernel/lib/raid6/algos.c, line 191.
>>>>
>>>> This corresponds to this code in lib/raid6/algos.c
>>>>
>>>>    190                          preempt_disable();
>>>>    191                          j0 = jiffies;
>>>>    192                          while ((j1 = jiffies) == j0)
>>>>    193                                  cpu_relax();
>>>>    194                          while (time_before(jiffies,
>>>>    195                                              j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
>>>>    196                                  (*algo)->xor_syndrome(disks, start, stop,
>>>>    197                                                        PAGE_SIZE, *dptrs);
>>>>    198                                  perf++;
>>>>    199                          }
>>>>    200                          preempt_enable();
>>>>
>>>> I.e code grabs jiffies and then loops and checks whether jiffies moved
>>>> forward; it calls cpu_relax(), which translated to yield instruction on
>>>> aarch64.
>>>>
>>>> Yield Instruction Opcode
>>>> ------------------------
>>>>
>>>> (gdb) x /1wx 0xffffff80089a3768
>>>> 0xffffff80089a3768 <raid6_select_algo+416>:	0xd503203f
>>>> (gdb) x /1i 0xffffff80089a3768
>>>>    0xffffff80089a3768 <raid6_select_algo+416>:	yield
>>>>
>>>>
>>>> Backtrace in QEMU
>>>> -----------------
>>>>
>>>> After kernel hangs attached gdb to qemu, see that thread that
>>>> corresponds to target CPU stuck while repeatedly executing loop
>>>> that spans couple ranges in code_gen_buffer buffers. If I put
>>>> breakpoint in cpu_tb_exec right after control passed to generated
>>>> snippets, it never gets there. I.e qemu stack in infinite loop.
>>>>
>>>> (gdb) bt
>>>> #0  0x00007fffeca53827 in code_gen_buffer ()
>>>> #1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
>>>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
>>>> #2  0x000000000048bd82 in cpu_loop_exec_tb (cpu=0x18c0190,
>>>> tb=0x7fffec95ed00 <code_gen_buffer+9755862>, last_tb=0x7fffec00faf8,
>>>> tb_exit=0x7fffec00faf0)
>>>
>>> At this point we have selected the next TB to run at so tb->pc should be
>>> where we are executing next. However we do chain TB's together so you
>>> can execute several TB's before coming back out. This can be disabled
>>> with -d nochain which will ensure we (slowly) exit to the outer run loop
>>
>> If I just add '-d nochain' it boots fine.
>>
>>> for every block we run.
>>>
>>>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:627
>>>> #3  0x000000000048c091 in cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:736
>>>> #4  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
>>>> #5  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0190) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
>>>> #6  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
>>>> #7  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
>>>>
>>>> Dumping cpu and env state in QEMU
>>>> ---------------------------------
>>>>
>>>> Looking at cpu data structure one can see that there is
>>>> pending interrupt request 'interrupt_request = 2'
>>>>
>>>> (gdb) f 1
>>>> #1  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec95ed00 <code_gen_buffer+9755862>)
>>>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
>>>> 167	    ret = tcg_qemu_tb_exec(env, tb_ptr);
>>>>
>>>> (gdb) p *cpu
>>>> $3 = {
>>>>   ...
>>>>   nr_cores = 1,
>>>>   nr_threads = 1,
>>>>   ...
>>>>   interrupt_request = 2,
>>>
>>> That is CPU_INTERRUPT_HARD which implies there is an IRQ pending. This
>>> should be enough to cause:
>>>
>>>  if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
>>>
>>> to handle the setup for servicing the IRQ (-d int should show this).
>>>
>>>>    ...
>>>>
>>>> Note 'pc' points in evn to the same instructions as we saw in gdb
>>>> with vmlinux session
>>>>
>>>> (gdb) p /x *env
>>>> $5 = {
>>>>   regs = {0x0 <repeats 16 times>},
>>>>   xregs = {0xfffedbcb, 0xffffff80087b6610, 0xffffffffffffffff, 0x0, 0x0, 0xfffedbcb, 0x54, 0x3436746e69203a36, 0x286e656720203278, 0xffffffd0, 0xffffff800800b940,
>>>>     0x5f5e0ff, 0xffffff8008a45000, 0xffffff8008b091c5, 0xffffff8088b091b7, 0xffffffffffffffff, 0xffffffc01ea57000, 0xffffff800800bd38, 0x10, 0xffffff8008824228,
>>>>     0xffffff8008811c98, 0x557, 0x5ab, 0xffffff8008a26000, 0xffffffc01ea56000, 0x5ab, 0xffffff80088fd690, 0xffffff800800bcc0, 0xffffff8008a26000, 0xffffff800800bc50,
>>>>     0xffffff80089a3758, 0xffffff800800bc50},
>>>>   pc = 0xffffff80089a3758,
>>>>   pstate = 0x5,
>>>>   aarch64 = 0x1,
>>>>   uncached_cpsr = 0x13,
>>>>
>>>> ARMGenericTimer sate that corresponds to Vtimer has ctl=5
>>>>
>>>> (gdb) p /x env->cp15.c14_timer[1]
>>>> $6 = {
>>>>   cval = 0xb601fb1,
>>>>   ctl = 0x5
>>>> }
>>>>
>>>> QEMU timer that handles vtimer is disarmed (ie pending interupt is already
>>>> set):
>>>>
>>>> (gdb) p *((struct ARMCPU *) cpu)->gt_timer[1]
>>>> $8 = {
>>>>   expire_time = 9223372036854775792,
>>>>   timer_list = 0x187fd00,
>>>>   cb = 0x5cf886 <arm_gt_vtimer_cb>,
>>>>   opaque = 0x18c0190,
>>>>   next = 0x0,
>>>>   scale = 16
>>>> }
>>>>
>>>> I.e what we have here qemu TCG code inifinitely loops executing
>>>> loop
>>>>
>>>>    192                          while ((j1 = jiffies) == j0)
>>>>    193                                  cpu_relax();
>>>>
>>>> in raid6_choose_gen function, but vtimer interrupt that is supposed
>>>> to move jiffies forward is pending and QEMU is not acting on it.
>>>>
>>>> Looking at 'int cpu_exec(CPUState *cpu)' it looks like interrupt and
>>>> exception handling is performed in the loop, but to do so it should
>>>> exit first from cpu_loop_exec_tb. I am still puzzled how it is
>>>> supposed to work if above kernel code instead of cpu_relax() (yield)
>>>> would just has nop instructions. But for now let's focus why QEMU
>>>> executing of 'yield' instruction does not bring control out of
>>>> cpu_loop_exec_tb and let QEMU to execute jump to pending interrupts.
>>>>
>>>>
>>>> yield instruction decoding in translate-a64.c handle_hint function
>>>> ------------------------------------------------------------------
>>>>
>>>> Let's put breakpoint in qemu under gdb session inside of handle_hint
>>>> function. We have the following function:
>>>>
>>>> /* HINT instruction group, including various allocated HINTs */
>>>> static void handle_hint(DisasContext *s, uint32_t insn,
>>>>                         unsigned int op1, unsigned int op2, unsigned int crm)
>>>> {
>>>>     unsigned int selector = crm << 3 | op2;
>>>>
>>>> <snip>
>>>>
>>>>     switch (selector) {
>>>>
>>>> <snip>
>>>>
>>>>     case 1: /* YIELD */
>>>>         if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>>>>             s->base.is_jmp = DISAS_YIELD;
>>>>         }
>>>>         return;
>>>>
>>>>
>>>> Thread 3 "qemu-system-aar" hit Breakpoint 1, handle_hint (s=0x7fffec00f880, insn=3573751871, op1=3, op2=1, crm=0)
>>>>     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/translate-a64.c:1345
>>>> 1345	        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>>>> (gdb) p /x insn
>>>> $12 = 0xd503203f
>>>> (gdb) p /x s->base.tb.cflags
>>>> $5 = 0x80000
>>>>
>>>> in s->base.tb.cflags CF_PARALLEL is set (but we are running
>>>> single CPU mode)
>>>>
>>>> #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
>>>>
>>>> gdb) n
>>>> [Thread 0x7fffeb5ff700 (LWP 13452) exited]
>>>> 1348	        return;
>>>> (gdb) p s->base.is_jmp
>>>> $14 = DISAS_NEXT
>>>> (gdb)
>>>>
>>>> I.e QEMU will execute yield instruction in our case as just regular
>>>> nop, that seems to explain why in qemu control never goes out of
>>>> cpu_loop_exec_tb.
>>>
>>> It should exit once the IRQ is raised. We check
>>> cpu->icount_decr.u16.high on entry to every block. So even a NOP will
>>> fall through and eventually pick up the IRQ on the start of the next
>>> block.
>>
>> Thank you. Your explanation of cpu->icount_decr.u16.high role let me
>> dig further. I do see now each tc generated block does check
>> cpu->icount_decr.u16.high.
>>
>> Here is what I found more:
>>
>> Execution of below sequence is triggered close to hang place.
>>
>> Debugger for each breakpoint executes
>>    bt, p cpu->interrupt_request, env->daif, cont
>>
>> I have following stop points
>>    watchpoint 7 for cpu->icount_decr.u16.high
>>    breakpoint 10 for arm_cpu_exec_interrupt
>>    breakpoint 9 for arm_cpu_do_interrupt
>>
>> Below sequence we can see two variation events progression, normally
>> it is 1), 2), 3), 4). But in case of hang 4) is never reached.
>>
>> 1) qemu_cpu_kick through cpu_exit sets cpu->icount_decr.u16.high to -1
>>
>> 2) cpu_handle_interrupt sets cpu->icount_decr.u16.high to 0
>>
>> 3) cpu_handle_interrupt checks cpu->interrupt_request and if set
>> calls arm_cpu_exec_interrupt
>>
>> 4) arm_cpu_exec_interrupt checks whether interrupts on target are
>> enabled and if so it calls arm_cpu_do_interrupt. In case of hang
>> is never reached.
>>
>> When I look at state of hanged execution I see that
>> cpu->interrupt_request=2 and cpu->icount_decr.u16.high=0
>>
>> So I think we have a logic problem here: icount_decr.u16.high was
>> cleared at 2) but interrupt cannot be really served since it is
>> disabled by target, so any subsequent tc block execution does not
>> return to main loop, and hangs ... I've tried to look around,
>> but could not find yet and running out of time today, maybe it is
>> already there or worth to have logic of handling instructions that
>> reenable interupts to check whether cpu->interrupt_request is on,
>> so it can set cpu->icount_decr.u16.high to -1 to reenable target
>> drop out of main loop.
>>
>> As before I could be missing something else, so further guidance
>> is appreicated.
>
>
> Could you apply commit b29fd33db578decacd14f34933b29aece3e7c25e to your
> tree? If it fixes it we should probably backport that to qemu-stable.

In v2.11.1 of qemu, that we use, we already have 
b29fd33db578decacd14f34933b29aece3e7c25e. Previous testing
and collected log was done with it present.

But my understanding that eret would happen when target exits
an interrupt, here I don't think it enters one.

Consider that target explicitely disables interrupts and while it is
disabled, arm_cpu_exec_interrupt function calls arm_excp_unmasked
and it returns false, so arm_cpu_do_interrupt is not called. Main
loop resume execution, and one of the block explicitely
reenables interrupt and sequence continues without ever returning to
main loop.

For example, if I apply below patch, it boots fine. But I am not sure
in what other places similar thing is needed, and whether below
is complete and correct:

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 91a9300..19128c5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2948,6 +2948,14 @@ static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri,
  static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
  {
+    if (env->daif & ~(value & PSTATE_DAIF)) {
+        /* reenabling interrupts */
+        CPUState *cs = CPU(arm_env_get_cpu(env));
+        if (cs->interrupt_request) {
+            /* there is pending one, let's drop back into main loop */
+            cs->icount_decr.u16.high = -1;
+        }
+    }
      env->daif = value & PSTATE_DAIF;
  }

Thanks,
Victor

> <snip>
> --
> Alex
>

--504000474-246938886-1521472492=:44401--
