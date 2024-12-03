Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D790EE64AAD
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:07:54 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.20620.1733234873157116918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 06:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 454041505;
	Tue,  3 Dec 2024 15:07:50 +0100 (CET)
Received: from [192.168.178.67] ([79.219.235.82]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tITZ5-476R3Q0; Tue, 3 Dec 2024 15:07:47 +0100
Date: Tue, 03 Dec 2024 15:07:46 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <YK8XNS.89RO2UFNG11R1@t-online.de>
In-Reply-To: <827A4F56-2328-4ED9-9E3E-6096EAC35E46@arm.com>
References: <20241130085222.17448-1-f_l_k@t-online.de>
	<827A4F56-2328-4ED9-9E3E-6096EAC35E46@arm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1DCO7oNVptxO1Ve9LP2D"
X-TOI-EXPURGATEID: 150726::1733234867-527ECDD7-1F247843/0/0 CLEAN NORMAL
X-TOI-MSGID: 720b647d-5d03-4b3a-8a5a-643122cac71e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208215

--=-1DCO7oNVptxO1Ve9LP2D
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

Got it. Currently I have issues to access the gnome gitlab. Will send a=20
patch there later

On Tue, Dec 3 2024 at 12:42:10 PM +00:00:00, Ross Burton via=20
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>=20
wrote:
> On 30 Nov 2024, at 08:52, Markus Volk via lists.openembedded.org=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>  Add a recipe for pam_wrapper, needed to build the tests
>>=20
>>  [<https://gitlab.com/cwrap/pam_wrapper>]
>>=20
>>  Import cmocka recipe from meta-oe
>> =20
>> [<https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-te=
st/cmocka/cmocka_1.1.7.bb>]
>=20
> Adding two new recipes for tests that we don=E2=80=99t even build yet alo=
ne=20
> install or run doesn=E2=80=99t seem like a good idea.
>=20
> I still think my original comment holds up: a patch to add a=20
> =E2=80=98tests=E2=80=99 option to meson which wraps all of the test cases=
 (and=20
> their dependencies) so we can disable the tests entirely should be=20
> upstreamable and mean we don=E2=80=99t need dependencies for tests we nev=
er=20
> build.
>=20
> Cheers,
> Ross
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208187):=20
> <https://lists.openembedded.org/g/openembedded-core/message/208187>
> Mute This Topic: <https://lists.openembedded.org/mt/109845617/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-1DCO7oNVptxO1Ve9LP2D
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Got it. Currently I have issues to=
 access the gnome gitlab. Will send a patch there later</div></div><div id=
=3D"geary-quote" dir=3D"auto"><br>On Tue, Dec 3 2024 at 12:42:10 PM +00:00:=
00, Ross Burton via lists.openembedded.org &lt;ross.burton=3Darm.com@lists.=
openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plai=
ntext" style=3D"white-space: break-spaces;">On 30 Nov 2024, at 08:52, Marku=
s Volk via lists.openembedded.org &lt;<a href=3D"mailto:f_l_k=3Dt-online.de=
@lists.openembedded.org">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt;=
 wrote:
<blockquote> Add a recipe for pam_wrapper, needed to build the tests
=20
 [<a href=3D"https://gitlab.com/cwrap/pam_wrapper">https://gitlab.com/cwrap=
/pam_wrapper</a>]
=20
 Import cmocka recipe from meta-oe
 [<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/re=
cipes-test/cmocka/cmocka_1.1.7.bb">https://git.openembedded.org/meta-openem=
bedded/tree/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb</a>]
</blockquote>
Adding two new recipes for tests that we don=E2=80=99t even build yet alone=
 install or run doesn=E2=80=99t seem like a good idea.

I still think my original comment holds up: a patch to add a =E2=80=98tests=
=E2=80=99 option to meson which wraps all of the test cases (and their depe=
ndencies) so we can disable the tests entirely should be upstreamable and m=
ean we don=E2=80=99t need dependencies for tests we never build.

Cheers,
Ross</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208187): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208187">https://lists.openembedded.org/g/openembedd=
ed-core/message/208187</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109845617/361=
8223">https://lists.openembedded.org/mt/109845617/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-1DCO7oNVptxO1Ve9LP2D--


