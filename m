Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.2904.1612385799618335470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 12:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dAS76amG;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id a8so1177008lfi.8
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 12:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=68xO0GLZ4FpKGPuV1X1Ie8PkW5G4WVZhtLAo2cmzlw4=;
        b=dAS76amGYjsefGBL+YPI/YX0rO3xbhLfXSENOrXEKv09SMqG7AUNCppQZlarQI/NYz
         vwwXN9Lgw7eqvUDJAJRylj8DeMo8h78DGgFr2CxM51Mag3e0HqAmObXPJ8dJgzfMQkx4
         QXqrj79heDYWV+ifPteC/o2aJMzFQ7oQuWZimipKGesG5TfWkPvrpQtR2IlmfY08/k8W
         wP40fhb01KorOVL75BPhBqkppFHEaL6n3DtlXeMKuWB7pgL3UXoRlk3OwhRD7a888EEF
         ed/0YUJJ91VIdLUJSoW/iUiIc1AEeM36XcIXMPvlW3PRMdkiehyZrB2AqXrPaz4Z0UYG
         u83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=68xO0GLZ4FpKGPuV1X1Ie8PkW5G4WVZhtLAo2cmzlw4=;
        b=uWysKzmzae7B21xoX3FObh3f7iW7dZ/r99yn8V+ThiaF8ybrNzGbeo56k7gr5R6n+k
         hRVKNfFTYcvxThVdD2LLJHu7P2GZno9dpvjEnaMDseBKAk7KVc6HAqt0NQpzNoTh/6KS
         LGJMY7rErhV/pu5N4jjNTCWXOj3IHZpsEpEmq6edvBJ95KsO8ZGFrD3R4pBv0hiqVH4X
         W6rvMx5qsRtvsF03z5JcRcrVxyUnpkNNB2J09mZBGek4HO1brn0Pj7jAMJA+p3Qx9DRb
         CMdmkMBoBr3dzzNsFb1JH5jZWpDgxkI7fjCkKeQhu9rFSLFSEOw75MQj9G7Dffs89qDS
         vZIg==
X-Gm-Message-State: AOAM531/cRf4ToOmFwjTpGzLnV4ZPNd+xAacF5Hrh+9vP3OvBpOLs+9m
	KN0mCETOl884YQI7HnKllghJoI5VJF2bZPGFZmw=
X-Google-Smtp-Source: ABdhPJxe4u1BAX9mJ5LUlPOdz+rn2EuTCOtM40HLnhnb2EWRtiPe71EnU1MpQPWWlUoISMXHHc27+cpoBmcETIAxTb0=
X-Received: by 2002:a19:f012:: with SMTP id p18mr2724313lfc.153.1612385797681;
 Wed, 03 Feb 2021 12:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20210201102300.3789714-1-yann@blade-group.com>
In-Reply-To: <20210201102300.3789714-1-yann@blade-group.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 3 Feb 2021 21:56:26 +0100
Message-ID: <CAHtQpK6c8cHp5qn6wjC5jyha5i2Q57KuVy6EVVyXuRJcLg9b9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: upgrade to 2.0.14
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>, =?UTF-8?Q?Romain_Roff=C3=A9?= <romain.roffe@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann,

On Mon, Feb 1, 2021 at 11:23 AM Yann Dirson <yann.dirson@blade-group.com> =
wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> This version does not support tslib any more, as can be seen by the
> failed AUH run.
>
> Originally-by: Romain Roff=C3=A9 <romain.roffe@blade-group.com>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../libsdl2/directfb-renderfillrect-fix.patch | 33 -------------
>  ...ectfb-spurious-curly-brace-missing-e.patch | 49 -------------------
>  .../{libsdl2_2.0.12.bb =3D> libsdl2_2.0.14.bb}  |  6 +--
>  3 files changed, 1 insertion(+), 87 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-rende=
rfillrect-fix.patch
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spuri=
ous-curly-brace-missing-e.patch
>  rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.12.bb =3D> libsdl2_2.=
0.14.bb} (91%)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillre=
ct-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrec=
t-fix.patch
> deleted file mode 100644
> index 83d4f4b1ec..0000000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.=
patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -# HG changeset patch
> -# User Sam Lantinga <slouken@libsdl.org>
> -# Date 1590793369 25200
> -# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
> -# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
> -Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
> -
> -Lacky
> -
> -It looks like refactoring of SDL2 internal API has broken SDL_RenderFil=
lRect for DirectFB. In new version function SDL_RenderFillRect returns 0, b=
ut rectangle is not visible.
> -
> -Replacing "count" with "len" in the argument list for SDL_memcpy in Dir=
ectFB_QueueFillRects fixes problem.
> -
> ---
> -
> -The patch was imported from the libsdl Mercurial repository
> -(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Mark Jonas <toertel@gmail.com>
> -
> -diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_re=
nder.c
> ---- a/src/video/directfb/SDL_DirectFB_render.c Thu May 21 00:06:09 2020=
 -0400
> -+++ b/src/video/directfb/SDL_DirectFB_render.c Fri May 29 16:02:49 2020=
 -0700
> -@@ -626,7 +626,7 @@
> -     }
> -
> -     cmd->data.draw.count =3D count;
> --    SDL_memcpy(verts, rects, count);
> -+    SDL_memcpy(verts, rects, len);
> -     return 0;
> - }
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-cur=
ly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-s=
purious-curly-brace-missing-e.patch
> deleted file mode 100644
> index aa351a89ba..0000000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brac=
e-missing-e.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -# HG changeset patch
> -# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -# Date 1585069551 25200
> -# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
> -# Parent  63387e8920f58f608288f247824ec5f4c286691f
> -src/video/directfb/SDL_DirectFB_render.c: fix build
> -Build with directfb is broken due to a spurious '}' and a missing 'E'
> -since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
> -
> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a=
 switch statement
