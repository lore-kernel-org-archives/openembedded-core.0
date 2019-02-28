Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 59CE47C7F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 00:30:07 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so11042183qkl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5yMZpFcFfO3Ib9G/aeHLE/vBevr1HsIOgq3wX/i4duc=;
	b=GVbPeGjJz0O13P9rIDfAXrKmYiQihT4pbfdwrdwNY5rsE/RYEaeAoM/T8xiwHv7dL4
	25LCHpYX0Cst7sh0JNYUOYkv8gyBaN6LPPjgTNa8Dk4GAwGaWuhP4tvGTnUubxnb3Lx/
	BlZfhRijrauDFtpJj+FVqr7uZNP4UfH9RtMueqEWl1Cy2YV33/jiAImI6MmulXfgRhUB
	SBoJ4JNUkqTvv/wkdRB/7KpH+drs+30lICuULOKNkz0bd4IqxTyHcs8Gf5GlljU/w9Nd
	+4uStEaoO493uak6xs2uAdw9FoR+ezlqOYyhvJZisjoFMPHCaIw5se6GRv9XfvqjrsPA
	Bkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5yMZpFcFfO3Ib9G/aeHLE/vBevr1HsIOgq3wX/i4duc=;
	b=gaUDPNZFeG2NmM5A9KTTYDKdRlacfseI+glKO/NzlKD5ZE/aKtHaHvV6yadCJS9BrQ
	8/FM6Vx5XUptxrSquUg4mKXHmFMYhWnJ/F17Lno8MXb3pIpJLGtjkJt5fISuQD54TthJ
	EYkrHcied7vRxS70A5G23+hJS/A6WykahCpjxq52aKxnp9n/T1UyvxLles2skDZGdgD3
	jEmeI7vvLSWG11xguCdJmbQyK3aM0oH7h8rfb+RqcIsFbbfhwC+/VIyUL3HyTU9ECAGz
	f5Q1fkBC/zHlz45hb0LZbBPkucV+sQpAQz7LtfPJD58EeIbPqeJDqnMneOF8hvGsQRB0
	5LRQ==
X-Gm-Message-State: AHQUAub4WDiPd2+VmM+mRpuDBbngHt4keBgz1S0zKT/kRHYRCDdVjgxm
	H/LtGdfxACMoGlBKOxythc7EwMDM5Ez8/WQv6NQ=
X-Google-Smtp-Source: AHgI3IZdT33GUw0sUyRJ4YuB5AZ/d0Z0OBlHcjTK8GIha+IaVlkQH64JQaMxPES3m1zcU7RR0TnWK6ATMsEboUN20NA=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr4426886qkm.315.1551313807964; 
	Wed, 27 Feb 2019 16:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20190227205042.44813-1-raj.khem@gmail.com>
	<20190227205042.44813-2-raj.khem@gmail.com>
	<CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 16:29:42 -0800
Message-ID: <CAMKF1sobnnPDsZjurzqaePU46JeOuO4GPq62iM3a2Y67zcbosw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Disable Werror when building with debug options
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
X-List-Received-Date: Thu, 28 Feb 2019 00:30:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 2:01 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Since compiler does not optimize away a lot of stuff we end up with
> > Werrors e.g.
> >
> > ./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
> > ../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >   114 |        + (k * ln2_lo + c))) - f);
> >       |          ~~~~~~~~~~~~^~~~
> >
> > which otherwise wont happen, so lets build with warnings-as-errors
> > disabled in debug mode
> >
> > given we disable werror, now we don't have to restrict user to compile
> > without -O0
>
> Did you actually test with -O0? Even if it builds, there may be issues
> at runtime:

Yes I did, and it does not build with -O0 and glibc build system gives


in file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be
compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~
In file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be
compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~
In file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be
compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~


this is user friendly message, that we can rely on, there is no need
to have code in metadata to detect it.

>
>   https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GNU_libc_with_GNU_CC.3F
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc.inc     | 9 ---------
> >  meta/recipes-core/glibc/glibc_2.29.bb | 1 +
> >  2 files changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> > index 67af396133..a382a22b73 100644
> > --- a/meta/recipes-core/glibc/glibc.inc
> > +++ b/meta/recipes-core/glibc/glibc.inc
> > @@ -2,15 +2,6 @@ require glibc-common.inc
> >  require glibc-ld.inc
> >  require glibc-testing.inc
> >
> > -python () {
> > -    opt_effective = "-O"
> > -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> > -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> > -            opt_effective = opt
> > -    if opt_effective == "-O0":
> > -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
> > -}
> > -
> >  DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
> >
> >  PROVIDES = "virtual/libc"
> > diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> > index bd8aa6d503..9b6fab066b 100644
> > --- a/meta/recipes-core/glibc/glibc_2.29.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> > @@ -90,6 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> >                  --disable-crypt \
> >                  --with-default-link \
> >                  --enable-nscd \
> > +                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
> >                  ${GLIBCPIE} \
> >                  ${GLIBC_EXTRA_OECONF}"
> >
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

