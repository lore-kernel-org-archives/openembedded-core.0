Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51300C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:11:26 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9206.1637165485543146269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YTKmHMuu;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id r11so13413318edd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=6Uey5G/UXsWPLhGS4R1vXhk4ju+9oWgBUywfJ6Zy18Q=;
        b=YTKmHMuuV7hf5SMgahRd+xYTLCYPYda5kLT+oISW3mxyrLtAaT7gBiV3ukqfqo/2KW
         gtwB36MWKsM+o74MGae5KUrgNqddto8f+NH6VUSUzepWYOXXEeXsXwmGKPk694a5KNGt
         D3So+m9zkbqhKu1cK0bb89VVpZfNLLY0b9hb6FG56Fa2jALiXSe/H3qpFa1m0KC2ysOY
         bV6DBWWm3PlhD+c4OE27cvBroCBnYH11R4yY2OT5wocpA68MiM62I2vQMr05UB1Q4kTF
         ISPyhp+LplKA/1zg4jpVnvYReUYlzmXZvCF/q1IoOSmBGqt6XbWwCrOKvHCv1c4U/Cq5
         pnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=6Uey5G/UXsWPLhGS4R1vXhk4ju+9oWgBUywfJ6Zy18Q=;
        b=p4/McmFV5eyB9OrXr5cmMtHRIP8r4mWC8aHaauiF4e2Kriz6dp8CvN40oiBr57PhNZ
         32LyGEyvDGUbE4zC8SuiGXc6BOZrGAlHX238XGIBzodAqMnk/Zw1xczgO1XNlwZ8YNmM
         jaGbt0UzoiwHZzfQIAX17a6VqND0OtUvc6I+Sw7g9Q+483kiZwWj+ZuAS25AOaLh4rRA
         7t/y5+HkbCJ2dU/YODAp7qekkO4tlFJujcTT0TH3H8/D7LsLFNKJCT/wwNt9erChtYeU
         XeV7aomzFgpkmz46WMNA3h7BupRvbMl7THCzoxxxeK6dROqmaBVrVLX8RgX0WhRkQ8GH
         tKFA==
X-Gm-Message-State: AOAM533D3rXBfVt/AK6sH3sUHOWLFifpuyZbxrEMc7TuKn+KhcaYDh2U
	g2MGSApiRUMli2shnE31vr8=
X-Google-Smtp-Source: 
 ABdhPJw2wMK9vBo6XN/gDyK15CAcW13v/M7Uiab4e7qZ3uMWRiGonyrV1YCm5mGdMXuXQ8Ybv9iwaw==
X-Received: by 2002:a17:907:1c15:: with SMTP id
 nc21mr23911533ejc.510.1637165483517;
        Wed, 17 Nov 2021 08:11:23 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id r7sm148870edd.5.2021.11.17.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 08:11:22 -0800 (PST)
Message-ID: <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 16:11:21 +0000
In-Reply-To: 
 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
	 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
	 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Auq8ln6hRtmOVL/N51R6"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 16:11:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158432


--=-Auq8ln6hRtmOVL/N51R6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 16:07 +0100, Alexander Kanavin wrote:
>=20
>=20
> On Wed, 17 Nov 2021 at 15:59, Luca Boccassi <luca.boccassi@gmail.com>
> wrote:
> > On Wed, 2021-11-17 at 13:53 +0100, Alexander Kanavin wrote:
> > > Shouldn't this be enabled in regular yocto builds first, e.g.
> > allow
> > > systemd-native and then add the needed checks to systemd.bbclass?
> > > Maybe nativesdk support isn't then needed at all?
> > >=20
> > > Alex
> >=20
> > I'm not sure I follow, that would break the build? These changes
> > are
> > necessary to make it work. I am including the package in the local
> > sdk
> > configuration, without these patches it does not build.
> >=20
>=20
>=20
> What I'm trying to say is running those systemd analyzers should be
> enabled in regular yocto builds first before it's enabled in SDKs.
> It's not a good idea to have a feature that is available in SDKs but
> not available in direct use of bitbake to build recipes.
>=20
> Alex

