Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.10600.1603102381419241572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iSq1E+an;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id f8so5358228vsl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iYjCpxkgrOTP4L60pxUwmiqG17m8xfAURYMrSHLt1IQ=;
        b=iSq1E+anm2K7Emp1flNWgKwguoJkHAhRT/DL9kE3al9L1ZJfkkKdnPZuSpQKlDyeMx
         WlhCQMO1tQLamSxuhQc6RnCPXuNZilnikzctRKYZgIwvEclP/bBEGSwy7RqT42l8pZkd
         v9R+gDdhfMjxch2MZswWpVX1tZl1sG2yHMk59qZ1Rc/gNnRkwYOJr3/GQFgSjAypm50y
         80uxDOWTs9Kohnrsfn0gq6DtstHttfD18b0y9JrERiYW7x0LSeRV0r2xi2EnHTlwuH74
         ZWd25jXDwjUvuMj9pMA2GYy/UOEEpFKqICTQ4bqtL0BtrsLAsMwc2Omcao1ilY01zUb7
         nbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iYjCpxkgrOTP4L60pxUwmiqG17m8xfAURYMrSHLt1IQ=;
        b=rtf+S8I4czYfh1VBoQxFS1Y0ZkyUAoN1+g9Fnt0GTaKvP3U2UW2LtXK7uT+ZE9acAl
         PqXcscTZ35+EFNqpLIdeopLzIpgXK9wT2FcA6CfA/c19lFFONmSHzjFJLzSGOZpcXUB4
         /5cCYsj4KAIf9KSFwqZ1y6D6nYLuHWyGvbd7NdoeCcjLidQw2Pvz/hEwcFtidkf4kF4K
         g6ilyX6/R2RyRAoy071EwYWoeq9hSJ/PBtgSM9dnyzJihqK2erWI+UhUu2/AQI85Z2JN
         cHoOV3tdipjUL0m9hnnswDxpMWy4PJNh0DW0payTcYEeoKqUXlG7pYhfXULztFBJaQzk
         18zw==
X-Gm-Message-State: AOAM53102T8O+i8X4BaI8nM78+VrPhQiZUL1wKsV6WiKYO9yOEB3OOr9
	zGDnN3spN46M2amN6IuEify9sjhzg/EN1J2oyJs=
X-Google-Smtp-Source: ABdhPJym3V48kTjhj3EEBDSdvCJXC4wJaeAhHSB4mzJD60FattTQcK53ZIMU8ta9hqitzzUxuA9WYDvCTgSEFSTQgBY=
X-Received: by 2002:a67:403:: with SMTP id 3mr6993475vse.54.1603102380464;
 Mon, 19 Oct 2020 03:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201018121002.1417335-1-quaresma.jose@gmail.com> <CANPvuR=b0hWOqmyPaFer+peo9emNg3Wi=f3+NewnsjnLj-G2ng@mail.gmail.com>
In-Reply-To: <CANPvuR=b0hWOqmyPaFer+peo9emNg3Wi=f3+NewnsjnLj-G2ng@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 19 Oct 2020 12:12:48 +0200
Message-ID: <CANNYZj8QeSngMXxoBHzvbq_dNovZJVQ=b21YqAObpGWy69qXeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 00/20] Updates the gstreamer to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed1dec05b2035bd8"

--000000000000ed1dec05b2035bd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchwork is not the canonical source for the patch queue (this maillist
is), so if it doesn't appear there you shouldn't worry too much.

Alex

On Mon, 19 Oct 2020 at 12:06, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:

