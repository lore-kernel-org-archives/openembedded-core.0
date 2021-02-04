Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4958.1612426730462045081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 00:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+Ry4vZS;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id v24so3229587lfr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gcnn/c+gw95lGYsakO9iiDa/4fzY9sAFVmmNfgR3PW8=;
        b=g+Ry4vZS+vvxAJtZ0vwAFf3SVqnkCtNdt9nywm8BODF4tR+33YTNuEhXuwGlIAKtbz
         I33vSLPT4u1qykMBwZlX5FusjzSJuGJ4NV9dzK7Ffm24Vqgllequ43F1vo3iNXCduQuM
         9swOX+Atz5JO5CmkDsIbBwuLieJfGK9xSqX5LujPX0fbATgyCK2v9pIQqYg6ZaysFl17
         M9ycIXT8GnQ4jjEt7wFzKo3pkGnzV8/TRnm2+XkOGCr/YuGiZVLwCE5p45zoRbNvb9lz
         XBy06M9RypZG+AgO5uou1AoKhofM4j+8cNxWRweu63c79uqnZG8XkGgMKXa7+mmzvvvI
         lzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gcnn/c+gw95lGYsakO9iiDa/4fzY9sAFVmmNfgR3PW8=;
        b=Ez95rUR8/+pjDBhABJGe1SJrG1ya4HHtPHQPh+DbLlwuHmxP7qbcONF66UMDo7ORUZ
         mGVTaEJ8vtxdXZGbn7jAg3x9wAvbp6A6J/vkdTjPDCJKMTKHzfum8zqCwECW/ob3RhS3
         gUht4tJrfrnWRgWDBiefBs3OzztoEP0YUEWrBS691YGEcu5Yu6JSsq1sZKWCi/kM49ou
         eN/nRm1U89QgfMMj3QqiGLfdKi5pT3IfkzbGPzNdRe7opMZRN2a5gcaJaOD13CZf6K9B
         zmzlokBXWrmAfn+sOnlKp8iIRxY/vRJCVY5n7BOlKjsyiw6DdSZer7z8TlxmFKIdBjuy
         9KdQ==
X-Gm-Message-State: AOAM533Ey9jg15K9MwqMUiK+6UBLdajZFf5GANCKKZELA+x2+ZPw9kF2
	aGJ+ygyM/dQEcPl0zCZSo+vJTWaBffFbhPD+1dQ=
X-Google-Smtp-Source: ABdhPJzNKSaWfAdu6DFjbVixV483tOCtoIorPvSZ1MLnY28H5V6u8j8pxl832oQH8C/QKdDV86ijGzohY1wsvyhxXU4=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr4139388lfp.50.1612426728593;
 Thu, 04 Feb 2021 00:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20210201102300.3789714-1-yann@blade-group.com>
 <CAHtQpK6c8cHp5qn6wjC5jyha5i2Q57KuVy6EVVyXuRJcLg9b9g@mail.gmail.com> <CA+4=imaUEgCL4reQ3xAh=vYUK6wfOspb0ti5k6Onw2WDTZxQTA@mail.gmail.com>
In-Reply-To: <CA+4=imaUEgCL4reQ3xAh=vYUK6wfOspb0ti5k6Onw2WDTZxQTA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 4 Feb 2021 09:18:37 +0100
Message-ID: <CAHtQpK6E0GkuLOU4mizrJwoEWGZz5a4Xpg-yjx8gaHMr2H0S2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: upgrade to 2.0.14
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>, =?UTF-8?Q?Romain_Roff=C3=A9?= <romain.roffe@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann,

On Thu, Feb 4, 2021 at 1:11 AM Yann Dirson <yann.dirson@blade-group.com> w=
rote:
>
>
>
> Le mer. 3 f=C3=A9vr. 2021 =C3=A0 21:56, Andrey Zhizhikin <andrey.z@gmail=
.com> a =C3=A9crit :
>>
>> Hello Yann,
>>
>> > index 5fa99821c4..872592fdae 100644
>> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
>> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
>> > @@ -18,14 +18,11 @@ PROVIDES =3D "virtual/libsdl2"
>> >
>> >  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>> >             file://more-gen-depends.patch \
>> > -           file://directfb-spurious-curly-brace-missing-e.patch \
>> > -           file://directfb-renderfillrect-fix.patch \
>>
>> I believe the patch ac_check_define.patch can also be dropped, as it
>> was applied upstream and is included in 2.0.14, see
>> http://hg.libsdl.org/SDL/rev/2c13b7ca1997
>
>
> hm, not sure what patch you're talking about, I don't see any by that na=
me.

Ah, please discard this. That patch was introduced by commit
79ada27ec2 and was present in the master-next of poky. Latest
master-next update does not have it anymore. :)

>
>>
>> >  "
>> >
>> >  S =3D "${WORKDIR}/SDL2-${PV}"
>> >
>> > -SRC_URI[md5sum] =3D "783b6f2df8ff02b19bb5ce492b99c8ff"
>>
>> Wonder why md5sum was just dropped and rather not updated?
>
>
> It's an obsolete algorithm. AUH itself removes this in its patches.

Got it, thanks for clarification.

>
>>
>> > -SRC_URI[sha256sum] =3D "349268f695c02efbc9b9148a70b85e58cefbbf704abd=
3e91be654db7f1e2c863"
>> > +SRC_URI[sha256sum] =3D "d8215b571a581be1332d2106f8036fcb03d12a70bae0=
1e20f424976d275432bc"
>> >
>> >  inherit autotools lib_package binconfig-disabled pkgconfig
>> >
>> > @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]       =3D "--enable-jack,--disa=
ble-jack,jack"
>> >  PACKAGECONFIG[kmsdrm]     =3D "--enable-video-kmsdrm,--disable-video=
-kmsdrm,libdrm virtual/libgbm"
>> >  PACKAGECONFIG[opengl]     =3D "--enable-video-opengl,--disable-video=
-opengl,virtual/libgl"
>> >  PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseau=
dio,pulseaudio"
>> > -PACKAGECONFIG[tslib]      =3D "--enable-input-tslib,--disable-input-=
tslib,tslib"
>> >  PACKAGECONFIG[wayland]    =3D "--enable-video-wayland,--disable-vide=
o-wayland,wayland-native wayland wayland-protocols libxkbcommon"
>> >  PACKAGECONFIG[x11]        =3D "--enable-video-x11,--disable-video-x1=
1,virtual/libx11 libxext libxrandr libxrender"
>> >
>> > --
>> > 2.29.2
>> >
>> >
>> >=20
>> >
>>
>>
>> --
>> Regards,
>> Andrey.
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>


--=20
Regards,
Andrey.
