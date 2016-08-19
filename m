Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 92F8F731D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:04:14 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4AE4868A019; Fri, 19 Aug 2016 15:04:12 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2384F68A019;
	Fri, 19 Aug 2016 15:04:07 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 5A0136740397;
	Fri, 19 Aug 2016 16:04:06 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <888B09F3-F9A2-49C1-86E8-E33FA1FE6521@gmail.com>
	<1471601644.16712.23.camel@linuxfoundation.org>
	<D00F6189-93E5-47F1-B2CB-E07F1F0C2B50@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57474cfd-86fc-be7b-f73f-27c1948dd116@mlbassoc.com>
Date: Fri, 19 Aug 2016 16:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <D00F6189-93E5-47F1-B2CB-E07F1F0C2B50@gmail.com>
Subject: Re: [RFT] gcc 6.2 RC1 update
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
X-List-Received-Date: Fri, 19 Aug 2016 14:04:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-19 15:40, Khem Raj wrote:
>
>> On Aug 19, 2016, at 3:14 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2016-08-16 at 11:55 -0700, Khem Raj wrote:
>>> Hi All
>>>
>>> I have put together recipe upgrade for upcoming gcc 6.2 release now
>>> that it entered RC phase. With gcc 6.2 the recipes are using tarballs
>>> instead of git fetcher as promised :)
>>> Please help testing it out in your setups and report any issues you
>>> see.
>>>
>>> The commit you need to cherry-pick for OE-core is this one
>>>
>>> https://github.com/kraj/openembedded-core/commit/0319b603761a16e65d70
>>> 4336112c3709a8bf771c
>>>
>>> Thank you for your help
>>
>> I put this through the autobuilder and it passed so I've merged it. I
>> did this quickly as we're putting a "pre M3" build through a QA cycle
>> and I wanted to get some of the more invasive changes into that build
>> so we don't have a stampeding herd of patches breaking everything
>> coming up to the final feature freeze for 2.2.
>>
>> In other news, we are now also testing musl world builds on the
>> autobuilder as part of regular testing.
>
> Fantastic !

Problem using this to build meta-fsl-arm:u-boot-fslc for i.MX6:
     CC      lib/asm-offsets.s
     lib/asm-offsets.c:1:0: error: bad value (armv5) for -march= switch

This worked fine with GCC/6.1 (git)

Ideas?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

