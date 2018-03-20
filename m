Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mail.openembedded.org (Postfix) with ESMTP id CF1597880B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 02:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2761; q=dns/txt; s=iport;
	t=1521512554; x=1522722154;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=AbHWwLFaDJsvkfcZWmadhtxfDd76UBWhkC2XaRslVKE=;
	b=gCHSPLup2MIXsQVhntsuePd3xbd7Slaj6dBHZu2r3nwrvSDaPX5PpZYT
	Ko+1aLcUDa8wuPfcFKLbSYIu8N4RIbzL8KoEI/jpW3Q9snkxIWJzdYyq+
	cWJFhX/pE7Mo61p9FyuavEYjTfBnGNfCoa3Eqwa1V3joK46SsGNQypc+E g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AIAQBNb7Ba/4YNJK1eGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNQgVgog12KHXKNC4FaKXsblAGCEguFEAKDQCE0GAECAQE?=
	=?us-ascii?q?BAQEBAmsohSUBAQEDASMEUgULCQIYKgICVwYTG4R1CI1Um0CBbDqIYIIOhTO?=
	=?us-ascii?q?CFYMpNII5M4gOgmEDjSiLEAmcYZAQAgQLAhMBgSoeOIFSTSMVgn2CMhuOPiA?=
	=?us-ascii?q?0kFcBAQE?=
X-IronPort-AV: E=Sophos;i="5.48,333,1517875200"; d="scan'208";a="368055466"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 02:22:33 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w2K2MWbS009938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 20 Mar 2018 02:22:32 GMT
Date: Mon, 19 Mar 2018 19:22:32 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e15e3ca1-ee9e-1efa-2247-2789aac05091@linaro.org>
Message-ID: <alpine.LRH.2.00.1803191917040.58477@sjc-ads-6991.cisco.com>
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
	<alpine.LRH.2.00.1803191615500.63034@sjc-ads-6991.cisco.com>
	<e15e3ca1-ee9e-1efa-2247-2789aac05091@linaro.org>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
X-List-Received-Date: Tue, 20 Mar 2018 02:22:33 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-1857282591-1521512552=:58477"

--504000474-1857282591-1521512552=:58477
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Mon, 19 Mar 2018, Richard Henderson wrote:

> On 03/20/2018 07:24 AM, Victor Kamensky wrote:
>>> target/arm/translate-a64.c:handle_sys() is setting
>>>    s->base.is_jmp = DISAS_UPDATE;
>>> which it thinks will end the TB, specifically because system
>>> register writes might do things like unmask interrupts or
>>> otherwise require main loop processing.
>>>
>>> The changes that prompted b29fd33db578dec stopped this working.
>>> I suspect what we want is for the case DISAS_UPDATE in
>>> aarch64_tr_tb_stop() to fall through into DISAS_EXIT, not
>>> DISAS_JUMP. (The AArch32 code gets this right, amazingly.)
>>
>> Peter, thank you. I can confirm that change you suggested
>> like one below, boots fine.
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 625ef2d..c381091 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -11384,12 +11384,12 @@ static void aarch64_tr_tb_stop(DisasContextBase
>> *dcbase, CPUState *cpu)
>>          case DISAS_UPDATE:
>>              gen_a64_set_pc_im(dc->pc);
>>              /* fall through */
>> -        case DISAS_JUMP:
>> -            tcg_gen_lookup_and_goto_ptr();
>> -            break;
>>          case DISAS_EXIT:
>>              tcg_gen_exit_tb(0);
>>              break;
>> +        case DISAS_JUMP:
>> +            tcg_gen_lookup_and_goto_ptr();
>> +            break;
>>          case DISAS_NORETURN:
>>          case DISAS_SWI:
>>              break;
>
> Alex and I just had a long chat about this, and I think this is the right solution.
>
> (1) It brings aa64 into alignment with aa32 wrt the meaning of these
> enumerators, (2) The only use of DISAS_UPDATE is there in handle_sys, so we're
> not changing the behaviour of any other insns, (3) The most frequent writes to
> system registers -- NZCV and FPCR -- are already special cased so that they
> won't exit the TB.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, Richard. So how do we go about committing it in qemu tree?
Should I submit the patch or Alex or Peter will do it?

Once fix is in qemu tree I will pick it and submit patch for OE tree
on top of current qemu-2.11.1.

Thanks,
Victor

>
> r~
>

--504000474-1857282591-1521512552=:58477--
