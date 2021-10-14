Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119CFC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 11:57:17 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.8440.1634212631023790812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 04:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1460A240011;
	Thu, 14 Oct 2021 11:57:06 +0000 (UTC)
Message-ID: <d6abdc4079f0a42533f66f7c722fa5f8fe146e3f.camel@bootlin.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/reproducibile: Include rust
 packages
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, pgowda cve
	 <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <rwmacleod@gmail.com>, alex.kanavin@gmail.com, umesh.kalappa0@gmail.com
Date: Thu, 14 Oct 2021 13:57:04 +0200
In-Reply-To: 
 <4f24a96686d8fc2035e84d10822447c0991552ac.camel@linuxfoundation.org>
References: <20211008083758.156759-1-pgowda.cve@gmail.com>
	 <7c45856599d0602f115788604a07b0105cd762aa.camel@linuxfoundation.org>
	 <CALY4987+J53GmzMtgzma=J1AtjvV+k3WwOrHgfDF-J2cr18rpw@mail.gmail.com>
	 <4f24a96686d8fc2035e84d10822447c0991552ac.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uHGyAHVRCse8gkHx6H4B"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 11:57:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156936


--=-uHGyAHVRCse8gkHx6H4B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pgowda,

On Fri, 2021-10-08 at 13:34 +0100, Richard Purdie wrote:
> On Fri, 2021-10-08 at 17:29 +0530, pgowda cve wrote:
> > Hi Richard,
> >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/=
764
> >=20
> > Thanks very much for sharing your inputs and comments on the issue.
> >=20
> > I could see some more builds where rust exclusions were unused:-
> > Some of the example builds are:-
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/757
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/755
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/751
> >=20
> > Can you please let me know about this inconsistent behavior?
>=20
> The reproducible test runs on different hosts and has two builds it
> compares.
> The first build can come from sstate. The second build is built on the
> specific
> worker the builds runs on.
>=20
> We can see from my link above that the build that shows reproducibility
> issues
> ran on fedora33 so it is probably something specific to that distro.
>=20
> The most likely way to reproduce the issue is therefore to build on
> something
> like an ubuntu system and compare the packages with those built on a
> fedora33
> system.
>=20
> > I will try to check the issue based on your inputs.
> >=20
> > I tried to build the reproducible with and without rust exclusions on
> > many poky sources.
> > Could not see this error on any sources ranging over the past two
> > months.
> > More details on the issue are shared at:-
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14525
>=20
> It sounds like you're only testing on debian whilst the autobuilder has
> multiple
> different hosts which is the difference.
>=20
> Cheers,
>=20
> Richard
>=20

There is a new occurrence of the reproducibility issue on Fedora 33 :
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/782/step=
s/12/logs/stdio

Best regards,
Thomas

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156782):=20
> https://lists.openembedded.org/g/openembedded-core/message/156782
> Mute This Topic: https://lists.openembedded.org/mt/86165875/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[thomas.per=
rot@bootlin.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-uHGyAHVRCse8gkHx6H4B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFoGxAACgkQn8ALBXH+
Cu1jXQv+NwKmDMWK4fkolrcHGxrTdvXph6epeewBPdnLqPmFDr5CHp3CiHr1zs6m
KvTJBszXNs3uq9OvoxfZ7qe42zaVke8fW6Lvh0T51GyG39HDj1ybwEmLiCuKmlfO
RGhNe7BL260zO4BAz6fGnACsP9cU4Fa/kJax6QE1vFBi80uLBY8QkacItoUIGJ6N
rjuwd5R+pomZcc6IKaXn8jqFsL0SAkf0D4Yd1Xf9Tz9KEuSKKyz6hJFJAPmJasj+
oXMZLga4Uu8vev5Z3xlz120Ec6kWBi2kV3PtFi8pRAlRsgr8BmX3Wj3oSL2VvqaG
AAvGX/XOJf61xotlWkcCzvBBBtRrlk5Bn0U2ON8Hud6hAMdSPoHN//t9KL/IYgwD
Y/HUOe1lpJQn+ecoEbFAbC9pNcFfg2tHzREAdK2rrlGW2sjT7cJUrguYVoHYU36j
lO1nxeHpEgu9BNMWOBxzzEws30H5QQy46NlntQQm6yaqKfRsAV2idwzq2vSjjF+z
HLvbX3fD
=wOth
-----END PGP SIGNATURE-----

--=-uHGyAHVRCse8gkHx6H4B--


