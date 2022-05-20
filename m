Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDAAC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:30:22 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.8194.1653049814953153633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FZ5N7ao+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6DDDD200017;
	Fri, 20 May 2022 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653049813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nW0SJ86d+3xVXIt5EVT7iCisuWbrjGYzO2NoEkUNU8k=;
	b=FZ5N7ao+QYV2Bd3kmwsWC4USCRKq9kkXgXvocRP9cXLgNDVHNkyVGLDU0K83qJ83Trov8q
	/0idcZBy3myywv1sp+yA+10CV6tDEDxsOYsermwCkeLAKoZKldCtHCRw32CrGnQ98ONf8+
	4SJ/vVGIl1pghPqjz0aR7I3iCBsTCBZhqrw1qYi4VSSANQju6vL3n90jHQQQ80AKTD5Jxe
	hczzYFCLUkdoOAp3iuN7kn7TwY7C50ELEjtPkvAeQuuhmblOCbyw71KK60zINYm9WuQLGb
	CVFvoUzlQgLdBvrW0eZARrBqKBTf0z/ljrYuIRqmCkoSf0fGdxYJts7VTUcgOA==
Message-ID: <4f4d15ca5a76650c374d0af976dae859519197e7.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation
 threads
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2022 14:30:10 +0200
In-Reply-To: <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
	 <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NGzv/DDdRS7B1RGlJVdT"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165930


--=-NGzv/DDdRS7B1RGlJVdT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jacob,

On Fri, 2022-05-20 at 14:19 +0200, Jacob Kroon wrote:
> On 5/20/22 14:16, Thomas Perrot via lists.openembedded.org wrote:
> > Otherwise the compilation may lead to out-of-memories.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0 meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > index 65757c36a733..e7cfe49e2b87 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > @@ -80,6 +80,8 @@ setup_python_link() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fi
> > =C2=A0 }
> > =C2=A0=20
> > +PARALLEL_MAKE =3D ""
> > +
> > =C2=A0 EXTRA_OECMAKE =3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0-DPORT=3DGTK \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0${@bb.utils.contains('GI_DATA_ENABLED', 'True', =
'-
> > DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
> > @@ -164,4 +166,3 @@ src_package_preprocess () {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> > =C2=A0=20
> > =C2=A0 }
> > -
> >=20
>=20
> Why punish build machines with lots of RAM ? Maybe it could be set=20
> depending on available RAM/number of cores ?
>=20

Why not.

I tested on a build server with more than ~12GB ram available and 16
cores, then I tried to reduce the number of threads and when the value
is greater than 1 the build fails.

Kind regards,
Thomas Perrot

> Jacob
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165928):
> https://lists.openembedded.org/g/openembedded-core/message/165928
> Mute This Topic: https://lists.openembedded.org/mt/91229473/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-NGzv/DDdRS7B1RGlJVdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmKHidIACgkQn8ALBXH+
Cu3rvwv/RvOx7HdQll1Cqa9KwIdB8iSN+dpiXKAlGVjsIBifp4A9P/eKqPPXJgU1
BQHsW4epMr66IN+bDcnoCtCMCaKiJGCvqrdJcXMO5JVrmYMwmnMUfYvpEiCmOXkc
vfNbe+75X9tO25BZTM7Xii2UcXgW9f3qNKF5q5rFB9JDSShEYzfguHkvap4a6Ya3
IaxqHrdo+lHRk1BbN5UAJ6Wa4io0OZ7RrpvoLqIYUrZTXVZwXMMG0+smBTNlx6wd
9CqrCS/iUCDH9aqOd3Mx//JfEksm2Q35zB0C/qeDEPIz1b8MuBTSUMbGeOBeDTPB
/iaE61jlZN8XJ+Vu/lTOBdtBPNQFxPn0UDF6OEizhGOTgtlfCMr33QyjaGgCrLrE
Q2+Yj7MQUjxHjTrcbgMJ67STzcq2lHMYW3YNULG7ed2wZzILzNptUaW0/3wTvcZq
3fnetLSvsHInyn0jomvs6fnXEiE+Es1dQXm1qgWV4dQ8mP8AucQgVz/GWJhtufh+
zJQ7d+eh
=yb58
-----END PGP SIGNATURE-----

--=-NGzv/DDdRS7B1RGlJVdT--

