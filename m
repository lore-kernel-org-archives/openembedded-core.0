Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBA177EF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 04:55:27 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id v189so36736312pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 21:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/HdgCOkA5sbU4Ca9vvaxfZOdNreAncCnSz+U0L+ZAns=;
	b=FP0I8lEdCToWzj2RpXIt9aQizSsp/Xeoqe3FenU4Ku8v0P06gS3BCsAPdEloEptzoO
	sP1iOk+bumuE6Syyv62cfoKcbC8EKWWwYx4rOfFd6InNbfYiNT6qmQtL+aeTZGjJDbo4
	OmctpbnwPAz5fOVsAAllUQzHVNrtiEiZcl2OegfQ2D1r12t7myTYISVpz+Tc7CJFAur9
	doFClvRjL5kfXIxjgd/6yuuWsn06ghvJf1cPfJvkkXAt3xcnSDOAx56OYY0H2Cy/58FB
	Pv5C2P/AxN2C89vpvC2eXh4DTRfEB06JyE7Eqce5uGXafeXWySZ9cpgMProUar8pmEkN
	YngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/HdgCOkA5sbU4Ca9vvaxfZOdNreAncCnSz+U0L+ZAns=;
	b=ZQveTWdqrjL0YtCgvDJKmU3CQDaDwWY2MLW1pInaBrbOHex8Jnk0NHR/1xs0N/9ibN
	sSJA/SrT3nw8l9Pk22eRVdaIse4f7Y/RGGsuwjvc8FD0Oq2OaonVgdsXGkk7g1zde5oG
	2Ws/kKOQcxSPOyBQv96d3dyigV+Y/EmZaAscUfzqW1nLLafcztfpMHXGBny5WCtfpxci
	Q3xKvUEBjGHqYChuNUyvO0Rlu67KC4+X9fZoRLJRBV7vgCXdtbxVpLkjBzMaLrcKRUk8
	YAGpEEI+63Fmvd8q6MQCl2BeMSq8WnuyKeHLXHQeDJIHCRwTzdraqoGvcTpXvCYAD0Mz
	Z7LQ==
X-Gm-Message-State: AHYfb5ivaGh05b70Q6RWHpstKsHBLPCi416UG0dn0ydzdceQtdSYQ6a6
	9OT7aPyGVWrdL6i5A9OO0+bt65oOyw==
X-Received: by 10.98.147.74 with SMTP id b71mr9942233pfe.283.1502320708889;
	Wed, 09 Aug 2017 16:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 9 Aug 2017 16:17:58 -0700 (PDT)
In-Reply-To: <b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
	<d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
	<b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Aug 2017 16:17:58 -0700
Message-ID: <CAMKF1srCG1cnp7r2fEgw0_YtvUGLf1euJg8a=EP7N+pSj4gCow@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Thu, 10 Aug 2017 04:55:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 2:10 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-08-07 09:47 AM, Alexander Kanavin wrote:
>>
>> On 08/07/2017 04:00 PM, Richard Purdie wrote:
>>
>>> Thanks for looking at this. Whilst some project still have some support
>>> for both, could we get timings of do_{configure|compile|install} for
>>> autotools vs. meson?
>>
>>
>> So far there's just one recipe that I can test, json-glib, which is fairly
>> small, and so there's not a lot of difference between compile+install steps.
>> configure however is vastly faster:
>>
>> autotools with gtk-doc
>>
>> configure 16.53
>> compile 12.56
>> install 1.94
>> total 31.03
>>
>> meson with gtk-doc
>>
>> configure 2.04
>> compile 4.87
>> install 9.16
>> total 16.07
>>
>> autotools without gtk-doc
>> configure 16.26
>> compile 5.49
>> install 1.59
>> total 23.34
>>
>> meson without gtk-doc
>> configure 1.95
>> compile 5.04
>> install 2.26
>> total 9.25
>
>
> Yep, total time for 'without gtk-doc' is *more* than cut in half!
>
> The drop in configure time is certainly expected but the compilation
> stage should be dominated by the compiler rather than make or ninja.
> The 'without gtk-doc' compile difference mostly confirms that
> but the 9% drop is odd. A couple of sources I've found assert that
> for large projects and parallel builds a full build time is essentially
> the same with ninja:
>    http://david.rothlis.net/ninja-benchmark/
> That work was done on a MacBook (!!) so it would be interesting to
> see what the results are on a 24+ core Linux system. I might
> give that a try tonight if there's nothing good on NetFlix.
>

try chromium builds from meta-browser and play with ninja its a big enough
package.

> By the way, systemd-234 has meson support and you (Alex) have sent
> a patch update to 242 to the oe-core list but without switching to meson
> as is reasonable. Anyway, 232 takes 51 seconds on my 16+16 core machine
> so it would be a useful benchmark as well. Want to take a stab at that?
>
> ../Randy
>
>
>
>>
>>
>> Alex
>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

