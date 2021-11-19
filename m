Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78A5C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:26:28 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.7636.1637321187780692294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aqXY2inv;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r25so4451720edq.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=SobXb+z/TO6Aw84RdsIEqUEhwtWJXEhfreVt46LUpxA=;
        b=aqXY2invHsB1osfTgt9J7tD9EKh3vP7GC8wclPgSmCFZMczsRkb+uf7emKdPT79RrC
         pKjetm4boHcstt/LU3YO/ZV9ctnni7DQG402goCx5w2LxlPp9Ebfc+AQcni0w4B8pE4G
         jovH8F0yGnZKFFRJ3QwEV7lp8w9XOuZg01J76O3K8jNY85FhkQ0mdN7HQDTxhmm4CO8O
         a6goD794jWQT9dgOUb6XTM/htdzzYRqeW3kGbteDV96gfcCKULxJ+y4bqQ2TTus3tr6F
         Uz0t9K8hqLpjD4lGikEh0EcIQEKwkekT+dreC3c/sAWNoXrz7E1Tw1LmPZ+j1Rtyfvfk
         m29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=SobXb+z/TO6Aw84RdsIEqUEhwtWJXEhfreVt46LUpxA=;
        b=rqETQ1kMZs1ETl3y5wBz//QVTYB0nIWJYOF8QkFTyIjjikjFqxVTV6qQcXLIkLcGU1
         AmwE60h3DabB83uyJHixlxwc26+VdMbQyOnnnKoCEL5lttGSzV/dmiiCWOQ8eiQ2HbtF
         uNXhk4b2JX44rFtFaiJ21hDFuNoRJHehH2DMIten5MSntVXPX3pzKIHDxbnJdD3QV/Vr
         sBtLxNAr17ZtdkPuJQhn/iaHUFf3U5N5pIDybinjmhdmZxtVZBr7umXINxFoLlSJPl77
         cWgOTUVoVY3bek4jtHaVsrbNsiOuYVVc69+DLSKT+jjRgau7B5lNG0dFGD0PW45Rhyms
         CzwQ==
X-Gm-Message-State: AOAM532knSmh4umywHx07mtNio8+ZKlY5+rLDg2snnr+baG0Y7VKUJ+t
	ertI3t3JqmGy/T2Yk+dfqwk=
X-Google-Smtp-Source: 
 ABdhPJzcZLMFxbbT2MsXzII1rKKxo2I4EDeOsqlvd4ei0sMcrSjK8xz/Z5UKix6s9x0L03DTFXEqCg==
X-Received: by 2002:a17:907:6ea8:: with SMTP id
 sh40mr6735187ejc.53.1637321185851;
        Fri, 19 Nov 2021 03:26:25 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 d3sm1340656edx.79.2021.11.19.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:26:25 -0800 (PST)
Message-ID: <7d5674bcfdd7de854cf8bfa431c1c46373f426d3.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Fri, 19 Nov 2021 11:26:23 +0000
In-Reply-To: <2f667850-b6f6-e7e8-5aef-41b2d0e64b5f@windriver.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <2f667850-b6f6-e7e8-5aef-41b2d0e64b5f@windriver.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x0c/PAz/pwdjVCtAdiqd"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158505


--=-x0c/PAz/pwdjVCtAdiqd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-11-19 at 09:43 +0800, ChenQi wrote:
> Hi Luca,
>=20
> If the real useful part is only about systemd-analyze in case of
> nativesdk/native, I'd suggest adding systemd-analyze-native or
> nativesdk-systemd-analyze instead of extending the current systemd
> recipe.
> This is because systemd has a whole bunch of dependencies which
> basically make no sense in case of native/nativesdk. Looking at the
> src/analyze/meson.build file, I guess it could be built
> independently.
>=20
> Regards,
> Qi

Hi,

Building individual binaries like that is not supported, so it cannot
work.

> On 11/17/21 8:31 PM, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> systemd-analyze in the next release will gain the ability to
> run the 'security' and 'verify' verbs offline, on local units.
> This is very useful at build time and/or in CI systems to detect
> errors and issues before changes are deployed, as a static
> analyzer tool.
> This series enables building the systemd recipe for the nativesdk
> targets, so that systemd-analyze can be included in the SDK and
> called by users/build systems/CI systems.
>=20
> Luca Boccassi (8):
> =C2=A0=C2=A0systemd: skip chown when building for nativesdk
> =C2=A0=C2=A0systemd: skip postinst in nativesdk builds
> =C2=A0=C2=A0systemd: remove /var in nativesdk builds
> =C2=A0=C2=A0volatile-binds: remove /var in nativesdk builds
> =C2=A0=C2=A0volatile-binds: add nativesdk
> =C2=A0=C2=A0kbd: add nativesdk
> =C2=A0=C2=A0os-release: add nativesdk
> =C2=A0=C2=A0systemd: add nativesdk
>=20
> =C2=A0meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
> =C2=A0meta/recipes-core/os-release/os-release.bb    |  2 ++
> =C2=A0meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
> =C2=A0.../systemd/systemd-serialgetty.bb            |  2 ++
> =C2=A0meta/recipes-core/systemd/systemd_249.5.bb    | 29
> +++++++++++++++++--
> =C2=A0.../volatile-binds/volatile-binds.bb          |  7 +++++
> =C2=A06 files changed, 41 insertions(+), 3 deletions(-)
>=20
> =C2=A0
> =C2=A0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158384):=20
> https://lists.openembedded.org/g/openembedded-core/message/158384
> Mute This Topic: https://lists.openembedded.org/mt/87118013/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
> =C2=A0


--=-x0c/PAz/pwdjVCtAdiqd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGXid8ACgkQKGv37813
JB4D0hAArUjlWZA9fn1ECgyuV5JH7TJUYe1pQ1SpWDUqmkJiu8u41JHtqGvFKnon
lkNF5qox1xFR8zskdkCOosPRAWLj2V+Vli4LGRCs10VuF/6OXoCBThH0CAyeCu5v
pIIIr+9sRE00FMC7rHS0wFtWrFmJ9GXsuxuwnHq8Bu8eS5Snz2zHJBt2XXDb/rXr
V8ZvGfbbUQoekBUkxnPAmllBzWwzFtkY87rxQSz/EqHQFmd2D6zq6jbDqhO4L4Fv
Zy2G0QopL4XF4Q3snBkQQi3sHau1mb3SD8e1rgPjdcW6Q7mNs85wgpVdRVg/ggHj
Gv685a2HNxx/JqEbt7jCfZvUlXa6Ne1WkL9Lz4R3OkuzwWh1xcdHbK8Q0wWyXOmE
MosvFKzsAiEV2tLDK6GfjSvq5OvNOVRJm3gEetF1Ym0SbNGxDWX3gqtPtwisZzPI
SffdNCFCC5sw3vXNSGt2N+EnjNL2kFnxepfZ1qd4yRuWOsWdRqzJbR/19OXtGnsM
DB8kX9JaRnVUxpb+aS/PAYq+dHVnda/oMdVquC8TnMTYU4Kww4OZ3ckFHrAz9K4v
QdkRlDslGGXMAx+gOtmohzFUdeI6gS7iBsKZKzwuZ5hE5mzZi9/9CglDWLxYfPqa
v6Nwow1ZZqWxZPVINjpn9yeL98s7m1SVrstGXQzUSQTmCvTAQlI=
=rqMX
-----END PGP SIGNATURE-----

--=-x0c/PAz/pwdjVCtAdiqd--


