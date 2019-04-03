Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 29E967BF70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 19:29:39 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id o187so70719vkg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FZtvTGqmoD15yZ10nrr1OgaUITym8ly+iDObBk6WCLg=;
	b=uAAw6zS9KX9fsG5cusEzXtsqrVA1c45HV+efIgjFCjrY3JQwp4jV5JjEHciqT9AQn9
	x8ZARsTfueBLTme59Lf8kDzVLU5ziy1eWEzXtr7lvLHZR/JegpusGWCNcseJWeie43Xi
	VVTm2yQhE3b4TPqWLGGP35wXb0FNCL3cxPqi340CbA3FFpsUEVyjV5pJrPhneJGp0mtC
	fyYQvBQMEJJ3Ne7KUDkKBl7Yyaco0NtdwwoQm3v6Yt7NuLG0cj70E9D99o+iN37zlmY/
	cO9ffBAdSEgrBRtgCzShSNsNdsWV9a8UUqvE/DSWko9i4VyqsjDvTTgyqg6nQZM98OGL
	Ei+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FZtvTGqmoD15yZ10nrr1OgaUITym8ly+iDObBk6WCLg=;
	b=Y8m3tZ2U69ARl0RakFBiAf4hEH4DNd7MPaOzX93zf0/AmdyH147X5MG0upJSkflvj/
	bL0pne6gG7ONkaa8CwBsSR2r97NviRq53k7vNolOu3SRbhMBXIN2Vc/97QOYV+I4mPkA
	CPyavP9/kFh9B+VgMbett1R/Z5EN7beF7soL88zqx+a+HFSVjKWjraG8llofxXY+Qmsp
	7Hp/1/poVfvdX2lq43N9TVVYpHSQD6t+4ROYyCfoKv3W9pIa+/5R1jqrYdbmu2ETjwCg
	UcvZnfYja6QXbeD2EdjNvsxhmZfQ3FGGigZ+S5NnyuECdHhs/QzwKIXpceXgznGCHE0b
	3qnQ==
X-Gm-Message-State: APjAAAV/nGlMQVc5Q1A/qvmCfttmpr/xQU/FDx8eib0J2BYfDzLNT4yC
	1SNSTiItvDOJzvZuZOUTdCb67PTYeQ6n0XdyBKU=
X-Google-Smtp-Source: APXvYqwvTc0HGrnqCUv5NfzxrOWyiWyMG2Sv32MxFyV6ghPUuTOEmAgOcuwmN4dUameuRcqyrUMFxpHMb5Ecv+U2FGQ=
X-Received: by 2002:a1f:56:: with SMTP id 83mr1480671vka.16.1554319780672;
	Wed, 03 Apr 2019 12:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
	<20190403062249.GB1281@localhost>
In-Reply-To: <20190403062249.GB1281@localhost>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 3 Apr 2019 12:29:29 -0700
Message-ID: <CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Wed, 03 Apr 2019 19:29:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 2, 2019 at 11:23 PM Adrian Bunk <bunk@stusta.de> wrote:
> On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wrote:
> >...
> > "armv4t" is defined in the arm tune files to mean "add -march=armv4t"
> > which is the convention used throughout all the tune files.
> >...
>
> Unfortunately this is not true.
>
> OE has both armv7a and armv7at tunes.
>
> There is no armv7a without Thumb support,
> so no -march=armv7-at exists in gcc.
>
> Both armv7a and armv7at tunes pass the same march to gcc,
> but [1] is not true:
>   Default to using the Thumb-2 instruction set for armv7a and above.
>
> The hardware supports Thumb-2 in any case, the actual difference between
> the armv7a and armv7at OE tunes is whether OE tells the compiler to
> generate ARM or Thumb-2 code.
>
> OE has both armv6 and armv6t tunes.
>
> There is no armv6 without Thumb support
> so no -march=armv6t exists in gcc.
>
> Some v6 support only Thumb-1 and some v6 support also Thumb-2,
> so what gcc does have is an -march=armv6t2.
> But OE lacks tunes for that.
>
> For matching the gcc options it would be correct to remove all
> armv6t and armv7at tunes that have no coresponding gcc options,
> and add armv6t2 tunes.

Aligning the tuning options exposed via the machine config files to
those supported by gcc seems like a worthy goal... but would be a big
upheaval at this point.

Note that the problem isn't specific to ARM. There are similar issues
for x86, but there we seem happy to provide a very minimal abstraction
with no attempt to track gcc. e.g. "corei7" hasn't been a documented
-march option since gcc 4.8 and we (somewhat arbitrarily) map it to
-march=nehalem to hide that fact from end users.

So the high level question seems to be: should DEFAULTTUNE even
attempt to provide a full featured mapping to the options provided by
gcc? Are we happy to expose a limited subset without a 1:1 mapping for
the options we do expose (current ARM approach) or is it better for
DEFAULTTUNE to hide away all the complexity of the options provided by
gcc (current x86 approach).

> And that's only for the legacy 32bit platforms.
>
> armv8 already has 21 feature modifiers in gcc 9,
> and while not all 2^21 or 3^21[2] combinations are
> valid the old tune approach won't scale for that.
>
> > Cheers,
> >
> > Richard
>
> cu
> Adrian
>
> [1] https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration-2.6-miscellaneous-changes
> [2] enable/disable/default
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

