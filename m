Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.9905.1616749901963493132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 02:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=qawegQn0;
 spf=pass (domain: blade-group.com, ip: 209.85.222.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f54.google.com with SMTP id g5so1399720uan.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZGph5N9mOwHx09ZE2UzfOctbdoAZpd4ZVKficVLffTQ=;
        b=qawegQn0vhxHJ7pEXtXoyzQ2buTl0l3kiULKmXKsURu7b+eVtWmvkwvyhz8HWj4zsH
         hgEeuM/Eq1NQ9AFwnfX9ctPma35SSiFigV936h9Noee4tBesNm5BC2W0ktAS3zlAt4iA
         a3btwUWCR2w0zHR9Al4qTFNXMnY98kQFm/9kVyYDYvOreBFWg5ORvEtPQ9NRV3VCbRE9
         UCpghYDyiXEA3IOyXiZEnex+S/q4AzJq3+Ie1wkxF7OmacDEFXIUsVWUm3VsOyzbyJfJ
         I4DIjl5rPj2SoPHWzI5ewkRpK+16Z0tGiAR/igZZFDTIvZi+bwiZTo5q1X2KFwBFJZW6
         ByRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZGph5N9mOwHx09ZE2UzfOctbdoAZpd4ZVKficVLffTQ=;
        b=QUioF6RPRZ6NoMm5Rj82QEoc+bDbvtp4UYuty+JjJEFEol2v72Q/4/kM3cQYQYyBCg
         5ygXewZmDo8KwhwK+Vrrq0SwLLSEhWI+/uoX007PeAG0D6Kh94gV8hS0jVNWUhM8Rb/L
         a72pH38c7mkcCYFjaWv4VPi/sHRCeWIl44s1qH24Vm0fEEpqobDJ/Iqr2dC9fiZgIEZg
         QXRBAkh64yLSHl6tKbb1s/FXwlm/WafUH9FCx41cPtT9zYbBKEjZonPZKkY1ocOKgIC7
         NZrp1bFpGM1RyA8CaFkNDRMNpmorGHrwx34CrLdGa9qBYhv10acpCtTU050x5RU2H5Dz
         LbXg==
X-Gm-Message-State: AOAM53307OzQtXbTibkOYASaUALqOrzBR4qrlIdWgqn5Z2YHev9Zrn1x
	AN+cNr/NiW4w1nEQw+C78kw24iW9G/HGvls+1z6dGg==
X-Google-Smtp-Source: ABdhPJxc3fZhzxDWCUz5MFa4RGCr8PbzoH2nLhv0TcGQtsJlxtxCUGvHG9OAon4dKXFyBbc5EQFB101m9CWZPrm84VM=
X-Received: by 2002:a9f:2341:: with SMTP id 59mr7011233uae.30.1616749901115;
 Fri, 26 Mar 2021 02:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210326010716.1055632-1-raj.khem@gmail.com>
In-Reply-To: <20210326010716.1055632-1-raj.khem@gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 26 Mar 2021 10:11:29 +0100
Message-ID: <CA+4=imZmjTnAbSrTPK_06n-oddfDxB1f0OB3ocrObFx1RkwkZQ@mail.gmail.com>
Subject: Re: [PATCH] gst-examples,gstreamer1.0-libav: Add option to exclude from world build
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le ven. 26 mars 2021 =C3=A0 02:07, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :
>
> When LICENSE_FLAGS_WHITELIST does not have commercial in it then the
> the dependencies like ffmpeg will become invisible and render these
> packages unbuildable, therefore world build will report parse issues
>
> its better to exclude them from world build in such cases
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Yann Dirson <yann@blade-group.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb       | 2 ++
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb b/m=
eta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
> index 4670ab34db..196258e00f 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
> @@ -33,3 +33,5 @@ RRECOMMENDS_${PN} =3D "gstreamer1.0-plugins-base-meta \
>                        ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "c=
ommercial", "gstreamer1.0-libav", "", d)} \
>                       ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "co=
mmercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
>  RPROVIDES_${PN} +=3D "gst-player gst-player-bin"
> +
> +EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", =
"commercial", "0", "1", d)}"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> index 6a84f92f31..7c39e7da37 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> @@ -6,6 +6,7 @@ SECTION =3D "multimedia"
>
>  # ffmpeg has comercial license flags so add it as we need ffmpeg as a de=
pendency
>  LICENSE_FLAGS =3D "commercial"
> +

The LICENSE_FLAGS can then be dropped here, right ?

>  LICENSE =3D "LGPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
>                      file://ext/libav/gstav.h;beginline=3D1;endline=3D18;=
md5=3Da752c35267d8276fd9ca3db6994fca9c \
> @@ -22,3 +23,5 @@ inherit meson pkgconfig upstream-version-is-even
>
>  FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
>  FILES_${PN}-staticdev +=3D "${libdir}/gstreamer-1.0/*.a"
> +
> +EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", =
"commercial", "0", "1", d)}"
> --
> 2.31.0
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
