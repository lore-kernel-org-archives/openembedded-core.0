Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.7971.1615476964118367073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qqzpGl6b;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dx17so47098138ejb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q+/lpLMIlAFWjeGN7AE0VCWpVOoBydpMjbQw9BZg84Q=;
        b=qqzpGl6bIAPCMn8C2/gT3n5QIUJopBqksLUAcgQFbPZFFHO6TJp4HGi9+jTQpi76S8
         S8MRIsx2OJTSJPBn7N9pOEevtCKKKBW0DRCj1gCW9bx/SEqWYTfyW9qOdR9/sSNbh+Nn
         m/utF8aym8OI0/7iGlvJDq2nT/Yh+89i9nryokntn3cBRdP1t583/9GsQ8m/NgGJZyCX
         c8eiko1LwZ67/WFLTgELrT0M6JCft1ikXNh821M2lf+6M7SecgYyGQZhH9FUtayubkMx
         bmRzwm+jochTmgV/K6ygFikzarcG2gT6ntgB3mPXpzR/b8Y7l0Iwyy6+oTGtT0MXpF5U
         X7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q+/lpLMIlAFWjeGN7AE0VCWpVOoBydpMjbQw9BZg84Q=;
        b=tfKEX7eawubIaoZ4VexWHXgHwnnygFnOT65HTynsMug2Sd4i9dctTnwfZKkQo0SYV8
         b7LNg8HF8S2n4iz6viiBcWdczROv5mBHVw3BJN6ukbgNTrJo+S2HgXScqbZLz9GwB1QS
         qBik9X0k2IFQ5njGgnTeEwk/VCt2V/Df4SIORa/utGtqwDXVtWu0Cv0pmYAi2HjKGxmL
         7rxd78Q6O+Oi8S3gHYNpiYC6vlhvprMJCY08en8CZ65IbI93d9Gr1lt/CmM9V8ujgUgT
         S3mosfieHWVWFGJ23MK0XUSfKS7JGGoxD7aWol8+xLESR9I5g9BXD0cb2ezGQ5ZHlmbb
         KqAg==
X-Gm-Message-State: AOAM532wN60YQeWg6BrGfK5Rk+nHSvjaX4jSyxSVy9VqHg5DuyvOEU+D
	aVll6mlGRB/gA7TYDWLG/0k=
X-Google-Smtp-Source: ABdhPJyGipCydSSW+wx6gq+Gdh3dSxLbkv8JI1X6yU/MRCbitugS0Fi/ru87VeFkumy9AKmcl+KCug==
X-Received: by 2002:a17:906:f01:: with SMTP id z1mr3778783eji.235.1615476962478;
        Thu, 11 Mar 2021 07:36:02 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n2sm1504582ejl.1.2021.03.11.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:36:01 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 16:36:01 +0100
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Anibal Limon <anibal.limon@linaro.org>,
	Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
Message-ID: <20210311153601.ootfsyrek7lmebu5@jama>
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
 <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
 <20210311091428.2a3nissv6eebjpzq@jama>
MIME-Version: 1.0
In-Reply-To: <20210311091428.2a3nissv6eebjpzq@jama>
X-Groupsio-MsgNum: 149299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tix6cwxx6uh4ewrt"
Content-Disposition: inline

--tix6cwxx6uh4ewrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:14:28AM +0100, Martin Jansa wrote:
> On Wed, Mar 10, 2021 at 04:33:02AM -1000, Steve Sakoman wrote:
> > On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.com> w=
rote:
> > >
> > > From: Richard Leitner <richard.leitner@skidata.com>
> > >
> > > This fixes [1] the following build error for nativesdk on Fedora 33
> > > which is caused by the removal of fractions.gcd() in favor of math.gc=
d()
> > > in python 3.9 [2]:
> > >
> > > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/py=
thon3.9/fractions.py)
> > >
> > > Furthermore the SRC_URI is adapted as the old one doesn't provide the
> > > 1.14.1 archive.
> > >
> > > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae=
35bee1fa0fdb8b5120b1dcd20cee6e34512
> > > [2] https://bugs.python.org/issue39350
> > >
> > > It's needed in gatesgarth and possibly dunfell as well to support
> > > distributions with python-3.9 as we build libxcb-native, which is
> > > failing with xcb-proto-1.14.
> > >
> > > 1.14.1 is a bug fix release:
> > > https://lists.x.org/archives/xorg-announce/2020-October/003061.html
> >=20
> > Dunfell is still at version 1.13, so this wouldn't be a bug fix version=
 bump.
>=20
> I see, well luckily 1.14 doesn't look too scary as well:
> https://lists.x.org/archives/xorg-announce/2020-February/003038.html
> https://git.openembedded.org/openembedded-core/commit/?h=3Dgatesgarth&id=
=3Dbf4ef2e3b376744b16c2f57725104207d23c28c6
>=20
> If this is the only issue for building dunfell with host distro with
> python-3.9 then I think it should be considered.
>=20
> Isn't autobuilder using some new host distro with python-3.9 already?
>=20
> FYI: I was seeing this with ubuntu 21.04, I'll trigger dunfell build on
> it now.

At least for LuneOS images this was the only build issue I've seen with 21.=
04.

Together with an warning about glibc:
WARNING: Your host glibc version (2.33) is newer than that in uninative (2.=
32). Disabling uninative so that sstate is not corrupted.

which I see you're going to address in new PR with uninative upgrade.

Cheers,

--tix6cwxx6uh4ewrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEo44QAKCRA3VSO3ZXaA
HIGJAKCY4DdCcdQb+isE5yhr7F8cKUa+PwCgjw7flyEYp7JkzLnuEieM78cG6UQ=
=L58Z
-----END PGP SIGNATURE-----

--tix6cwxx6uh4ewrt--
