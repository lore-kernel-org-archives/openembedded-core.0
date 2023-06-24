Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C09EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 06:48:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.12352.1687589324656344049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 23:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id A98DB7B9E;
	Sat, 24 Jun 2023 08:48:37 +0200 (CEST)
Received: from [192.168.178.156] ([84.154.170.124]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qCx4X-4QQX8y0; Sat, 24 Jun 2023 08:48:37 +0200
Date: Sat, 24 Jun 2023 08:48:31 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] python3-pygobject: disable features_check for
 class-native
To: Ross Burton <Ross.Burton@arm.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Message-Id: <V8WQWR.DNXH8T226OY2@t-online.de>
In-Reply-To: <6214B370-3EAD-4D61-91AA-1DCA4D1B5212@arm.com>
References: <20230623175013.103510-1-f_l_k@t-online.de>
	<6214B370-3EAD-4D61-91AA-1DCA4D1B5212@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CLsWJvV5k5rwmmfyai9G"
X-TOI-EXPURGATEID: 150726::1687589317-38D2AD37-EFF4C640/0/0 CLEAN NORMAL
X-TOI-MSGID: 258890c8-d21d-4012-b66d-cf73f45fe850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 06:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183359

--=-CLsWJvV5k5rwmmfyai9G
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

4 recipes in meta-gnome add 'python3-pygobject-native' to DEPENDS.
./meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6=
.bb:=20
   python3-pygobject-native \
./meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb:DEPENDS =3D "exiv2=20
python3-pygobject-native"
./meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb:   =20
python3-pygobject-native \
./meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb:   =20
python3-pygobject-native \

Though it seems to me that only the build of libgweather really needs=20
it.
<https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/build-aux/meson/gen=
_locations_variant.py#L7>
<https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/meson.build#L50>


However, I have found that I can build 'python3-pygobject-native'=20
without error using DISTRO =3D "poky". It seems that I have a local=20
problem that has caused it to stop working. I will take this=20
opportunity to clean up my local.conf and look for the bug. Sorry for=20
the noise

Am Fr, 23. Jun 2023 um 18:44:49 +0000 schrieb Ross Burton=20
<Ross.Burton@arm.com>:
> On 23 Jun 2023, at 18:50, Markus Volk via lists.openembedded.org=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>> =20
>> <https://git.yoctoproject.org/poky/commit/?id=3D1ee93dc114df26d94310682e=
6a632327e8bce062>
>>  mandates gobject-introspection-data DISTRO_FEATURE which is not=20
>> availabe for native.
>>  Thus python3-pygobject-native gets unbuildable
>>=20
>>  ERROR: Nothing PROVIDES 'python3-pygobject-native'
>>  python3-pygobject-native was skipped: missing required distro=20
>> feature 'gobject-introspection-data' (not in DISTRO_FEATURES)
>=20
> pygobject can=FFt work without g-i so this indicates that you need to=20
> fix a DEPENDS, not enable the building of an unusable recipe.
>=20
> Ross


--=-CLsWJvV5k5rwmmfyai9G
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>4 recipes in meta-gnome add 'pytho=
n3-pygobject-native' to DEPENDS.</div><div><div>./meta-networking/recipes-c=
onnectivity/networkmanager/networkmanager_1.42.6.bb: &nbsp; &nbsp;python3-p=
ygobject-native \</div><div>./meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0=
.bb:DEPENDS =3D "exiv2 python3-pygobject-native"</div><div>./meta-gnome/rec=
ipes-gnome/tracker/tracker_3.5.1.bb: &nbsp; &nbsp;python3-pygobject-native =
\</div><div>./meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb: &=
nbsp; &nbsp;python3-pygobject-native \</div></div><div><br></div><div>Thoug=
h it seems to me that only the build of libgweather really needs it.</div><=
div><a href=3D"https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/build=
-aux/meson/gen_locations_variant.py#L7">https://gitlab.gnome.org/GNOME/libg=
weather/-/blob/main/build-aux/meson/gen_locations_variant.py#L7</a></div><d=
iv><a href=3D"https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/meson.=
build#L50">https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/meson.bui=
ld#L50</a></div><div><br></div><div><div><br></div><div>However, I have fou=
nd that I can build 'python3-pygobject-native' without error using DISTRO =
=3D "poky". It seems that I have a local problem that has caused it to stop=
 working. I will take this opportunity to clean up my local.conf and look f=
or the bug. Sorry for the noise</div></div></div><div id=3D"geary-quote" di=
r=3D"auto"><br>Am Fr, 23. Jun 2023 um 18:44:49 +0000 schrieb Ross Burton &l=
t;Ross.Burton@arm.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plain=
text" style=3D"white-space: break-spaces;">On 23 Jun 2023, at 18:50, Markus=
 Volk via lists.openembedded.org &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@=
lists.openembedded.org">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt; =
wrote:
<blockquote>=20
 <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D1ee93dc114df26d9=
4310682e6a632327e8bce062">https://git.yoctoproject.org/poky/commit/?id=3D1e=
e93dc114df26d94310682e6a632327e8bce062</a>
 mandates gobject-introspection-data DISTRO_FEATURE which is not availabe f=
or native.
 Thus python3-pygobject-native gets unbuildable
=20
 ERROR: Nothing PROVIDES 'python3-pygobject-native'
 python3-pygobject-native was skipped: missing required distro feature 'gob=
ject-introspection-data' (not in DISTRO_FEATURES)
</blockquote>
pygobject can=FFt work without g-i so this indicates that you need to fix a=
 DEPENDS, not enable the building of an unusable recipe.

Ross</div></blockquote></div>
--=-CLsWJvV5k5rwmmfyai9G--


