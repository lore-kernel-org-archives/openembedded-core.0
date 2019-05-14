Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id B15677BD97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:40:02 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z6so8603348qkl.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=01NCBoD63rpXTrWbcNTPgE8Ew1xkHsvXSCitfmhp960=;
	b=CMlLrCzzdTr+u+xsKOxCavdxdJXTGya6ZtGKeiEirfiX8AvOIw8933RDBmoZMvHQhz
	tgvFWMmAjN86vNb6y/szmrGTNkV20yC5Twyw0FTmlDW0HG6slx8Bhq90O1c5AV9BKbVp
	OQGBv93qU5ADFLp0CYJb2V6uCFFNGvEGZA6jnAbXLS4aSDvsL1Flrb4P9Ziql23RWXrk
	hxvF8JaAn5z1m4/n9/UDkTRUMCHWJhPmBD+IIQrTX/n+qWcuAbe+Va7wAoPoBRJgjGKW
	gWEH4+aEvJzHbiD8E0o1flL085MwTwhKFeM+pssa4C4DCpeDm7TnJL7+3jfsnsIY3YJz
	xKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=01NCBoD63rpXTrWbcNTPgE8Ew1xkHsvXSCitfmhp960=;
	b=ApLzABJls8nX+VgDDgz4lpC36tiBLuFwJ0215VtJ8x9CEleAXLbQCzC+YPIV3z+mmF
	HMADfWxeE1J2Bdp3tWwhQWhQ/q1NgxdZmJMw7Tq375MZnqREAfF+MujQmO8MfjcfF7du
	ubJNqDR1j246cHFLOz3bLEcK96tNk3LhI26OABEedPvzmmHfrgDQJrT71hxHroSvGXtO
	Sn6QKY9aKl2X/WbIWsS2Bbq+50DyMG4gxAWcZILQ/WszWErRMkL2ZMaKxnkleSrzRNUD
	J/r9/KMnJkv6OpSjwUkyr0g4jI2JCXr6DyhzdEIAgF8IZZCyh3aX6OnLXYI/5aCY+Mih
	iaLA==
X-Gm-Message-State: APjAAAVbxd5tIhuAwq1dXqyO4eLtJim4aAvCwMFgvpXLsOoF5s7d/T+2
	i+r6gMVz+KlCpn15kPxvvqtoRanc7oZHfiISBMaK//er
X-Google-Smtp-Source: APXvYqwNsrgv3NNFRSyjoeFzSuN7061xgBnyfXAR+ZG6OQS8/3xV4FBfwXqtzq/OMaQ2hQ/0HUSqkCmugWljjgWpi6U=
X-Received: by 2002:a37:8d06:: with SMTP id p6mr26051509qkd.315.1557805203437; 
	Mon, 13 May 2019 20:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
	<CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
In-Reply-To: <CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 23:39:37 -0400
Message-ID: <CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core status with gcc9
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
X-List-Received-Date: Tue, 14 May 2019 03:40:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 12, 2019 at 1:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, May 12, 2019 at 6:21 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > I've run some tests and think we're now down to one remaining issue
> > with gcc 9:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145
> >
>
> Assembler is not liking what gcc9 is generating
>
> HOSTCC scripts/kconfig/conf.o
> /tmp/ccnMW5be.s: Assembler messages:
> /tmp/ccnMW5be.s: Internal error (Segmentation fault).
>
> I wonder if its a common case or specific here?
> I will try to reproduce it as well
>

I am able to get a .s file which crashes assembler on
qemu. Same file assembles ok with mips cross assembler
so next I want to get hold of a mips hardware and try
it on the real h/w, meanwhile if someone has easy access
to mips and can load core-image-sato-sdk on it then I can
provide the asm file which crashes assembler

> > which is a kernel "make scripts" segfaulting on target on mips and
> > hence failing to build kernel modules. If we can get that one fixed
> > we're good from an OE-Core perspective to move to gcc 9.
> >
> > I have to recognise the work Khem has put in getting us this close!
> >
> > Cheers,
> >
> > Richard
> >