> Is there a problem with this that I don't understand?
> This version of the series does not appear on.
> https://patchwork.openembedded.org/project/oe-core/series
>
> Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia domingo,
> 18/10/2020 =C3=A0(s) 13:10:
> >
> > V2:
> > - Fixes the build of vulkan plugin
> > - Fixes pacth headers
> > - Upgrade orc 0.4.31 -> 0.4.32
> >
> > V3:
> > - gstreamer1.0: Fix reproducibility issue around libcap
> > - gstreamer1.0-python: install append is not need any more
> > - gstreamer1.0-plugins-[good/bad]: disable new meson options
> > - gstreamer1.0-plugins-[base/good/bad]: add new meson option as
> PACKAGECONFIG
> > - Update pacth headers
> >
> > Jose Quaresma (20):
> >   gstreamer1.0: upgrade to version 1.18.0
> >   gstreamer1.0: Fix reproducibility issue around libcap
> >   gstreamer1.0-plugins-base: upgrade to version 1.18.0
> >   gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
> >   gstreamer1.0-plugins-good: upgrade to version 1.18.0
> >   gstreamer1.0-plugins-good: disable new meson options
> >   gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
> >   gstreamer1.0-plugins-bad: upgrade to version 1.18.0
> >   gstreamer1.0-plugins-bad: disable new meson options
> >   gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
> >   gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
> >   gstreamer1.0-python: upgrade to version 1.18.0
> >   gstreamer1.0-python: install append is not need any more
> >   gstreamer1.0-rtsp-server: upgrade to version 1.18.0
> >   gstreamer1.0-vaapi: upgrade to version 1.18.0
> >   gst-examples: upgrade to version 1.18.0
> >   gstreamer1.0-omx: upgrade to version 1.18.0
> >   gstreamer1.0-libav: upgrade to version 1.18.0
> >   gst-devtools: add version 1.18.0 (gst-validate -> gst-devtools)
> >   orc: Upgrade 0.4.31 -> 0.4.32
> >
> >  .../orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb}      |   3 +-
> >  ...ct-has-a-different-signature-on-musl.patch |  10 +-
> >  .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
> >  ...001-Make-player-examples-installable.patch |  24 +-
> >  ...mples_1.16.0.bb =3D> gst-examples_1.18.0.bb} |   4 +-
> >  .../gstreamer/gst-validate_1.16.2.bb          |  25 --
> >  .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
> >  .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  21 ++
> >  ...x_1.16.2.bb =3D> gstreamer1.0-omx_1.18.0.bb} |   4 +-
> >  ...alized-warnings-when-compiling-with.patch} |   8 +-
> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
> >  ...avoid-including-sys-poll.h-directly.patch} |   8 +-
> >  ...sentinals-for-gst_structure_get-etc.patch} |  43 ++--
> >  ...ssing-opencv-data-dir-in-yocto-buil.patch} |   8 +-
> >  ....bb =3D> gstreamer1.0-plugins-bad_1.18.0.bb} |  38 +--
> >  ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
> >  ...02-meson-Add-variables-for-gir-files.patch | 235 -----------------=
-
> >  ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
> >  ...v-fb-Make-sure-config.h-is-included.patch} |   8 +-
> >  ...04-glimagesink-Downrank-to-marginal.patch} |   8 +-
> >  ...bb =3D> gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
> >  ...defines-GLsync-to-fix-compile-on-som.patch |  70 ------
> >  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |   8 +-
> >  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} |  17 +-
> >  ...bb =3D> gstreamer1.0-plugins-ugly_1.18.0.bb} |   5 +-
> >  ...son.build-fix-builds-with-python-3.8.patch |  24 --
> >  ....16.2.bb =3D> gstreamer1.0-python_1.18.0.bb} |  24 +-
> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
> >  ....bb =3D> gstreamer1.0-rtsp-server_1.18.0.bb} |   9 +-
> >  .../0001-vaapsink-downgrade-to-marginal.patch |  46 ----
> >  ...1.16.2.bb =3D> gstreamer1.0-vaapi_1.18.0.bb} |  16 +-
> >  ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +-
> >  ...002-Remove-unused-valgrind-detection.patch | 112 +++++++++
> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
> >  ...eson-Add-option-for-installed-tests.patch} |  20 +-
> >  .../0003-meson-Add-valgrind-feature.patch     |  74 ------
> >  .../gstreamer/gstreamer1.0/capfix.patch       |  37 ---
> >  ...er1.0_1.16.2.bb =3D> gstreamer1.0_1.18.0.bb} |  29 +--
> >  39 files changed, 350 insertions(+), 880 deletions(-)
> >  rename meta/recipes-devtools/orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb} (=
86%)
> >  rename meta/recipes-multimedia/gstreamer/{gst-validate =3D>
> gst-devtools}/0001-connect-has-a-different-signature-on-musl.patch (76%)
> >  create mode 100644 meta/recipes-multimedia/gstreamer/
> gst-devtools_1.18.0.bb
> >  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb =3D>
> gst-examples_1.18.0.bb} (91%)
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/
> gst-validate_1.16.2.bb
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/
> gstreamer1.0-libav_1.16.2.bb
> >  create mode 100644 meta/recipes-multimedia/gstreamer/
> gstreamer1.0-libav_1.18.0.bb
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb
> =3D> gstreamer1.0-omx_1.18.0.bb} (92%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{fix-maybe-un=
initialized-warnings-when-compiling-with-Os.patch
> =3D> 0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch} (8=
0%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-bu=
ild-gir-even-when-cross-compiling-if-introsp.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{avoid-includ=
ing-sys-poll.h-directly.patch
> =3D> 0002-avoid-including-sys-poll.h-directly.patch} (79%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{ensure-valid=
-sentinels-for-gst_structure_get-etc.patch
> =3D> 0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch} (69%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{opencv-resol=
ve-missing-opencv-data-dir-in-yocto-buil.patch
> =3D> 0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch} (9=
1%)
> >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.16.2.bb =3D> gstreamer1.0-plugins-bad_1.18.0.=
bb}
> (85%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{get-caps-fr=
om-src-pad-when-query-caps.patch
> =3D> 0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch} (81%=
)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-b=
uild-gir-even-when-cross-compiling-if-introsp.patch
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-A=
dd-variables-for-gir-files.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0003-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> =3D> 0002-ssaparse-enhance-SSA-text-lines-parsing.patch} (98%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0005-viv-fb=
-Make-sure-config.h-is-included.patch
> =3D> 0003-viv-fb-Make-sure-config.h-is-included.patch} (80%)
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0009-glimag=
esink-Downrank-to-marginal.patch
> =3D> 0004-glimagesink-Downrank-to-marginal.patch} (85%)
> >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.16.2.bb =3D> gstreamer1.0-plugins-base_1.18.=
0.bb}
> (78%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-e=
nsure-Qt-defines-GLsync-to-fix-compile-on-som.patch
> >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.16.2.bb =3D> gstreamer1.0-plugins-good_1.18.=
0.bb}
> (84%)
> >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.16.2.bb =3D> gstreamer1.0-plugins-ugly_1.18.=
0.bb}
> (89%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-f=
ix-builds-with-python-3.8.patch
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.=
bb
> =3D> gstreamer1.0-python_1.18.0.bb} (50%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-bu=
ild-gir-even-when-cross-compiling-if-introsp.patch
> >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-rtsp-server_1.16.2.bb =3D> gstreamer1.0-rtsp-server_1.18.0.=
bb}
> (74%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downg=
rade-to-marginal.patch
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.b=
b
> =3D> gstreamer1.0-vaapi_1.18.0.bb} (82%)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgri=
nd-detection.patch
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even=
-when-cross-compiling-if-introsp.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-option-fo=
r-installed-tests.patch
> =3D> 0003-meson-Add-option-for-installed-tests.patch} (97%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-f=
eature.patch
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb =3D>
> gstreamer1.0_1.18.0.bb} (72%)
> >
> > --
> > 2.28.0
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>
>

--000000000000ed1dec05b2035bd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Patchwork is not the canonical source for the patch q=
ueue (this maillist is), so if it doesn&#39;t appear there you shouldn&#39;=
t worry too much.</div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Oct 202=
0 at 12:06, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">qu=
aresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Is there a problem with this that I don&#39;t understa=
nd?<br>
This version of the series does not appear on.<br>
<a href=3D"https://patchwork.openembedded.org/project/oe-core/series" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.org/proje=
ct/oe-core/series</a><br>
<br>
Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_bl=
ank">quaresma.jose@gmail.com</a>&gt; escreveu no dia domingo,<br>
18/10/2020 =C3=A0(s) 13:10:<br>
&gt;<br>
&gt; V2:<br>
&gt; - Fixes the build of vulkan plugin<br>
&gt; - Fixes pacth headers<br>
&gt; - Upgrade orc 0.4.31 -&gt; 0.4.32<br>
&gt;<br>
&gt; V3:<br>
&gt; - gstreamer1.0: Fix reproducibility issue around libcap<br>
&gt; - gstreamer1.0-python: install append is not need any more<br>
&gt; - gstreamer1.0-plugins-[good/bad]: disable new meson options<br>
&gt; - gstreamer1.0-plugins-[base/good/bad]: add new meson option as PACKA=
GECONFIG<br>
&gt; - Update pacth headers<br>
&gt;<br>
&gt; Jose Quaresma (20):<br>
&gt;=C2=A0 =C2=A0gstreamer1.0: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0: Fix reproducibility issue around libcap<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-base: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-base: add new meson option as PACKAG=
ECONFIG<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-good: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-good: disable new meson options<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-good: add new meson option as PACKAG=
ECONFIG<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-bad: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-bad: disable new meson options<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-bad: add new meson options as PACKAG=
ECONFIG<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-plugins-ugly: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-python: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-python: install append is not need any more<=
br>
&gt;=C2=A0 =C2=A0gstreamer1.0-rtsp-server: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-vaapi: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gst-examples: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-omx: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gstreamer1.0-libav: upgrade to version 1.18.0<br>
&gt;=C2=A0 =C2=A0gst-devtools: add version 1.18.0 (gst-validate -&gt; gst-=
devtools)<br>
&gt;=C2=A0 =C2=A0orc: Upgrade 0.4.31 -&gt; 0.4.32<br>
&gt;<br>
&gt;=C2=A0 .../orc/{<a href=3D"http://orc_0.4.31.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">orc_0.4.31.bb</a> =3D&gt; <a href=3D"http://orc_0.4.32.bb" =
rel=3D"noreferrer" target=3D"_blank">orc_0.4.32.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 ...ct-has-a-different-signature-on-musl.patch |=C2=A0 10 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gst-devtools_1.18.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gst-devtools_1.18.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 43 ++++<br>
&gt;=C2=A0 ...001-Make-player-examples-installable.patch |=C2=A0 24 +-<br>
&gt;=C2=A0 ...<a href=3D"http://mples_1.16.0.bb" rel=3D"noreferrer" target=
=
=3D"_blank">mples_1.16.0.bb</a> =3D&gt; <a href=3D"http://gst-examples_1.1=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">gst-examples_1.18.0.bb</a>} |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gst-validate_1.16.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gst-validate_1.16.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 25 --<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-libav_1.16.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.16.2.bb</a>=C2=A0 =
=
=C2=A0 |=C2=A0 35 ---<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-libav_1.18.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.18.0.bb</a>=C2=A0 =
=
=C2=A0 |=C2=A0 21 ++<br>
&gt;=C2=A0 ...<a href=3D"http://x_1.16.2.bb" rel=3D"noreferrer" target=3D"=
_blank">x_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.18.0.bb</a>} |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 ...alized-warnings-when-compiling-with.patch} |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...even-when-cross-compiling-if-introsp.patch |=C2=A0 36 ---<br=
>
&gt;=C2=A0 ...avoid-including-sys-poll.h-directly.patch} |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...sentinals-for-gst_structure_get-etc.patch} |=C2=A0 43 ++--<b=
r>
&gt;=C2=A0 ...ssing-opencv-data-dir-in-yocto-buil.patch} |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ....bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.18.0.=
bb</a>} |=C2=A0 38 +--<br>
&gt;=C2=A0 ...t-caps-from-src-pad-when-query-caps.patch} |=C2=A0 12 +-<br>
&gt;=C2=A0 ...even-when-cross-compiling-if-introsp.patch |=C2=A0 36 ---<br=
>
&gt;=C2=A0 ...02-meson-Add-variables-for-gir-files.patch | 235 -----------=
-------<br>
&gt;=C2=A0 ...arse-enhance-SSA-text-lines-parsing.patch} |=C2=A0 10 +-<br>
&gt;=C2=A0 ...v-fb-Make-sure-config.h-is-included.patch} |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...04-glimagesink-Downrank-to-marginal.patch} |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-base_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.18.0=
.bb</a>} |=C2=A0 32 +--<br>
&gt;=C2=A0 ...defines-GLsync-to-fix-compile-on-som.patch |=C2=A0 70 ------=
<br>
&gt;=C2=A0 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-good_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.18.0=
.bb</a>} |=C2=A0 17 +-<br>
&gt;=C2=A0 ...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-ugly_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ugly_1.18.0=
.bb</a>} |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 ...son.build-fix-builds-with-python-3.8.patch |=C2=A0 24 --<br>
&gt;=C2=A0 ....<a href=3D"http://16.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.18.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.18.0.bb</a>} |=C2=
=
=A0 24 +-<br>
&gt;=C2=A0 ...even-when-cross-compiling-if-introsp.patch |=C2=A0 36 ---<br=
>
&gt;=C2=A0 ....bb =3D&gt; <a href=3D"http://gstreamer1.0-rtsp-server_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-server_1.18.0.=
bb</a>} |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 .../0001-vaapsink-downgrade-to-marginal.patch |=C2=A0 46 ----<b=
r>
&gt;=C2=A0 ...<a href=3D"http://1.16.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.18.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.18.0.bb</a>} |=
=C2=A0 16 +-<br>
&gt;=C2=A0 ...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 16 +-<br>
&gt;=C2=A0 ...002-Remove-unused-valgrind-detection.patch | 112 +++++++++<b=
r>
&gt;=C2=A0 ...even-when-cross-compiling-if-introsp.patch |=C2=A0 36 ---<br=
>
&gt;=C2=A0 ...eson-Add-option-for-installed-tests.patch} |=C2=A0 20 +-<br>
&gt;=C2=A0 .../0003-meson-Add-valgrind-feature.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 74 ------<br>
&gt;=C2=A0 .../gstreamer/gstreamer1.0/capfix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 37 ---<br>
&gt;=C2=A0 ...<a href=3D"http://er1.0_1.16.2.bb" rel=3D"noreferrer" target=
=
=3D"_blank">er1.0_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.1=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.0.bb</a>} |=
=C2=A0 29 +--<br>
&gt;=C2=A0 39 files changed, 350 insertions(+), 880 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/orc/{<a href=3D"http://orc_0.4.31.=
bb" rel=3D"noreferrer" target=3D"_blank">orc_0.4.31.bb</a> =3D&gt; <a href=
=3D"http://orc_0.4.32.bb" rel=3D"noreferrer" target=3D"_blank">orc_0.4.32.=
bb</a>} (86%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{gst-validate =3D&gt; =
gst-devtools}/0001-connect-has-a-different-signature-on-musl.patch (76%)<br=
>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gst-devtools_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gst-de=
vtools_1.18.0.bb</a><br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
-examples_1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">gst-examples_1.16=
.0.bb</a> =3D&gt; <a href=3D"http://gst-examples_1.18.0.bb" rel=3D"noreferr=
er" target=3D"_blank">gst-examples_1.18.0.bb</a>} (91%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gst-validate_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gst-va=
lidate_1.16.2.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-libav_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">=
gstreamer1.0-libav_1.16.2.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-libav_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
gstreamer1.0-libav_1.18.0.bb</a><br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-omx_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
omx_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.18.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.18.0.bb</a>} (92%)<br=
>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad/{fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch =3D&gt; 0=
001-fix-maybe-uninitialized-warnings-when-compiling-with.patch} (80%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.pa=
tch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad/{avoid-including-sys-poll.h-directly.patch =3D&gt; 0002-avoid-including-=
sys-poll.h-directly.patch} (79%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad/{ensure-valid-sentinels-for-gst_structure_get-etc.patch =3D&gt; 0003-ens=
ure-valid-sentinals-for-gst_structure_get-etc.patch} (69%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad/{opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch =3D&gt; 0004=
-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch} (91%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-plugins-bad_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstre=
amer1.0-plugins-bad_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-pl=
ugins-bad_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-bad_1.18.0.bb</a>} (85%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ase/{get-caps-from-src-pad-when-query-caps.patch =3D&gt; 0001-ENGR00312515-=
get-caps-from-src-pad-when-query-caps.patch} (81%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.p=
atch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ase/{0003-ssaparse-enhance-SSA-text-lines-parsing.patch =3D&gt; 0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch} (98%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ase/{0005-viv-fb-Make-sure-config.h-is-included.patch =3D&gt; 0003-viv-fb-M=
ake-sure-config.h-is-included.patch} (80%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ase/{0009-glimagesink-Downrank-to-marginal.patch =3D&gt; 0004-glimagesink-D=
ownrank-to-marginal.patch} (85%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-plugins-base_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-plugins-base_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-=
plugins-base_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-base_1.18.0.bb</a>} (78%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.p=
atch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-plugins-good_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-plugins-good_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-=
plugins-good_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-good_1.18.0.bb</a>} (84%)<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-plugins-ugly_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-plugins-ugly_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-=
plugins-ugly_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-ugly_1.18.0.bb</a>} (89%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-python/0001-meson.build-fix-builds-with-python-3.8.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-python_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-python_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.18.0.bb</a=
>} (50%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.pa=
tch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-rtsp-server_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstre=
amer1.0-rtsp-server_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-rt=
sp-server_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp=
-server_1.18.0.bb</a>} (74%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0-vaapi_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-vaapi_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.18.0.bb</a>} (=
82%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-mes=
on-Add-option-for-installed-tests.patch =3D&gt; 0003-meson-Add-option-for-i=
nstalled-tests.patch} (97%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-meson-Add-valgrind-feature.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1=
.0/capfix.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst=
reamer1.0_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16=
.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.18.0.bb" rel=3D"noreferr=
er" target=3D"_blank">gstreamer1.0_1.18.0.bb</a>} (72%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ed1dec05b2035bd8--
