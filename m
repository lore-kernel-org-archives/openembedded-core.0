Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FC8D1118A
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 18:24:57 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.41018.1730658292968594544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 10:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeeTEBh3;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so23634241fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730658291; x=1731263091; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAqQdNKCQtBtgqPEFeeAC0I95yo8hSkHXJq9bp14qno=;
        b=IeeTEBh3kuS1zmE65fpVC1J9n5sIsfoRlzDA2peda/LKXF2Hm3kfM12eUWEJhF6NQy
         jCJ6M9lsFMJpuNISuBvoPLpGvfpkYWHNXFiRgVcZeAOOzxfz7n8ujQ6oJGRPravW8bJY
         KSYoVQxEoggtXMWw+s2s7tOUy59tAX3eMAimiyzBccrzdwm9LLw2LDbveNdYo/T1NyGn
         IGIPlmLpVvbt+yobfDG0VDY4sz5+dNzD/3GgwkIyQYt/FYXPUkEs+g/iB2X1etT/AW3i
         67ynMXAP4YZmrA+WEWrcHEAflw1sPdy6sSRwisky67jqS0KoDDCWuuLEQRkn8stAqgoW
         MoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730658291; x=1731263091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAqQdNKCQtBtgqPEFeeAC0I95yo8hSkHXJq9bp14qno=;
        b=c/GH9gxoIs84hWjUlufNylSTORkOdAjNi2WXZ5M/EvlJCQlTAfiEX5OnGdSwoptS4e
         3hRdvMIX4m3Gkt1RmdwQki7LEzMLBRf+1dJTCSMoWknMy8XzBB1+TqHN/TQEmt1EZT2t
         rJ11CsdiKPZM4qWby+RHd8U6KDl9GcrmhKqk8GfhdErkTbJHR/K5dFs7AS6zc2Zd1RZO
         kYF13yrZ5zVHqWdICXTjGxJN5f7KUmK7nsGMdBfBkeySTZoooHT6gGjJuOdiwJpqc+YL
         IcKOogrDRhJ+qoznOGhFbWI8DOXpzmfNoDU64rZFwYV97WaOUDENGHptjxuLQoGtN2k3
         sGHg==
X-Gm-Message-State: AOJu0YwcMdtO8Th9XuZORHulpjfDkLKdATGI9eixF1c9INHGOx8ok7do
	5jpv22pgLEjkCfDBz6aS3c7hHo48dn7mkWm1nUVkVTUGoTXHXVvvfWr7Q1ynIK7h5BYvFTBuN2E
	r69HTMdY/eK1GRPS3p4aTOq6JH2s=
X-Google-Smtp-Source: AGHT+IEka1oRKHI8/guUbAVdBTadRKXJfjVteCt5Ehpt/Z+JUCbe4RZad59iumNKg//4txI3vfieMasFIn98+X05xYs=
X-Received: by 2002:a05:651c:2112:b0:2fb:4ff6:eb0d with SMTP id
 38308e7fff4ca-2fcbdfdf40bmr135012261fa.22.1730658290811; Sun, 03 Nov 2024
 10:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20241103182040.25039-1-hiagofranco@gmail.com>
In-Reply-To: <20241103182040.25039-1-hiagofranco@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Nov 2024 19:24:39 +0100
Message-ID: <CA+chaQforrVHeUCApbig_roJ5OtFeX+FM=Mds=f3wDx-15R37w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] drm-info: add recipe
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 18:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206668

meta-oe patches should go to openembedded-devel ML as README says.

On Sun, Nov 3, 2024 at 7:21=E2=80=AFPM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This recipe provides information about DRM devices, useful for debugging
> and checking information about DRM.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
>
> diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/rec=
ipes-graphics/drm/drm-info_2.7.0.bb
> new file mode 100644
> index 000000000000..9f1cbb47fbfd
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Small utility to dump info about DRM devices"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/emersion/drm_info"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32fd56d355bd6a61017655d8da26b=
67c"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=
=3Dmaster;protocol=3Dhttps"
> +SRCREV =3D "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS =3D "json-c libdrm"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206667): https://lists.openembedded.org/g/openembedde=
d-core/message/206667
> Mute This Topic: https://lists.openembedded.org/mt/109371629/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

