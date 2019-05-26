Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0710F7D3B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 17:17:29 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id a132so14706464qkb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yunca5oTgyokhN4c1TKxVkci63Skp3kI/oCCGgOV1YE=;
	b=Q/A8Z6gUDGfi88LxfE8WRtxhfA2lgqIky6jvPxpM0fyE4XfV6abTSdbtUocgIrRyeq
	2f2m5dRHy4g4gsNDzJXOplK12Hc4bH6r7w3EBUPZIZBXQ9jhO34hP1LokcIqzrxGSGe5
	QPCZ0iRwkm5uy2zNu0q2GBjKUwTqPBnlDHxtzkmE1wddrFi7JBE+Q6vwkXRNB449k5be
	dY+MJVMuTZO9Pmwg4fzH4QPyAFu2O3fHGIXCBQxVy5Ucj2Q5pNz6vGtWzsCq96/by2SC
	IvdZ5ZWelzQVPYIDPJSP0bOIOCgS8c3z3+/UEH8gFaiGDSby0Om70Rfj2xeh64DMSToH
	kA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yunca5oTgyokhN4c1TKxVkci63Skp3kI/oCCGgOV1YE=;
	b=ugJG2DgTU3bOOJleA56mMtbEHqab2zx0OqD9lSakDfRa7OIg3NjQaQUMPN4oWRbJTJ
	OtDB5SbYddC0d5rVKoGja/g08yMKdg5HF8mA+QTC3qBJLWaZXKhoATOV0ulOSn+1hrtk
	aZjGtCaSNKArgITlg33pRf7bZtUglmCo6uEO7wJkR4TVyAsd8h5h8f8FrDi1w6J2DUw8
	3hOCum7Oo804D90817nNTZ0myNk1U7jrG2sfCfXSvFeOqT+mqpxsmOxPR1/0i+Kd1jrP
	ONww67HYli3CQaZvTh1+xxziR8Daid7r1GaVbxEzqYJGN3Zzp3STnvIGHLqGEyPUjD4r
	+1Cw==
X-Gm-Message-State: APjAAAXox/pVW3uz+otoZTlGhctjzWz2b7oDX3t4+bJTRGk/a5q3MU62
	6j71d5m3aCo/2kTxRo8hEA8TSlf5yS7jvG9ZoEo=
X-Google-Smtp-Source: APXvYqyLiW+YpJZtCE3/SAy/RA/g7+nVSEse9a7wkVwbIOCAO61vEps/Z0YDyYOonp7YhX3GOeRUZ0+pbo0whvp1fZs=
X-Received: by 2002:a37:8102:: with SMTP id c2mr15053939qkd.208.1558891050629; 
	Sun, 26 May 2019 10:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
	<CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
	<CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
In-Reply-To: <CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 May 2019 10:17:05 -0700
Message-ID: <CAMKF1spmyDREqVp4hu5UsSmfmi5KY7MgJNficCgZmXXo00tRjQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 26 May 2019 17:17:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019 at 8:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, May 12, 2019 at 1:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, May 12, 2019 at 6:21 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > I've run some tests and think we're now down to one remaining issue
> > > with gcc 9:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145
> > >
> >
> > Assembler is not liking what gcc9 is generating
> >
> > HOSTCC scripts/kconfig/conf.o
> > /tmp/ccnMW5be.s: Assembler messages:
> > /tmp/ccnMW5be.s: Internal error (Segmentation fault).
> >
> > I wonder if its a common case or specific here?
> > I will try to reproduce it as well
> >
>
> I am able to get a .s file which crashes assembler on
> qemu. Same file assembles ok with mips cross assembler
> so next I want to get hold of a mips hardware and try
> it on the real h/w, meanwhile if someone has easy access
> to mips and can load core-image-sato-sdk on it then I can
> provide the asm file which crashes assembler
>
got some more time to narrow it down.
works with musl+gcc-9
works with glibc+clang-8
works with musl+Clang-8

so only glibc+gcc-9 combo is one which exhibits the issue

> > > which is a kernel "make scripts" segfaulting on target on mips and
> > > hence failing to build kernel modules. If we can get that one fixed
> > > we're good from an OE-Core perspective to move to gcc 9.
> > >
> > > I have to recognise the work Khem has put in getting us this close!
> > >
> > > Cheers,
> > >
> > > Richard
> > >

