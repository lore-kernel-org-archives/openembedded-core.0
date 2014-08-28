Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAE770EE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:08:53 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id u56so841029wes.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=U5mtQWfkqFuRVNJajHv63VE5zJE0W49RGjENR+MGG4c=;
	b=mSsJRl2nsAGkqjg35+JaRHvbgvKIjM7/CT/oE7BrVGdyzwgQegsFrnZ3IDySBj0pNJ
	u5j4aofpKAdN71lEcgItcTttAtOWX2tuE5zuwP2+GEJ7ZINng0mOa0GfH6/Zg0P+LyYb
	BHd22Rx8hDF1xEurqi3wDTFzlNUKxpqhiOlPsr2OKz/i4nxQePZo0QeSIz30x/n2ChM+
	n/qYck0N5mVu64xVtr1cwA/Zf6zZB2k4xWDkPJbsYUlmBAjkzK7owPeXykB1WhaFCY2O
	Bli0SilM8t5g/M1kuuPIS7x1Zc7GbCea856t+1mS9FX0YGT4nkUrgW7uCv6M7RLk5Xx6
	giOA==
X-Gm-Message-State: ALoCoQlR7RIYPObOReRCnuGGcmAG0nhBfeJsxPX8zS6REjNw232COFmqqAgcFWsi2lNj4Y2090NI
X-Received: by 10.194.59.201 with SMTP id b9mr5590015wjr.43.1409234934218;
	Thu, 28 Aug 2014 07:08:54 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d1ac:ee01:c702:e868?
	([2001:610:612:0:d1ac:ee01:c702:e868])
	by mx.google.com with ESMTPSA id
	hm7sm15181253wib.12.2014.08.28.07.08.52 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 07:08:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53FF3565.1030604@windriver.com>
Date: Thu, 28 Aug 2014 16:08:50 +0200
Message-Id: <ADBE2328-238E-4CAB-8976-BC3E9657848D@dominion.thruhere.net>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>
	<20140822133349.76751634@e6410-2> <20140822193910.GD20524@jama>
	<20140822154954.04d4fc02@e6410-2> <20140822214626.GF20524@jama>
	<20140822170626.13280b11@e6410-2> <20140822222642.GG20524@jama>
	<53FB8A87.1010202@windriver.com>
	<53F8A551-7665-45B9-A386-DFA43D57E04F@dominion.thruhere.net>
	<53FF3565.1030604@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 14:09:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 aug. 2014, om 15:57 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:

> On 8/28/14, 8:50 AM, Koen Kooi wrote:
>>=20
>> Op 25 aug. 2014, om 21:12 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:
>>=20
>>> On 8/22/14, 5:26 PM, Martin Jansa wrote:
>>>> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>>>>> On Fri, 22 Aug 2014 23:46:26 +0200
>>>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>=20
>>>>>> changing
>>>>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb =
while
>>>>>> still building with -marm doesn't make much sense to me and is =
only
>>>>>> confusing.
>>>>>=20
>>>>> I think the distinction is that if you use armv7at-neon, you *can* =
build
>>>>> specific packages with thumb. Mostly, I guess, I don't think it =
makes sense
>>>>> to use a tuning that specifically states that it can't run thumb =
code for
>>>>> processors which can. Although... May not be an important =
distinction, really,
>>>>> as you note.
>>>>=20
>>>>> I don't think it makes sense to use a tuning that specifically =
states
>>>>> that it can't run thumb code
>>>=20
>>> The defaulttune is supposed to supply what the processor and ABI are =
capable of.
>>>=20
>>> So in the case of armv7a, it's saying no thumb support at all, this =
included thumb interwork.
>>>=20
>>> armv7at says that the processor supports thumb, and interwork =
-should- be enabled.  (It can of course be manually disabled, but that's =
another issue to be dealt with...)
>>>=20
>>> armv7at doesn't say it actually includes thumb combines binaries.  =
(I argued originally it should, but was overruled for a variety of =
reasons... not the least of which is the interwork enabled, and multilib =
issues with 'same abi' configurations.)
>>>=20
>>> So I agree the default should be armv7at or armv7at-neon, unless =
there is a compelling reason to leave it as a default with interwork =
disabled.
>>>=20
>>> As for the hard float question.  I'm torn on this.. for =
compatibility a lot of the industry is still soft-float based, and =
frankly I've not exactly encouraged it with my customers.. (I'm not =
seeing general performance improvements, only improvements in select =
artificial benchmarks, or specific pieces of code.)
>>=20
>> Again, softfloat !=3D softfp. The current OE default of softfp *does* =
use the VFP, it just passed the floats in the integer registers. Which =
is why you will see no difference with hardfloat except for benchmarks =
and povray.
>>=20
>=20
> Exactly.  Which is why I haven't recommended to my customers that they =
-need- the HF ABI, like others in the ARM world seem to be insisting.
>=20
> If you have a LOT of functions that pass floats, or you do it often =
enough to see the behavior -- I can see how it would be useful.  But =
this is fairly artificial in most of the embedded workloads I'm familiar =
with.
>=20
> So I'd still say I'd like to change the cortexa* DEFAULTTUNES to =
reference armv7at or armv7at-neon (continue the softfp ABI for the time =
being).  I'd be fine with the at-neon version, as I think all of the =
commodity armv7a's have neon.

Thumb1 support has never been stable, so I don't see what it will buy =
us. It just seems a way to piss of DISTROs without any benefits.=

