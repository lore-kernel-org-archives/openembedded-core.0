Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 446B571957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:13:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z11so20716113pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=djq+sJd4qFGDUdLllVA7Q1CaPUXGlsPtRBmcPEmNtg8=;
	b=CsDIfSt080/jTDMpku3uAxUQsN1619iQU+0a8rmzsJMRV/mx8L6ySckEfBEd9cIpwc
	OPj4Kgtb+4EsMxIWKsghWncrL53ULjGRmgfX+TggtAZSQuCB2kKAihiYMeyLaCiQvHSp
	TIS+fuCQ5Q/ZtEZri8b1Br2q57pO00w3ZxcCSU5T7sGQiQ+6TIl9U3LzbhNtq4tj8kYd
	TV6N7AaoXDnxbU3shRPQuMzBd0xiASupsl8qQkhKC/tafuUU8HtnN1F8kn49ov/74tPQ
	zyJgGlXiTVcISMRsYlR+I2ZhRuQElfadJC1JvSinTprdKb7ChcIRY/UVyoUMNW901KCL
	lAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=djq+sJd4qFGDUdLllVA7Q1CaPUXGlsPtRBmcPEmNtg8=;
	b=mMcybwwgs3uXPHjh9Yikp9r3n6Mb8y1FEPDodvRwYKeLEh4NIXYKfOih3cmlz4qDJX
	iTfPnKC7lV4qDwPy4kG0dYSks7ZfE75SlUrEHRZplG9AQgNah39javHs0Yvh9GtV3NWf
	UWloApqA0ceKDrbcZeClCWXY9bod5bbEnpNN4FWAh86VWIf2n3oJX8KFarZvILjFT5AM
	lm956a2gWbRxPtYiVvduJL8jYlKq6gb2eItGjHtEb9siwLqw5rBMskiC0qDvW/jd6hwk
	xqAfaABT6PwHmnuronaGXYIdqVIfF8opye/JRcv3eZ4XJtR/e+N1sGhjU821ZmKHHccv
	O3mw==
X-Gm-Message-State: AMCzsaX1+aK8QynPFUNCHd+l9V6nrfdecYsbSJAlrMN45+kVM5cFLSiK
	yXUOgj8s/ZcUq3ZFLTTIPwCF3H/68lYPYb8mkXg=
X-Google-Smtp-Source: AOwi7QCDEiJ+M6tqrro7pxPdfcaU269XnM1AamGs2Y49bd2T0lP+y0hPOoq0asjyQ7j3jBz+rU9bCJm6oX4vKMpeDFw=
X-Received: by 10.99.183.67 with SMTP id w3mr6238807pgt.329.1507666413672;
	Tue, 10 Oct 2017 13:13:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 10 Oct 2017 13:13:03 -0700 (PDT)
In-Reply-To: <CAJ86T=Xw2VTOFKODCXR+UpMmUuTT-TaT75h4i9LiVz7mNiRt1Q@mail.gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
	<CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
	<CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
	<CAJ86T=Xw2VTOFKODCXR+UpMmUuTT-TaT75h4i9LiVz7mNiRt1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2017 13:13:03 -0700
Message-ID: <CAMKF1sr-L-pescBejaL7hYOrXMr4ryb-p892QZ7QcnxdUhw-FQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 20:13:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 12:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Oct 10, 2017 at 12:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Oct 10, 2017 at 10:59 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Sat, Oct 7, 2017 at 10:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Fixes
>>>> internal compiler error: Max. number of generated reload insns per insn is achieved (90)
>>>
>>> Is there a plan to update gcc 6.3 -> 6.4 in OE 2.5?
>>
>> actually, I was thinking of not touching 6.x at all since it solely
>> for backward compatibility
>> so upgrading it might cause issues for users
>
> gcc 6.3 to 6.4 isn't really an upgrade in the sense of any new
> features, it's just bug fixes, some of which look somewhat important:
>
>   https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=6.4
>
> Since gcc 6.x is now well into the maintenance phase, I'd be inclined
> to think that the risk -vs- reward odds of taking these upstream fixes
> is pretty good.

I think we understand that its a bug fix only, however, upstream is not
validating gcc 6.x releases against OE-Core, and OE community isnt
doing that either. Invariably, while low, there are chances
of regressions specific to OE

>
>>, and since we do not test
>> it actively, we would
>> not know them. I would rather keep it to the version we have once
>> tested but I am open
>> to maintaining an upgraded version if community thinks that is
>> beneficial for them. there
>> wont be any testing on it in 2.5 release cycle,
>
> Just having the upgrade available to the community is useful, even if
> there are no guarantees or testing. I've backporting gcc 6.3 into my
> morty branch as it fixes build issues with musl. Morty with gcc 6.3 is
> not a combination which was ever officially supported or tested
> upstream, but I very much appreciate the fact that upgrading gcc 6.2
> to 6.3 in morty only requires a few cherry-picks :-)

I am open for if there are more like minded folks who think this will be a good
thing to have. so all listening please chime in

>
>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---

