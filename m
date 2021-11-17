Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DD4C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:00:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.8155.1637161200146132910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AXfRrHnu;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id z10so12344764edc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 06:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=B2YnrbjMjxDivJwPnqzXO2voqOQ2fJ8Dp7Nsfz9fFEY=;
        b=AXfRrHnu5Drohb2bP7kXNORvXGJ8+mmcVT6JWs3Z3R8qiMn9Ak9N1jkR3lMBSKlPBw
         9T+2WwMZduqBsnVxz9eMUVjbJatw5sIPezGGVqkiILbiJ5n/dwcE2r2lc9U3E43Y7C9M
         EETHBPR0pGDUnOqGloTd9jwBxu0OE8Kh6UfHEYHWFppqFekVsm/A5dPdIIswSMloGrQT
         yPdxbpAdnjl0q05QnFWDr3ZJNUP6sSxT8EYXCIh4cYXlGJGoc+dkZaslkKz4r03Ko7+l
         je+uTkvgqzOekqJh/2yIL/QyTfU2yxilnSh+O57+1wOR00oXm1kra0fTefWpE9A4A/3u
         ANsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=B2YnrbjMjxDivJwPnqzXO2voqOQ2fJ8Dp7Nsfz9fFEY=;
        b=nf3d+p47bQ9UF+DD3oyFUbPU1UBGTDGZK4FFCexCREOLvc2eIjd9PSjaO9LpyejtL2
         4FHqYcQ1Rl15f/rkrS75LQ4t7HVyTjrAJiote1mvi8EQ1QbnXwcwMbSZVdTb5DMPZXON
         97mK7RWNHaVNkfdzd5QeC55nzTUd3fcvk/F6e+JyhDplngpJkffTF8+N3ziNrt/STbhJ
         9aH7FWD5xYtaiGMk0tRs+GKn5Bmt+E/tlAGuSZGu8R9WoS0lZpG7YEB+ujLSWj5qXw8x
         ZU6bhI/S0BOsALFWoHvEZ33EFRpo9Y/knmIgnhlsm0iP0pm4Db9+Ue8fQyb7qnG27cja
         bZIw==
X-Gm-Message-State: AOAM531fgo1W14ZBFfi6fcmqpEBge/eKEAnDCXrOZQ03MHvw97srR7Hc
	7tOY5FaESkBQ8CitOOCJoic=
X-Google-Smtp-Source: 
 ABdhPJzVcIDWlMmPdAW01kypyHBh4SPOGP3F0KvqLz5Mx8TKFG+UJsJg4LxOHPkOEysUNnfKP4Owmg==
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr22792966edz.43.1637161198054;
        Wed, 17 Nov 2021 06:59:58 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id mp5sm65183ejc.68.2021.11.17.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:59:57 -0800 (PST)
Message-ID: <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 14:59:55 +0000
In-Reply-To: 
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2E+Xc58WVFL5itGCwFjO"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:00:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158394


--=-2E+Xc58WVFL5itGCwFjO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 13:53 +0100, Alexander Kanavin wrote:
> Shouldn't this be enabled in regular yocto builds first, e.g. allow
> systemd-native and then add the needed checks to systemd.bbclass?
> Maybe nativesdk support isn't then needed at all?
>=20
> Alex

I'm not sure I follow, that would break the build? These changes are
necessary to make it work. I am including the package in the local sdk
configuration, without these patches it does not build.

> On Wed, 17 Nov 2021 at 13:32, Luca Bocassi <luca.boccassi@gmail.com>
> wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > systemd-analyze in the next release will gain the ability to
> > run the 'security' and 'verify' verbs offline, on local units.
> > This is very useful at build time and/or in CI systems to detect
> > errors and issues before changes are deployed, as a static
> > analyzer tool.
> > This series enables building the systemd recipe for the nativesdk
> > targets, so that systemd-analyze can be included in the SDK and
> > called by users/build systems/CI systems.
> >=20
> > Luca Boccassi (8):
> > =C2=A0 systemd: skip chown when building for nativesdk
> > =C2=A0 systemd: skip postinst in nativesdk builds
> > =C2=A0 systemd: remove /var in nativesdk builds
> > =C2=A0 volatile-binds: remove /var in nativesdk builds
> > =C2=A0 volatile-binds: add nativesdk
> > =C2=A0 kbd: add nativesdk
> > =C2=A0 os-release: add nativesdk
> > =C2=A0 systemd: add nativesdk
> >=20
> > =C2=A0meta/recipes-core/kbd/kbd_2.4.0.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-
> > =C2=A0meta/recipes-core/os-release/os-release.bb=C2=A0 =C2=A0 |=C2=A0 2=
 ++
> > =C2=A0meta/recipes-core/systemd/systemd-conf_1.0.bb |=C2=A0 2 ++
> > =C2=A0.../systemd/systemd-serialgetty.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 ++
> > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb=C2=A0 =C2=A0 | 29
> > +++++++++++++++++--
> > =C2=A0.../volatile-binds/volatile-binds.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 +++++
> > =C2=A06 files changed, 41 insertions(+), 3 deletions(-)
> >=20


--=-2E+Xc58WVFL5itGCwFjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVGOsACgkQKGv37813
JB4hyhAAtsJ64PqZIb9t+dO6OzlM/HgHluFesdys3Pc7SXYINq1vzC04sz76UgQL
0gJRD2y/YHvCE8cZlPzokLd2PChrZvGKg814kVIPRuAnCsneE/zJ553RL+mfBWx2
Zhs4pe3e0IQOu7BTM67L15KktGnlqTJKYb2uSotD6ubQWdgVAKN/nIXi94iNYc/X
6qartzv6dKbowE1gcsjlkoilOzC3uueaev2IFOtipvvLxM7c3Ur3NUZEWMG9Ei2d
sW4umZDuyfv5fo59VWIHYXu+9isTi2SlHOPPd2vsv51TPx2frVRtbEnkl/pJXgoB
iIjuGC9es/PhUR4iBkObx3XmOVJarAtV4BlrztNgfHU2ssnZbZ3XObotQvNRB8e3
KzhMEv+UbraDuamN3KNG99CYFfZzxATitfImu1YU4atrn+NyBDYooeTFS8mac/v/
lG4G1+TFtxNSAZN/KKN45DvjyDQ6VjaNY+elpmzseDbfk2O6EAU5v1dGguOMPJxM
etcHWwhSOJDSOKAMKw/qGEFpTab7khnQFHf9F1vl8i1b5wFkb15u2Rb/FDX5pxJ6
7LmdDod3qwwxbzFU588ikIbDWnfPaaGzI/eWpl8Ifi5FXCJkOUlNq2FszF0TJvr8
GV9YMUZFCVoORF9C5yQwrwREVIQxxOXmcvSPI5BJeZdAHKJ7JuI=
=fBkH
-----END PGP SIGNATURE-----

--=-2E+Xc58WVFL5itGCwFjO--


