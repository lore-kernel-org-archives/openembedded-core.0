Return-Path: <kamensky@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 32E2778278
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 02:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5586; q=dns/txt; s=iport;
	t=1521512055; x=1522721655;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=UQuCEjC5wWiAW/u+AxCwLPNkt3BWDAcckaS7POMAe8c=;
	b=AZlT1K7Rc0p5SqclqafKqQOOD4YJnN5TlApnLhtW1NnCbNhuJI+Cd6no
	lOIWys1meimTUh2hr9Oka5T+WayANlMkGyxMC4sqXNSt+8/V+exThW1hh
	fL+sog/Mhjszd3AcLaxOrGRFDYcGQ50DvPb1zyb9pN75f/1TsSwzTFJY4 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AGAQDpbbBa/5NdJa1eGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQgVgojXpyjQuBWil7G5QBghILhRACg0AhNBgBAgEBAQEBAQJ?=
	=?us-ascii?q?rKIUlAQEBAwEnUhALGC5XBhOFEAirAzqIYIIOhTOCFYMpNII5M4pvA40oixAJn?=
	=?us-ascii?q?GGQEAIECwITAYEqHjiBUk0jFYJ9gjIbjj4gNJBXAQEB?=
X-IronPort-AV: E=Sophos;i="5.48,333,1517875200"; d="scan'208";a="86757686"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 02:14:14 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id w2K2ED4d008690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 20 Mar 2018 02:14:13 GMT
Date: Mon, 19 Mar 2018 19:14:13 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
In-Reply-To: <874llbk1xc.fsf@linaro.org>
Message-ID: <alpine.LRH.2.00.1803191854480.58477@sjc-ads-6991.cisco.com>
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
	<alpine.LRH.2.00.1803190744140.44401@sjc-ads-6991.cisco.com>
	<CAFEAcA8p9uO_7MXzkqyAnc-gifTHhmUgyRyE8X7hZnW=sbgQOg@mail.gmail.com>
	<874llbk1xc.fsf@linaro.org>
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
X-List-Received-Date: Tue, 20 Mar 2018 02:14:13 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="504000474-394800777-1521511943=:58477"
Content-ID: <alpine.LRH.2.00.1803191912350.58477@sjc-ads-6991.cisco.com>

--504000474-394800777-1521511943=:58477
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; FORMAT=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1803191912351.58477@sjc-ads-6991.cisco.com>



On Mon, 19 Mar 2018, Alex Bennée wrote:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 19 March 2018 at 17:46, Victor Kamensky <kamensky@cisco.com> wrote:
>>> In v2.11.1 of qemu, that we use, we already have
>>> b29fd33db578decacd14f34933b29aece3e7c25e. Previous testing
>>> and collected log was done with it present.
>>>
>>> But my understanding that eret would happen when target exits
>>> an interrupt, here I don't think it enters one.
>>>
>>> Consider that target explicitely disables interrupts and while it is
>>> disabled, arm_cpu_exec_interrupt function calls arm_excp_unmasked
>>> and it returns false, so arm_cpu_do_interrupt is not called. Main
>>> loop resume execution, and one of the block explicitely
>>> reenables interrupt and sequence continues without ever returning to
>>> main loop.
>>>
>>> For example, if I apply below patch, it boots fine. But I am not sure
>>> in what other places similar thing is needed, and whether below
>>> is complete and correct:
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 91a9300..19128c5 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -2948,6 +2948,14 @@ static CPAccessResult aa64_daif_access(CPUARMState
>>> *env, const ARMCPRegInfo *ri,
>>>  static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>                              uint64_t value)
>>>  {
>>> +    if (env->daif & ~(value & PSTATE_DAIF)) {
>>> +        /* reenabling interrupts */
>>> +        CPUState *cs = CPU(arm_env_get_cpu(env));
>>> +        if (cs->interrupt_request) {
>>> +            /* there is pending one, let's drop back into main loop */
>>> +            cs->icount_decr.u16.high = -1;
>>> +        }
>>> +    }
>>>      env->daif = value & PSTATE_DAIF;
>>>  }
>>
>> target/arm/translate-a64.c:handle_sys() is setting
>>     s->base.is_jmp = DISAS_UPDATE;
>> which it thinks will end the TB, specifically because system
>> register writes might do things like unmask interrupts or
>> otherwise require main loop processing.
>
> For the DAIFclear and eret paths we set DISAS_EXIT. What is the
> handle_sys path that should be doing this? Is this a direct setting of
> DAIF?

Yes, the one that translated into aa64_daif_write help invocation, ie
something like:

'msr daif, x25'

the reason why I went in my experiment after aa64_daif_write function,
that I saw it was hitting daif watchpoint last, clearing it before
system hangged.

Here is backtrace before system stuck. After backtrace,
first entry is interrupt_requested, followed by daif, and then by
cp15.hcr_el2, and cp15.scr_el3

Old value = 128
New value = 0
aa64_daif_write (env=0x18c8430, ri=0x18f07d0, value=0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:2952
2952    }
#0  aa64_daif_write (env=0x18c8430, ri=0x18f07d0, value=0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/helper.c:2952
#1  0x00000000005c8f43 in helper_set_cp_reg64 (env=0x18c8430, rip=0x18f07d0, value=0)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/target/arm/op_helper.c:842
#2  0x00007fffec05cec7 in code_gen_buffer ()
#3  0x000000000048aee9 in cpu_tb_exec (cpu=0x18c0190, itb=0x7fffec0393c0 <code_gen_buffer+164758>)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:167
#4  0x000000000048bd82 in cpu_loop_exec_tb (cpu=0x18c0190, tb=0x7fffec0393c0 <code_gen_buffer+164758>, last_tb=0x7fffec00faf8,
     tb_exit=0x7fffec00faf0) at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:627
#5  0x000000000048c091 in cpu_exec (cpu=0x18c0190)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/accel/tcg/cpu-exec.c:736
#6  0x000000000044a883 in tcg_cpu_exec (cpu=0x18c0190)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1270
#7  0x000000000044ad82 in qemu_tcg_cpu_thread_fn (arg=0x18c0190)
     at /wd6/oe/20180311/build/tmp-glibc/work/x86_64-linux/qemu-native/2.11.1-r0/qemu-2.11.1/cpus.c:1475
#8  0x00007ffff79616ba in start_thread (arg=0x7fffec010700) at pthread_create.c:333
#9  0x00007ffff59bc41d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
$7778 = 0x2
$7779 = 0x0
$7780 = 0x0
$7781 = 0x0

Note IMO dealing with aa64_daif_write may not be sufficient, because
besides daif unmasked interrupt function also checks cp15.hcr_el2, and 
cp15.scr_el3. Those could be a reason why interrupt is masked and
they could change too and require exit into main loop, if interrupt is
pending.

Thanks,
Victor

>>
>> The changes that prompted b29fd33db578dec stopped this working.
>> I suspect what we want is for the case DISAS_UPDATE in
>> aarch64_tr_tb_stop() to fall through into DISAS_EXIT, not
>> DISAS_JUMP. (The AArch32 code gets this right, amazingly.)
>>
>> thanks
>> -- PMM
>
>
> --
> Alex Bennée
>

--504000474-394800777-1521511943=:58477--
