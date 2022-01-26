Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D65C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 12:32:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.12099.1643200340803437486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 04:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1nsZFMc;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id q22so12453379ljh.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 04:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5LmYxFJ74BNWTNc/z71gzJA8iogUyKDLmm3Kn1h7UO4=;
        b=a1nsZFMcjqGWfLcxgtQjbBqW9Inlk0jdQJ2ZpcQdu+7q8tVksT1GJH7lm+vqxvjchq
         gXJjajPIsnSZVElIpyLQzrJvDdi5heaPFKAEyCOmWEg8u4+ZZp+/5Whh40erGwvZLvfv
         HU083aO2pHX1GeEW/xw7v6B4zagN7RliDx0ZEEkmdJ6tZqZH2W7pPr0A8xhcPTj6qN35
         AUIapXrRSiAh0xma9Xno1Itn1W+IT4X0qEBjS9O4dXl2KoGQRGTjG2c3z5xekX73dcfG
         yddqebRhPNmlh/n1JW7JzLKY2BWH1eRboTy11GeP53hjD8muUupYvnrV9uXBHylGOFk/
         Sqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LmYxFJ74BNWTNc/z71gzJA8iogUyKDLmm3Kn1h7UO4=;
        b=ZCP5FCx0lE2xXIKm/g9H0DwKfIHEsYGNfb/Z+CipvZG3CawIty2YNVyhpTJZLbzU8S
         lNWLN2iZJFBOEdOnfxfQ1FIdIUqoxP+SMrxyf1HB3rilfEGKuS9Hp1ShuPyjNp/KAuzd
         BOac7QctkfUiCwTvfCYx0Cce48EkW3im8psukhtefY79SjRDSq9dwfL9jmgRgyGywHos
         NEFIXhKsSg1NnsZ8F5Q9KoFNgsvJvWF5xHXHbQNr15rwFLFtwQO9QEdU8xbhsiUywGDD
         0FluuergQe4I34pp1DrgKVx6FrdDsEyWVAmVqjEbMi2LUODAd/e9J556UcjMuHuq6Rdv
         87Qg==
X-Gm-Message-State: AOAM533yu2wxx7HvRae2vJYX82A/dEvkEAL8eHaNRHSZTjoGjoTNajJj
	/gxfRAeJq7XMC533/QhPcf6pM+YAxVcrRQftXlM=
X-Google-Smtp-Source: 
 ABdhPJyWy7NNpnXHo+MkoNlj7e1S8vIPtVdqWT3KGIwqRPvqViccPlkAR4gAE+OpptWA9yEO+p+1s6IH6cmJOA5QR2A=
X-Received: by 2002:a2e:7a10:: with SMTP id
 v16mr11841916ljc.426.1643200338571;
 Wed, 26 Jan 2022 04:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20220126102814.4173943-1-ch@denx.de>
 <CANPvuR=bCzgv+R3kHQgDOh4CSst7CP0y+uy+9L_my4oVQrdm1A@mail.gmail.com>
 <bfa13920-1ea0-1aab-3d3b-22d32ecc4c0f@denx.de>
In-Reply-To: <bfa13920-1ea0-1aab-3d3b-22d32ecc4c0f@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Jan 2022 12:32:08 +0000
Message-ID: 
 <CANPvuR=L4ecE=vNF+UyM8PKdy1CegPmsTEqJ25Tm3oXFii4qdA@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000079b55705d67b64f4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 12:32:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160985

--00000000000079b55705d67b64f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Claudius Heine <ch@denx.de> escreveu no dia quarta, 26/01/2022 =C3=A0(s) 12=
:15:

> Hi Jose,
>
> On 2022-01-26 11:52, Jose Quaresma wrote:
> >
> > Hi Claudius,
> >
> > I think we can do that switch for the monorepo in a follow up patch
> > after the 1.20 integration.
> > I have an internal update with most ready for 19.3 that misses some of
> > the existing downstream patches that we have.
> >
> > The gstreamer project will provide the archives for different component=
s
> > as they had done so far,
> > so we don't need to change the monorepo to integrate the gstreamer 1.20
> > for now.
>
> Ok that sounds good. I didn't know about that.
>

