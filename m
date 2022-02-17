Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09979C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:08:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.4153.1645139329345571092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M5Wi7QJv;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id b11so2010506lfb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EGxMx6QCFG3aSkBQ79YcUWHTtEnwRBYfHHtvjG5mZnU=;
        b=M5Wi7QJvvuWifiwixqj/GR9XNm4O9A9WnS9MX52+Yaq3DX8N47vzp8RzqHjCSSf+g9
         +yJm4oSBD3t6Ytez6gGBNzbaQaNSaLjaqtlPNN+LSdONcVTFfSMtGWlrqjRV001DCnGU
         7Ra9nmMoZ8OiDwA6xE9drBPpLilhAIh0MY1VqxH6T5AYGWF3TyQYi5HqhPtxukYW26US
         M+rIVrGGWJucEU4P/EcfQGiNqV9EzzbzKV+PUY6BAV04KCALiNFnldYhzKK8V6pjQYSF
         xJ7G+e+Jp2cZjSj13nG91vLHU4DzFdf0bfnAbFi5iwdEOp4wf/lN1L750qZ2T7e8biYn
         bkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EGxMx6QCFG3aSkBQ79YcUWHTtEnwRBYfHHtvjG5mZnU=;
        b=5oCcPabc0TwyVJ+Cf6JbreKFFpl22VF5yBDpyrIxNVSjkoPoRiVhK+tNe8H8doHFF9
         d0ty3bhl7m7D9shzr/TDCXhAUN6K/QtnDwsBSy0XY87l1J3GhN3qjG7dFX6yc5eSkX2O
         agcWplHDbyRrcqACyJ8WjChFdPVSuz8lz/QaJhabfmK7RcBWNeiG86qK+I7OlIzc2i0Y
         VRfAue24HaksNZxCNvE+maAEdnBgwHqc6sPISHXa//F0ZTPvgkw8ECI1azagO4PCUGMr
         v/nxvCC6JTWrUNA6VkkcfyC3jr4oRG5d8B3xaG1Qp+ofp4FrUbKL27wS+U49WvVDrlx5
         Z2rw==
X-Gm-Message-State: AOAM533bDhgP0hfxVwJYD+6GQniKiv15TMZkXIy3WiySoCpN6JUWwrTe
	K0RMWv9webdBXdG4UqgPnypJ2pDeL08+cx/MqOk=
X-Google-Smtp-Source: 
 ABdhPJwxbC2t2b33wWb1LT6o8N4+ko5b3avLxxQ5u/5sMP2XKKZ/19Y6wTK6O7ywDUXJB/az9Tad6W3uq3c6PO+hSTk=
X-Received: by 2002:ac2:47ef:0:b0:435:e3b6:5022 with SMTP id
 b15-20020ac247ef000000b00435e3b65022mr3483978lfp.95.1645139327133; Thu, 17
 Feb 2022 15:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20220216232803.1868265-1-quaresma.jose@gmail.com>
 <705135fb77074d9c9ac87d0d060592e1@axis.com>
In-Reply-To: <705135fb77074d9c9ac87d0d060592e1@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 17 Feb 2022 23:08:36 +0000
Message-ID: 
 <CANPvuRkQiwKXTB-6SXD4sf1vtBWH7DQEG-Q_M+tXo1N6S1QNYw@mail.gmail.com>
Subject: Re: [PATCH] gstreamer1.0: update licences of all modules
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000332cd005d83ed959"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:08:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161871

--000000000000332cd005d83ed959
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

It's not as simple as I was thinking, I'll need more time.

Jose

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quinta,
17/02/2022 =C3=A0(s) 14:34:

