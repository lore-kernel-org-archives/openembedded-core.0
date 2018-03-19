Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECFC786F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3107; q=dns/txt; s=iport;
	t=1521501843; x=1522711443;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=E3Dc9H9pkhFQYnpU0fWu9TN35u/NbS/HzE6xgq96wzc=;
	b=Wmjl1aYb9egnzXaG+weixfNznkwPhV5H89oSwh8IwPd2KI4AVut3HhQF
	V8ACOnErpWMHX3e8DR9P3Q3zrD9U6SvT2D7G7IdMhBx5m4qrR4LjhSf0T
	UUwAOX0k/KaRJnAY8Ox8D1WkkOa26cPHj0JKFi6SiA0tnS5hOIMv4YWL/ Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D/AAC1RbBa/4ENJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQgVgojXlyjQuBWimBFpQAghILhRACg0AhNBgBAgEBAQEBAQJ?=
	=?us-ascii?q?rKIUlAQEBAwEnEQI/BQsLGC5XBhOFEAirMTqIXoIOhTOCFYNdgjkzim8DjSaLE?=
	=?us-ascii?q?AmcXpAOAgQLAhMBgSoeOIFSTSMVgn2CMhuOPiA0kFcBAQE?=
X-IronPort-AV: E=Sophos;i="5.48,332,1517875200"; d="scan'208";a="369900745"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 23:24:02 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id w2JNO1Y5022387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 19 Mar 2018 23:24:02 GMT
Date: Mon, 19 Mar 2018 16:24:01 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8p9uO_7MXzkqyAnc-gifTHhmUgyRyE8X7hZnW=sbgQOg@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1803191615500.63034@sjc-ads-6991.cisco.com>
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
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
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
X-List-Received-Date: Mon, 19 Mar 2018 23:24:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Mon, 19 Mar 2018, Peter Maydell wrote:

> On 19 March 2018 at 17:46, Victor Kamensky <kamensky@cisco.com> wrote:
>> In v2.11.1 of qemu, that we use, we already have
>> b29fd33db578decacd14f34933b29aece3e7c25e. Previous testing
>> and collected log was done with it present.
>>
>> But my understanding that eret would happen when target exits
>> an interrupt, here I don't think it enters one.
>>
>> Consider that target explicitely disables interrupts and while it is
>> disabled, arm_cpu_exec_interrupt function calls arm_excp_unmasked
>> and it returns false, so arm_cpu_do_interrupt is not called. Main
>> loop resume execution, and one of the block explicitely
>> reenables interrupt and sequence continues without ever returning to
>> main loop.
>>
>> For example, if I apply below patch, it boots fine. But I am not sure
>> in what other places similar thing is needed, and whether below
>> is complete and correct:
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 91a9300..19128c5 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -2948,6 +2948,14 @@ static CPAccessResult aa64_daif_access(CPUARMState
>> *env, const ARMCPRegInfo *ri,
>>  static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>                              uint64_t value)
>>  {
>> +    if (env->daif & ~(value & PSTATE_DAIF)) {
>> +        /* reenabling interrupts */
>> +        CPUState *cs = CPU(arm_env_get_cpu(env));
>> +        if (cs->interrupt_request) {
>> +            /* there is pending one, let's drop back into main loop */
>> +            cs->icount_decr.u16.high = -1;
>> +        }
>> +    }
>>      env->daif = value & PSTATE_DAIF;
>>  }
>
> target/arm/translate-a64.c:handle_sys() is setting
>    s->base.is_jmp = DISAS_UPDATE;
> which it thinks will end the TB, specifically because system
> register writes might do things like unmask interrupts or
> otherwise require main loop processing.
>
> The changes that prompted b29fd33db578dec stopped this working.
> I suspect what we want is for the case DISAS_UPDATE in
> aarch64_tr_tb_stop() to fall through into DISAS_EXIT, not
> DISAS_JUMP. (The AArch32 code gets this right, amazingly.)

Peter, thank you. I can confirm that change you suggested
like one below, boots fine.

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 625ef2d..c381091 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11384,12 +11384,12 @@ static void aarch64_tr_tb_stop(DisasContextBase 
*dcbase, CPUState *cpu)
          case DISAS_UPDATE:
              gen_a64_set_pc_im(dc->pc);
              /* fall through */
-        case DISAS_JUMP:
-            tcg_gen_lookup_and_goto_ptr();
-            break;
          case DISAS_EXIT:
              tcg_gen_exit_tb(0);
              break;
+        case DISAS_JUMP:
+            tcg_gen_lookup_and_goto_ptr();
+            break;
          case DISAS_NORETURN:
          case DISAS_SWI:
              break;

- Victor

> thanks
> -- PMM
>

