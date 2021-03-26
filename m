Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.10166.1616750683096486984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 02:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=fcbHKS4P;
 spf=pass (domain: blade-group.com, ip: 209.85.222.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f41.google.com with SMTP id 97so1406815uav.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FXxAi/wjzanErqRk14fu/Y8Ecp+Yz9nVE8/D/KzRfDQ=;
        b=fcbHKS4P9iR8AiRxB+4BYxVX9/DeH6ZPtu95aW6fNUK/Znh8tS38hJbs6u7uGKy1/m
         fk/mToxvIl5DO3b7XfZpC3eMnyeBzdFcqEhKvrsSb2JaXkPSG85FIAf27hyyJCjZJL64
         IZt2oMb2Fj6bPMdF1R7WbXJB9PXWQpcQVpmz6CYSuAArFmbmRg+ObJ6dG2r34x9gQ9IS
         sGFpkjo6EoNZ8b0dLMAM8QFvLvjef/ZVCLvwxbwCgw0o3AJxCe9dt+DNrd41BkWudtxR
         CVdHPdc8Nz1ErXWSGzHFsSbX0up/ve+P/4OY6+VV/y+eJupH9RygsqgpFRA6jhXw32BZ
         5yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FXxAi/wjzanErqRk14fu/Y8Ecp+Yz9nVE8/D/KzRfDQ=;
        b=p7+LCvbFzsCY5hF4sl7LKdrr1ZwIaAozJiBhZgryIW7FuDWbF1+uWqQjWhttWBQcdU
         3y6lbXdYhC3rijzlYkLcZTnxkRf43k+KG/Y1PfxGQNcevKHQbBZ/+ET/9h1Ht+Ij9zPi
         SvsNRagz+NmS+5Sjb68ZHowWr0N7A3FBiYP5h67Bo90RDODUx22HQvelPdv8ok7HG1b6
         I4nOeu5leBxtLM+9K40WqOT7XeLriV0Z59rLDRBRuwA7I4q8svDzksLq8/n8R+ftLUVg
         bLSlphBfTYodfovl26zDGjppkoIFmKNwTl9h9I5aH0WpYSrJD6Cx4hAv2kNBUPP4luJT
         LK3g==
X-Gm-Message-State: AOAM533gtfVjdwhXLgQPE2ppJhS+XsLZytefiQlH5cL9Be9Am80PaACj
	+cSnSePEeMiJPQjUmktdC+SvXZ2QQRVsMnxY2GoLLQ==
X-Google-Smtp-Source: ABdhPJx4+Wh6YZ6gDZChIahtILL/YfpXbQmhX44KZXs7I5KFCFb6Is+qGBO2RYMIB3FndvckqwpSfMMw5zQs8fopDBo=
X-Received: by 2002:ab0:6cef:: with SMTP id l15mr6808732uai.130.1616750682188;
 Fri, 26 Mar 2021 02:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163742.810094-1-yann@blade-group.com> <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
 <166F99C335958413.14663@lists.openembedded.org>
In-Reply-To: <166F99C335958413.14663@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Fri, 26 Mar 2021 10:24:30 +0100
Message-ID: <CA+4=imZTObVAaSTr5jzVod-sjKJqtisqzVZ-UB7Bk72K0mS2eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 25 mars 2021 =C3=A0 14:44, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>
> Hi Alex,
>
> Le mar. 23 mars 2021 =C3=A0 17:42, Alexander Kanavin
> <alex.kanavin@gmail.com> a =C3=A9crit :
> >
> > Is it possible to further split the NONCOMMERCIAL_PACKAGECONFIGS into =
ones that are enabled and disabled, and use the former in PACKAGECONFIG its=
elf?
>
> You mean something like this ?
>
> # PACKAGECONFIG features that do not pull codecs
> NONCOMMERCIAL_DEFAULT_PACKAGECONFIGS =3D " \
>  avdevice avfilter avformat swresample swscale postproc avresample \
>  alsa bzlib drm gpl lzma pic pthreads shared zlib \
>  ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
>  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)} \
> "
> NONCOMMERCIAL_NONDEFAULT_PACKAGECONFIGS =3D " \
>  altivec bzlib gsm jack openssl sdl2 \
> "
>
> PACKAGECONFIG ??=3D "avcodec theora \
>                    ${NONCOMMERCIAL_DEFAULT_PACKAGECONFIGS}"
>
> I admit I'm not completely sure about every feature's status.
>
> I tend to think that if ffmpeg relies on a lib providing an
> implementation, and there
> are patent-related risks, it should that lib setting a LICENSE_FLAG.
> Eg. x264 and others
> already sets the "commercial" flag, so I'm tempted to not add a
> duplicate flag in
> ffmpeg (in the same spirit as my patches against gst-libav and mpv).
> Would it be
> good enough ?

