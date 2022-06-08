Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B92EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:07:27 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web08.3653.1654672041088022848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.197,
 mailfrom: marcel@ziswiler.com)
Received: from [10.0.0.147] ([31.10.206.125]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0Lhgpj-1nLhXa3qGP-00mp63
 for <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 09:07:20
 +0200
Message-ID: <523055072271ae397582baf881e279ee2268e5d3.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v2] gstreamer1.0-plugins-bad: add libavtp
 packageconfig
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jun 2022 09:07:17 +0200
In-Reply-To: <20220531213624.7414-1-marcel@ziswiler.com>
References: <20220531213624.7414-1-marcel@ziswiler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:c4uYZH+OOBOvReXoEZwrFmttgovujnMf8YX5UTiCNGoJPSoZNfH
 kmjtmG5kk443kcUlWxly29u5CawHj8C0K92Yd0Jx01MwvWj/di0nUmh0PeOC0mQ0cYWm1s9
 Nb5TkrInhkoAx2xRHeWGgFJcXmyqxhAmZB8H6+pVRizohI3aoE2JRC98J4ozGRRb5sJJzWN
 CqbTbUIHmaJs+z3BlEwsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K/IMiO+t+LQ=:gSGF67y3r1gJQ4w8p+3HVL
 j0fwzOYXprZx6Q/MTSQScDtNpnymnc08ubGdc9KWCoD8k1MTrAYS6j7WUrB2LRJpUh/TkTSX0
 iLScQA/w6UvTIFYqveFP0VhOnIUDcHKOnc7HlxxGmVRSu2ONU5z3W99/fqgQ1dFShbLc8v2Dn
 mwVaqjVX/Y83wGCpqHamF6C7ZwxM6LIT4bstKhM446VouN1zS36dMmERUcCAP2r+S+gUICCtT
 3KyYb8muhS62dxKJkh3ga5rdGIrBijuEHOAFXxxXYkn/F6t+1SzPTwrG6U3vLOK7NK8ONtvtP
 MQIWPOYaDVSyAyzQV+yJmgtmATwRZSfzTGjWpvxQval67kZ9ULV1aSSDUL1HMwLoepD5HY1xO
 GuhuKslgLSa7mpHlcJdllDCfxas8/VMCtW1e5gx8DB/tSddU2Fjv5ooE82GepJbRs2hKFZNrg
 oFD+cSNVMCpEQdH1xyCinTjV2Xp30f7CcMRQvvPFFhn4kwyDS9UmovI7S5ea+38gTZPcft7cw
 jmp2vAGOz2So52lv83F3emLLiZuKgeqVa10T+zfyOXr7diRaSYnqM7v68vrDUxQRiy1t1g9jM
 P8QLgL6gYWfsAmlVzZov+G+aWWYxwNQtI73M2MrTs2xc9np91bzA2t74icMgTia0xCfGjW+FK
 UjuydZm5tzcbY8iOFJ6QcLzKbHmz25nhilrFc1R3ZrfB2zWL2d20/VdXbTd3IFnxjT7rhq5Lg
 5kClBgY7SzZLembILMEVH/CK4Gm/tbxquCpn2w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:07:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166692

On Tue, 2022-05-31 at 23:36 +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> Add avtp resp. libavtp PACKAGECONFIG. This allows building them
> GStreamer Audio Video Transport Protocol (AVTP) Plugins which rely on
> Avnu's libavtp.

Gentle ping on this one now with the other two related patches having been =
pulled to master [1] resp. meta-
openembedded/master-next [2].

Thanks!

[1] https://github.com/openembedded/openembedded-core/commit/8824d91fe20631=
95014c38c134b97946d3b429c2
[2] https://github.com/openembedded/meta-openembedded/commit/bb575718e146b6=
6f23f2fc151fbb1e453b9f89ae

> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
> End-to-end tested on Verdin iMX8M Plus.
> Will talk about it at the Embedded World Conference in the TSN & Linux
> track next month [1].
>=20
> [1] https://events.weka-fachmedien.de/embedded-world-conference/program/
>=20
> Changes in v2:
> - Rename avtp to libavtp in the subject to make this more clear.
>=20
> =C2=A0.../gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.20.2.bb b/meta/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
> index bb33e3822e..53c78d4366 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.b=
b
> @@ -35,6 +35,7 @@ PACKAGECONFIG ??=3D " \
> =C2=A0
> =C2=A0PACKAGECONFIG[aom]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D "-Daom=3Denabled,-Daom=3Ddisabled,aom"
> =C2=A0PACKAGECONFIG[assrender]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "-=
Dassrender=3Denabled,-Dassrender=3Ddisabled,libass"
> +PACKAGECONFIG[avtp]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "-Davtp=3Denabled,-Davtp=3Ddisabled,libavtp"
> =C2=A0PACKAGECONFIG[bluez]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "-Dbluez=3Denabled,-Dbluez=3Ddisabled,bluez5"
> =C2=A0PACKAGECONFIG[bz2]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2"
> =C2=A0PACKAGECONFIG[closedcaption]=C2=A0=C2=A0 =3D "-Dclosedcaption=3Dena=
bled,-Dclosedcaption=3Ddisabled,pango cairo"
> @@ -112,7 +113,6 @@ EXTRA_OEMESON +=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dandroidmedia=3Ddisabled \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dapplemedia=3Ddisabled \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dasio=3Ddisabled \
> -=C2=A0=C2=A0=C2=A0 -Davtp=3Ddisabled \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dbs2b=3Ddisabled \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dchromaprint=3Ddisabled \
> =C2=A0=C2=A0=C2=A0=C2=A0 -Dd3dvideosink=3Ddisabled \

