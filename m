Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5CA67C847
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 01:15:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j36so21670763qta.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X9Pmk3MwCz+d4ci2rlmyvpitOKy+IJtZ7qN7jB1Zq6w=;
	b=C06iGqTD3G1T84WwS93J6unL1zdm6sBw7s/pANbjR385+W7ArjQPrNh4XSespdy5Uf
	DRfXSgN1P7c9jk1K1+GWIVJiffPqtoA6gcMqawC9JpvpUkrHdR1uDzqNXvGbntleLEMQ
	x6YJzNAPY9dBw3kb0lEbHTS48MmZcQGlmON15Y5Y9E7MZ+AxM45BhXUFAliPe8gOj3uu
	9WPIj1IsB0XBgFiDRLRMNobho2DaDFsDeU3QcDYSHpwDOzo55dO/Zo4BaO0KIgKi+hOP
	quQ9E6lIW+tg9adenmy8pBGE9sVd+/9TQKQNKBDRbAmkKcS5T8fleG/0vYyzP2K3/kmM
	CVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X9Pmk3MwCz+d4ci2rlmyvpitOKy+IJtZ7qN7jB1Zq6w=;
	b=lXa/VmIyfj/m3DeoPmnmt3lJbD1krXQiZ2TutcZA4lcY/DBofe3Mf8XRLWXm2Zl2hi
	L9Bdw5dUTZ/DsJwXHxq8zZDMbPxdjzQjEf2uz0MGXSDkw+mgWjcrr/LDrJPVViyGZfKZ
	ZRhKFrEFefwO4N6QotLbkCF9vG9hj2DdLLnAZi6Crr1uv/bha9Z6HA1pat3ChlRarfyU
	9RNuMvgzc+IHlIUQWoiOGpU/f357W8v4yWbzcUcFiMgz1pAn+pVMQDBglYztIj5Ppgj7
	1Mi5M1D6JGfUpKcJkLUCmKzpWrEwcdddfITCKOs6ygpTyuoz/cwx2ZOKWhAAIx+fyzVG
	Hztw==
X-Gm-Message-State: APjAAAX0pdXJVqSiYsDbnFqvdgwy1EDhb6ivC0q35Nm7C7OoI7SCKZ2+
	e1mMtHN2nk6SIjCSH0MLWmlJHu56+lm0gBxISzs=
X-Google-Smtp-Source: APXvYqy/nuAWGJzBoqwmGri7fNf0fNhUz+uR+G3FBELJFMG/VahfpmvECrzSD7rNbZEXHxWCwNUrkdxCg2HD6f9uzwk=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr4402896qvf.194.1551316524575; 
	Wed, 27 Feb 2019 17:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20190227205042.44813-1-raj.khem@gmail.com>
	<20190227205042.44813-2-raj.khem@gmail.com>
	<CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
	<20190227223229.GA1503@jama>
	<CAMKF1srcmWG6m+78ZBX-hv=1ZqHPA__RtMWwr-9HLp2mvDtFww@mail.gmail.com>
	<CAJ86T=U+TUnGj=CmDrp7OhrKDAgrbdwsd6Wv_7EWAp5fv2y4BQ@mail.gmail.com>
In-Reply-To: <CAJ86T=U+TUnGj=CmDrp7OhrKDAgrbdwsd6Wv_7EWAp5fv2y4BQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 17:14:58 -0800
Message-ID: <CAMKF1sqxWnSwS6q-boe9S2XP48B+y7AqbAJKP1ZMxgO_3mBTAw@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Feb 2019 01:15:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 4:46 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 4:31 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Feb 27, 2019 at 2:32 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > On Wed, Feb 27, 2019 at 02:01:06PM -0800, Andre McCurdy wrote:
> > > > On Wed, Feb 27, 2019 at 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > Since compiler does not optimize away a lot of stuff we end up with
> > > > > Werrors e.g.
> > > > >
> > > > > ./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
> > > > > ../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > >   114 |        + (k * ln2_lo + c))) - f);
> > > > >       |          ~~~~~~~~~~~~^~~~
> > > > >
> > > > > which otherwise wont happen, so lets build with warnings-as-errors
> > > > > disabled in debug mode
> > > > >
> > > > > given we disable werror, now we don't have to restrict user to compile
> > > > > without -O0
> > > >
> > > > Did you actually test with -O0? Even if it builds, there may be issues
> > > > at runtime:
> > > >
> > > >   https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GNU_libc_with_GNU_CC.3F
> > >
> > > Agreed, last time I've tried it still didn't work in runtime with -O0.
> > >
> >
> > intention is not to state that it should be working with -O0, but let
> > glibc complain that it can not be compiled with out optimization which
> > it does nicely.
>
> Doesn't glibc complain about -O0 regardless of --disable-werror?
>

No, it gets stuck in warnings being treated as errors and that can
misguide the user.

> If so then I don't see any advantage in specifically passing
> --disable-werror in the -O0 case.
>
> > > If this is the only place where it now fails, can we please work around
> >
> > No, this is just a representative, there are several such warnings in
> > tests especially, so disabling werror is only sane here.
> >
> > > it like in:
> > > https://sourceware.org/git/?p=glibc.git;a=commit;h=27c5e756a2a8495d77480a103081a86c1ca9a1e8
> > > https://sourceware.org/git/?p=glibc.git;a=commit;h=4a06ceea33ecc220bbfe264d8f1e74de2f04e90d
> > > and pending:
> > > https://patches-gcc.linaro.org/patch/13529/
> > >
> > > > >  meta/recipes-core/glibc/glibc.inc     | 9 ---------
> > > > >  meta/recipes-core/glibc/glibc_2.29.bb | 1 +
> > > > >  2 files changed, 1 insertion(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> > > > > index 67af396133..a382a22b73 100644
> > > > > --- a/meta/recipes-core/glibc/glibc.inc
> > > > > +++ b/meta/recipes-core/glibc/glibc.inc
> > > > > @@ -2,15 +2,6 @@ require glibc-common.inc
> > > > >  require glibc-ld.inc
> > > > >  require glibc-testing.inc
> > > > >
> > > > > -python () {
> > > > > -    opt_effective = "-O"
> > > > > -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> > > > > -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> > > > > -            opt_effective = opt
> > > > > -    if opt_effective == "-O0":
> > > > > -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
> > > > > -}
> > > > > -
> > > > >  DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
> > > > >
> > > > >  PROVIDES = "virtual/libc"
> > > > > diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> > > > > index bd8aa6d503..9b6fab066b 100644
> > > > > --- a/meta/recipes-core/glibc/glibc_2.29.bb
> > > > > +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> > > > > @@ -90,6 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> > > > >                  --disable-crypt \
> > > > >                  --with-default-link \
> > > > >                  --enable-nscd \
> > > > > +                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
> > > > >                  ${GLIBCPIE} \
> > > > >                  ${GLIBC_EXTRA_OECONF}"
> > > > >
> > > > > --
> > > > > 2.21.0
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

