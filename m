Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 22A856BD57
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 14:35:51 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b8so12302686qtr.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=953kf/S98iYnUnoo8bAPlXRO3WF234jqVCI+BK1bh5I=;
	b=Nfe0ICLekVwbE8Jxdhs3cce+RRRe02WLBT9QrVvmY9JpdTW1Fyf3BBtcNsZCzWD/EE
	SbV8mO08aVhdENzS3eZSIkUbnhsllp3CRndX7+dRWz9RL132S68FUOWTbaNe4PA4RzzU
	zN1B13R26WKygOrpUtv/x1jEVwoeKTQPTA56SmklT0mCvb7EGy9yoO7SzStKmQIopNDY
	iAcjWLSCsVKrjK7pgE0Mu9XEPrI/Y/vSeORgA7R1wgzPthYLZOaC/zyko8EzK12S55JN
	wlApBlwnFSV4vm+h9sOFb6C6g9cPOAP0ODr+xBa2cGRAX6pmoQoW5ApfTxdchrfrNwDv
	gmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=953kf/S98iYnUnoo8bAPlXRO3WF234jqVCI+BK1bh5I=;
	b=YSJo94crijvFdC07bhZbjGu7SdDFY4dCZdVixxjIywVdIG+6zKVJH9gOXmO2axKfPf
	EamZHwUNt6pv0FtXu7HI9bSGiQL3pFnr64GDEv23Ks05gTFRDaw3OaO5lKC8mL3epw/J
	np+QeOIyyQo4nxay2jMjHNJ+equMfetq2QO+CyvW/OO3dGgkcT9i4ejmcf9ONfd9XtL4
	cpZu6hmHckuGlXyTPiXG9ergc33vI57mH48vwFnTlJyE3aF9NKqcfuRE/l6KVt8fIqSj
	Wfk8a8DZ48umaowPvI227yEU0BXnB+axm3qhqxFskBojRB4DsnN9B1RmU8r23tQ7QWwG
	JwJQ==
X-Gm-Message-State: AHQUAubgnJtpcS+QPYDobowZ6cda/3imf5bPo/P36G+UMxck7czgVxov
	v7X2F2Kjddt/AnGxp1D9fXahF1fE5yUsV9YqFRw=
X-Google-Smtp-Source: AHgI3IY5hMxHHoht5wZ6MoW18cjoa2ApVe46wK7YXvN82Z6XQG7BVFlgI5PLXWU8+wZOdKvTFOhn4llKzQ3O1TPYn04=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr18961354qtn.253.1549895752686; 
	Mon, 11 Feb 2019 06:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
	<81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
	<b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
In-Reply-To: <b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Feb 2019 06:35:26 -0800
Message-ID: <CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
To: Phil Reid <preid@electromag.com.au>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Mon, 11 Feb 2019 14:35:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 6:39 PM Phil Reid <preid@electromag.com.au> wrote:
>
> On 3/01/2019 9:59 pm, Richard Purdie wrote:
> > On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
> >> Your previous solution is working for me, so I was not working on
> >> fixing
> >> this. I thought, that You will just add missing packages, and that
> >> is.
> >> I don't have setup for failing machine.
> >>
> >> Is there any simple way to get all missing perl packages?
> >
> > I reworked the patch a bit, tested and just merged a working version of
> > it:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d4e27863f3874fb7dc543eed8dcf6a8c4d146fb5
> >
> > Cheers,
> >
> > Richard
> >
>
> This patch seems to trigger the following new warning for me during populate_sdk
>
> Collected errors:
>   * Solver encountered 1 problem(s):
>   * Problem 1/1:
>   *   - package busybox-dev-1.29.2-r0.4.cortexa9t2hf-neon requires busybox = 1.29.2-r0.4, but none of the providers can be installed
>   *
>   * Solution 1:
>   *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.9.sdk-provides-dummy-target
>
>   *   - do not ask to install a package providing target-sdk-provides-dummy-dev
>
>   * Solution 2:
>   *   - do not ask to install a package providing busybox-dev
>
>
> Not sure what is request busybox-dev to be istalled in the sdk.
> Any thoughts?
>

Richard

I am seeing same failure as well. I solved it by adding

RDEPENDS_${PN}-dev = "" in busybox recipe.

I am not sure if thats right solution, busybox-dev seems to be empty package.


>
>
> --
> Regards
> Phil Reid
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

