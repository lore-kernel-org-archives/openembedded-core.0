Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A3BC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:21:07 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by mx.groups.io with SMTP id smtpd.web12.729.1664990466368127216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mqGKo3pj;
 spf=pass (domain: bootlin.com, ip: 217.70.178.240,
 mailfrom: thomas.perrot@bootlin.com)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9D688CE053
	for <openembedded-core@lists.openembedded.org>;
 Wed,  5 Oct 2022 16:10:24 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BF85D240002;
	Wed,  5 Oct 2022 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664986221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M/vg7UvC7zhoWv7omJBeIyL2Err1VHG3sIFJes3YKxs=;
	b=mqGKo3pju6qo0lGvkcaPMPAKanKgGY0P0/JHIaRzO6BgbD4UQAaSTVO3KjQFqZ7zyCRysX
	AfnYcbdV0vlIRKE1fN+7B58ZOUvVLuRRyj3lqtdqJ5w2tvMmhdU9q0cyWx0Rrug2BGUpED
	o5gv8krk1hOABiBoiwZBZJ55fPufIn9KIszC2jvmXtUw6wItKQmQZqSIZskCq1NSf1Xeb/
	VyyCJ7OWRtl8GDFjmcf0BNIr2c9ODPGQhednjT59lVWjjufI4ypyR7/ulx1/gI/OcF4MYN
	1VSyJF5AkvjZQO5Ojtne5B1yQ9orEW91yA+9OaafcQW0rOCxXXu5hOd6FwNUoA==
Message-ID: <20929425292b86e535e9e86c599c5e9b60406c82.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Oct 2022 18:10:19 +0200
In-Reply-To: 
 <CANNYZj9zy23Vud+41johxrg6MTvx-rZAWQbKmB52NMYBjgYp4w@mail.gmail.com>
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
	 <CANNYZj9zy23Vud+41johxrg6MTvx-rZAWQbKmB52NMYBjgYp4w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nnGEqSX1Hp+I2S+iYlrX"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171474


--=-nnGEqSX1Hp+I2S+iYlrX
Content-Type: multipart/alternative; boundary="=-PP28F05+ZDuDR+DWmau0"

--=-PP28F05+ZDuDR+DWmau0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, 2022-10-05 at 17:31 +0200, Alexander Kanavin wrote:
> Has this regressed at some point? Why was it not needed before?

This issue occurs when the rrecommends are not installed.

Kind regards,
Thomas

>=20
> Alex
>=20
> On Wed 5. Oct 2022 at 17.01, Thomas Perrot via lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > Otherwise, it isn't possible to interact with the UI.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > b/meta/recipes-sato/images/core-image-sato.bb
> > index e63a229d1257..0e37c15097b3 100644
> > --- a/meta/recipes-sato/images/core-image-sato.bb
> > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > @@ -12,6 +12,8 @@ inherit core-image
> > =C2=A0TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool nativesdk-gli=
b-
> > 2.0"
> > =C2=A0TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D " nativesdk-
> > intltool nativesdk-glib-2.0"
> >=20
> > +IMAGE_INSTALL:append:qemuall =3D " kernel-module-virtio-input"
> > +
> > =C2=A0QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > 512", "-m 256", d)}'
> > =C2=A0QB_MEM:qemuarmv5 =3D "-m 256"
> > =C2=A0QB_MEM:qemumips =3D "-m 256"
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171465):
> > https://lists.openembedded.org/g/openembedded-core/message/171465
> > Mute This Topic: https://lists.openembedded.org/mt/94137249/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-PP28F05+ZDuDR+DWmau0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"overflow-wrap: break-word; -webkit-nbsp-m=
ode: space; line-break: after-white-space;"><div>Hello Alex,</div><div><br>=
</div><div>On Wed, 2022-10-05 at 17:31 +0200, Alexander Kanavin wrote:</div=
><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729=
fcf solid;padding-left:1ex"><div dir=3D"auto">Has this regressed at some po=
int? Why was it not needed before?</div></blockquote><div><br></div><div>Th=
is issue occurs when the rrecommends are not installed.</div><div><br></div=
><div>Kind regards,</div><div>Thomas</div><div><br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 5.=
 Oct 2022 at 17.01, Thomas Perrot via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:bootl=