But it is already available? And it has been for a long time:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/syste=
md/systemd_249.5.bb#n411

> >=20
> > > On Wed, 17 Nov 2021 at 13:32, Luca Bocassi
> > <luca.boccassi@gmail.com>
> > > wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >=20
> > > > systemd-analyze in the next release will gain the ability to
> > > > run the 'security' and 'verify' verbs offline, on local units.
> > > > This is very useful at build time and/or in CI systems to
> > detect
> > > > errors and issues before changes are deployed, as a static
> > > > analyzer tool.
> > > > This series enables building the systemd recipe for the
> > nativesdk
> > > > targets, so that systemd-analyze can be included in the SDK and
> > > > called by users/build systems/CI systems.
> > > >=20
> > > > Luca Boccassi (8):
> > > > =C2=A0 systemd: skip chown when building for nativesdk
> > > > =C2=A0 systemd: skip postinst in nativesdk builds
> > > > =C2=A0 systemd: remove /var in nativesdk builds
> > > > =C2=A0 volatile-binds: remove /var in nativesdk builds
> > > > =C2=A0 volatile-binds: add nativesdk
> > > > =C2=A0 kbd: add nativesdk
> > > > =C2=A0 os-release: add nativesdk
> > > > =C2=A0 systemd: add nativesdk
> > > >=20
> > > > =C2=A0meta/recipes-core/kbd/kbd_2.4.0.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-
> > > > =C2=A0meta/recipes-core/os-release/os-release.bb=C2=A0 =C2=A0 |=C2=
=A0 2 ++
> > > > =C2=A0meta/recipes-core/systemd/systemd-conf_1.0.bb |=C2=A0 2 ++
> > > > =C2=A0.../systemd/systemd-serialgetty.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 ++
> > > > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb=C2=A0 =C2=A0 | 29
> > > > +++++++++++++++++--
> > > > =C2=A0.../volatile-binds/volatile-binds.bb=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 7 +++++
> > > > =C2=A06 files changed, 41 insertions(+), 3 deletions(-)
> > > >=20
> >=20


--=-Auq8ln6hRtmOVL/N51R6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVKakACgkQKGv37813
JB6SXxAAyShxpq+lUYY5A43CoDWxaIIRSjXtev7kOZUFztAICg29A4AV7zoUwbVx
Ofn5c+09cjLW6JVlo3IXL3K2HPiu5V6USZAqUnOvllKgvIIXo4qSHbEbZ3KQw992
uogN8ZF/fI8Z3iv1cIrlQFXKRaGIu1wn4UUDD5wFoa3RgTo6/znAYkXvXOQN9w2A
QmCBKh4lr3/ejtBisUbM1SfD9sRA8ppV2p33yX797Ic9aVZ1pbtGPuvv+vzuEzN2
ZH+MVfN5kVjm6x+HCbmnN2y80VUCyDUurUw0VZSGlmGX7gCCof3aeSMTjPrixmUQ
3PYjI1LGVGJgT6qYH+QIS9y/+OWBELj/q0hZrSnOB9cOwDLaW2+EMA40f/nNFo1A
fl+OjSwF+O+ecwevh/xA3rKzZdS0R7bzkxWJ2MTfh1KZZI9KRmUJD/poPoxew2H2
Xp/Q+0zGrhgRbd/ZeDby0lsseJIVPKc1+IBUNGPZM1rjXaxWhXROpKrIECNB6sLp
QQkM01f1qgGA65a/mz4DBNnD7rM4JN1BfirXGzpR0UIPKk7Ake5k2Q6vOiIf1W/1
Kqd7b6YYt0DIU1nNLSuqY1I06kU9qINvCw+tFgfi3byDXYtXONhPqFQC5Ywx5fKq
q4A9wuM7RldUS2Hkorv1JCvGLOfgnynO3VLBU+nEnltT6udri4k=
=DVEY
-----END PGP SIGNATURE-----

--=-Auq8ln6hRtmOVL/N51R6--


