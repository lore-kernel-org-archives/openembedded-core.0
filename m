Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.3664.1615454071000773642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 01:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A6eavLj/;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ci14so44552389ejc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 01:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ESqesZ+CyD5Zl35qH/b8hsJ7SHhzhAm2btQJ2PbLHo=;
        b=A6eavLj/6k2QHnADr4u31cS/AVC/fsxnPQZTsxtsj34cC47uJwfXWCQLheSDYq1YFB
         muHcPfKearJCJqhS23Kpbkz4YVgBlmx1pKvTx+Yb5qhSgdBRgK7xTwuRXU0AC/w7O4lb
         AleWId5WzdUek6VVW1dgDWyPtUZecr4+RAE36yebw+XSa61ox3nEYrlucVhi+vfolq2F
         Yv4MC63MPKQn/ESJ/pIemZdmhQHcmJlWv4TpkF59zxHPE5sXb6M0+M5Ij5EJZx8TpZJ7
         UO6+cTLSAw7CcC+nFn+0Y4Jz2t8ZFZBaQw5lTEcHA9H+twzCKMaoHEW8h13BGV6BrQlr
         A8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ESqesZ+CyD5Zl35qH/b8hsJ7SHhzhAm2btQJ2PbLHo=;
        b=YaEf+cY9EuJ3UmPwKCD3/mFtT5E3AjG1bOsZ0xVz8LxIRiCRL5kBb/aTp5naVQll9p
         0hFdQV7qYKXwICO9PSrJb0SfObd7RQaMbV6ahsN4QCLaj6F90ztttPh4Oz7E6BwpqvtO
         U/GrRFkLNyXOTGeN235BaheJ7Mledyt37Tz6REao301gQ0SXpVkCCZqF0NDDLk8WUAAt
         2U37N32HRPgHuZ6xxrdG4+jTfx9pgFALZ0+NYA4VQemH4osHNrBj+gtm2m0NflY9DOu+
         4tl6eIHkKIKvlbQXxhKvFZMxvmiryqjClJJAGIfGgjANuew782uAKNoo/b1DyeTLFrDY
         EDtw==
X-Gm-Message-State: AOAM531MRw0uBpk5AKxcUhWRk/3K2E9zcpG1uNz7fWfANgjToUVYzTDl
	XRUkJnME5Y7VAcQ9NMnfJYY=
X-Google-Smtp-Source: ABdhPJzT6cHMorNMDzO9JAaA6QZRomqrDbiQ6rpbabUM1Jdq1zerzKtzPAG5/XuIHZfr/0vizi5kEQ==
X-Received: by 2002:a17:906:8443:: with SMTP id e3mr2096902ejy.370.1615454069509;
        Thu, 11 Mar 2021 01:14:29 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cy5sm960246edb.46.2021.03.11.01.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 01:14:29 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 10:14:28 +0100
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Anibal Limon <anibal.limon@linaro.org>,
	Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
Message-ID: <20210311091428.2a3nissv6eebjpzq@jama>
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
 <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
X-Groupsio-MsgNum: 149274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nresoayngrsv7zby"
Content-Disposition: inline

--nresoayngrsv7zby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 04:33:02AM -1000, Steve Sakoman wrote:
> On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
> >
> > From: Richard Leitner <richard.leitner@skidata.com>
> >
> > This fixes [1] the following build error for nativesdk on Fedora 33
> > which is caused by the removal of fractions.gcd() in favor of math.gcd=
()
> > in python 3.9 [2]:
> >
> > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/pyt=
hon3.9/fractions.py)
> >
> > Furthermore the SRC_URI is adapted as the old one doesn't provide the
> > 1.14.1 archive.
> >
> > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae3=
5bee1fa0fdb8b5120b1dcd20cee6e34512
> > [2] https://bugs.python.org/issue39350
> >
> > It's needed in gatesgarth and possibly dunfell as well to support
> > distributions with python-3.9 as we build libxcb-native, which is
> > failing with xcb-proto-1.14.
> >
> > 1.14.1 is a bug fix release:
> > https://lists.x.org/archives/xorg-announce/2020-October/003061.html
>=20
> Dunfell is still at version 1.13, so this wouldn't be a bug fix version =
bump.

I see, well luckily 1.14 doesn't look too scary as well:
https://lists.x.org/archives/xorg-announce/2020-February/003038.html
https://git.openembedded.org/openembedded-core/commit/?h=3Dgatesgarth&id=
=3Dbf4ef2e3b376744b16c2f57725104207d23c28c6

If this is the only issue for building dunfell with host distro with
python-3.9 then I think it should be considered.

Isn't autobuilder using some new host distro with python-3.9 already?

FYI: I was seeing this with ubuntu 21.04, I'll trigger dunfell build on
it now.

> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../xorg-proto/{xcb-proto_1.14.bb =3D> xcb-proto_1.14.1.bb}     | 4 +=
+--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.bb =3D> xcb-p=
roto_1.14.1.bb} (84%)
> >
> > diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb b/meta=
/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> > similarity index 84%
> > rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
> > rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> > index 6de30098d6..52e474a2e9 100644
> > --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
> > +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
> > @@ -11,8 +11,8 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00d=
c0aba7 \
> >                      file://src/dri2.xml;beginline=3D2;endline=3D28;md=
5=3Df8763b13ff432e8597e0d610cf598e65"
> >
> > -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
> > -SRC_URI[sha256sum] =3D "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f=
36f1ecc79834416a605"
> > +SRC_URI =3D "https://xorg.freedesktop.org/archive/individual/proto/${=
BP}.tar.xz"
> > +SRC_URI[sha256sum] =3D "f04add9a972ac334ea11d9d7eb4fc7f8883835da3e485=
9c9afa971efdf57fcc3"
> >
> >  inherit autotools pkgconfig python3native
> >
> > --
> > 2.30.1
> >
> >
> >=20
> >

--nresoayngrsv7zby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEnfdAAKCRA3VSO3ZXaA
HBeSAJ4naVjWiDBXEMLfnAj5hbQduubSIwCfb5qf0Hpf3RhFhk5W5ZY96xseLzQ=
=1tym
-----END PGP SIGNATURE-----

--nresoayngrsv7zby--
