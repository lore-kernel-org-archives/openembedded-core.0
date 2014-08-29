Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id C00D765E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 12:16:54 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so2098174wes.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=jxaOrI9Q/sihnnqutf4riHwudJF3fOEI7vn5X/4SnIc=;
	b=Ls5o6lOMJcSaJPktcGJhqkv+Irh/MJ7xwNxxQJ0fOliEEvA4Q6i/8KdPhCHG9oW1/D
	L6Grg3oSaZaommb5syM/eq/JqFCMXcgGrIQ2SaHh4ndzEsgOjrfzdRd1S+OpfLREO7d7
	Mx3Bpx3czLKRNHgzj2chOHjBkvwy1wpNmiz1VXe+pLCzMzP5h7Vi/hZ3Zto2zHC99DVK
	q/rYe+Z2VH5VKMQMBJ/2SptsxIVdHr2342+6ZA1TY5VQ+uaXBqaCJfJOCvYDKxflEmJ3
	f9z8k5QTRRf6VUg2RiTsMy3WJ8cNrpzeg7NkxVD9pVF511i7HEj90JIh9VnCXPS2YQhF
	P/QQ==
X-Gm-Message-State: ALoCoQliUUG62nxCazn7XsPaQFm0DsmbYLZKV4fleGu2mn2B2XzWXl/D+UsPxGxk2x0MW2rQDw6P
X-Received: by 10.181.5.3 with SMTP id ci3mr3386446wid.57.1409314615676;
	Fri, 29 Aug 2014 05:16:55 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d1ac:ee01:c702:e868?
	([2001:610:612:0:d1ac:ee01:c702:e868])
	by mx.google.com with ESMTPSA id
	et1sm18226084wjd.11.2014.08.29.05.16.54 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Aug 2014 05:16:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <540019B2.3090102@topic.nl>
Date: Fri, 29 Aug 2014 14:16:52 +0200
Message-Id: <5EF487E4-89F3-4840-A647-50C47862A921@dominion.thruhere.net>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>	<20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama>	<20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama>	<20140822170626.13280b11@e6410-2>
	<20140822222642.GG20524@jama>	<53FB8A87.1010202@windriver.com>
	<53F8A551-7665-45B9-A386-DFA43D57E04F@dominion.thruhere.net>
	<53FF3565.1030604@windriver.com> <540019B2.3090102@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 29 Aug 2014 12:16:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2014, om 08:12 heeft Mike Looijmans <mike.looijmans@topic.nl> =
het volgende geschreven:

> On 08/28/2014 03:57 PM, Mark Hatle wrote:
>> On 8/28/14, 8:50 AM, Koen Kooi wrote:
>>>=20
>>> Op 25 aug. 2014, om 21:12 heeft Mark Hatle =
<mark.hatle@windriver.com>
>>> het volgende geschreven:
>>>=20
>>>> On 8/22/14, 5:26 PM, Martin Jansa wrote:
>>>>> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>>>>>> On Fri, 22 Aug 2014 23:46:26 +0200
>>>>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>>=20
>>>>>>> changing
>>>>>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb =
while
>>>>>>> still building with -marm doesn't make much sense to me and is =
only
>>>>>>> confusing.
>>>>>>=20
>>>>>> I think the distinction is that if you use armv7at-neon, you =
*can*
>>>>>> build
>>>>>> specific packages with thumb. Mostly, I guess, I don't think it
>>>>>> makes sense
>>>>>> to use a tuning that specifically states that it can't run thumb
>>>>>> code for
>>>>>> processors which can. Although... May not be an important
>>>>>> distinction, really,
>>>>>> as you note.
>>>>>=20
>>>>>> I don't think it makes sense to use a tuning that specifically =
states
>>>>>> that it can't run thumb code
>>>>=20
>>>> The defaulttune is supposed to supply what the processor and ABI =
are
>>>> capable of.
>>>>=20
>>>> So in the case of armv7a, it's saying no thumb support at all, this
>>>> included thumb interwork.
>>>>=20
>>>> armv7at says that the processor supports thumb, and interwork
>>>> -should- be enabled.  (It can of course be manually disabled, but
>>>> that's another issue to be dealt with...)
>>>>=20
>>>> armv7at doesn't say it actually includes thumb combines binaries.  =
(I
>>>> argued originally it should, but was overruled for a variety of
>>>> reasons... not the least of which is the interwork enabled, and
>>>> multilib issues with 'same abi' configurations.)
>>>>=20
>>>> So I agree the default should be armv7at or armv7at-neon, unless
>>>> there is a compelling reason to leave it as a default with =
interwork
>>>> disabled.
>>>>=20
>>>> As for the hard float question.  I'm torn on this.. for =
compatibility
>>>> a lot of the industry is still soft-float based, and frankly I've =
not
>>>> exactly encouraged it with my customers.. (I'm not seeing general
>>>> performance improvements, only improvements in select artificial
>>>> benchmarks, or specific pieces of code.)
>>>=20
>>> Again, softfloat !=3D softfp. The current OE default of softfp =
*does*
>>> use the VFP, it just passed the floats in the integer registers. =
Which
>>> is why you will see no difference with hardfloat except for =
benchmarks
>>> and povray.
>>>=20
>>=20
>> Exactly.  Which is why I haven't recommended to my customers that =
they
>> -need- the HF ABI, like others in the ARM world seem to be insisting.
>>=20
>> If you have a LOT of functions that pass floats, or you do it often
>> enough to see the behavior -- I can see how it would be useful.  But
>> this is fairly artificial in most of the embedded workloads I'm =
familiar
>> with.
>=20
> That's because we all learned to work around the softfp. I got bitten =
by it once, so I also learned to avoid passing floats around across =
library boundaries as much as possible. GCC is smart enough to use =
hardfloat on internal methods, but its hands are tied when interfacing =
with externals.
>=20
> There are other, more subtle effects to using hardfloat. For one =
thing, it increases the number of registers available to pass parameters =
around.
>=20
> I can see the case for not really needing hardfloat. But I fail to see =
the advantage of strictly adhering to softfp just "because we used to". =
What's the big disadvantage in moving to hardfloat?

Being link and runtime incompatible with the previous setting. It's a =
flag day change, something that should only be done when everyone is =
aware of the results. Seeing the discussion here I have no faith in that =
being the case.=

