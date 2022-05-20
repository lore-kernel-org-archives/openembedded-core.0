Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEF5C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:35:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8240.1653050107413050049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nxdTaMty;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 46FB31C000D;
	Fri, 20 May 2022 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653050104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR40gvMtphf33nacgp9DvPQvbsMFgJzUdB8yjSSRGr8=;
	b=nxdTaMtyakh/UUebPY6BN3q6+rPuZmU0Kb4seLm9eY1k//S03RLjip0v+hDhKOm0Cct27x
	PZxPutyjGZqe5d96aZOiHcnpUdpnmmeHibDtoaCaKPDtZNo5d8Xdqf2cH6I6Dl1WLSQtJx
	pFyVd5o9q/pjSZLNAs4MqCU6Axz9ePIni3NwiIsNPwds76UxjxwA+RKDt6ee5Mm/Ksrw6H
	8AYOqBeYO/wVUzyqu7sUVcOMzYL4j09ZqzhYofv24U+l1rZOf3zOEjWlcm0xbwLOiRggB8
	S6eIJE7iQ0TbUEW1fl/NuKtuifF+d0a7GUhXEMlqtS5WAVR0IuqOtwQXbULoEQ==
Message-ID: <ce55c3f2351362441f335689b030bb22efa7cef6.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation
 threads
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Jacob Kroon
	 <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2022 14:35:03 +0200
In-Reply-To: 
 <CANNYZj-V-+YiX4vOEBrEBmaqN6Qdacwwu8soz47WcCQLcpZHeg@mail.gmail.com>
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
	 <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
	 <CANNYZj-V-+YiX4vOEBrEBmaqN6Qdacwwu8soz47WcCQLcpZHeg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dW8CQ09+BE91aYZ7sU2O"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:35:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165932


--=-dW8CQ09+BE91aYZ7sU2O
Content-Type: multipart/alternative; boundary="=-xOoIHi2D3dvvEMhOLEeO"


--=-xOoIHi2D3dvvEMhOLEeO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Fri, 2022-05-20 at 14:27 +0200, Alexander Kanavin wrote:
> The correct way to address this is to restrict the amount of webkit
> make jobs in site.conf, specific to the build host. Or add RAM.
>=20

I heard you

Kind regards,
Thomas Perrot

