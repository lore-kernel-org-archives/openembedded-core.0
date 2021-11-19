Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09440C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:55:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.7944.1637322947572127636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8YaaSA8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id y13so41504168edd.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=3nZkXGXi0d6T+WewVMPlXmtba1mo9fNv1QFZ0Kfj6Wc=;
        b=m8YaaSA8gSe0swM+Ow5pIPr9DR0jufSvFnQFwW0S3bTkQSSVkzsCCWMdui0UG/3Zll
         iHSCIlF651AhyrmG/ajeWmvgoWv8l3WNJ6At9Z6RaeeqHd4t5E1a6tVkfoPyCxCGPLI6
         eO08R40eUsqZZi2YOueqS74aJUkjgkRjGHwGtoipju/AphnyzH7FAizMxw4oqb7UVkkX
         t6ru7kYFJWGG4jawXTuwMOzyACLeOiK0OWha0YjzvRmH5ZgV8AIZiig3G2gAa3K97uxB
         TAqzvN2MFetfSewrYqRIZQEb11JFgdOQeFnsIj9dbhWVM4UxwrUzYCD5vJD0mqKlTOeo
         yQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=3nZkXGXi0d6T+WewVMPlXmtba1mo9fNv1QFZ0Kfj6Wc=;
        b=xw3UdvQuRZsIC6zMXrA4yR5DVydEFYFqscZBQv5/bVOipZ/Ib6ZUxV5hj6PzfMQGEW
         hU1Y2epGCA5az7H0QSYgCKmmifbafMoMgxa+Oqc0gJuxNarFt4gtNj5MreEYAGhbGMYp
         cIV7Zuax9u3uKJjiT0bhJVPlaJ9a2Br+hurfHMNEdiyzb6Zr1a9jiYJ0lqlSNXETdHuh
         LOqs3aTau06DKCtWFr01TZsHDS44c0BXqJWjZ/tEW3Gi5lmR9oEpwIjQ5l6tIaEzlsE1
         gFuB1/SJ+wsqjN4r7cvxcwZn4bT+RdzvMbkdNOvJ3jDoj1AFbTMXTUfffHXGYROWfOpl
         YSbQ==
X-Gm-Message-State: AOAM53196EPRIx2ob1OEEEiLHtufLZQQadAe03jELqegOQSodpSvW0aK
	o7BZKRk5TbmsdVuOb7iBXN0=
X-Google-Smtp-Source: 
 ABdhPJyj196ARVplE/ZcFLi/yWtFRape9e2P4aMOJ9pa9ZoEsZIu3/pVczdViruHpLeac2zT22/g8w==
X-Received: by 2002:a17:906:af1a:: with SMTP id
 lx26mr7192927ejb.44.1637322945617;
        Fri, 19 Nov 2021 03:55:45 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 m22sm1310080eda.97.2021.11.19.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:55:45 -0800 (PST)
Message-ID: <80c83ead864e1fd716d4ed532bb8bb5ba94d21b5.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] systemd: add nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	paul.eggleton@microsoft.com
Date: Fri, 19 Nov 2021 11:55:43 +0000
In-Reply-To: 
 <CANNYZj9Hf-fFaXDScePBNQ8vdoJ9zhZWTgaNU7AiMtkPr7fzJA@mail.gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-7-luca.boccassi@gmail.com>
	 <CANNYZj9Hf-fFaXDScePBNQ8vdoJ9zhZWTgaNU7AiMtkPr7fzJA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z5vMSXJstOz8MrH5eOrq"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:55:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158517


--=-z5vMSXJstOz8MrH5eOrq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-11-19 at 12:39 +0100, Alexander Kanavin wrote:
> Once again, I do not want this accepted in oe-core, not until there's
> equivalent native functionality.
>=20
> Alex

As already mentioned, that's completely unrelated, and I do not have
the time nor the interest to invest weeks of my time working on that.
But arbitrarily rejecting patches is your prerogative of course, so
I'll just keep these changes out-of-tree then.

> On Fri, 19 Nov 2021 at 12:35, Luca Bocassi <luca.boccassi@gmail.com>
> wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Allows using tools like systemd-analyze at build time and in
> > CI systems
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > =C2=A0meta/recipes-core/systemd/systemd-conf_1.0.bb=C2=A0 =C2=A0 | 2 ++
> > =C2=A0meta/recipes-core/systemd/systemd-serialgetty.bb | 2 ++
> > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++
> > =C2=A03 files changed, 6 insertions(+)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > index 61ce7939d3..84de4d17cf 100644
> > --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > @@ -41,3 +41,5 @@ FILES:${PN} =3D "\
> > =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system.conf.d/ \
> > =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/network/ \
> > =C2=A0"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > index 7ca951cdbd..f877e6ad18 100644
> > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > @@ -50,3 +50,5 @@ FILES:${PN} =3D
> > "${systemd_system_unitdir}/*.service ${sysconfdir}"
> > =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >=20
> > =C2=A0ALLOW_EMPTY:${PN} =3D "1"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> > b/meta/recipes-core/systemd/systemd_249.5.bb
> > index 2928a85c93..445a50b1e3 100644
> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > @@ -773,6 +773,8 @@ ALTERNATIVE_TARGET[runlevel] =3D
> > "${base_bindir}/systemctl"
> > =C2=A0ALTERNATIVE_LINK_NAME[runlevel] =3D "${base_sbindir}/runlevel"
> > =C2=A0ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
> >=20
> > +BBCLASSEXTEND =3D "nativesdk"
> > +
> > =C2=A0# Nothing picks up /var in the nativesdk case
> > =C2=A0do_install_append_class-nativesdk () {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}/var


--=-z5vMSXJstOz8MrH5eOrq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGXkL8ACgkQKGv37813
JB5qwBAA0myqEb/kayJxKbsaDwMkrDHyK80Ze33fIpV3uwYYjkvF9OZslCW5Zig+
B8Ednb+d8muYdW5oHjHTNkU4Um1hHQcayticvBwBEycF/WmuI4ya3/aepFEahF6w
ABfkW1q7dwZ7ARFkyvp6xFa4AMtmdetP+JJIu17hrmeS6RlF8cwohClQosBf/ztV
6JxuAA1eCga7mGp7kRaTr5i94bSWp/SJ1kwegr2YYRgeo1xb8a8n5aDiFzV6+ZED
lRHi2sTDFvQtDZWHPT/5GiXc9lPrcG+I4Z+N7K0ujEkfGExPD13kaSk1hOwfZ5S8
UecD1Sccc2qU3zyF4nNhdxDtaT5VH2dp5FMl1PgcayzjTSg/5SyE6R4Uv83jRgGr
Ny8t2H1WZa1hGMWlTOe1InohhkxBX/yz6nEKkJ7yP7Dy2aH89bjveTDAXroLlLqS
rIDuVcC7kp9tkcW/buOBqMx1Fpcs8GqceS77AUsxS7u3ZOVoXVt+ikZoVSJqfFSz
URHfoGxGOVcecxRjZQ+fnGEfFfCYuv3tdvyAmEGXUT+AJHh5frHKQ2EC73g0AmTE
JdR9Cty5KyEKRCltLPdRxclkDuh1n/VrPW5jELaQgVe/nDOWbAU45Pby6eLY/x1d
ReAiIxmeb6hgr43j6XrfrThyI4ZMnNZk6r6/ewQWlqy0wqR2ET0=
=XcRU
-----END PGP SIGNATURE-----

--=-z5vMSXJstOz8MrH5eOrq--


