Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.28721.1604310080623646268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQmkYofP;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id k3so17944001ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CIB2cFYTL8noO0Wf91t0cwzZtqxxW/aiP/Ct+QsuqvQ=;
        b=TQmkYofPHDwzlJmyQHAwQZYl6t4CcYN6Apx2E8HeGv0Cu+WelUsbFEoQySXxsJgBV4
         O5NN3wUSl7+CugqDq6OD502SClbpnY8d/Se+6U0TO0/paihRcgKd7OsEgCzWK4G+RqAQ
         BsWE+ph7MWiR9A1cGrgmtWYbqdC6JDYFQMcWMeTkhvjky3cnIXk9h1DDWoKgD8weVw9K
         NkRfpBZpW58c6mMLMsEe0tFD2MgPuulmK9s7h+qJrL3brGMOVPCfQ7mxzB/+X1qv0UUu
         I7ja/YsWnSN8EVcaVtqQWsO8qC/ZOo/wAvDGTUagyitOdVqqpiT6bi1x2PecCGUmoI6+
         diZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CIB2cFYTL8noO0Wf91t0cwzZtqxxW/aiP/Ct+QsuqvQ=;
        b=EfQX7kDr4FJTJgd/9EPeARxAJjrB+MAbkuc3LtY8wa7CwWGsT6IIvt8oyAxvkgdyi6
         0kgLt8DqZdfDf93pg72zQfg04bCZenl4MjdWELYQkFWSEm87L8WMDCZJvTlNNfFHKmXJ
         k622ixRUhB0Ws3p+W8I7MVSj5HjdFDAIoAWOGxltRcx7K/xM686MfuC3fBkeGLTpMIAK
         iRcYYZv9DRP28rdG64grxbFdy96POQGwc0njYplOmT6i4pjEuKaTawR8pCMvPukR7iF+
         +4m9loRuViS+AbX+acbPBiUyKANz6KS3PDNbcyAJprOkuUZjU6Gzs3Z1sS/iiIaaldSe
         l7wQ==
X-Gm-Message-State: AOAM5310bxVtazc07FswGlNPbeuP6gzMkLtJLjBO5Egp/AMVM+JHz0xh
	FBukwQ/AuauOcKBeGkf1DW+1m3U554GSF7LXg7k=
X-Google-Smtp-Source: ABdhPJyCu6xe2m2PFS2E/JPjjCPCppz5EwMp65VuEgZOYPcSyuMX2byMAYlEsa3nfPp95wBC1eyNONx5NvS/JOT9rUY=
X-Received: by 2002:a17:907:1102:: with SMTP id qu2mr14508100ejb.300.1604310078854;
 Mon, 02 Nov 2020 01:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20201102083440.28814-1-toertel@gmail.com>
In-Reply-To: <20201102083440.28814-1-toertel@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 2 Nov 2020 09:41:07 +0000
Message-ID: <CANPvuRmB=9PbeQ51KPbGhqsLwXvikoQVYm1Dh54JD4q_=Uwzqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libsdl2: Fix directfb syntax error
To: Mark Jonas <toertel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Jonas <toertel@gmail.com> escreveu no dia segunda, 2/11/2020 =C3=A0(s)=
 08:45:
>
> Build of libsdl2 with directfb is broken due to a spurious '}' and a
> missing 'E' since version 2.0.12. The upstream is already fixed.

This needs Upstream-Status:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_He=
ader_Recommendations:_Upstream-Status

>
> Signed-off-by: Mark Jonas <toertel@gmail.com>
> ---
>  ...ectfb-spurious-curly-brace-missing-e.patch | 49 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spuri=
ous-curly-brace-missing-e.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-cur=
ly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-s=
purious-curly-brace-missing-e.patch
> new file mode 100644
> index 0000000000..aa351a89ba
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brac=
e-missing-e.patch
> @@ -0,0 +1,49 @@
> +# HG changeset patch
> +# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +# Date 1585069551 25200
> +# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
> +# Parent  63387e8920f58f608288f247824ec5f4c286691f
> +src/video/directfb/SDL_DirectFB_render.c: fix build
> +Build with directfb is broken due to a spurious '}' and a missing 'E'
> +since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
> +
> +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
> +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a=
 switch statement
> +  202 |         case SDL_BLENDMODE_MUL:
> +      |         ^~~~
> +
> +/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src=
/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undecl=
ared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
> +  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsur=
f, DSBF_DSTCOLOR));
> +      |                                                                =
   ^~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8b=
c8ee6b67b77
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +--
> +
> +The patch was imported from the libsdl Mercurial repository
> +(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Mark Jonas <toertel@gmail.com>
> +
> +
> +diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_re=
nder.c
> +--- a/src/video/directfb/SDL_DirectFB_render.c Mon Mar 23 14:10:25 2020=
 -0700
> ++++ b/src/video/directfb/SDL_DirectFB_render.c Tue Mar 24 10:05:51 2020=
 -0700
> +@@ -198,11 +198,10 @@
> +             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF=
_SRCCOLOR));
> +
> +             break;
> +-        }
> +         case SDL_BLENDMODE_MUL:
> +             data->blitFlags =3D DSBLIT_BLEND_ALPHACHANNEL;
> +             data->drawFlags =3D DSDRAW_BLEND;
> +-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF=
_DSTCOLOR));
> ++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF=
_DESTCOLOR));
> +             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF=
_INVSRCALPHA));
> +
> +             break;
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.0.12.bb
> index 83dce86801..8ecf161f69 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
> @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
>
>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://more-gen-depends.patch \
> +           file://directfb-spurious-curly-brace-missing-e.patch \
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
