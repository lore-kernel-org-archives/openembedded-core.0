Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE5A7ECB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:45:30 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x3so1402007lji.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ifh6fr0ESjO3z2GB2zzzXJRB3PX8zzYhCEoRoyK2N+Q=;
	b=n+BJMTXyY2EWw+qgJZ/nZntM3ai2xi9RKKftw+JQ7B+uToyhXW1UbBrlzcpSjzoV17
	5C1dHG8e8CC6CUG5W+dc35IW90Bzlbm87tf9xImi1O4l9fVSsmm0Z+/+/hprBXd1C4tm
	fJa+EELSgJB1+zoHPp23yu5P0pxM8+EBmCzBH0YR3Z+CQ17uASTO/dWtJdsVON93GA2Q
	hVa5S9AL+ZciY5IEft4dnvgCSktIA9Eqg122gxK52tCag1ykRU1aOci4WjWpd1n42Yyg
	gpRj7abEkQuPak8e5FWl+2hwUlToY6Rnt1yDkTLCny9wCvEMwIjv2gZqSr8R2uxeJ37g
	phwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ifh6fr0ESjO3z2GB2zzzXJRB3PX8zzYhCEoRoyK2N+Q=;
	b=nmFVL67H5cByRSSzDKV7cMuv9lFbpou7JnQ3zd2JskU2GT3w5uTakjdlE0WXatrG72
	1i6ICbFjdvF5FhPHOWz+1B8vU7gvuf62acs1RjPrtHi/v8sp2X7Jx8FDJp9/Ea5sqg7/
	Z9QW61KoGObzdgixobj6+QDN7ZhwCcfADKd3k9So3DyBiRzXExkggygL7oiFi1/Ot4p7
	+lFjmHxU3nud8lFeToxOn3vG8dcoayByvXHwoulw8xcEDJxBX7fTYJ1zGCGEox5+QPRR
	YvofeF43kgS+RHfzZP9tBeU1I/qFRVTaCwYSQeT7cNLlBtqF/7r7ywquzSTOMUdnA39C
	zL6g==
X-Gm-Message-State: APjAAAVHkbIxxWErEfVBuJqt9tzl8pPk7+hE+24xzLKp9luCYTn55bSL
	5ImRAKSTXml96ABrREig6ts3pIck4C4Xd3dkY03OMppa
X-Google-Smtp-Source: APXvYqzjXz3+QrMiilTyIzePND3f8XwSKkHUSGk9J25BKdC6Xt7TkKEaBtzl3NFPLScSuCsDiMwgILx2S0aZsn5VEGM=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr3552797ljg.232.1567043130721; 
	Wed, 28 Aug 2019 18:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<1d17bdc6ed17c0aa0680c7bcfbeb6f37a8d9cb8c.1567019771.git.bruce.ashfield@gmail.com>
	<CADkTA4NjewFLyHM5W4+cC2ZGpwZecRQgvz_7Xhxe-Fd0UCHZiA@mail.gmail.com>
In-Reply-To: <CADkTA4NjewFLyHM5W4+cC2ZGpwZecRQgvz_7Xhxe-Fd0UCHZiA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 21:45:19 -0400
Message-ID: <CADkTA4PWSpM_GDf2yYOVFbRNkVKfQMCs2SL4B0SUD4QnwZ5MLw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] perf: v5.3+ build fixes
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
X-List-Received-Date: Thu, 29 Aug 2019 01:45:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 8:32 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 3:28 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > In the 5.3+ perf builds, there are multiple unistd.h files that need
> > to be kept in sync. So not only do we update one, we update both to
> > ensure that libc-headers and the perf build are in sync.
> >
> > perf checks some key files itself to be sure they are in sync, and
> > bits.h can be out of sync. There's no build error that results with
> > bits.h at the moment, but we still make sure they are in sync to
> > avoid the configure/compile warning.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > index 8ac8e7c308..58543c73d8 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -241,6 +241,10 @@ do_configure_prepend () {
> >      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> > +    install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> > +
>
> I just realized this may not be safe across all the kernel versions.
> I'll submit a new version (if required), after I've tested my python3
> changes to perf.

I've tested this across 4.19 -> 5.3 and didn't find any issues. So it
should be safe and I won't send a v2.

Bruce

>
> Cheers,
>
> Bruce
>
> > +    # bits.h can have the same issuen as unistd.h, so we make the tools variant take precedence
> > +    install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> >  }
> >
> >  python do_package_prepend() {
> > --
> > 2.19.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

