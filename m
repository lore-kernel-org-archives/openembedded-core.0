Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E18C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:19:17 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.web10.1395.1744741148550117741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 11:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=YwFMOU8R;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.196, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1744741147; x=1745345947; i=marcel@ziswiler.com;
	bh=dB2ZvOZznZ44S9z2fpBQiL7+T0NGmjtYJ7huUCbtBO0=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YwFMOU8RaCNvJz1uhTIDbQyI3oKMqg1pmO0Ck1mUNDXSahcwGd2mKWbl43DQL4IR
	 IxoeyYtORQynXEkHEUGeM0glee6oaMNKkwQf2FJH/U8HgrfiGIcNWaK4dWV+XHDjF
	 DZiOCpmOvKLQWk1rYtoLHBe2Nr4mxjy63womlFHJKOG4xW0inNrRRfD7pDgueGf1K
	 JhL7lUxCwZSUyxcXQsaEHhOXumTM/cL5SIEWnw/u6bXHGEuNkkhon7USJxnKOW9xC
	 /LKhL/qhcJYoJ6PaGVVTtmm51xEkqfzQAbrHrVcmvMknV/WvWdS2U5KZcOl2Onv7b
	 hCzZ9FMwTgMeqWNzwg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.17.2.242] ([167.98.27.226]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1Mzh89-1t9mX52c1B-013i2Z;
 Tue, 15 Apr 2025 20:19:07 +0200
Message-ID: <1ed1a7a1079041f487987c0b9b701b4298144bce.camel@ziswiler.com>
Subject: Re: [PATCH v2] bmaptool: upgrade 3.8.0 -> 3.9.0
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Fabio Estevam <festevam@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Date: Tue, 15 Apr 2025 20:19:03 +0200
In-Reply-To: <20250415175130.887427-1-festevam@gmail.com>
References: <20250415175130.887427-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:vkN9motYSC3xbFlpMdTTAyUBz3uFFXyEXNmGvYKfCskuFTAinD2
 rPk+zkjRF0gFA47OJKUrL0PY+8byc9Opz7jsKUHCMPOj3siibm4qcPw8onmt3LdTiN5Wbe5
 QmuwPxlNhLqXsHJCjuxoh8YHREzoaGnMTHdgj9lpsYZMmhm/8Qd5A0xYtFYmrIIkH9fJmmc
 Dmtd0yeIwD8NY2a7tMOSQ==
UI-OutboundReport: notjunk:1;M01:P0:AAT8WW24LQc=;qeFpNZ96TJxztKuin5qDUD4Nr0w
 SWnHaSbgttNDRELxIF6NOSYzDB1mwW+9RPX54IuxlYebJ3kgNQb/TByuinf0jyXuaYWZLukss
 WORFmGEjQV6qeTJhbTpBDp6ULMH8lZHCvxU7gWFjsJ/3mOQQlcTj2NNE7Xtxx3rG5fSbI0mw/
 oaMAzMxy28KffD4bXYM3nXfZlZsNJCjAaUPcdRp7c3whohdW3B4LQRf3Jy86CHjQ4TWSKxu8Q
 T+jO8RLf0Eti749Wqg9QtF2SDWKHM8FjzHzC8uTKXMFY5o00kN2WWdhsR5s9ertpdUpICZWey
 +P1KgKIY7sGv/3DCTp259Vfoo/73HvpspoHA8n3oPIE+smrS5bJ5dyceQi51Av+LyhFFAqCop
 KL902lJt428LG12HFdhaPuoFGj4GDkgQRu26dA6Zi9HHzcOUVP7TAIOYcXocH4bKhQHJ7JHRd
 nbiYK5iOUmNITczsek8751q6icOtH20fZOny3mzYB+FBh9N6nVK80a2QhybUwRDvGGu6IAV2P
 ZkHkIQwozTlvkH92tP9Z0A+8gu85xRyqs+7JDkEqPGBViPLEz6IXib7iIWzUj61O3UZGwUcNg
 5kTk8gFONygV2fWTE4/2ltbCV085EVwIFCwATJjDMRS0ViJ4D9fymjanZBlfYoAxSenyYdylR
 XFDpGEHwvr3p6Bt7ZCmp0z8XJMzlzkQAb+uQc4jSj1tgJx7tlFjeqmeVfp2fA6nv6hgfzipVL
 7f5Ecgf4QtBza5LRmoIW78YyUpD+Woiv//uyw9OB8wUiNyW7mT0UFhZt4kY4+ojykPEWdpNv+
 rEf94KHU8iaesRVxZnTJqZySZkXfOOyPMilS1Mr2l6dQTT33EypZb1ADV+aPQImN0umim4Erj
 oFSxGSznTPJOOO3AAfXPkI9U4QsX6HiDeETbcni8ClQq29tZjp+tHOzf7B2VsIpeomUprqNGF
 B3T6uhfYjhGxkMSCfgM7TnpIGJbpv+QTV4xWNCT7UWJz15JJ77Qxu65DDj5k70Z3Jr5P/XUbu
 lRPfzpW79Vzaa8eKxz5gSkTpiViJygr2kQOeTBY+NJbvCY0ZKt9+VUOHMGhwJvusUqE0akKyv
 f2WKdDanQsFua4P0V66JDjuTxsRTGp7ZVJg1CsB5iLtoLq5hQ5E+CXaqOfsU553QiDMeBK/G4
 E3eruc/lHbMH1Ku0RDfOkdTGiKnNEpaLkc1hVoauFS30U9jCsrCbBcCNgpEl7nn3d242NwcHq
 od3dEabK57B2hb1SJq/VadzAJIfJCgR39jLLT8mscouif5P5iYGxBApPgzJI4wrgzuyWqaXxw
 2CNt+3d5wpHtmS1aoYoSjBE2D4G3GSQhNSep7wr463qXLeSEa55k+M9IaR0yP1nt9M29unIfL
 5RA/PkKZFjp4Pv3o2m9yv4yX4OjGAO2xXAUP38lwUJXC82oym6gpJQYhib
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 18:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214960

Hi Fabio

Long time no see (;-p).

On Tue, 2025-04-15 at 14:51 -0300, Fabio Estevam via lists.openembedded.org=
 wrote:
> From: Fabio Estevam <festevam@gmail.com>
>=20
> Update to the 3.9.0 version.
>=20
> This version has switched to use hatch as the build backend, so adjust it
> accordingly.
>=20
> The INSANE_SKIP can now be safely removed as explained by
> commit 824009560776 ("bmaptool: temporarily silence the pep517-backend wa=
rning).
>=20
> python3-six is no longer a runtime dependency since bmap=20
> commit a67976e80daf (""Remove six from production code), so remove its

I guess you wanted them quotation marks be around the commit subject : )

