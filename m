Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 705AC7DFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 07:53:55 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id m18so16497721qki.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 00:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ShXikOKfvIzFVmlgjjeCTNDmNWgvrOEKVtILJnu4dG8=;
	b=UQpzOMwpcSsj+MbkA/YQS4UbBGnFR+pCWiXMG7cyK+hNyQGIUjOncxDzvygRRITLTD
	HDtxh112ZUyDdVBTtH9JWJqiotrdU+lMDtrkKgSHWzguGQBblLZ6FSsXxS0F8MR2SQJx
	A+M62MhT05K78ibqCgn7SVIqtBRHm51lSNlghEglT4wGlBaeq8DikKSNX/cgJm52uV0H
	8QtEyNXgCNI+g0vRxSznCzzxEQ/Msy8xJ1V/Jp7NbEY5kgWGeqZ80DgzHUosfL67PL0Q
	jaDsw2iWqoaEvEvqcq7twQcMMwI8dvYTPgJkjmuJY9Y45ZIUJHB5KRYjWDlW/tVF15Uk
	MbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ShXikOKfvIzFVmlgjjeCTNDmNWgvrOEKVtILJnu4dG8=;
	b=YuUBtFfgyEjbECivm+2BEuuAiAxyo83UU6X/EBwPiTnhmy6rWZlZBVZ9cX6cR8g0jZ
	xP/VsBk1nooz+MI++r/JffGIrV4c+le/Vffh11udMXmHfIt/obSHGOGYoUgrp2ETrllX
	cDs2+WaiGFP+GYwRbRJQWu5LCMipRlG5UVzd4blADyYc3xPQJtBRizGmvTzAipUM3pxj
	8Pu91JqjJldnv8Vx8Y1VQJ4jyHyHDxN/jnL4uZzmcqykt5gYRjOZ7nZ097XnLfpxfrak
	Q2jIif+CpPvNg4o3B0W/tJciP4P2bVcx9jK65M/nIMCOQnbbZZuv6I+JAqTQe7k2J+Vf
	ETxQ==
X-Gm-Message-State: APjAAAUtLcR/OFQ54EfY9FxBuNfjoEXGPUkuebs8+YBrdUXe0GtViWaS
	BbjW0C7NpL2K/rDVOIQr/7RHwRyOd5yqJxYFpD7LC2AlcHY=
X-Google-Smtp-Source: APXvYqw/l4zlTbFD+R1TPM7RB/SbKO+6mfm9Sz8Ed3mfA93bEtSY65sINEH2zP0TuMrtrny7pNgAJf3ChtJTF01PKY4=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr89872083qkb.24.1558943636140;
	Mon, 27 May 2019 00:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
	<CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
	<CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
	<CAMKF1spmyDREqVp4hu5UsSmfmi5KY7MgJNficCgZmXXo00tRjQ@mail.gmail.com>
In-Reply-To: <CAMKF1spmyDREqVp4hu5UsSmfmi5KY7MgJNficCgZmXXo00tRjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 00:53:30 -0700
Message-ID: <CAMKF1soM4-qnt9STcuV=e8T=zLx1ESR=0HT3xeCCJ4J7mxCc_w@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 May 2019 07:53:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 26, 2019 at 10:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, May 13, 2019 at 8:39 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, May 12, 2019 at 1:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sun, May 12, 2019 at 6:21 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > I've run some tests and think we're now down to one remaining issue
> > > > with gcc 9:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145
> > > >
> > >
> > > Assembler is not liking what gcc9 is generating
> > >
> > > HOSTCC scripts/kconfig/conf.o
> > > /tmp/ccnMW5be.s: Assembler messages:
> > > /tmp/ccnMW5be.s: Internal error (Segmentation fault).
> > >
> > > I wonder if its a common case or specific here?
> > > I will try to reproduce it as well
> > >
> >
> > I am able to get a .s file which crashes assembler on
> > qemu. Same file assembles ok with mips cross assembler
> > so next I want to get hold of a mips hardware and try
> > it on the real h/w, meanwhile if someone has easy access
> > to mips and can load core-image-sato-sdk on it then I can
> > provide the asm file which crashes assembler
> >
> got some more time to narrow it down.
> works with musl+gcc-9
> works with glibc+clang-8
> works with musl+Clang-8
>
> so only glibc+gcc-9 combo is one which exhibits the issue
>

I have sent a workaound for this which we can try out.
https://patchwork.openembedded.org/patch/161674/

> > > > which is a kernel "make scripts" segfaulting on target on mips and
> > > > hence failing to build kernel modules. If we can get that one fixed
> > > > we're good from an OE-Core perspective to move to gcc 9.
> > > >
> > > > I have to recognise the work Khem has put in getting us this close!
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >

