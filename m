Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.16715.1604076461245976939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 09:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gPQ8rocg;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id k9so7357296edo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=37eAF2wTszS0iQvzPtO0H2AS2pbD9VD0qdjSV0ATnPY=;
        b=gPQ8rocgiQZ/Yf3s/4rOKGMk9shnAu3/kf5xDLKeIaFb1MplaaQv0E2nknO1s076lV
         qrKS6O5sTPCAK+GhIQbZt659RbS13hnmBlVztN7MbkK5T+YpMCK5Z62vYncdriRjXX7K
         Oqz07qoBB2O8Kp45WAk01wRAFhBnrpi0fZu2lWWZR4heLQrSe9J4+vd9SkzNYnLNrIpn
         K3CiqJlWxAxGYPShXfOCNfBCafrpNoPdvj2s8xNgXgRVQfFQKaKXcvTVfHJKcHDlQoZ4
         WtEHTepvyf3+p4O40IGkHRDS4I4g6AGRfETUS3w/X0I8BMJkcVICN+wmThQEwm8dU4Mm
         Nw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=37eAF2wTszS0iQvzPtO0H2AS2pbD9VD0qdjSV0ATnPY=;
        b=HZ9lzid0ASRsFCEv0zscwgjbaKlfSA/6CeslltrAUs96f9+yB0a9B91kUGtz3ji6/b
         ePxuEK9ewW9eebhg9jzF6jDkboF7PrP74np15zjep34HM96DMdBVG3533efXbL1tOBCN
         jUeUaBFeWfuuid9rR/xcOfEXSvePzRIhlMIt0aD8lvd/Wo7hZqTOnewK+GKwxcXgU+kY
         tflhHJicLNqA6H6MhT5uETsmzFjYPFEt4a6MmC7b+UOrXR3AWv9+Da+aGn+A+/6EKmhC
         QEjDftq1FR7mpR2NwImb6pnROEVuy1BZEJW+MbbgL4F5//9+uhuH/nOhTfVF/KP4xynQ
         JvGw==
X-Gm-Message-State: AOAM533321NQhbBmhjLUe2JiU90du4rBpCMXmR9h6xjeA7ZfWD3GmBiQ
	Ho5XrWIfD2fcGg9DINf5CNvOuc1VoDS5tjoaaCQ=
X-Google-Smtp-Source: ABdhPJwDo9fnAlCrPfmWxeLwnEeV0neIM3c8KlWrhFTd6UyVdPR4wiBOTFnwyYbUidW5TbN/aHPzeHn0dSiAxUcVBy4=
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr3290706edq.59.1604076459525;
 Fri, 30 Oct 2020 09:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
In-Reply-To: <1642987B07D196A5.27950@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 30 Oct 2020 16:47:41 +0000
Message-ID: <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nasm is present on sysroot

The build log
https://errors.yoctoproject.org/Errors/Details/510826/

Countain:

NOTE: Direct dependencies are:
'/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-devtools/n=
asm/nasm_2.15.05.bb:do_populate_sysroot'

NOTE: Skipping as already exists in sysroot:
'nasm'

I don't have a build it on qemux86-64 and only build on arm
and on arm it is builded without nasm because -Dasm=3Ddisabled
Otherwise I think everything is correct with this patch

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 22:54:
>
> I don't understand that!
>
> The logs from
> https://errors.yoctoproject.org/Errors/Details/510826/
> Have meson asm enabled [-Dasm=3Denabled] and this option pulls nasm as
> dependency in [PATCH v5 07/22]
>
> [PATCH v5 07/22] gstreamer1.0-plugins-good: add new meson option as
> PACKAGECONFIG
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.18.0.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
> index ad3eabd0be..860b31106f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0=
.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0=
.bb
> @@ -20,6 +20,7 @@ RPROVIDES_${PN}-soup +=3D "${PN}-souphttpsrc"
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
> +    ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
>      bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup
> speex taglib v4l2 \
>  "
>
> @@ -27,6 +28,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender
> libxfixes libxdamage"
>  X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled
> -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
>  X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabled
> -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
>
> +PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
>  PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2"
>  PACKAGECONFIG[cairo]      =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cai=
ro"
>
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> quinta, 29/10/2020 =C3=A0(s) 22:14:
> >
> > I need to check what's append with this
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > quinta, 29/10/2020 =C3=A0(s) 16:06:
> > >
> > > On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
> > > >     * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.pa=
tch
> > > >       Removed since these are included in 1.18.0
> > > >
> > > > License-Update: remove file://common/coverage/coverage-report.pl
> > > > Upstream dont have it any more.
> > > >
> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > > ---
> > > >  ...defines-GLsync-to-fix-compile-on-som.patch | 70 --------------=
-
> > > > ----
> > > >  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  8 +--
> > > >  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} | 14 ++--
> > > >  3 files changed, 10 insertions(+), 82 deletions(-)
> > > >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0=
-
> > > > plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on=
-
> > > > som.patch
> > > >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-
> > > > good_1.16.2.bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} (84%)
> > >
> > > Thanks for the updated series, I put it in for testing and this time
> > > we're seeing:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/13=
05
> > >
> > > nasm seems to be needed by plugins-good but is missing?
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
> >
> > --
> > best regards,
> > Jos=C3=A9 Quaresma
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
