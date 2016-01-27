Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 98E3A731F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:49:22 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id mw1so19461215igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VOUnH6OKOIyyWlQmE/n6oUbCWdYmQg0l2yVN7ZvgFek=;
	b=ViiejlhECm9Fu1aXdo7nlrcBTvVeEB7rIPsbiPNv3o4EISEkYz7urq+3lsUnYj0D9U
	cpKCKZv4DfsWT2Q2ZBEwmuzV6nW75bR7aLly5HOcHOkpDBe8bpt/UuglcOc2Om7qgyLY
	arzdy+549iA3X0Lh/GAPULQv8VkvTOWoHTFCGC8Pm064n4YWe/z3KWmje+azlktgleiY
	C7xDAmc4I+bXr6hoJuh8qv6skadBWomK2pUS9E2BrkxFZvZp8YHZcuYWzJkkFUvwKaen
	9z7hehiRflSBrchvT3SpUuNElWHVPvKXFo2str3a0urBNVqak5clDxYrDD2JD5BtXX5x
	E9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VOUnH6OKOIyyWlQmE/n6oUbCWdYmQg0l2yVN7ZvgFek=;
	b=bfVCAF1TBeULH0o76P9f0rdrCXOs+VGQ8LV6wvFzaCnUjbLBS9KOZ+4LSrSTgvfqwc
	tBCdtSgVHq6zcW1g19VB5cEbQQWmj7PR57AaECL11zXjnUMYSh/aKU2sAkXumwlc+hlb
	Z5IqHxz8R2XZrZx1Lb8MYo4Gw3PIUHd5gwYMmZNlnCwsi26Xc7CitYiwzNs3Z82hpJdq
	0gAWEWmVow3JTmZTYVxODvIqOP1F8OCybGSuymbB6Cj0LWfS2zfB9/pAFqWE02zUF6Tl
	0DQ/HKzj2Kd1ic6nfT3J9KeMuL4cGj67hkJNYsNvvD6L/rds8QEQypewsj9ivAm9ZjI0
	UB6Q==
X-Gm-Message-State: AG10YOTzP/YSXxdUwRCkveE1gqjRI+QIdROyO7E4a9XvCMM2Ivc7Ml4+L7Sb9P8Zgi8S/G/KiE2JxfQ/DJFAxw==
X-Received: by 10.50.79.196 with SMTP id l4mr32076392igx.11.1453924162975;
	Wed, 27 Jan 2016 11:49:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 27 Jan 2016 11:48:53 -0800 (PST)
In-Reply-To: <8263236.qlFRBBJkri@peggleto-mobl.ger.corp.intel.com>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<20160127191614.GH1652@denix.org>
	<C4EFBCA2-18D0-4FB2-BA45-FB21E83A3189@gmail.com>
	<8263236.qlFRBBJkri@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jan 2016 14:48:53 -0500
Message-ID: <CAMKF1soj2T0TXzvrDd6k7jnEef9POgyeGsyBBz25=52KuS+4uA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Wed, 27 Jan 2016 19:49:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 27, 2016 at 2:37 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wed, 27 Jan 2016 14:28:47 Khem Raj wrote:
>> > On Jan 27, 2016, at 2:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> >
>> > On Tue, Jan 26, 2016 at 09:20:23AM -0500, Denys Dmytriyenko wrote:
>> >> On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
>> >>> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
>> >>>> A clean room re-implementation and extension of the original stress
>> >>>> tool.
>> >>>
>> >>> What's the rationale for adding this to oe-core over another layer?
>> >>
>> >> None, besides the original stress is in oe-core. What other layer would
>> >> you
>> >> suggest?
>> >
>> > Ross,
>> >
>> > Care do make your own suggestion? Do you think meta-oe would be a better
>> > fit? Are there any other considerations, since stress-ng is a replacement
>> > of the original stress and it was added to oe-core? Thanks.
>>
>> IIRC we had meta-benchmarking. They all should go there.
>
> I guess you mean meta-oe/recipes-benchmark (though an actual separate layer
> might be interesting.)

yes recipes-benchmarking.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