> Ale=C2=A0
>=20
> On Fri 20. May 2022 at 14.20, Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > On 5/20/22 14:16, Thomas Perrot via lists.openembedded.org wrote:
> > > Otherwise the compilation may lead to out-of-memories.
> > >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >=C2=A0 =C2=A0meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
> > >=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > > index 65757c36a733..e7cfe49e2b87 100644
> > > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > > @@ -80,6 +80,8 @@ setup_python_link() {
> > >=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> > >=C2=A0 =C2=A0}
> > >=C2=A0 =C2=A0
> > > +PARALLEL_MAKE =3D ""
> > > +
> > >=C2=A0 =C2=A0EXTRA_OECMAKE =3D " \
> > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPORT=3DGTK \
> > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.con=
tains('GI_DATA_ENABLED', 'True', '-
> > DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
> > > @@ -164,4 +166,3 @@ src_package_preprocess () {
> > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/WebKit2Gtk=
/DerivedSources/webkit2/*.h
> > >=C2=A0 =C2=A0
> > >=C2=A0 =C2=A0}
> > > -
> > >=20
> >=20
> > Why punish build machines with lots of RAM ? Maybe it could be set=20
> > depending on available RAM/number of cores ?
> >=20
> > Jacob
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165929):
> https://lists.openembedded.org/g/openembedded-core/message/165929
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


--=-xOoIHi2D3dvvEMhOLEeO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Hi Alexander,</div><div><br></div><div>On Fri=
, 2022-05-20 at 14:27 +0200, Alexander Kanavin wrote:</div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div dir=3D"auto">The correct way to address this is to restrict=
 the amount of webkit make jobs in site.conf, specific to the build host. O=
r add RAM.</div><div dir=3D"auto"><br></div></blockquote><div><br></div><di=
v><div>I heard you</div></div><div><br></div><div>Kind regards,</div><div>T=
homas Perrot</div><div><br></div><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"aut=
o">Ale&nbsp;</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri 20. May 2022 at 14.20, Jacob Kroon &lt;<a href=3D"m=
ailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><div>On 5/20/22 14:16, Thomas Perrot via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>&gt; Otherwise the compilation may lead t=
o out-of-memories.<br>&gt; <br>&gt; Signed-off-by: Thomas Perrot &lt;<a hre=
f=3D"mailto:thomas.perrot@bootlin.com" target=3D"_blank">thomas.perrot@boot=
lin.com</a>&gt;<br>&gt; ---<br>&gt;&nbsp; &nbsp;meta/recipes-sato/webkit/<a=
 href=3D"http://webkitgtk_2.36.1.bb" rel=3D"noreferrer" target=3D"_blank">w=
ebkitgtk_2.36.1.bb</a> | 3 ++-<br>&gt;&nbsp; &nbsp;1 file changed, 2 insert=
ions(+), 1 deletion(-)<br>&gt; <br>&gt; diff --git a/meta/recipes-sato/webk=
it/<a href=3D"http://webkitgtk_2.36.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">webkitgtk_2.36.1.bb</a> b/meta/recipes-sato/webkit/<a href=3D"http://we=
bkitgtk_2.36.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.1.bb=
</a><br>&gt; index 65757c36a733..e7cfe49e2b87 100644<br>&gt; --- a/meta/rec=
ipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.1.bb" rel=3D"noreferrer" =
target=3D"_blank">webkitgtk_2.36.1.bb</a><br>&gt; +++ b/meta/recipes-sato/w=
ebkit/<a href=3D"http://webkitgtk_2.36.1.bb" rel=3D"noreferrer" target=3D"_=
blank">webkitgtk_2.36.1.bb</a><br>&gt; @@ -80,6 +80,8 @@ setup_python_link(=
) {<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp;fi<br>&gt;&nbsp; &nbsp;}<br>&gt;&nbsp=
; &nbsp;<br>&gt; +PARALLEL_MAKE =3D ""<br>&gt; +<br>&gt;&nbsp; &nbsp;EXTRA_=
OECMAKE =3D " \<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;-DPORT=3DGTK \<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTIO=
N=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \<br>&gt; @@ -164,4 +166,3 @@ =
src_package_preprocess () {<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;${B}/WebKit2Gtk/DerivedSources/webkit2/*.h<br>&gt;&nbsp; &nb=
sp;<br>&gt;&nbsp; &nbsp;}<br>&gt; -<br>&gt; <br></div><div><br>Why punish b=
uild machines with lots of RAM ? Maybe it could be set <br>depending on ava=
ilable RAM/number of cores ?<br></div><div><br>Jacob<br></div><div><br></di=
v><div><br></div><div><br></div></blockquote></div></div><div><br></div><di=
v>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>Links: You re=
ceive all messages sent to this group.<br></div><div>View/Reply Online (#16=
5929): <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/165929">https://lists.openembedded.org/g/openembedded-core/message/165929=
</a><br></div><div>Mute This Topic: <a href=3D"https://lists.openembedded.o=
rg/mt/91229473/5443093">https://lists.openembedded.org/mt/91229473/5443093<=
/a><br></div><div>Group Owner: <a href=3D"mailto:openembedded-core+owner@li=
sts.openembedded.org">openembedded-core+owner@lists.openembedded.org</a><br=
></div><div>Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub=
</a>&nbsp;[<a href=3D"mailto:thomas.perrot@bootlin.com">thomas.perrot@bootl=
in.com</a>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>=
</div><div><br></div></blockquote><div><br></div><div><span><pre>-- <br></p=
re><pre>Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

</pre></span></div></body></html>

--=-xOoIHi2D3dvvEMhOLEeO--

--=-dW8CQ09+BE91aYZ7sU2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmKHivcACgkQn8ALBXH+
Cu1gwQv/WJrpyBS+YMDhcxPguodXr+/Ak38uwXzIVyt+D05MSFUR8eTVWmNTPF0I
eB8JtLP/U04GCH4d93sckvgP35bc4hwW7Nef6q2SYKxwWP6WcLC+jPixv5ncpM2O
PvmbAfWEWzHA7F3z4NtCDT9MdKq8Ir7HWaX23wd9GrlMQ8eGEJQYowj2mB1ue01g
nU7xBTltEr5HquiGnG4nhfN5cSITXrhLDLvVVC/gWTQDN0m++X5XshyPY2ztPR04
3pHyM8Khwo/T9OyvmZZ7971pTDxuh0r6xJ1YY09e+apjl9AdWnbOK1/49VnbM7z6
p62B4UkhlJ1Po+K4U0LPmthDrnSOFqCZtAXKoWMGENbjbEqOEgv7qTCj4Ux+A6RU
Ll+njrKYWNASvkIWEjECtCoW+pNoxbROWUuMQeBppSlRizKP4IcmC/ChtSaNFOSb
64NLeW2jap/AZuu5DJYg6RFG25ISF2Z4aOD02rL54Gwy9nAcQB7gOZCbhT1kNmLR
KuRtj/wX
=bPAf
-----END PGP SIGNATURE-----

--=-dW8CQ09+BE91aYZ7sU2O--