On second thought, it appears the only PACKAGECONFIG feature bringing
codecs and not backed by a lib is just "avcodec".

Thus we could probably just use:

LICENSE_FLAGS =3D "${@bb.utils.contains('PACKAGECONFIG', 'avcodec',
'commercial', '', d)}"

We would possibly not even need to set EXCLUDE_FROM_WORLD on this one, sin=
ce the
default PACKAGECONFIG would still set the "commercial" flag, right ?

>
> >
> >
> > Alex
> >
> > On Tue, 23 Mar 2021 at 17:38, Yann Dirson <yann.dirson@blade-group.com=
> wrote:
> >>
> >> From: Yann Dirson <yann@blade-group.com>
> >>
> >> The rationale here is that if the user can only whitelist "commercial=
"
> >> to use any part of ffmpeg, even it the list of features is carefully
> >> reviewed when switching the whitelisting on, there was nothing to
> >> guard from inadvertently activating a new feature that would not have
> >> been reviewed.
> >>
> >> This patch adds one LICENSE_FLAGS value for each feature, except for
> >> those that bring no codec, trying to be on the same level of legal
> >> safety - but then I may miss something.
> >>
> >> I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
> >> anything that brings a codec, notably libavcodec.  I also did not loo=
k
> >> at non-default features yet.
> >>
> >> There may still be a problem if any feature in ffmpeg gets activated
> >> by default upstream and not registed as a PACKAGECONFIG feature.  At
> >> least any of those that depend on another lib would not be enabled,
> >> that could be seen as a sufficient safeguard.
> >> ---
> >>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
> >>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/re=
cipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> >> index 08be38ca50..3a36c95151 100644
> >> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> >> @@ -16,7 +16,17 @@ LICENSE_libavutil =3D "${@bb.utils.contains('PACKA=
GECONFIG', 'gpl', 'GPLv2+', 'LGP
> >>  LICENSE_libpostproc =3D "GPLv2+"
> >>  LICENSE_libswresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gp=
l', 'GPLv2+', 'LGPLv2.1+', d)}"
> >>  LICENSE_libswscale =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',=
 'GPLv2+', 'LGPLv2.1+', d)}"
> >> -LICENSE_FLAGS =3D "commercial"
> >> +
> >> +# PACKAGECONFIG features that do not pull codecs
> >> +NONCOMMERCIAL_PACKAGECONFIGS =3D " \
> >> + alsa bzlib drm gpl lzma zlib xcb xv \
> >> + avdevice avfilter avformat swresample swscale postproc avresample \
> >> +"
> >> +# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be ex=
plicitly whitelisted.
> >> +# See https://ffmpeg.org/legal.html
> >> +LICENSE_FLAGS =3D "${@' '.join('commercial_' + cfg \
> >> +                             for cfg in '${PACKAGECONFIG}'.split() \
> >> +                             if cfg not in '${NONCOMMERCIAL_PACKAGEC=
ONFIGS}'.split())}"
> >>
> >>  LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486=
a80fdaf4a4263 \
> >>                      file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e=
80d47fae504 \
> >> --
> >> 2.30.2
> >>
> >>
> >>
> >>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
>=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
