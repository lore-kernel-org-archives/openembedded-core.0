Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.29066.1604310464340320164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mJPDDoQ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id b9so3487309edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 01:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9AdoO/VQf0R45t6W8Kin481KV+Q7ggqeh760D/w/36g=;
        b=mJPDDoQ0PyS6pBzUUb/M+f38KMB/FXwWkCsyxTtMHgyLkhQIJ02iHU3MB898Odjw9Q
         Y93XQRn/SsyATbUqczRCgwq9o+5CY03HBoGLsJYqDFE5u7qKIwfXNoBLQqrb9Bd6LAH1
         cnTGsvmXH+VElGSfix7EQ4XhyD7haqswF/N2J2ynzp1U7f7B2E0LfEX9yj/ZVdOIp9l6
         HMKJIFk9vsuedKhaMXrwjrQ+VLCR57sipwhYGTE/TGZ73WHc32Wt73G8jQ7WyOAawZJL
         cFJ1nwJ6YA9zLdFYR9vQquvPCdLQksHtYb2LDD4AjvXp1awRtq6jgHAGbrfzCDCFgwz6
         QvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9AdoO/VQf0R45t6W8Kin481KV+Q7ggqeh760D/w/36g=;
        b=XfV3ToEB5I+8Sua6/V+ZeSBde0et02DIzaD5v3v9KtRmJWXltMb8wqOgiy5T9Os3dS
         OvK92gy4b9Hojq1EARa5hih828IGetHFu1KDvS7s29wOVFdKFc3S9mNdUyRVGR8DkYZB
         +h/lDgPF3AerTLmTAXPzHe16PqKIo0iPUe3WHrggxGpZ4tkaACINQBjJMMPl3YffqVKu
         tIdqYXOXIg3Ng5JasyFvPsI/o7UMde7KSO/+kCw2/UgezSY35nZNrYynE6/M/U6lWWLh
         veVEFI+Myb8b+NbxxSiD96QQz9YNtx2vWArvht8C8T285C/7P3vAg64ZBh3TN/Oh6XxC
         KmpQ==
X-Gm-Message-State: AOAM53099YWcScSu6vEBVE5eX2uAuvGNLm3QV8a7jAvG5zBY1WM39zah
	5z2lApb9Sczb8BumqbkMY6wmvK41PTL/anY9gSRVVhbofVqkuv7C
X-Google-Smtp-Source: ABdhPJxP1oPVW+MECAvZXsXuXmedn7AKeE0gMbAaxQPUllRX9WFb0YJit4attUQmNxwd62J6vPuV0jxnnnEKAchRaHA=
X-Received: by 2002:a05:6402:16d5:: with SMTP id r21mr5904338edx.358.1604310462844;
 Mon, 02 Nov 2020 01:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20201102083440.28814-1-toertel@gmail.com> <1643A784CED48DC0.21604@lists.openembedded.org>
In-Reply-To: <1643A784CED48DC0.21604@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 2 Nov 2020 09:47:31 +0000
Message-ID: <CANPvuRk2zJaCA4cjGEEy38Bsvfp0jDBS-Nz=Yt4EfHTgD1gCeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libsdl2: Fix directfb syntax error
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
> > Build of libsdl2 with directfb is broken due to a spurious '}' and a
> > missing 'E' since version 2.0.12. The upstream is already fixed.
>
> This needs Upstream-Status:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_=
Header_Recommendations:_Upstream-Status
>
> >
> > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > ---
> >  ...ectfb-spurious-curly-brace-missing-e.patch | 49 ++++++++++++++++++=
+
> >  .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spu=
rious-curly-brace-missing-e.patch
> >
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-c=
urly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb=
-spurious-curly-brace-missing-e.patch
> > new file mode 100644
> > index 0000000000..aa351a89ba
> > --- /dev/null
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-br=
ace-missing-e.patch
> > @@ -0,0 +1,49 @@
> > +# HG changeset patch
> > +# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +# Date 1585069551 25200
> > +# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
> > +# Parent  63387e8920f58f608288f247824ec5f4c286691f
> > +src/video/directfb/SDL_DirectFB_render.c: fix build
> > +Build with directfb is broken due to a spurious '}' and a missing 'E'
> > +since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
> > +
> > +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/s=
rc/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
> > +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/s=
rc/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within=
 a switch statement
> > +  202 |         case SDL_BLENDMODE_MUL:
> > +      |         ^~~~
> > +
> > +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/s=
rc/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' unde=
clared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
> > +  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(dests=
urf, DSBF_DSTCOLOR));
> > +      |                                                              =
     ^~~~~~~~~~~~~
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa=
8bc8ee6b67b77
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +
> > +--
> > +
> > +The patch was imported from the libsdl Mercurial repository
> > +(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
> > +
> > +Upstream-Status: Backport

Sorry for that!
Upstream-Status is present

> > +
> > +Signed-off-by: Mark Jonas <toertel@gmail.com>
> > +
> > +
> > +diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_=
render.c
> > +--- a/src/video/directfb/SDL_DirectFB_render.c Mon Mar 23 14:10:25 20=
20 -0700
> > ++++ b/src/video/directfb/SDL_DirectFB_render.c Tue Mar 24 10:05:51 20=
20 -0700
> > +@@ -198,11 +198,10 @@
> > +             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DS=
BF_SRCCOLOR));
> > +
> > +             break;
> > +-        }
> > +         case SDL_BLENDMODE_MUL:
> > +             data->blitFlags =3D DSBLIT_BLEND_ALPHACHANNEL;
> > +             data->drawFlags =3D DSDRAW_BLEND;
> > +-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DS=
BF_DSTCOLOR));
> > ++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DS=
BF_DESTCOLOR));
> > +             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DS=
BF_INVSRCALPHA));
> > +
> > +             break;
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/re=
cipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > index 83dce86801..8ecf161f69 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> > @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
> >
> >  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> >             file://more-gen-depends.patch \
> > +           file://directfb-spurious-curly-brace-missing-e.patch \
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
