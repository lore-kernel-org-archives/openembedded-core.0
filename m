Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 364677CAF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 22:32:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z84so7080764wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 14:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YzjfqMGmCbCQdB+N15NuqZPib4SyXM8+tSo8WqefghE=;
	b=uwDnyuyE7cWWfKY+iN2v4wkfEKoD61mHaYKE8gM3Ga5rTMj95QqXap19mdEx/2G/0C
	rZiP+Yj7hVmR5WAFo+rNwtWJ3E+hilZdsnAix/Sh0XFEat69zLZ0DZbWwwZd4o51YUDa
	DD09y9tZ8FggSW6iGJW2D1KXEsQM/oakC0npjhOTKbXtOdzNdqkwBDfllHgxYwXr7AaE
	BYhdl145OgNsA0qTSebLPZwXAG3vbLFHN+YRwxNSr5PYtKBrThXV2vCJFDENJZWVhsid
	vA8DcZKARDoxIatjV0re/XpgYDpC/UmPktj5EX0jPAE1rtUyLCeglkhiZmExjZwgH6eS
	7eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YzjfqMGmCbCQdB+N15NuqZPib4SyXM8+tSo8WqefghE=;
	b=fQaPa/TRyMiMkLlRnwP+g5/VR58ny6s+ataAm8hgydYDoBS4sc+6o1xFttYOEV6PfL
	Ljn63WKK28/5JZA6XpmnLzZASjsjbEG0FVioRPYc5+tSJzSegwt64p0JSP3kqXOpX5tk
	c2OZeOtK/BFHtIHKNk/eLkPs+h8UadaTbAZirIiD+PVh4uvLrFq2odOweBfj60dhhOXi
	f1Vhf9VBdSvWeytXON0tavEh3LkHczNXr86FZEiL3E17q4UB/R0OZGIgwd5yIvKzu6ij
	oa3N0HOxsQepCkE8lS1Uqs1K3wVpPUiDsIDNYrGxi8KQzCFKPTM/rtHJMSGURp+7bXwb
	TBiw==
X-Gm-Message-State: AHQUAuaQhz7z+voGMtDVzmXcCif2Ytwh6l3FDx9va2EvlkKaUep4B7nT
	MFOt92RlLyfqzT9HpyYykII=
X-Google-Smtp-Source: APXvYqyS2Ou47WAzjeZVNVLJmWpBFErRvqHZoZrGHfYLRMxQOZbb8ijjFc7mQdtpr9fDo2/+bhBYlg==
X-Received: by 2002:a1c:101:: with SMTP id 1mr892370wmb.128.1551306749750;
	Wed, 27 Feb 2019 14:32:29 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 12sm7910009wme.25.2019.02.27.14.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 14:32:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Feb 2019 23:32:29 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190227223229.GA1503@jama>
References: <20190227205042.44813-1-raj.khem@gmail.com>
	<20190227205042.44813-2-raj.khem@gmail.com>
	<CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
X-List-Received-Date: Wed, 27 Feb 2019 22:32:29 -0000
X-Groupsio-MsgNum: 121715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 02:01:06PM -0800, Andre McCurdy wrote:
> On Wed, Feb 27, 2019 at 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Since compiler does not optimize away a lot of stuff we end up with
> > Werrors e.g.
> >
> > ./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
> > ../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
> >   114 |        + (k * ln2_lo + c))) - f);
> >       |          ~~~~~~~~~~~~^~~~
> >
> > which otherwise wont happen, so lets build with warnings-as-errors
> > disabled in debug mode
> >
> > given we disable werror, now we don't have to restrict user to compile
> > without -O0
>=20
> Did you actually test with -O0? Even if it builds, there may be issues
> at runtime:
>=20
>   https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc=
_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GN=
U_libc_with_GNU_CC.3F

Agreed, last time I've tried it still didn't work in runtime with -O0.

If this is the only place where it now fails, can we please work around
it like in:
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D27c5e756a2a8495d77=
480a103081a86c1ca9a1e8
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D4a06ceea33ecc220bb=
fe264d8f1e74de2f04e90d
and pending:
https://patches-gcc.linaro.org/patch/13529/

> >  meta/recipes-core/glibc/glibc.inc     | 9 ---------
> >  meta/recipes-core/glibc/glibc_2.29.bb | 1 +
> >  2 files changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glib=
c/glibc.inc
> > index 67af396133..a382a22b73 100644
> > --- a/meta/recipes-core/glibc/glibc.inc
> > +++ b/meta/recipes-core/glibc/glibc.inc
> > @@ -2,15 +2,6 @@ require glibc-common.inc
> >  require glibc-ld.inc
> >  require glibc-testing.inc
> >
> > -python () {
> > -    opt_effective =3D "-O"
> > -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> > -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> > -            opt_effective =3D opt
> > -    if opt_effective =3D=3D "-O0":
> > -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.get=
Var('PN'), opt_effective))
> > -}
> > -
> >  DEPENDS =3D "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-hea=
ders"
> >
> >  PROVIDES =3D "virtual/libc"
> > diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/=
glibc/glibc_2.29.bb
> > index bd8aa6d503..9b6fab066b 100644
> > --- a/meta/recipes-core/glibc/glibc_2.29.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> > @@ -90,6 +90,7 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} \
> >                  --disable-crypt \
> >                  --with-default-link \
> >                  --enable-nscd \
> > +                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0=
 -Og', '--disable-werror', '', d)} \
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
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHcP+wAKCRA3VSO3ZXaA
HOlOAKC27Qgc1z+zkccmhD1+4kQyGmp4QgCfcJHhexDcwSX17mtz5UPr2bqF1Jo=
=1CvL
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
