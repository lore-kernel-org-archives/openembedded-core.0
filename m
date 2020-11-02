Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.28915.1604310106017669962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kLTwHJO9;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id o9so15911233ejg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4XKQip0dkI/6dNfPzGUGvjEMkuQv/tC2HbCgv1hOzns=;
        b=kLTwHJO90I1+aMhcYuhUrMwMObYI8P5UWQRP9aZl0p58QoxN4f40ZspQFYHUTCj2vT
         jeDv/QElarrIePrQMlr+QcsB29U761BendI9Qg3Zp45BlUpXgc+nX9ydbxZEeurg8GA9
         Ua3+MEgcfy/z6ErHqNZy60x48IIQcsdtQ6GC92P7w0SZq7ABzmFCg+47HoU42+ZyY3ln
         /fSxdwySV43f79dKctlfZw89TGlDhAFd72r4mCf6Pa43YmZnM26S8f/RhApWR4CEadNW
         zF1GOfs4mUXv0c5f7lLyJUIjThEpW4lTpJTye7IhL7tifrxLBh2rttATO3ypIdxXIWPM
         tqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4XKQip0dkI/6dNfPzGUGvjEMkuQv/tC2HbCgv1hOzns=;
        b=BuBip7gEVD3sqOrkrGFcNcVLE5r4ubbtKnGKdFNzwfd9H1ZAkqZk5d85Qb1UfmohR8
         5iTstUYVibDLDQ43RC8SCqEsNYEo/PvFqhNw+pbt+LBGBQxoLSbMoUpmGHoTK8tWrXBJ
         8Pxr0V/0P6U6vPZP/Nqc8zCV3lWnBSy+bTgZZhlEZHmZpZDR2dsvMmbbIIxKSxm5MHcY
         ktQkCYORDFhX9am5eqIDsjgXppCiWDrOd1CH7QiNlDUvojRZpCPHy9MyJunJMjBaJsFA
         01K3HY3oBXgcML75yZxcYrl9z+R1yQ86lE0Mb5xUf2buidfBgjvVY/jN9jC1mB0ft2Py
         wwYA==
X-Gm-Message-State: AOAM532qB0ud7mW7ZfggLDzgmkvMUL3B8jZ52b/ISeXC8TbCj7Z2CkDF
	X1Jg4c6Rnqtgp6mUWq1GfmYPWbLFnmFXgZ136RI=
X-Google-Smtp-Source: ABdhPJwr7KD/mVy5Xe30NdkteydVupLKZraXGyYcWN2T2MDdNAlFUIaCW9OiQkcw45lVT2/Gsa6FlGUmrYrPjL+Eeic=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr14268062ejb.484.1604310104520;
 Mon, 02 Nov 2020 01:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20201102083440.28814-1-toertel@gmail.com> <20201102083440.28814-2-toertel@gmail.com>
In-Reply-To: <20201102083440.28814-2-toertel@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 2 Nov 2020 09:41:29 +0000
Message-ID: <CANPvuRm-gZoGoi6dgXBroZa7b_Y0mqGhE5vBjx8K84hQM_wBEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsdl2: Fix directfb SDL_RenderFillRect
To: Mark Jonas <toertel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Jonas <toertel@gmail.com> escreveu no dia segunda, 2/11/2020 =C3=A0(s)=
 08:45:
>
> Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
> DirectFB. The problem has already been fixed upstream.

This needs Upstream-Status:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_He=
ader_Recommendations:_Upstream-Status

>
> Signed-off-by: Mark Jonas <toertel@gmail.com>
> ---
>  .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-rende=
rfillrect-fix.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillre=
ct-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrec=
t-fix.patch
> new file mode 100644
> index 0000000000..83d4f4b1ec
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.=
patch
> @@ -0,0 +1,33 @@
> +# HG changeset patch
> +# User Sam Lantinga <slouken@libsdl.org>
> +# Date 1590793369 25200
> +# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
> +# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
> +Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
> +
> +Lacky
> +
> +It looks like refactoring of SDL2 internal API has broken SDL_RenderFil=
lRect for DirectFB. In new version function SDL_RenderFillRect returns 0, b=
ut rectangle is not visible.
> +
> +Replacing "count" with "len" in the argument list for SDL_memcpy in Dir=
ectFB_QueueFillRects fixes problem.
> +
> +--
> +
> +The patch was imported from the libsdl Mercurial repository
> +(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Mark Jonas <toertel@gmail.com>
> +
> +diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_re=
nder.c
> +--- a/src/video/directfb/SDL_DirectFB_render.c Thu May 21 00:06:09 2020=
 -0400
> ++++ b/src/video/directfb/SDL_DirectFB_render.c Fri May 29 16:02:49 2020=
 -0700
> +@@ -626,7 +626,7 @@
> +     }
> +
> +     cmd->data.draw.count =3D count;
> +-    SDL_memcpy(verts, rects, count);
> ++    SDL_memcpy(verts, rects, len);
> +     return 0;
> + }
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.0.12.bb
> index 8ecf161f69..0b75eb0c1d 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> @@ -19,6 +19,7 @@ PROVIDES =3D "virtual/libsdl2"
>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://more-gen-depends.patch \
>             file://directfb-spurious-curly-brace-missing-e.patch \
> +           file://directfb-renderfillrect-fix.patch \
>  "
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
> --
> 2.25.1
>
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