in.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div>Otherwise, it isn't possible=
 to interact with the UI.<br></div><div><br>Signed-off-by: Thomas Perrot &l=
t;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_blank">thomas.per=
rot@bootlin.com</a>&gt;<br>---<br>&nbsp;meta/recipes-sato/images/<a href=3D=
"http://core-image-sato.bb" rel=3D"noreferrer" target=3D"_blank">core-image=
-sato.bb</a> | 2 ++<br>&nbsp;1 file changed, 2 insertions(+)<br></div><div>=
<br>diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato.bb</a> b/meta/rec=
ipes-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D"noreferrer" t=
arget=3D"_blank">core-image-sato.bb</a><br>index e63a229d1257..0e37c15097b3=
 100644<br>--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato.bb</a><br>+++ b/m=
eta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D"norefe=
rrer" target=3D"_blank">core-image-sato.bb</a><br>@@ -12,6 +12,8 @@ inherit=
 core-image<br>&nbsp;TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool na=
tivesdk-glib-2.0"<br>&nbsp;TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext=
 =3D " nativesdk-intltool nativesdk-glib-2.0"<br></div><div><br>+IMAGE_INST=
ALL:append:qemuall =3D " kernel-module-virtio-input"<br>+<br>&nbsp;QB_MEM =
=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", =
d)}'<br>&nbsp;QB_MEM:qemuarmv5 =3D "-m 256"<br>&nbsp;QB_MEM:qemumips =3D "-=
m 256"<br></div><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br></div><div>Links: You receive all messages sent to this group.<=
br></div><div>View/Reply Online (#171465): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/171465">https://lists.openembedded.or=
g/g/openembedded-core/message/171465</a><br></div><div>Mute This Topic: <a =
href=3D"https://lists.openembedded.org/mt/94137249/5443093">https://lists.o=
penembedded.org/mt/94137249/5443093</a><br></div><div>Group Owner: <a href=
=3D"mailto:openembedded-core+owner@lists.openembedded.org">openembedded-cor=
e+owner@lists.openembedded.org</a><br></div><div>Unsubscribe: <a href=3D"ht=
tps://lists.openembedded.org/g/openembedded-core/unsub">https://lists.opene=
mbedded.org/g/openembedded-core/unsub</a>&nbsp;[<a href=3D"mailto:thomas.pe=
rrot@bootlin.com">thomas.perrot@bootlin.com</a>]<br></div><div>-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div><br></div></blockquote></di=
v></div></blockquote><div><br></div><div><span><pre>-- <br></pre><pre>Thoma=
s Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

</pre></span></div></body></html>

--=-PP28F05+ZDuDR+DWmau0--

--=-nnGEqSX1Hp+I2S+iYlrX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmM9rGsACgkQn8ALBXH+
Cu1lEwv/dTKjYxyXTPNXVAJL5a82XtE3wuptHrL/p806tdLJ+HUwL7N94XIkvg2H
pBGQWqf663Kj0N5fE20T6qtRG/eeU6m0i5Y225kxVXqTl0uNC3KZzbYfZVLYm5U8
nJf+SfuQkGNED+wEE2BIZpxDmaEl+7hAdMHraUrsj+QKvHi0XFMcb3i3Yevojo1Y
LXI4Ypjd4JstXLmV6F+BDn028l4/r7tx8BE9feo91c4Jcp++RdV00c5Cxa64jKl4
PTlHcbNUkz0cZ4hoA9OAUQvozdlm5+OU+Ro0POfVEzaukm/oskZ+TnL+NDzVywh7
VNPAxo7jtjW4E8bf77vMbbo4c5E94TUkNqnAgwk4wRJYuTuoMOr7MBFtY16kUA8j
kKV6eRYMVlHlJDNQmkeZsf2deBde//lh1cLJ+EAYx/N1sV/xQVpUTJAsd5gz0hnI
7cUB2QLY+tNMZahNkwDXI35fi32DkJaiujYDCE63VLragI5YmgU72IvAGbNk6hKT
skYcESdJ
=fw5R
-----END PGP SIGNATURE-----

--=-nnGEqSX1Hp+I2S+iYlrX--