> > -----Original Message-----
> > From: Jose Quaresma <quaresma.jose@gmail.com>
> > Sent: den 17 februari 2022 00:28
> > To: openembedded-core@lists.openembedded.org
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Jose Quaresma <
> quaresma.jose@gmail.com>
> > Subject: [PATCH] gstreamer1.0: update licences of all modules
> >
> > Since all gstreamer modules uses LGPLv2.1 with exceptions
> > for some plugins in bad and ugly modules that has GPLv2+.
> >
> > For the GPLv2+ this patch set the licence only for each plugin
> > that is affected by this licence. The commercial LICENSE_FLAGS
> > is enabled if any of the previous plugins is builded.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  .../gstreamer/gst-devtools_1.20.0.bb                   |  2 +-
> >  .../gstreamer/gstreamer1.0-libav_1.20.0.bb             |  2 +-
> >  .../gstreamer/gstreamer1.0-omx_1.20.0.bb               |  2 +-
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb       |  7 ++++++-
> >  .../gstreamer/gstreamer1.0-plugins-base_1.20.0.bb      |  2 +-
> >  .../gstreamer/gstreamer1.0-plugins-good_1.20.0.bb      |  2 +-
> >  .../gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb      | 10 ++++++++--
> >  .../gstreamer/gstreamer1.0-python_1.20.0.bb            |  2 +-
> >  .../gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb       |  2 +-
> >  .../gstreamer/gstreamer1.0-vaapi_1.20.0.bb             |  2 +-
> >  .../gstreamer/gstreamer1.0_1.20.0.bb                   |  2 +-
> >  11 files changed, 23 insertions(+), 12 deletions(-)
>
> [cut]
>
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.20.0.bb
> > index 915d4ec744..22288373ac 100644
> > --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.20.0.bb
> > +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.20.0.bb
> > @@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D
> > "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7
> >
> >  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
> >
> > -LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+"
> > +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
> >
> >  DEPENDS +=3D "gstreamer1.0-plugins-base"
> > @@ -98,6 +98,11 @@ PACKAGECONFIG[faad]            =3D
> "-Dfaad=3Denabled,-Dfaad=3Ddisabled,faad2"
> >  PACKAGECONFIG[resindvd]        =3D "-Dresindvd=3Denabled,-
> Dresindvd=3Ddisabled,libdvdread libdvdnav"
> >  PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled=
,x265"
> >
> > +LICENSE_FLAGS =3D "${@bb.utils.contains("PACKAGECONFIG", "gpl",
> "commercial", "", d)}"
>
> There shouldn't be any commercial limitations in these plugins. If there
> were, then they would be in -ugly instead.
>
> > +LICENSE:${PN}-faad =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-resindvd =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-x265 =3D "GPL-2.0-or-later"
>
> This is unfortunately not enough. It is actually more the opposite of
> what is needed. You need to set the license for all the other plugins
> that are only affected by LGPL-2.1-or-later since the default for a
> package is ${LICENSE} if no ${LICENSE:<package>} is defined.
>
> It is likely that you can do something creative in
> split_gstreamer10_packages() and set the default license there for the
> plugin packages to "LGPL-2.1-or-later" and then the overrides above
> would be enough. You probably want to do something like this to avoid
> having to update the lists of plugin packages every time the recipes
> are updated to new versions as plugins have a tendency to come and go.
>
> > +
> >  EXTRA_OEMESON +=3D " \
> >      -Ddoc=3Ddisabled \
> >      -Daes=3Denabled \
>
> [cut]
>
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > index 8128104319..6442fd4504 100644
> > --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > @@ -7,8 +7,7 @@ BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343
> \
> >
> >
> file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=3D4c=
771b8af188724855cb99cadd390068"
> >
> > -LICENSE =3D "GPLv2+ & LGPLv2.1+ & LGPLv2+"
> > -LICENSE_FLAGS =3D "commercial"
> > +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> >
> >  SRC_URI =3D " \
> >
> https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$=
{PV}.tar.xz
> \
> > @@ -37,6 +36,13 @@ PACKAGECONFIG[dvdread]  =3D
> "-Ddvdread=3Denabled,-Ddvdread=3Ddisabled,libdvdread"
> >  PACKAGECONFIG[mpeg2dec] =3D
> "-Dmpeg2dec=3Denabled,-Dmpeg2dec=3Ddisabled,mpeg2dec"
> >  PACKAGECONFIG[x264]     =3D "-Dx264=3Denabled,-Dx264=3Ddisabled,x264"
> >
> > +LICENSE_FLAGS =3D "${@bb.utils.contains("PACKAGECONFIG", "gpl",
> "commercial", "", d)}"
>
> I do not think making this conditional is correct. AFAIK the commercial
> flag is used in this recipe due to, e.g., patent limitations and not
> necessarily the actual code and its license. It affects all plugins in
> -ugly (it is the reason they are there in the first place and not in,
> e.g., -good or -bad).
>
> > +LICENSE:${PN}-cdio =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-a52dec =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-dvdread =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-mpeg2dec =3D "GPL-2.0-or-later"
> > +LICENSE:${PN}-x264 =3D "GPL-2.0-or-later"
>
> The same applies here as in -bad.
>
> > +
> >  EXTRA_OEMESON +=3D " \
> >      -Ddoc=3Ddisabled \
> >      -Dsidplay=3Ddisabled \
>
> //Peter
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000332cd005d83ed959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>It&#39;s not as simple as I w=
as thinking, I&#39;ll need more time.<br></div><div><br></div><div>Jose</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">pet=
er.kjellerstedt@axis.com</a>&gt; escreveu no dia quinta, 17/02/2022 =C3=A0(=
s) 14:34:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; -=
----Original Message-----<br>
&gt; From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" tar=
get=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Sent: den 17 februari 2022 00:28<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;; Jose Quaresma &l=
t;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>&gt;<br>
&gt; Subject: [PATCH] gstreamer1.0: update licences of all modules<br>
&gt; <br>
&gt; Since all gstreamer modules uses LGPLv2.1 with exceptions<br>
&gt; for some plugins in bad and ugly modules that has GPLv2+.<br>
&gt; <br>
&gt; For the GPLv2+ this patch set the licence only for each plugin<br>
&gt; that is affected by this licence. The commercial LICENSE_FLAGS<br>
&gt; is enabled if any of the previous plugins is builded.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Cc: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gst-devtools_1.20.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gst-devtools_1.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-libav_1.20.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.20.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-omx_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.20.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.20.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.20.0.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-base_1.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.20.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-good_1.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.20.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-plugins-ugly_1.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ugly_1.20.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 | 10 ++++++++--<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-python_1.20.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.20.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-rtsp-server_1.20.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-server_1.20.0.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-vaapi_1.20.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 11 files changed, 23 insertions(+), 12 deletions(-)<br>
<br>
[cut]<br>
<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-bad_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0-plugins-bad_1.20.0.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=
=3D"http://gstreamer1.0-plugins-bad_1.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gstreamer1.0-plugins-bad_1.20.0.bb</a><br>
&gt; index 915d4ec744..22288373ac 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-bad_1.20.0.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-bad_1.20.0.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D<br>
&gt; &quot;015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7<br>
&gt; <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/gst-plugins-bad-${PV}&quot;<br>
&gt; <br>
&gt; -LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+ &amp; LGPLv2.1+&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c&quot;<br>
&gt; <br>
&gt;=C2=A0 DEPENDS +=3D &quot;gstreamer1.0-plugins-base&quot;<br>
&gt; @@ -98,6 +98,11 @@ PACKAGECONFIG[faad]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;-Dfaad=3Denabled,-Dfaad=3Ddisabled,faad2&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[resindvd]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dr=
esindvd=3Denabled,- Dresindvd=3Ddisabled,libdvdread libdvdnav&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x265]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 &quot;-Dx265=3Denabled,-Dx265=3Ddisabled,x265&quot;<br>
&gt; <br>
&gt; +LICENSE_FLAGS =3D &quot;${@bb.utils.contains(&quot;PACKAGECONFIG&quot=
;, &quot;gpl&quot;, &quot;commercial&quot;, &quot;&quot;, d)}&quot;<br>
<br>
There shouldn&#39;t be any commercial limitations in these plugins. If ther=
e <br>
were, then they would be in -ugly instead.<br>
<br>
&gt; +LICENSE:${PN}-faad =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-resindvd =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-x265 =3D &quot;GPL-2.0-or-later&quot;<br>
<br>
This is unfortunately not enough. It is actually more the opposite of <br>
what is needed. You need to set the license for all the other plugins <br>
that are only affected by LGPL-2.1-or-later since the default for a <br>
package is ${LICENSE} if no ${LICENSE:&lt;package&gt;} is defined.<br>
<br>
It is likely that you can do something creative in <br>
split_gstreamer10_packages() and set the default license there for the <br>
plugin packages to &quot;LGPL-2.1-or-later&quot; and then the overrides abo=
ve <br>
would be enough. You probably want to do something like this to avoid <br>
having to update the lists of plugin packages every time the recipes <br>
are updated to new versions as plugins have a tendency to come and go.<br>
<br>
&gt; +<br>
&gt;=C2=A0 EXTRA_OEMESON +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -Ddoc=3Ddisabled \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -Daes=3Denabled \<br>
<br>
[cut]<br>
<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-plugins-ugly_1.20.0.bb</a> b/meta/recipes-multimedia/gstreamer/<a hr=
ef=3D"http://gstreamer1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-plugins-ugly_1.20.0.bb</a><br>
&gt; index 8128104319..6442fd4504 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-ugly_1.20.0.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-ugly_1.20.0.bb</a><br>
&gt; @@ -7,8 +7,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedes=
ktop.org/gstreamer/gst-plugins-ugly/-/issues" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues<=
/a><br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da6f89e2100d9b6cd=
ffcea4f398e37343 \<br>
&gt; <br>
&gt; file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=
=3D4c771b8af188724855cb99cadd390068&quot;<br>
&gt; <br>
&gt; -LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+ &amp; LGPLv2+&quot;<br>
&gt; -LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-later&quot;<br>
&gt; <br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gst=
reamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$%7BPV%7D.tar.=
xz" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.org/=
src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz</a> \<br>
&gt; @@ -37,6 +36,13 @@ PACKAGECONFIG[dvdread]=C2=A0 =3D &quot;-Ddvdread=3D=
enabled,-Ddvdread=3Ddisabled,libdvdread&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[mpeg2dec] =3D &quot;-Dmpeg2dec=3Denabled,-Dmpeg2de=
c=3Ddisabled,mpeg2dec&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x264]=C2=A0 =C2=A0 =C2=A0=3D &quot;-Dx264=3Denable=
d,-Dx264=3Ddisabled,x264&quot;<br>
&gt; <br>
&gt; +LICENSE_FLAGS =3D &quot;${@bb.utils.contains(&quot;PACKAGECONFIG&quot=
;, &quot;gpl&quot;, &quot;commercial&quot;, &quot;&quot;, d)}&quot;<br>
<br>
I do not think making this conditional is correct. AFAIK the commercial <br=
>
flag is used in this recipe due to, e.g., patent limitations and not <br>
necessarily the actual code and its license. It affects all plugins in <br>
-ugly (it is the reason they are there in the first place and not in, <br>
e.g., -good or -bad).<br>
<br>
&gt; +LICENSE:${PN}-cdio =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-a52dec =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-dvdread =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-mpeg2dec =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE:${PN}-x264 =3D &quot;GPL-2.0-or-later&quot;<br>
<br>
The same applies here as in -bad.<br>
<br>
&gt; +<br>
&gt;=C2=A0 EXTRA_OEMESON +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -Ddoc=3Ddisabled \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -Dsidplay=3Ddisabled \<br>
<br>
//Peter<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000332cd005d83ed959--