> -  202 |         case SDL_BLENDMODE_MUL:
> -      |         ^~~~
> -
> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undecl=
ared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
> -  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsur=
f, DSBF_DSTCOLOR));
> -      |                                                                =
   ^~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8b=
c8ee6b67b77
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -
> ---
> -
> -The patch was imported from the libsdl Mercurial repository
> -(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Mark Jonas <toertel@gmail.com>
> -
> -
> -diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_re=
nder.c
> ---- a/src/video/directfb/SDL_DirectFB_render.c Mon Mar 23 14:10:25 2020=
 -0700
> -+++ b/src/video/directfb/SDL_DirectFB_render.c Tue Mar 24 10:05:51 2020=
 -0700
> -@@ -198,11 +198,10 @@
> -             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF=
_SRCCOLOR));
> -
> -             break;
> --        }
> -         case SDL_BLENDMODE_MUL:
> -             data->blitFlags =3D DSBLIT_BLEND_ALPHACHANNEL;
> -             data->drawFlags =3D DSDRAW_BLEND;
> --            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF=
_DSTCOLOR));
> -+            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF=
_DESTCOLOR));
> -             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF=
_INVSRCALPHA));
> -
> -             break;
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.0.14.bb
> similarity index 91%
> rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
> index 5fa99821c4..872592fdae 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
> @@ -18,14 +18,11 @@ PROVIDES =3D "virtual/libsdl2"
>
>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://more-gen-depends.patch \
> -           file://directfb-spurious-curly-brace-missing-e.patch \
> -           file://directfb-renderfillrect-fix.patch \

I believe the patch ac_check_define.patch can also be dropped, as it
was applied upstream and is included in 2.0.14, see
http://hg.libsdl.org/SDL/rev/2c13b7ca1997

>  "
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
>
> -SRC_URI[md5sum] =3D "783b6f2df8ff02b19bb5ce492b99c8ff"

Wonder why md5sum was just dropped and rather not updated?

> -SRC_URI[sha256sum] =3D "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e9=
1be654db7f1e2c863"
> +SRC_URI[sha256sum] =3D "d8215b571a581be1332d2106f8036fcb03d12a70bae01e2=
0f424976d275432bc"
>
>  inherit autotools lib_package binconfig-disabled pkgconfig
>
> @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]       =3D "--enable-jack,--disable=
-jack,jack"
>  PACKAGECONFIG[kmsdrm]     =3D "--enable-video-kmsdrm,--disable-video-km=
sdrm,libdrm virtual/libgbm"
>  PACKAGECONFIG[opengl]     =3D "--enable-video-opengl,--disable-video-op=
engl,virtual/libgl"
>  PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudio=
,pulseaudio"
> -PACKAGECONFIG[tslib]      =3D "--enable-input-tslib,--disable-input-tsl=
ib,tslib"
>  PACKAGECONFIG[wayland]    =3D "--enable-video-wayland,--disable-video-w=
ayland,wayland-native wayland wayland-protocols libxkbcommon"
>  PACKAGECONFIG[x11]        =3D "--enable-video-x11,--disable-video-x11,v=
irtual/libx11 libxext libxrandr libxrender"
>
> --
> 2.29.2
>
>
>=20
>


--=20
Regards,
Andrey.