I use or distribute the release tarballs - how will this affect me?
We will continue to release the various GStreamer modules individually as
tarballs, so if you only consume tarballs the move to a mono repository
should not affect you at all.
https://gstreamer.freedesktop.org/documentation/frequently-asked-questions/=
mono-repository.html?gi-language=3Dc#i-use-or-distribute-the-release-tarbal=
ls-how-will-this-affect-me


> So that means you will update gstreamer to 1.20 when it is ready for
> kirkstone?
>

As I said before I have some pre-work done for the gstreamer 19.3
in preparation for the 1.20 but I am not the manteires or the owner of
these recipes.

Jose


>
> thanks,
> Claudius
>
> >
> > Cheers,
> > Jose
> >
> > Claudius Heine <ch@denx.de <mailto:ch@denx.de>> escreveu no dia quarta,
> > 26/01/2022 =C3=A0(s) 10:28:
> >
> >     Hi,
> >
> >     since the release of gstreamer 1.20 is getting close, and it might
> >     make sense to
> >     include it into the kirkstone release. I prepared preliminary updat=
e
> >     patchset
> >     for it.
> >
> >     Gstreamer changed to use monorepos with 1.20 so I went ahead I
> >     changed all
> >     recipes to use one SRC_URI from `gstreamer1.0-source.inc`. Currentl=
y
> >     I just use
> >     a tarball from a unrelease commit id, but that will be changed to
> >     the correct
> >     one, after gstreamer is released.
> >
> >     I have some ideas which could be implemented with this change, but =
I
> >     wanted
> >     feedback for this first:
> >       - remove the version from the filename, and define the PV in the
> >         `gstreamer1.0-source.inc`, this might make future updates easie=
r.
> >       - put all recipes together into one recipe, which provides
> >     packages for all
> >         subprojects, this improves build time and makes maintenance
> >     easier, but also
> >         breaks downstream bbappends.
> >
> >     Any feedback on this is welcome.
> >
> >     kind regards,
> >     Claudius
> >
> >     Claudius Heine (12):
> >        gstreamer1.0: 1.18.5 -> 1.20.0
> >        gstreamer1.0-plugins-base: 1.18.5 -> 1.20.0
> >        gstreamer1.0-plugins-good: 1.18.5 -> 1.20.0
> >        gstreamer1.0-plugins-bad: 1.18.5 -> 1.20.0
> >        gstreamer1.0-plugins-ugly: 1.18.5 -> 1.20.0
> >        gstreamer1.0-libav: 1.18.5 -> 1.20.0
> >        gstreamer1.0-python: 1.18.5 -> 1.20.0
> >        gstreamer1.0-omx: 1.18.5 -> 1.20.0
> >        gstreamer1.0-vaapi: 1.18.5 -> 1.20.0
> >        gstreamer1.0-rtsp-server: 1.18.5 -> 1.20.0
> >        gst-examples: 1.18.5 -> 1.20.0
> >        gst-devtools: 1.18.5 -> 1.20.0
> >
> >       ...ct-has-a-different-signature-on-musl.patch |   8 +-
> >       ...tools_1.18.5.bb <http://tools_1.18.5.bb> =3D>
> >     gst-devtools_1.20.0.bb <http://gst-devtools_1.20.0.bb>} |   9 +-
> >       ...001-Make-player-examples-installable.patch |  22 +-
> >       ...mples_1.18.5.bb <http://mples_1.18.5.bb> =3D>
> >     gst-examples_1.20.0.bb <http://gst-examples_1.20.0.bb>} |  11 +-
> >       ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346
> ------------------
> >       ...1.18.5.bb <http://1.18.5.bb> =3D> gstreamer1.0-libav_1.20.0.bb
> >     <http://gstreamer1.0-libav_1.20.0.bb>} |   9 +-
> >       ...x_1.18.5.bb <http://x_1.18.5.bb> =3D> gstreamer1.0-omx_1.20.0.=
bb
> >     <http://gstreamer1.0-omx_1.20.0.bb>} |   6 +-
> >       ...ialized-warnings-when-compiling-with.patch |   8 +-
> >       ...-avoid-including-sys-poll.h-directly.patch |   8 +-
> >       ...-sentinals-for-gst_structure_get-etc.patch |  24 +-
> >       ...issing-opencv-data-dir-in-yocto-buil.patch |  25 +-
> >       .../0005-msdk-fix-includedir-path.patch       |  26 +-
> >       ....bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb
> >     <http://gstreamer1.0-plugins-bad_1.20.0.bb>} |  20 +-
> >       ...et-caps-from-src-pad-when-query-caps.patch |  10 +-
> >       ...parse-enhance-SSA-text-lines-parsing.patch |  10 +-
> >       ...iv-fb-Make-sure-config.h-is-included.patch |   8 +-
> >       ...004-glimagesink-Downrank-to-marginal.patch |  32 --
> >       ...bb =3D> gstreamer1.0-plugins-base_1.20.0.bb
> >     <http://gstreamer1.0-plugins-base_1.20.0.bb>} |  17 +-
> >       ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  12 +-
> >       ...bb =3D> gstreamer1.0-plugins-good_1.20.0.bb
> >     <http://gstreamer1.0-plugins-good_1.20.0.bb>} |   9 +-
> >       ...bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb
> >     <http://gstreamer1.0-plugins-ugly_1.20.0.bb>} |  10 +-
> >       ....18.5.bb <http://18.5.bb> =3D> gstreamer1.0-python_1.20.0.bb
> >     <http://gstreamer1.0-python_1.20.0.bb>} |   7 +-
> >       ....bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb
> >     <http://gstreamer1.0-rtsp-server_1.20.0.bb>} |   8 +-
> >       .../gstreamer/gstreamer1.0-source.inc         |   5 +
> >       ...1.18.5.bb <http://1.18.5.bb> =3D> gstreamer1.0-vaapi_1.20.0.bb
> >     <http://gstreamer1.0-vaapi_1.20.0.bb>} |   5 +-
> >       ...der.c-when-env-var-is-set-do-not-fal.patch |  69 ----
> >       ...pect-the-idententaion-used-in-meson.patch} |  14 +-
> >       ...002-Remove-unused-valgrind-detection.patch | 112 ------
> >       ...s-add-support-for-install-the-tests.patch} |  67 ++--
> >       ...-use-too-strict-timeout-for-validati.patch |  32 --
> >       ...-use-a-dictionaries-for-environment.patch} |  28 +-
> >       ...er-script-to-run-the-installed_tests.patch |  72 ++++
> >       ...-the-environment-for-installed_tests.patch |  58 ---
> >       ...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
> >     gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |  25 +-
> >       34 files changed, 267 insertions(+), 865 deletions(-)
> >       rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb
> >     <http://gst-devtools_1.18.5.bb> =3D> gst-devtools_1.20.0.bb
> >     <http://gst-devtools_1.20.0.bb>} (83%)
> >       rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb
> >     <http://gst-examples_1.18.5.bb> =3D> gst-examples_1.20.0.bb
> >     <http://gst-examples_1.20.0.bb>} (82%)
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-=
build-with-ffmpeg-5.0.0.patch
> >       rename
> >     meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb
> >     <http://gstreamer1.0-libav_1.18.5.bb> =3D>
> >     gstreamer1.0-libav_1.20.0.bb <http://gstreamer1.0-libav_1.20.0.bb>}
> >     (66%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb
> >     <http://gstreamer1.0-omx_1.18.5.bb> =3D> gstreamer1.0-omx_1.20.0.bb
> >     <http://gstreamer1.0-omx_1.20.0.bb>} (89%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.18.5.bb <
> http://gstreamer1.0-plugins-bad_1.18.5.bb>
> >     =3D> gstreamer1.0-plugins-bad_1.20.0.bb
> >     <http://gstreamer1.0-plugins-bad_1.20.0.bb>} (91%)
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimage=
sink-Downrank-to-marginal.patch
> >       rename
> >     meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.18.5.bb
> >     <http://gstreamer1.0-plugins-base_1.18.5.bb> =3D>
> >     gstreamer1.0-plugins-base_1.20.0.bb
> >     <http://gstreamer1.0-plugins-base_1.20.0.bb>} (85%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.18.5.bb
> >     <http://gstreamer1.0-plugins-good_1.18.5.bb> =3D>
> >     gstreamer1.0-plugins-good_1.20.0.bb
> >     <http://gstreamer1.0-plugins-good_1.20.0.bb>} (91%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.18.5.bb
> >     <http://gstreamer1.0-plugins-ugly_1.18.5.bb> =3D>
> >     gstreamer1.0-plugins-ugly_1.20.0.bb
> >     <http://gstreamer1.0-plugins-ugly_1.20.0.bb>} (82%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb
> >     <http://gstreamer1.0-python_1.18.5.bb> =3D>
> >     gstreamer1.0-python_1.20.0.bb
> >     <http://gstreamer1.0-python_1.20.0.bb>} (79%)
> >       rename
> >     meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-rtsp-server_1.18.5.bb <
> http://gstreamer1.0-rtsp-server_1.18.5.bb>
> >     =3D> gstreamer1.0-rtsp-server_1.20.0.bb
> >     <http://gstreamer1.0-rtsp-server_1.20.0.bb>} (70%)
> >       create mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
> >       rename
> >     meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb
> >     <http://gstreamer1.0-vaapi_1.18.5.bb> =3D>
> >     gstreamer1.0-vaapi_1.20.0.bb <http://gstreamer1.0-vaapi_1.20.0.bb>}
> >     (90%)
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.=
c-when-env-var-is-set-do-not-fal.patch
> >       rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-i=
dententaion-used-in-meson.patch
> >     =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgri=
nd-detection.patch
> >       rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-f=
or-install-the-tests.patch
> >     =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use=
-too-strict-timeout-for-validati.patch
> >       rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-diction=
aries-for-environment.patch
> >     =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
> >       create mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-scr=
ipt-to-run-the-installed_tests.patch
> >       delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-en=
vironment-for-installed_tests.patch
> >       rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb
> >     <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
> >     <http://gstreamer1.0_1.20.0.bb>} (72%)
> >
> >
> >     base-commit: a179485351a0563d12a2fef3e49971122255ed80
> >     --
> >     2.34.1
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000079b55705d67b64f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Claudius Heine &lt;<a href=3D"mailto:=
ch@denx.de">ch@denx.de</a>&gt; escreveu no dia quarta, 26/01/2022 =C3=A0(s)=
 12:15:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jose,=
<br>
<br>
On 2022-01-26 11:52, Jose Quaresma wrote:<br>
&gt; <br>
&gt; Hi Claudius,<br>
&gt; <br>
&gt; I think we can do that switch for the monorepo in a follow up patch <b=
r>
&gt; after the 1.20 integration.<br>
&gt; I have an internal update with most ready for 19.3 that misses some of=
 <br>
&gt; the existing downstream patches that we=C2=A0have.<br>
&gt; <br>
&gt; The gstreamer project will provide the archives for different=C2=A0com=
ponents <br>
&gt; as they had done so far,<br>
&gt; so we don&#39;t=C2=A0need to change the monorepo to integrate the gstr=
eamer 1.20 <br>
&gt; for now.<br>
<br>
Ok that sounds good. I didn&#39;t know about that.<br></blockquote><div><br=
></div><div>I use or distribute the release tarballs - how will this affect=
 me?<br>We will continue to release the various GStreamer modules individua=
lly as tarballs, so if you only consume tarballs the move to a mono reposit=
ory should not affect you at all.<br></div><div><a href=3D"https://gstreame=
r.freedesktop.org/documentation/frequently-asked-questions/mono-repository.=
html?gi-language=3Dc#i-use-or-distribute-the-release-tarballs-how-will-this=
-affect-me">https://gstreamer.freedesktop.org/documentation/frequently-aske=
d-questions/mono-repository.html?gi-language=3Dc#i-use-or-distribute-the-re=
lease-tarballs-how-will-this-affect-me</a><br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
So that means you will update gstreamer to 1.20 when it is ready for <br>
kirkstone?<br></blockquote><div><br></div><div>As I said before=C2=A0I have=
 some pre-work done for the gstreamer 19.3</div><div>in preparation for the=
 1.20 but I am not the manteires or the owner=C2=A0of these recipes.<br></d=
iv><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
thanks,<br>
Claudius<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Jose<br>
&gt; <br>
&gt; Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@=
denx.de</a> &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@d=
enx.de</a>&gt;&gt; escreveu no dia quarta, <br>
&gt; 26/01/2022 =C3=A0(s) 10:28:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0since the release of gstreamer 1.20 is getting clos=
e, and it might<br>
&gt;=C2=A0 =C2=A0 =C2=A0make sense to<br>
&gt;=C2=A0 =C2=A0 =C2=A0include it into the kirkstone release. I prepared p=
reliminary update<br>
&gt;=C2=A0 =C2=A0 =C2=A0patchset<br>
&gt;=C2=A0 =C2=A0 =C2=A0for it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Gstreamer changed to use monorepos with 1.20 so I w=
ent ahead I<br>
&gt;=C2=A0 =C2=A0 =C2=A0changed all<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipes to use one SRC_URI from `gstreamer1.0-sourc=
e.inc`. Currently<br>
&gt;=C2=A0 =C2=A0 =C2=A0I just use<br>
&gt;=C2=A0 =C2=A0 =C2=A0a tarball from a unrelease commit id, but that will=
 be changed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the correct<br>
&gt;=C2=A0 =C2=A0 =C2=A0one, after gstreamer is released.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have some ideas which could be implemented with t=
his change, but I<br>
&gt;=C2=A0 =C2=A0 =C2=A0wanted<br>
&gt;=C2=A0 =C2=A0 =C2=A0feedback for this first:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- remove the version from the filename, and =
define the PV in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`gstreamer1.0-source.inc`, this might=
 make future updates easier.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- put all recipes together into one recipe, =
which provides<br>
&gt;=C2=A0 =C2=A0 =C2=A0packages for all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprojects, this improves build time=
 and makes maintenance<br>
&gt;=C2=A0 =C2=A0 =C2=A0easier, but also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0breaks downstream bbappends.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Any feedback on this is welcome.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0kind regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Claudius<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Claudius Heine (12):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0: 1.18.5 -&gt; 1.20.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-plugins-base: 1.18.5 -&gt; 1.2=
0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-plugins-good: 1.18.5 -&gt; 1.2=
0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-plugins-bad: 1.18.5 -&gt; 1.20=
.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-plugins-ugly: 1.18.5 -&gt; 1.2=
0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-libav: 1.18.5 -&gt; 1.20.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-python: 1.18.5 -&gt; 1.20.0<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-omx: 1.18.5 -&gt; 1.20.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-vaapi: 1.18.5 -&gt; 1.20.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstreamer1.0-rtsp-server: 1.18.5 -&gt; 1.20=
.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gst-examples: 1.18.5 -&gt; 1.20.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gst-devtools: 1.18.5 -&gt; 1.20.0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...ct-has-a-different-signature-on-musl.patc=
h |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://tools_1.18.5.bb" rel=3D=
"noreferrer" target=3D"_blank">tools_1.18.5.bb</a> &lt;<a href=3D"http://to=
ols_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://tools_1.18.5.bb<=
/a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gst-devtools_1.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">gst-devtools_1.20.0.bb</a> &lt;<a href=3D"http:=
//gst-devtools_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gst-d=
evtools_1.20.0.bb</a>&gt;} |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...001-Make-player-examples-installable.patc=
h |=C2=A0 22 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://mples_1.18.5.bb" rel=3D=
"noreferrer" target=3D"_blank">mples_1.18.5.bb</a> &lt;<a href=3D"http://mp=
les_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://mples_1.18.5.bb<=
/a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gst-examples_1.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">gst-examples_1.20.0.bb</a> &lt;<a href=3D"http:=
//gst-examples_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gst-e=
xamples_1.20.0.bb</a>&gt;} |=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...st-libav-fix-build-with-ffmpeg-5.0.0.patc=
h | 346 ------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://1.18.5.bb" rel=3D"noref=
errer" target=3D"_blank">1.18.5.bb</a> &lt;<a href=3D"http://1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://1.18.5.bb</a>&gt; =3D&gt; <a href=
=3D"http://gstreamer1.0-libav_1.20.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">gstreamer1.0-libav_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-libav_1.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-libav_1.20.0.bb</=
a>&gt;} |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://x_1.18.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">x_1.18.5.bb</a> &lt;<a href=3D"http://x_1.18.5.b=
b" rel=3D"noreferrer" target=3D"_blank">http://x_1.18.5.bb</a>&gt; =3D&gt; =
<a href=3D"http://gstreamer1.0-omx_1.20.0.bb" rel=3D"noreferrer" target=3D"=
_blank">gstreamer1.0-omx_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-omx_1.20.0.bb" r=
el=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-omx_1.20.0.bb</a>&g=
t;} |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...ialized-warnings-when-compiling-with.patc=
h |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-avoid-including-sys-poll.h-directly.patc=
h |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-sentinals-for-gst_structure_get-etc.patc=
h |=C2=A0 24 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...issing-opencv-data-dir-in-yocto-buil.patc=
h |=C2=A0 25 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.../0005-msdk-fix-includedir-path.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.=
0-plugins-bad_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-bad_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-bad_1.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-bad=
_1.20.0.bb</a>&gt;} |=C2=A0 20 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...et-caps-from-src-pad-when-query-caps.patc=
h |=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...parse-enhance-SSA-text-lines-parsing.patc=
h |=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...iv-fb-Make-sure-config.h-is-included.patc=
h |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...004-glimagesink-Downrank-to-marginal.patc=
h |=C2=A0 32 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0=
-plugins-base_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-base_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ba=
se_1.20.0.bb</a>&gt;} |=C2=A0 17 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...t-gstqtgl.h-instead-of-gst-gl-gstglf.patc=
h |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0=
-plugins-good_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-good_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-good_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-go=
od_1.20.0.bb</a>&gt;} |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0=
-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-ugly_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-ugly_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ug=
ly_1.20.0.bb</a>&gt;} |=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0....<a href=3D"http://18.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">18.5.bb</a> &lt;<a href=3D"http://18.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://18.5.bb</a>&gt; =3D&gt; <a href=3D"http=
://gstreamer1.0-python_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-python_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-python_1.20.0.bb=
" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-python_1.20.0.bb=
</a>&gt;} |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.=
0-rtsp-server_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
rtsp-server_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-rtsp-server_1.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-rtsp-server=
_1.20.0.bb</a>&gt;} |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.../gstreamer/gstreamer1.0-source.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://1.18.5.bb" rel=3D"noref=
errer" target=3D"_blank">1.18.5.bb</a> &lt;<a href=3D"http://1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://1.18.5.bb</a>&gt; =3D&gt; <a href=
=3D"http://gstreamer1.0-vaapi_1.20.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">gstreamer1.0-vaapi_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-vaapi_1.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-vaapi_1.20.0.bb</=
a>&gt;} |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...der.c-when-env-var-is-set-do-not-fal.patc=
h |=C2=A0 69 ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...pect-the-idententaion-used-in-meson.patch=
} |=C2=A0 14 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...002-Remove-unused-valgrind-detection.patc=
h | 112 ------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...s-add-support-for-install-the-tests.patch=
} |=C2=A0 67 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-use-too-strict-timeout-for-validati.patc=
h |=C2=A0 32 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-use-a-dictionaries-for-environment.patch=
} |=C2=A0 28 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...er-script-to-run-the-installed_tests.patc=
h |=C2=A0 72 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-the-environment-for-installed_tests.patc=
h |=C2=A0 58 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<a href=3D"http://er1.0_1.18.5.bb" rel=3D=
"noreferrer" target=3D"_blank">er1.0_1.18.5.bb</a> &lt;<a href=3D"http://er=
1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://er1.0_1.18.5.bb<=
/a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a> &lt;<a href=3D"http:=
//gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer1.0_1.20.0.bb</a>&gt;} |=C2=A0 25 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A034 files changed, 267 insertions(+), 865 del=
etions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-multimedia/gstreamer/{<a=
 href=3D"http://gst-devtools_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank=
">gst-devtools_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gst-devtools_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gst-devtools_1.18.5.bb</a>&gt; =3D=
&gt; <a href=3D"http://gst-devtools_1.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gst-devtools_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gst-devtools_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gst-devtools_1.20.0.bb</a>&gt;} (8=
3%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-multimedia/gstreamer/{<a=
 href=3D"http://gst-examples_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank=
">gst-examples_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gst-examples_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gst-examples_1.18.5.bb</a>&gt; =3D=
&gt; <a href=3D"http://gst-examples_1.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gst-examples_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gst-examples_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gst-examples_1.20.0.bb</a>&gt;} (8=
2%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0-liba=
v/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-libav_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-libav_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-libav_1.18.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-libav_1.18.5.bb</=
a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-libav_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.20.0.bb</a> &lt;<a h=
ref=3D"http://gstreamer1.0-libav_1.20.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://gstreamer1.0-libav_1.20.0.bb</a>&gt;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0(66%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-omx_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0-omx_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-omx_1.18.5.bb" r=
el=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-omx_1.18.5.bb</a>&g=
t; =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.20.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">gstreamer1.0-omx_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-omx_1.20.0.bb" r=
el=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-omx_1.20.0.bb</a>&g=
t;} (89%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">=
gstreamer1.0-plugins-bad_1.18.5.bb</a> &lt;<a href=3D"http://gstreamer1.0-p=
lugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer=
1.0-plugins-bad_1.18.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_=
1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.=
20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-bad_1.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-bad=
_1.20.0.bb</a>&gt;} (91%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-base/0004-glimagesink-Downrank-to-marginal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-plugins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>gstreamer1.0-plugins-base_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.1=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ba=
se_1.18.5.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-plugins-base_1.20.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.20.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ba=
se_1.20.0.bb</a>&gt;} (85%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-plugins-good_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>gstreamer1.0-plugins-good_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-good_1.1=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-go=
od_1.18.5.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-plugins-good_1.20.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.20.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-good_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-go=
od_1.20.0.bb</a>&gt;} (91%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-plugins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>gstreamer1.0-plugins-ugly_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-ugly_1.1=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ug=
ly_1.18.5.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-plugins-ugly_1.20.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ugly_1.20.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-ugly_1.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-ug=
ly_1.20.0.bb</a>&gt;} (82%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstre=
amer1.0-python_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-python_1.18.5.bb=
" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-python_1.18.5.bb=
</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-python_1.20.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-python_1.20.0.bb=
" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-python_1.20.0.bb=
</a>&gt;} (79%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-rtsp-server_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">=
gstreamer1.0-rtsp-server_1.18.5.bb</a> &lt;<a href=3D"http://gstreamer1.0-r=
tsp-server_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer=
1.0-rtsp-server_1.18.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; <a href=3D"http://gstreamer1.0-rtsp-server_=
1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-server_1.=
20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-rtsp-server_1.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-rtsp-server=
_1.20.0.bb</a>&gt;} (70%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0-sour=
ce.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/{<a href=3D"http:=
//gstreamer1.0-vaapi_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-vaapi_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-vaapi_1.18.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-vaapi_1.18.5.bb</=
a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0-vaapi_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.0.bb</a> &lt;<a h=
ref=3D"http://gstreamer1.0-vaapi_1.20.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://gstreamer1.0-vaapi_1.20.0.bb</a>&gt;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0(90%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0001=
-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
4-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0001-tests-respect-the-idententaion-used-in=
-meson.patch} (71%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0002=
-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
5-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0002-tests-add-support-for-install-the-test=
s.patch} (65%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0003=
-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
6-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0003-tests-use-a-dictionaries-for-environme=
nt.patch} (61%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0004=
-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0007=
-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-multimedia/gstreamer/{<a=
 href=3D"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank=
">gstreamer1.0_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt; =3D=
&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gstreamer1.0_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;} (7=
2%)<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0base-commit: a179485351a0563d12a2fef3e49971122255ed=
80<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
-- <br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000079b55705d67b64f4--