> RDEPENDS entry.
>=20
> Signed-off-by: Fabio Estevam <festevam-ynQEQJNshbs@public.gmane.org>

Reviewed-by: Marcel Ziswiler <marcel@ziswiler.com>

> ---
> Changes since v1:
> - Remove python3-six from RDEPENDS.
>=20
> =C2=A0meta/recipes-support/bmaptool/bmaptool_git.bb | 11 ++++-------
> =C2=A01 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes=
-support/bmaptool/bmaptool_git.bb
> index c38f05e1a1..155dd0ac80 100644
> --- a/meta/recipes-support/bmaptool/bmaptool_git.bb
> +++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
> @@ -10,23 +10,20 @@ LICENSE =3D "GPL-2.0-only"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
> =C2=A0
> =C2=A0SRC_URI =3D "git://github.com/yoctoproject/${BPN};branch=3Dmain;pro=
tocol=3Dhttps"
> -SRCREV =3D "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
> +SRCREV =3D "618a7316102f6f81faa60537503012a419eafa06"
> =C2=A0S =3D "${WORKDIR}/git"
> -BASEVER =3D "3.8.0"
> +BASEVER =3D "3.9.0"
> =C2=A0PV =3D "${BASEVER}+git"
> =C2=A0
> =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> =C2=A0
> =C2=A0# Need df from coreutils
> -RDEPENDS:${PN} =3D "python3-core python3-compression python3-misc python=
3-mmap python3-setuptools python3-
> fcntl python3-six coreutils"
> +RDEPENDS:${PN} =3D "python3-core python3-compression python3-misc python=
3-mmap python3-setuptools python3-
> fcntl coreutils"
> =C2=A0
> -inherit setuptools3
> +inherit python_hatchling
> =C2=A0
> =C2=A0# For compatibility with layers before scarthgap
> =C2=A0RREPLACES:${PN} =3D "bmap-tools"
> =C2=A0RCONFLICTS:${PN} =3D "bmap-tools"
> =C2=A0
> -# Poetry backend appears incomplete, upstream has moved to hatch
> -INSANE_SKIP =3D "pep517-backend"
> -
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214959): https://lists.openembedded.org/g/openembedde=
d-core/message/214959
> Mute This Topic: https://lists.openembedded.org/mt/112281471/4454657
> Group Owner: openembedded-core+owner-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@pub=
lic.gmane.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[gchoc-open=
embedded-core@m.gmane-mx.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

