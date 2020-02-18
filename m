Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62AA560D1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 21:00:39 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so23938910iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FZRy+dThnFyEHnRad4Xf38FuwsCE/8aIB0nRPrYqeqw=;
	b=TuVTglFgjerJSVJjBvxGpvr+PjOBp39ABz70xmBbJL8sjkuHMoi5dy8oc+dC/p1IjB
	iYRH2fzBOW/nEnaq/GCdtRGSxhaMSzLjfjEErAv2ZKxuj7b54TdDw9/bRI470z8fJ1cZ
	O9ebOyc5SmIE82qm1llI8SQCJjQCwsfA6KLQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FZRy+dThnFyEHnRad4Xf38FuwsCE/8aIB0nRPrYqeqw=;
	b=K/dp9jCwoTPUiLb1FLIzew1JuNXHULZcq7yr4Xj+C+24dNtY5joBLWn/KfotZQgTvP
	5uS0JPhOi8muJZno4tM6GCGb+p3wEwJy38XmS5edr78rhnExGAu5UKAff8D7yk7jsRaa
	5mbtzxRWVN4Y5X7PAGYajrr1VD+l3RVqYuvhbyjVydN0j8ZXPHc/ZZwzaLMTpWzolOfl
	O1BOFoBMug/LsewTdIyC22JIxAhmzSt2SvWxWYtQTx5+KQgwWRwds1r0I0po73fuK4Zl
	5PIew/zeZzdXTLmi4L4k+hbtg2ubs84Ga7MuesfVNC7S23LVRhuCqKUDQA1390350iRL
	TRPA==
X-Gm-Message-State: APjAAAW11UYM9QbXm0kzhucSNgonv8GW+CAqfZIEsHNfTssO5CQJdXWY
	4ckHBNCNstsm42CpnXC2oFrdmqaa8XQxxnt4itylcg==
X-Google-Smtp-Source: APXvYqwSraQEVvBF9jq0Q9Q7dOKvjZ345B5y6Y08Hk3F6pT/vtdr35PiBU9BV9J6shuXDsynmY0wJsHnF7YnRjeJo7I=
X-Received: by 2002:a05:6638:44a:: with SMTP id
	r10mr17656343jap.36.1582059640387; 
	Tue, 18 Feb 2020 13:00:40 -0800 (PST)
MIME-Version: 1.0
References: <20200218203136.8314-1-jonathan.richardson@broadcom.com>
	<CAJ86T=WWPJ+CQJovoy+Gr35Qw1B0xQZ5Bs9dMxiA8LcgpvOoYA@mail.gmail.com>
In-Reply-To: <CAJ86T=WWPJ+CQJovoy+Gr35Qw1B0xQZ5Bs9dMxiA8LcgpvOoYA@mail.gmail.com>
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Date: Tue, 18 Feb 2020 13:00:29 -0800
Message-ID: <CAHrpVsX2T83KLNmm3d-+96ju1FJgzqZHstySNLf_eQbweoJT0Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 1/1] fio: remove disabling of compiler optimizations
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
X-List-Received-Date: Tue, 18 Feb 2020 21:00:40 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, that was a typo. I'll send it to devel with an updated comment. Thanks!

On Tue, Feb 18, 2020 at 12:52 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Feb 18, 2020 at 12:32 PM Jonathan Richardson via
> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> >
> > Disabling compiler optimizations affects fio performance by 25-30% so
> > remove this from EXTRA_OECONF. Disabling of optimizations should be
> > machine specific if there are bugs in the code instead of the default.
>
> Wrong mailing list ( patches for meta-oe should be sent to
> openembedded-devel@lists.openembedded.org )
>
> In general when removing a workaround or fix it's also helpful to
> include a link to the commit which added it, in this case:
>
>   https://git.openembedded.org/meta-openembedded/commit/?id=739349da0826221f98648b64b693f9ae33e7d4ea
>
> (FWIW since that crash was seen with a much older version of fio
> compiled with a now obsolete toolchain it seems perfectly justified to
> remove it).
>
> > Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > ---
> >  meta-oe/recipes-benchmark/fio/fio_3.18.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/fio/fio_3.18.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > index b6484290f..2c461b8c5 100644
> > --- a/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > +++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > @@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
> >  DISABLE_STATIC = ""
> >
> >  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
> > -EXTRA_OECONF = "--disable-optimizations"
> >
> >  do_configure() {
> >      ./configure ${EXTRA_OECONF}
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

