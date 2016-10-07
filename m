Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id F117871981
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:07:39 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id A56E2517EDF0;
	Fri,  7 Oct 2016 17:07:36 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 7 Oct 2016 17:07:40 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 7 Oct 2016 17:07:39 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mark Hatle
	<mark.hatle@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<9c3c5cc4-02e0-4a95-c6f6-9a282701c240@windriver.com>
	<77aabb0f-ae71-2425-6a63-fabd27bed710@imgtec.com>
	<1475855318.30475.633.camel@linuxfoundation.org>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <0e93c6bb-0b30-c203-5750-f470e2753f7c@imgtec.com>
Date: Fri, 7 Oct 2016 17:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475855318.30475.633.camel@linuxfoundation.org>
X-Originating-IP: [192.168.154.45]
Subject: Re: [PATCH 0/9] Add MIPS release 6 ISA support
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
X-List-Received-Date: Fri, 07 Oct 2016 16:07:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/07/2016 04:48 PM, Richard Purdie wrote:
> On Fri, 2016-10-07 at 12:53 +0100, Zubair Lutfullah Kakakhel wrote:
>> On 10/06/2016 05:43 PM, Mark Hatle wrote:
>>>
>>> A few general comments.  I don't see an n32 variant
>>> implemented.  I'd suggest a
>>> follow on patch (vs a new version) to add n32.
>>>
>>> It looks like it's missing in the files modified by patches 6-9.
>> Thanks for the review.
>> Yes I haven't added the n32 variant on purpose at the moment.
>> Wanted to get this out to see if this is the correct approach.
>
> I've been torn on these patches, they're good but they've come in very
> late in the cycle for this kind of change. Since they're comparatively
> straight forward to review, I've merged them. This is partly because I
> wouldn't really want to backport changes like this later and it seemed
> likely that might be requested.

Thank you very much for merging them this cycle!

>
> What I will say though is that we really need to think about an
> "allmips", or "mipsarch" override, rather than all these duplicate
> lines for all mips variants. This is something we should fix early in
> the 2.3 cycle and should make some of this look a lot neater. It might
> be worth openening a bug for this in the bugzilla and assigning that to
> yourself, assuming you're happy to work on it?

The duplicate lines are bothersome indeed.
I'm happy to work on it. But I'm still a bit new to OE internals so would
prefer a little direction regarding the best approach to take.

Regards,
ZubairLK

>
> Cheers,
>
> Richard
>
>

