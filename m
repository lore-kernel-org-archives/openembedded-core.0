Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D09D67F0BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 17:39:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n11so46310117qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=10JlxJmo9Dxwzj0f/C4XoqyjBiGEXRUTtH9XzpzOhNY=;
	b=S1llionPfCBwjpH95ETdb27WHAmzN0603bGU5mWzxEPj7YomMXQY8OZ3wJ1Dx39GV1
	KSlWnom6i0yNhLQyKn+3CM1KWBJFqAzPROgB2q92g1JMMfeVHBv2n5wrYLgn28xnveYU
	f+HFNz18zAmEGZHrDyLp0GW+G91mLnYNXqumFdW30Sl0EfD9M1E+v6urjtLsTa+F5LdZ
	BNEdficH5WtRz/Dr8dkwBXXsZh0FtTReLQLFsbqcor7ui5ZQ1MXNGOlTSIDh6EZHPHsH
	us8iQz/9hky+fTBjXEI9O1HJfiUPp8aA+0StKsShvPc1aZ1TY8UPw8M+azTTb6opOHNm
	+YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=10JlxJmo9Dxwzj0f/C4XoqyjBiGEXRUTtH9XzpzOhNY=;
	b=uQ69bktR2PFXUNNM6QfSliDuERQa9tDL01vwVVB2XP2qoLBuwU4wfbxLbPG7YGjtB2
	cS3oNf7Mas4JjW+HiGDpJPXACcLS0MbiMNy7rV71C2Ho5HNNDT4e/KQCM/KhwiH0Zsqi
	aZRtpN81bAIxuJkg4GX2SrxRwMDlpPHNSa43lgCSSy46oMj/Cmfv3HPwOZGz6D2HdF6O
	fpLwLj/XRygoptzu3rfC+n/f5YDcrNd/lM3fQqKg/cjVcqp+Fitl+Hmv1Q544kuwQgmG
	AXUr73EYX5fwPhDR/V8/82m/OrC8EAMWF+++EjD6cKlxlA6rvr22RQqiTKVJhHY8/491
	Ob+g==
X-Gm-Message-State: APjAAAVW4Ulegx92iO+lPX1JqaW+AhKUpc360QOd3qFmTlaBSh3Hozh3
	uVp5QhxZr0pNRn9TOoaKF2axuAMQ0IPZQ5X+gQg=
X-Google-Smtp-Source: APXvYqxQs397WLi1xJYry0MY2DHJ1fYykPBQle61357Ex+MXY+Umsnb5o1xQJZMQEe6KJD8UiokJdLjNHg4mC/VNPbU=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr57557155qtr.194.1563989986522;
	Wed, 24 Jul 2019 10:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190720180058.10672-1-raj.khem@gmail.com>
	<20190720180058.10672-3-raj.khem@gmail.com>
	<20190721152022.GA5474@localhost>
	<531504ebcdae52b7ce1fe8221417d4026c0f9ceb.camel@linuxfoundation.org>
	<CAMKF1sqhkL7moib2Z0N8+quptPW7fEx9ez_MBE0zZAjr-A-kgg@mail.gmail.com>
	<20190724145814.GB626@localhost>
In-Reply-To: <20190724145814.GB626@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 10:39:20 -0700
Message-ID: <CAMKF1sp+OvO6tF8Z2=q9=jFTn-ciLntwjhxh2kenkh23z3x3xw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 3/4] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 24 Jul 2019 17:39:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 7:58 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jul 24, 2019 at 06:39:16AM -0700, Khem Raj wrote:
> > On Wed, Jul 24, 2019 at 1:24 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> >
> > > On Sun, 2019-07-21 at 18:20 +0300, Adrian Bunk wrote:
> > > > On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:
> > > > > ...
> > > > > ++#if !defined(FNM_EXTMATCH)
> > > > > ++# define FNM_EXTMATCH (0)
> > > > > ++#endif
> > > > > ...
> > > >
> > > > As already said in [1] this is expected to result in broken code,
> > > > and the upstream testsuite also confirms this.
> > >
> > > I've taken the patches as they don't make things worse. I am a bit
> > > concerned about a few places musl is building up problematic patches
> > > though (systemd, elfutils, ltp come to mind).
> > >
> >
> > Yes I am aware of this I think LTP we are upstreaming and I hope this w=
ill
> > be better in future
> > Systemd we might have to re-evaluate but I think few patches are worthy=
 of
> > upstreaming elfutils I don=E2=80=99t know yet
>
> elfutils and the same bogus change in ifupdown might need the
> implementation from glibc added as an own package, similar to
> what you've already done for argp and obstack.
>

yes FNM_EXTMATCH change needs to be done logically at app level,
instead of defining it
sometimes apps just use it because its available and covers vast set
that maybe otherwise not
needed.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

