Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.28733.1604310437322787155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WZt6F2Vg;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id ay21so325827edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gYRUj7AC+uYdL2I3a61CWRdEnl05ik/Mih9wTY3U4wE=;
        b=WZt6F2Vg/R/oBbqYQV+if+jV+PBIjfTkPP98dZndcl3aoxORgflEhM/pal+4C8g0YX
         6TRZAxr+3A6hhjdTGf0exe+xu3N93M5jjxIkwlEV1cNSO/TuWz83J6xsvYGm1yewEbR9
         lN76GHX3QOtJMGT6pmgDpg4j+RWqgJTng2Ktf0J/4mG2BaTmoYBatEXfnenM4+dfmAHl
         gv3gj1dA4IGS+UBt6EPJrvRVGVYctN40sdyfCoueGPKrDmglblO5x7pYuAQwiQUUfdok
         BIcMkEkRIcXWn/t6+4B+XktRQ0LBauEg9zf9wnEQ6p1Ot9koa3WND4ZyQTvyYm9srGhW
         RdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gYRUj7AC+uYdL2I3a61CWRdEnl05ik/Mih9wTY3U4wE=;
        b=Kn0izoUfdHMBISEXf2O+gqnoRCBF68kEa1Z8QRidezAplKXNLaQG/ZzMKkEi+tFIYj
         1uL170PilZvTALjgWULVoTMDKxjEXDvwQD44h1Bni2L9r+5sFVOG5qDxhiPUO6/Pcqni
         ly2phogtS158iIhlIZvPMeubz90RDuCM1NYOsN+n/GgGWcSHevgU42jYbGqfRZNHJcys
         QbEddRVsPyJIRL0sN9rpHIe3oeFTZgWpWji+ajOF+r6mDKjsiNrRxDZxGx35tsbmU+y7
         SF2eEIPnopqL2OybkcMVNxN8p5YG0EB+kkGIGWJf449p71B1nsLZceJzKY+Bz23mPNyr
         ab5Q==
X-Gm-Message-State: AOAM532CpJDyyyxw8jtyfXcspQgKAx5uZUj1FLL1cUiY5c4KN2a6yU6C
	0q7C5kxM4O9i8Ov9m02wXYJtlhIezcYX/NgbCM0=
X-Google-Smtp-Source: ABdhPJxzf+BzBjajSkIdazjDB24X5Y7EC3DAoDeMfsJIZ7povDpUCSdk3piLmGzWV4abCAEys+AT8n/dt2xTLqh9h58=
X-Received: by 2002:a05:6402:94d:: with SMTP id h13mr6306666edz.59.1604310435560;
 Mon, 02 Nov 2020 01:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20201102083440.28814-1-toertel@gmail.com> <20201102083440.28814-2-toertel@gmail.com>
 <1643A78AB5B15C6B.444@lists.openembedded.org>
In-Reply-To: <1643A78AB5B15C6B.444@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 2 Nov 2020 09:47:04 +0000
Message-ID: <CANPvuRk52Hks7r22cLyYCphft71kdzxj7qbOmOmoAN9DPZ3JkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsdl2: Fix directfb SDL_RenderFillRect
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Mark Jonas <toertel@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
segunda, 2/11/2020 =C3=A0(s) 09:41:
>
> Mark Jonas <toertel@gmail.com> escreveu no dia segunda, 2/11/2020 =C3=A0=
(s) 08:45:
> >
> > Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
> > DirectFB. The problem has already been fixed upstream.
>
> This needs Upstream-Status:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_=
Header_Recommendations:_Upstream-Status
>
> >
> > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > ---
> >  .../libsdl2/directfb-renderfillrect-fix.patch | 33 ++++++++++++++++++=
+
> >  .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-ren=
derfillrect-fix.patch
> >
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfill=
rect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillr=
ect-fix.patch
> > new file mode 100644
> > index 0000000000..83d4f4b1ec
> > --- /dev/null
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fi=
x.patch
> > @@ -0,0 +1,33 @@
> > +# HG changeset patch
> > +# User Sam Lantinga <slouken@libsdl.org>
> > +# Date 1590793369 25200
> > +# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
> > +# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
> > +Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
> > +
> > +Lacky
> > +
> > +It looks like refactoring of SDL2 internal API has broken SDL_RenderF=
illRect for DirectFB. In new version function SDL_RenderFillRect returns 0,=
 but rectangle is not visible.
> > +
> > +Replacing "count" with "len" in the argument list for SDL_memcpy in D=
irectFB_QueueFillRects fixes problem.
> > +
> > +--
> > +
> > +The patch was imported from the libsdl Mercurial repository
> > +(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
> > +
> > +Upstream-Status: Backport

Sorry for that!
Upstream-Status is present

> > +
> > +Signed-off-by: Mark Jonas <toertel@gmail.com>
> > +
> > +diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_=
render.c
> > +--- a/src/video/directfb/SDL_DirectFB_render.c Thu May 21 00:06:09 20=
20 -0400
> > ++++ b/src/video/directfb/SDL_DirectFB_render.c Fri May 29 16:02:49 20=
20 -0700
> > +@@ -626,7 +626,7 @@
> > +     }
> > +
> > +     cmd->data.draw.count =3D count;
> > +-    SDL_memcpy(verts, rects, count);
> > ++    SDL_memcpy(verts, rects, len);
> > +     return 0;
> > + }
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/re=
cipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > index 8ecf161f69..0b75eb0c1d 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > @@ -19,6 +19,7 @@ PROVIDES =3D "virtual/libsdl2"
> >  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> >             file://more-gen-depends.patch \
> >             file://directfb-spurious-curly-brace-missing-e.patch \
> > +           file://directfb-renderfillrect-fix.patch \
> >  "
> >
> >  S =3D "${WORKDIR}/SDL2-${PV}"
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
