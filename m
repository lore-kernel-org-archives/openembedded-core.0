Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 048027728E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:11:15 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 9so85729592iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NhiGfFQV+az7FkFs11m6H29JVhHxW5Y6Ld+UQBkk3zg=;
	b=y5uqYNFjIa+ish7td0q+9YvUxp3oGxy7kEVhRzPHTda4atRmLbrELRfJh0U0UegbyG
	OQgiVQW+DGAcrGw7139JSvRo73vkKcRqrZp6q0hhsLGVud2xHYd5TDmCha0ot8yzfdZ/
	OYjC5KtQjBYnbmIQBAJvvpT3t/H9M8bpK6c1VejsTBxFJHBR9LJmxN3KNOIRkgcLwJUj
	96DNWp2hVlndm/HtBpTvCXdLweYQrC6NtAymZxiAlqZgmDF/tbb+7Eoub6LpIXpRTQoR
	NkrhQtnLmMEAnT5cKuQ/GyIWru2cLpG6sdwoqSRtwTLxxkXHg8afgGfkbmM3X/K/mdci
	mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NhiGfFQV+az7FkFs11m6H29JVhHxW5Y6Ld+UQBkk3zg=;
	b=NGT+LeQhc8BIJ7hRxX3StKf3vBR3WFbdsBHDvWK+2JocbrLX4xY9KXjBdXHbekQXbJ
	DI1hlONJd98hSpX7pd4pRPtov+0JbDugEIFu28IS7Bs08yKNbVFkGVPPWwfoRahgq/dI
	FjBDKQyBQMI/LA7GdhCU86u08Yhj1B0j/EzSJJfYCYrxQWY8wVGtxZ8EkknpKt01Le+S
	nnP7XI7xE49rL0r4ddZR+jtn+XvGDeh+wff5V8yIhFoa+iVIyagJDjKo+GJqFJ56XcEz
	9v7E32ZWEYGIJmmSeWVYiUJPXhRuEDjDmjHR5vRR1Syfy2CUYIziD2uZYefVfnyOKDmj
	BZig==
X-Gm-Message-State: AG10YOSJjYGRNtdC+aBeg7vraa8BH3ytTJGhrnDQ+FA2FVXgTxTQTPmUUf5qf5fSCqQ3V72zzCnkf65tMMmJhQ==
X-Received: by 10.107.34.79 with SMTP id i76mr27884781ioi.195.1454346676310;
	Mon, 01 Feb 2016 09:11:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 09:10:46 -0800 (PST)
In-Reply-To: <1454335791.27087.35.camel@linuxfoundation.org>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
	<718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
	<56AC1101.70209@windriver.com>
	<B88596E1-A5F6-4199-89D8-194E48A06742@gmail.com>
	<1454151423.10340.84.camel@linuxfoundation.org>
	<56AF6538.9010000@windriver.com>
	<1454335791.27087.35.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:10:46 -0800
Message-ID: <CAMKF1soXUiPbjUMgHjCh_gRuq63mc2txXp=Tw5eGukHfbDxWNg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Mon, 01 Feb 2016 17:11:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 6:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-02-01 at 22:01 +0800, Hongxu Jia wrote:
>> On 01/30/2016 06:57 PM, Richard Purdie wrote:
>> > On Fri, 2016-01-29 at 18:36 -0800, Khem Raj wrote:
>> > > > On Jan 29, 2016, at 5:25 PM, Hongxu Jia <
>> > > > hongxu.jia@windriver.com>
>> > > > wrote:
>> > > >
>> > > > On 01/30/2016 01:47 AM, Peter Kjellerstedt wrote:
>> > > > > Wouldn't it be better to swap the first and second commit and
>> > > > > then
>> > > > > move the addition of -gno-record-debug-prefix-map to the
>> > > > > other
>> > > > > commit
>> > > > > where -fdebug-prefix-map are added.
>> > > > OK
>> > > >
>> > > > > You must also remember that not all use the compiler provided
>> > > > > by
>> > > > > OE-Core, so adding -gno-record-debug-prefix-map
>> > > > > unconditionally
>> > > > > to
>> > > > > DEBUG_CFLAGS will break with unpatched compilers... (This
>> > > > > also
>> > > > > indicates that "Upstream-Status: Inappropriate [oe specific]"
>> > > > > may
>> > > > > not be quite right if you want this to be supported by other
>> > > > > compiler versions).
>> > > > Agree, we should conditionally add -gno-record-debug-prefix-map
>> > > > to
>> > > > support other compiler. Thank you for pointing it out.
>> > > its not only non gcc compilers, we also have gcc 4.9 still.
>> > I think we do likely need to patch 4.9. For other compilers than
>> > that,
>> > or other compilers, I'd suggest that people can either define a set
>> > of
>> > DEBUG_CFLAGS, or set:
>> >
>> > DEBUG_CFLAGS_remove = "-gno-record-debug-prefix-map"
>> >
>> > to avoid problems. I'm not sure making it conditional in some way
>> > is
>> > any better than just using the above line.
>>
>> Got it, I will do it in V4.
>
> I think we should try and see if the the gcc patch would be accepted
> upstream.

yes they are fine as such should be sent upstream. but please open a
gcc bugzilla entry
to track it

 Meanwhile, if we default to turning this on in our compilers,
> much of this issue goes away as Phil mentions.
>
> Cheers,
>
> Richard
>
>
>

