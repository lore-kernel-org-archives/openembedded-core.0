Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 47B877F467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 17:20:57 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s14so6824281qkm.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ws/7QSiCfLqfUNwnOSufhHa8C2cjnILPZSlXvbirmPQ=;
	b=jKBtUprb6EHEE/ROIutV86R0Ythv3AkyBDdK5jzFDJefH5o5l2bP8Gg2ZhLx10ZSXb
	FVxzmUZEwp6rS/fdEA0ktNJPJn5B4QSSeBskJnybdB0XlGzq5x9wW7m6TmMccDB+t/RK
	JXOmHAMf7GL0rNnVHv72iX/vnosAVhJc7OvcDNBrl8rUcj0qV6kheWXZaLi5/VwduiSC
	usH4xa1eo7xygqmqtDOWuSKPX/7ouEK0cpGq0LWf1+9794cl6gGnFWyjkC113gLx1P+L
	ZhmWUAsxV70QhbDrt8ib49pJhkuz+DX9GDrELi2Hl2uPPkAl0N1V67rnoJV4oio0fi5b
	lNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ws/7QSiCfLqfUNwnOSufhHa8C2cjnILPZSlXvbirmPQ=;
	b=JEYVawXSIws7Dnwx3jAgbzIlrwSaTjm+leAPoDKjTsQXYGqInVZXAQtgczx4dp47Nw
	pPkdrMFWaRHUldYAFQvy2pEyBU4Kwe4vlz7f1ZG6t02SHNgfvdMpkG2yN8vpt2krrSr/
	zU/OjxtBf/ddAi6+NzJUhZyGsgqdrw3wgHzIFgXoRTfAeyodJDh+i4HbsSgSWToMYdlu
	UF9GaMrB9kVMheXFA6laOndgbnn+71x/m5H4hyy6YI3S79QhhFxC/Gdkfkak0ZU2uNqH
	8IT2KgYz4DixkMU4NQpyWh4BcsOlM7J1Qp9uJdN1CZiERLWY91l7xoOjk/7HBRbnAsVB
	5/dg==
X-Gm-Message-State: APjAAAUemMvi0sxF677WPaFGvDsczpA81E+VdhIO6G4wKKpPGQRjhFuV
	SgYc1ypy9jULsxwIc79AT+K8oSDUDk0rPNn2fhg=
X-Google-Smtp-Source: APXvYqxNcBmzFHPdTfAN//L6Nucl5V71p+f6j0TFFgi6Ubj30ALXli1KE5IRl4t5eLyEK+Mfq3udQiMyPhLWkdtQ8h0=
X-Received: by 2002:a37:b245:: with SMTP id b66mr16627272qkf.337.1567185657926;
	Fri, 30 Aug 2019 10:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190830155354.18038-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sq8F5yc6G7i2L7+3aBLHeuumT_c-DFs=7EBzTvfe1iPNA@mail.gmail.com>
	<92f66841b24106d9acc75a3a60c39ac5d28c0462.camel@linuxfoundation.org>
In-Reply-To: <92f66841b24106d9acc75a3a60c39ac5d28c0462.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 10:20:31 -0700
Message-ID: <CAMKF1sqLgHiA0raXfHAGdg+GgMGdHjwtSG2iyhgDtjT68-CgiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Clean up fixed-includes
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
X-List-Received-Date: Fri, 30 Aug 2019 17:20:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 9:55 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-08-30 at 09:51 -0700, Khem Raj wrote:
> > On Fri, Aug 30, 2019 at 8:54 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > We had interesting failures where building gcc-cross-powerpc with
> > > 5.0 kernel
> > > headers, then building eudev after moving to 5.2 headers failed.
> > >
> > > gcc-cross doesn't rebuild when linux-libc-headers changes due to
> > > its
> > > listing in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS. This shouldn't matter
> > > but
> > > fixincludes as adding asm-generic/socket.h to its filtered list
> > > which
> > > was then replacing the real header with an older version. This
> > > mismatch
> > > lead to build failures.
> > >
> > > We trust the Linux kernel headers to be ANSI safe so lets just
> > > clear out
> > > any headers and trust the originals to be correct.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-cross.inc | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > index 6222c2e8c91..e417b898734 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > @@ -196,6 +196,8 @@ do_install () {
> > >         # We use libiberty from binutils
> > >         find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
> > >         find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> > > +
> > > +       find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed
> > > -type f -not -name "README" -not -name limits.h -not -name
> > > syslimits.h | xargs rm -f
> >
> > Whats different for limits.h and syslimits.h as compared to standard
> > headers from libc, Maybe we should just get that sorted as well while
> > here
>
> limits.h looks to be gcc specific additions/fallback. syslimits.h is
> just a passthrough. I decided to go with less risk in the patch and
> leave those as is but am open to more investigation.
>

fixed limits.h needs syslimits.h so either both go or both stay

> I suspect limits.h is there for pre glibc bootstrap?

thats right.

>
> Cheers,
>
> Richard
>

