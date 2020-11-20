Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.924.1605909196436116298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 13:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FDLr+7Ab;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.50, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f50.google.com with SMTP id y11so5399880qvu.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 13:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ThJB2wsawZ8k0HKl6bZ3ms+QoMd1EhPev8u7JMDYo0I=;
        b=FDLr+7AbBsVKC23+SdHM1VUL9+OvkzIq55afbjbjBl1ltHEBx9aSWLOZ19cGE1C2WX
         9MIuQg5q3IZ7JHKeBI26Jt9crS/x19/6b2k0aOf83EstadzKtDVPXaQ8KEuAkEM90yQo
         Eh1ZGOM1lYXgI3vICTZYaRgEPHJaAGp0drTs/CT59QFDtDV/XJdITzQvmktN4TC0hlP0
         rt7WhyU/BkSvUbGNZ1IIqwyelh3Y3arxx97FPcHBkFd1GjePapd5R41L9vtBy60Kskr5
         PGa3iPr4MbDMm651QcHpLRoSoBrKlhevOuJWMz7YrQ6xAwbglIaI7Zww6DAgrs+zJZ3H
         O3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ThJB2wsawZ8k0HKl6bZ3ms+QoMd1EhPev8u7JMDYo0I=;
        b=nF6XsjGKLhNjPoBaiupmfy+3dwsMyr43Nm5MI8Y+zzOx+NOOd9NuUCLmN897JgySmH
         CdWv0QNmNrVK9Ih83SRanb499F0uUewyKa0qRph6LFHyQYYP0+3tXBN9rowNImk1nA73
         5D3I8FRXmo8KQppU1TAVQJ3QaD/GPvzzhUivSm/X5kWjETwEZF7LyhCgezMyUlEfY6nn
         DmEvkzURS87u+wBAiEwixlxR4VAKJXVhGNYa40EUX5LQG4wKEvCScTMfQLipZuDfGWuz
         bJT0dS408TQ84aqhnP8Io8G+KFbD8aholuyD0YqEkpEHHEoJP+TW4HAxt2WcdrRdrwit
         BeEA==
X-Gm-Message-State: AOAM5336I4TOAl03TpcfCHFh7I/AsvgKkTwmediamUvysCoDRzY93Ptf
	i73uqrIKyb0EvAKnAp+x/O7xfGiXx6cBUPNJ
X-Google-Smtp-Source: ABdhPJxOO9xok+Yd1O7CCPp9vwSi1RwO95Rx5oev7tVnqERc4Vxmo6YPvLL4Na4DGcQw064bJV6DYQ==
X-Received: by 2002:ad4:524d:: with SMTP id s13mr18516745qvq.19.1605909195168;
        Fri, 20 Nov 2020 13:53:15 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id l28sm2764289qkl.7.2020.11.20.13.53.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 13:53:14 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id q22so10430444qkq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 13:53:13 -0800 (PST)
X-Received: by 2002:a37:5156:: with SMTP id f83mr18392350qkb.197.1605909193558;
 Fri, 20 Nov 2020 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20201120173630.1296722-1-otavio@ossystems.com.br>
 <20201120173630.1296722-2-otavio@ossystems.com.br> <CAJ86T=W1EYUXGPVpk6LMSiraUthAa3ye3_-w8LJoaKGMB_nECw@mail.gmail.com>
In-Reply-To: <CAJ86T=W1EYUXGPVpk6LMSiraUthAa3ye3_-w8LJoaKGMB_nECw@mail.gmail.com>
Date: Fri, 20 Nov 2020 18:53:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpGhiUji_S8fUZ+q8M6dT_3g+D8dw0KGJPghzau54Gd-A@mail.gmail.com>
Message-ID: <CAP9ODKpGhiUji_S8fUZ+q8M6dT_3g+D8dw0KGJPghzau54Gd-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point. Please ignore this commit. My fault :-(

Em sex., 20 de nov. de 2020 =C3=A0s 18:21, Andre McCurdy
<armccurdy@gmail.com> escreveu:
>
> On Fri, Nov 20, 2020 at 9:36 AM Otavio Salvador
> <otavio.salvador@gmail.com> wrote:
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb          | 7 +-----=
-
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.18.1.bb
> > index 8813b8faca..43d51552f1 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18=
.1.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18=
.1.bb
> > @@ -64,12 +64,7 @@ PACKAGECONFIG[wayland]      =3D ",,wayland-native w=
ayland wayland-protocols libdrm
> >  PACKAGECONFIG[dispmanx]     =3D ",,virtual/libomxil"
> >  PACKAGECONFIG[viv-fb]       =3D ",,virtual/libgles2 virtual/libg2d"
> >
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11'=
, ' x11', '', d)}"
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gbm'=
, ' gbm', '', d)}"
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', ' wayland', '', d)}"
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'disp=
manx', ' dispmanx', '', d)}"
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'egl'=
, ' egl', '', d)}"
> > -OPENGL_WINSYS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'viv-=
fb', ' viv-fb', '', d)}"
> > +OPENGL_WINSYS_append =3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 gb=
m wayland dispmanx egl viv-fb', d)}"
>
> This drops the first leading space so isn't exactly equivalent.
>
> >  EXTRA_OEMESON +=3D " \
> >      -Ddoc=3Ddisabled \
> > --
> > 2.29.2
> >
> >
> >=20
> >



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
