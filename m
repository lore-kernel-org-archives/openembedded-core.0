Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.2362.1614979193222899016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 13:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JccZ3EpW;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id h10so4577917edl.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 13:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6l2g60eoN+YUEEmWsJFaMFGw5Os6CJq2MuYqbbQHSHk=;
        b=JccZ3EpW1+PLRiLjVhK5AuJxsqSexkSGBHRRaq5K6rRDkAwgI70aG35pBqo1HVBK/S
         UAuGV6OKzpeeYk3Gm45N+1IwlH1iOMLdT+PBR7D8anCnvodQVOpAzLzc6j36hT+6KG9G
         Rrm9262N/qFvT5TKbEV7d9bMy89aYbppP2jx5lTWQSzGZ2hiiiJKh7r8F6NUF7ecY1aH
         VixFVzpOoe+uWcDlQutMQ50DPcINitKOmeAgyeUDMbhy7Iwv4v8DlBEKAfS2Ss2/mJRY
         b9p1RgV5cXi8FUEoTbJ14/TvrIwgCDjw5rFHzen6bag13QWXR80bmnBUWCmbhaUXTK+b
         pFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6l2g60eoN+YUEEmWsJFaMFGw5Os6CJq2MuYqbbQHSHk=;
        b=T+D+nQ2+K3GxZgveSFExpu/cTE4LzW8blqNg19z0AUvfohXds42zckgoNR4npoOBTx
         FiOFDm7Re+aR2kgEA7S1JzBHYLxx4VCb7Kqu3TP2VLAo0woa9h1tECF+6gbJKAnlvfjv
         smTPaHU1LoTKYjs3857MBNoJI5Pyy+9GcgQRXhoUbPh//2FUZuz5gOB9G1QTOBSJX6vG
         lNinKoqdswfVJpn106JiZEkoNm9llz6yEZpaVWw/f7wgGGTOHce6dwLKUuVap9qiqfUf
         9bAZ6ooeCbP4Ec0CXrGEi1jqt5DJcAxJvando7k39AI2n/WbO+Jy+duzc33L78cBeUoM
         N0RQ==
X-Gm-Message-State: AOAM531r8cU9PcvGHz9NhTtUDdw3cG+dUhCQPFbNLRyagmxVChf8qTHX
	c2D6k8ZCfuPP5EqJtjGcB4c=
X-Google-Smtp-Source: ABdhPJyODQEyj99DkkWTrVAIUDtvTBokIp95JElzIZ4wzGV9Shhmmd9WInr0BsJDxtwTiQRuwwAVxw==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr11029967edw.14.1614979191739;
        Fri, 05 Mar 2021 13:19:51 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i6sm2076201ejz.95.2021.03.05.13.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:19:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Mar 2021 22:19:50 +0100
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"anibal.limon@linaro.org" <anibal.limon@linaro.org>,
	"geoffhp@gmail.com" <geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Message-ID: <20210305211950.mcfntduav7rwpffj@jama>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
 <16696CDA6651CD2C.16425@lists.openembedded.org>
 <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
 <20210305115050.chhf5zf357wns3xl@jama>
 <38592c5c6824461687563ed1a52913eb@XBOX03.axis.com>
 <b9ceb42871b6bfa49caaf1bb86ae6627154688d4.camel@linuxfoundation.org>
 <5aea5e8a740f4079beb62be11234cc4c@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <5aea5e8a740f4079beb62be11234cc4c@XBOX03.axis.com>
X-Groupsio-MsgNum: 149066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a6hq2zisvkqierni"
Content-Disposition: inline

--a6hq2zisvkqierni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 08:21:10PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 5 mars 2021 18:54
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Martin Jansa
> > <martin.jansa@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org; anibal.limon@linaro.org;
> > geoffhp@gmail.com
> > Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISD=
IR
> >=20
> > On Fri, 2021-03-05 at 15:52 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Martin Jansa <martin.jansa@gmail.com>
> > > > Sent: den 5 mars 2021 12:51
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: openembedded-core@lists.openembedded.org; anibal.limon@linaro.o=
rg;
> > > > >
> > > > > Actually, thinking a bit more on this, I believe that with my pat=
ch
> > > > > applied, this patch should _not_ be applied. That is because it
> > makes
> > > > > the paths relative to thisdir, but then uses ${THISDIR} when using
> > > > > them. Thus if thisdir is normalized, it may no longer match
> > ${THISDIR}
> > > > > and the relative paths will not work as intended.
> > > >
> > > > I'm sorry I've tested and wrote that part of commit message when I =
had
> > > > if os.path.exists(filename):
> > > > at the beginning of this whole section, which I've then re-wrote to
> > just
> > > > store only existing filenames in files as a list instead of a map (=
to
> > > > simplify the rest of this function as well), but then I was wonderi=
ng
> > > > why Ross used the map in the initial implementation here:
> > > > https://git.openembedded.org/openembedded-
> > > > core/commit/?id=3D5acd9cbc9d5c6355010775250fb25f043441c5cd
> > > > and assumed it was needed to get all possible filenames in
> > > > do_configure[file-checksums] in case they are created later.
> > > >
> > > > So I've removed all my cleanups and returned to smallest change to
> > just
> > > > replace COREBASE with THISDIR.
> > > >
> > > > What about checking the existence before showing the error, that wi=
ll
> > > > show an error only when matching file exists while keeping all
> > > > not-skipped paths in do_configure[file-checksums] even when they do=
n't
> > > > exist yet.
> > > >
> > > > Will send a patch for this shortly.
> > >
> > > Any objections to my patch, where there is no need for the bb.error()
> > > in the first place?
> >=20
> > Your patch encodes the paths of layers relative to each other into the
> > sstate checksums. I'm not sure we want to encourage that and this code
> > will end up copy and pasted around without people realising what they're
> > doing :/.
>=20
> Hmm, I guess that may be considered bad. :/
>=20
> > Cheers,
> >=20
> > Richard
>=20
> Then we will have to decide on what to do with the cross-files. Currently=
=20
> the code tries to handle cross-files provided by any layer, but with the=
=20

I wouldn't say that by using FILESPATH it really tried to handle
cross-files from other layers.

> recent changes and without mine it really only supports specifying=20
> cross-files in the same layer where the recipe is. So we will either have=
=20
> to find a way to actually support cross-files from multiple layers, or=20
> we may as well rip out the current attempt at supporting it.=20

And replace it with what?
https://git.openembedded.org/openembedded-core/commit/?id=3D5acd9cbc9d5c635=
5010775250fb25f043441c5cd
wasn't added to support cross-files from other layers, so we still need
this for the cross-files in oe-core, right?

Now it will just refuse to consider cross-files when they are outside
oe-core while showing an error, instead of silently making signatures of
glib-2.0 and everything depending specific to the build path where it
was built.

And as small benefit of using THISDIR it will also work when you copy
glib-2.0 and all its cross-files to some other layer (like somebody
did @LGE when backporting newer glib-2.0).

--a6hq2zisvkqierni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEKgdAAKCRA3VSO3ZXaA
HKjWAJMGVD5K8rSNun/KEPMUZ9F/UVDLAJ93akD/7U5FpX8Lo7I0BNEfLz5F3Q==
=4XLH
-----END PGP SIGNATURE-----

--a6hq2zisvkqierni--
