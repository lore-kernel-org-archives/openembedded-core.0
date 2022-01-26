Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A05AC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:52:20 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.10941.1643194336199979948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUUZ9Qn0;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id x7so62203647lfu.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1wNXuO/iaaEBkowSZirJoTS8N4cHrhKBPEea1m3viI=;
        b=aUUZ9Qn0cHFbLNx4Y2waOUZvDYJ18GRvMSVuDcFVwYbs5pZhL44lGDSlUQD2jwODM3
         hhjUiarZytqkNwzSv2RhmO/i5TXDO1hBNtNY2tTinmCLktPwCRhyX8e4upuwb/brn/tY
         1NFvu62EZncnVaTxTmCULfxTErdJJw7+LPdMWmHVITEWHcVGUWck2hiq63glnwbZtBoz
         Tmmtu51ooah6gG+oYjLvFH0Di+yuhXQssFRIj+9J4dRErywhifn/AuCn/LRL2vD/ewAV
         e3W0WdPiTS3DcQfcPa/H0MqF58/2A8G4BjqI20Cc+UEvk/efX8f5i+/REcUds5nidzIp
         xcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1wNXuO/iaaEBkowSZirJoTS8N4cHrhKBPEea1m3viI=;
        b=cQMJ/7Hp161snmzxvt8xzCUdt5RGSboCQwRelV1kC++8nx/5fekx1ITznROL4DJ5mj
         oTStSsLBM+wvQKEufwnSKjmhs/BLpGtzeoDIkG7BMarAWai5UFjzBEYyHkK8foVAICEm
         qamBlTynqR7E/eqkMDbTPKe7BqUWX+gqnhJfNqID1VEk9/nB91JSkfHbNx0rPVqburgZ
         KrH45zdjJ+9GJStZTVIwWopakd/xYnLMA4Jmz9e19RHoNEz60pylMUWhwSp04fhDs2LG
         5R0tCNAIj2Gp8e00fHD4/YuQWZW2QmQdEQdC+fS5xVhscsXE/ePBT7520Zsln06rFcG8
         uYPg==
X-Gm-Message-State: AOAM532Gss6FJdgtaQkzynAt03TMHcbPImB4MfqrTPwUSUMfHak7oFhK
	duiO9qxlddfyD1ugakqkWQL6BWdDttnyHJjwRJk=
X-Google-Smtp-Source: 
 ABdhPJxjbkUnEUuR5kCNzsnHzSDajtIqSd5FaQJu+wLjRgRKc19OR8uQ2ridkCaSpKr8UjgwSLvGIpCv0dlUjKKRnt0=
X-Received: by 2002:a05:6512:3a85:: with SMTP id
 q5mr19021445lfu.555.1643194334009;
 Wed, 26 Jan 2022 02:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20220126102814.4173943-1-ch@denx.de>
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Jan 2022 10:52:03 +0000
Message-ID: 
 <CANPvuR=bCzgv+R3kHQgDOh4CSst7CP0y+uy+9L_my4oVQrdm1A@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000935c7205d679fe77"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:52:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160979

--000000000000935c7205d679fe77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudius,

I think we can do that switch for the monorepo in a follow up patch after
the 1.20 integration.
I have an internal update with most ready for 19.3 that misses some of the
existing downstream patches that we have.

The gstreamer project will provide the archives for different components as
they had done so far,
so we don't need to change the monorepo to integrate the gstreamer 1.20 for
now.

Cheers,
Jose

Claudius Heine <ch@denx.de> escreveu no dia quarta, 26/01/2022 =C3=A0(s) 10=
:28:

> Hi,
>
> since the release of gstreamer 1.20 is getting close, and it might make
> sense to
> include it into the kirkstone release. I prepared preliminary update
> patchset
> for it.
>
> Gstreamer changed to use monorepos with 1.20 so I went ahead I changed al=
l
> recipes to use one SRC_URI from `gstreamer1.0-source.inc`. Currently I
> just use
> a tarball from a unrelease commit id, but that will be changed to the
> correct
> one, after gstreamer is released.
>
> I have some ideas which could be implemented with this change, but I want=
ed
> feedback for this first:
>  - remove the version from the filename, and define the PV in the
>    `gstreamer1.0-source.inc`, this might make future updates easier.
>  - put all recipes together into one recipe, which provides packages for
> all
>    subprojects, this improves build time and makes maintenance easier, bu=
t
> also
>    breaks downstream bbappends.
>
> Any feedback on this is welcome.
>
> kind regards,
> Claudius
>
> Claudius Heine (12):
>   gstreamer1.0: 1.18.5 -> 1.20.0
>   gstreamer1.0-plugins-base: 1.18.5 -> 1.20.0
>   gstreamer1.0-plugins-good: 1.18.5 -> 1.20.0
>   gstreamer1.0-plugins-bad: 1.18.5 -> 1.20.0
>   gstreamer1.0-plugins-ugly: 1.18.5 -> 1.20.0
>   gstreamer1.0-libav: 1.18.5 -> 1.20.0
>   gstreamer1.0-python: 1.18.5 -> 1.20.0
>   gstreamer1.0-omx: 1.18.5 -> 1.20.0
>   gstreamer1.0-vaapi: 1.18.5 -> 1.20.0
>   gstreamer1.0-rtsp-server: 1.18.5 -> 1.20.0
>   gst-examples: 1.18.5 -> 1.20.0
>   gst-devtools: 1.18.5 -> 1.20.0
>
>  ...ct-has-a-different-signature-on-musl.patch |   8 +-
>  ...tools_1.18.5.bb =3D> gst-devtools_1.20.0.bb} |   9 +-
>  ...001-Make-player-examples-installable.patch |  22 +-
>  ...mples_1.18.5.bb =3D> gst-examples_1.20.0.bb} |  11 +-
>  ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ------------------
>  ...1.18.5.bb =3D> gstreamer1.0-libav_1.20.0.bb} |   9 +-
>  ...x_1.18.5.bb =3D> gstreamer1.0-omx_1.20.0.bb} |   6 +-
>  ...ialized-warnings-when-compiling-with.patch |   8 +-
>  ...-avoid-including-sys-poll.h-directly.patch |   8 +-
>  ...-sentinals-for-gst_structure_get-etc.patch |  24 +-
>  ...issing-opencv-data-dir-in-yocto-buil.patch |  25 +-
>  .../0005-msdk-fix-includedir-path.patch       |  26 +-
>  ....bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb} |  20 +-
>  ...et-caps-from-src-pad-when-query-caps.patch |  10 +-
>  ...parse-enhance-SSA-text-lines-parsing.patch |  10 +-
>  ...iv-fb-Make-sure-config.h-is-included.patch |   8 +-
>  ...004-glimagesink-Downrank-to-marginal.patch |  32 --
>  ...bb =3D> gstreamer1.0-plugins-base_1.20.0.bb} |  17 +-
>  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  12 +-
>  ...bb =3D> gstreamer1.0-plugins-good_1.20.0.bb} |   9 +-
>  ...bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb} |  10 +-
>  ....18.5.bb =3D> gstreamer1.0-python_1.20.0.bb} |   7 +-
>  ....bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb} |   8 +-
>  .../gstreamer/gstreamer1.0-source.inc         |   5 +
>  ...1.18.5.bb =3D> gstreamer1.0-vaapi_1.20.0.bb} |   5 +-
>  ...der.c-when-env-var-is-set-do-not-fal.patch |  69 ----
>  ...pect-the-idententaion-used-in-meson.patch} |  14 +-
>  ...002-Remove-unused-valgrind-detection.patch | 112 ------
>  ...s-add-support-for-install-the-tests.patch} |  67 ++--
>  ...-use-too-strict-timeout-for-validati.patch |  32 --
>  ...-use-a-dictionaries-for-environment.patch} |  28 +-
>  ...er-script-to-run-the-installed_tests.patch |  72 ++++
>  ...-the-environment-for-installed_tests.patch |  58 ---
>  ...er1.0_1.18.5.bb =3D> gstreamer1.0_1.20.0.bb} |  25 +-
>  34 files changed, 267 insertions(+), 865 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb =3D>
> gst-devtools_1.20.0.bb} (83%)
>  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb =3D>
> gst-examples_1.20.0.bb} (82%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-b=
uild-with-ffmpeg-5.0.0.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb
> =3D> gstreamer1.0-libav_1.20.0.bb} (66%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb =3D=
>
> gstreamer1.0-omx_1.20.0.bb} (89%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.18.5.bb =3D> gstreamer1.0-plugins-bad_1.20.0.b=
b}
> (91%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimages=
ink-Downrank-to-marginal.patch
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.18.5.bb =3D> gstreamer1.0-plugins-base_1.20.0=
.bb}
> (85%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.18.5.bb =3D> gstreamer1.0-plugins-good_1.20.0=
.bb}
> (91%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.18.5.bb =3D> gstreamer1.0-plugins-ugly_1.20.0=
.bb}
> (82%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb
> =3D> gstreamer1.0-python_1.20.0.bb} (79%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-rtsp-server_1.18.5.bb =3D> gstreamer1.0-rtsp-server_1.20.0.b=
b}
> (70%)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb
> =3D> gstreamer1.0-vaapi_1.20.0.bb} (90%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c=
-when-env-var-is-set-do-not-fal.patch
>  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-id=
ententaion-used-in-meson.patch
> =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrin=
d-detection.patch
>  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-fo=
r-install-the-tests.patch
> =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-=
too-strict-timeout-for-validati.patch
>  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-dictiona=
ries-for-environment.patch
> =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-env=
ironment-for-installed_tests.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D>
> gstreamer1.0_1.20.0.bb} (72%)
>
>
> base-commit: a179485351a0563d12a2fef3e49971122255ed80
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000935c7205d679fe77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Claudius,<div><br></div><div=
><div style=3D"color:rgb(0,0,0)">I think we can do that switch for the mono=
repo in a follow up patch after the 1.20 integration.</div><div style=3D"co=
lor:rgb(0,0,0)">I have an internal update with most ready for 19.3 that mis=
ses some of the existing downstream patches that we=C2=A0have.</div></div><=
div style=3D"color:rgb(0,0,0)"><br></div><div style=3D"color:rgb(0,0,0)"><d=
iv>The gstreamer project will provide the archives for different=C2=A0compo=
nents as they had done so far,</div><div>so we don&#39;t=C2=A0need to chang=
e the monorepo to integrate the gstreamer 1.20 for now.</div></div><div sty=
le=3D"color:rgb(0,0,0)"><br></div><div>Cheers,</div><div>Jose</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Claudius =
Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de</a>&gt=
; escreveu no dia quarta, 26/01/2022 =C3=A0(s) 10:28:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
since the release of gstreamer 1.20 is getting close, and it might make sen=
se to<br>
include it into the kirkstone release. I prepared preliminary update patchs=
et<br>
for it.<br>
<br>
Gstreamer changed to use monorepos with 1.20 so I went ahead I changed all<=
br>
recipes to use one SRC_URI from `gstreamer1.0-source.inc`. Currently I just=
 use<br>
a tarball from a unrelease commit id, but that will be changed to the corre=
ct<br>
one, after gstreamer is released.<br>
<br>
I have some ideas which could be implemented with this change, but I wanted=
<br>
feedback for this first:<br>
=C2=A0- remove the version from the filename, and define the PV in the<br>
=C2=A0 =C2=A0`gstreamer1.0-source.inc`, this might make future updates easi=
er.<br>
=C2=A0- put all recipes together into one recipe, which provides packages f=
or all<br>
=C2=A0 =C2=A0subprojects, this improves build time and makes maintenance ea=
sier, but also<br>
=C2=A0 =C2=A0breaks downstream bbappends.<br>
<br>
Any feedback on this is welcome.<br>
<br>
kind regards,<br>
Claudius<br>
<br>
Claudius Heine (12):<br>
=C2=A0 gstreamer1.0: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-plugins-base: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-plugins-good: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-plugins-bad: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-plugins-ugly: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-libav: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-python: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-omx: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-vaapi: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gstreamer1.0-rtsp-server: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gst-examples: 1.18.5 -&gt; 1.20.0<br>
=C2=A0 gst-devtools: 1.18.5 -&gt; 1.20.0<br>
<br>
=C2=A0...ct-has-a-different-signature-on-musl.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...<a href=3D"http://tools_1.18.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">tools_1.18.5.bb</a> =3D&gt; <a href=3D"http://gst-devtools_1.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gst-devtools_1.20.0.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A0...001-Make-player-examples-installable.patch |=C2=A0 22 +-<br>
=C2=A0...<a href=3D"http://mples_1.18.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">mples_1.18.5.bb</a> =3D&gt; <a href=3D"http://gst-examples_1.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gst-examples_1.20.0.bb</a>} |=C2=A0 1=
1 +-<br>
=C2=A0...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 -----------------=
-<br>
=C2=A0...<a href=3D"http://1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">=
1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-libav_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.20.0.bb</a>} |=C2=A0=
 =C2=A09 +-<br>
=C2=A0...<a href=3D"http://x_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank=
">x_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.20.0.bb</a>} |=C2=A0 =
=C2=A06 +-<br>
=C2=A0...ialized-warnings-when-compiling-with.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...-avoid-including-sys-poll.h-directly.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...-sentinals-for-gst_structure_get-etc.patch |=C2=A0 24 +-<br>
=C2=A0...issing-opencv-data-dir-in-yocto-buil.patch |=C2=A0 25 +-<br>
=C2=A0.../0005-msdk-fix-includedir-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 26 +-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.20.0.bb</a>=
} |=C2=A0 20 +-<br>
=C2=A0...et-caps-from-src-pad-when-query-caps.patch |=C2=A0 10 +-<br>
=C2=A0...parse-enhance-SSA-text-lines-parsing.patch |=C2=A0 10 +-<br>
=C2=A0...iv-fb-Make-sure-config.h-is-included.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...004-glimagesink-Downrank-to-marginal.patch |=C2=A0 32 --<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-base_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.20.0.bb</a=
>} |=C2=A0 17 +-<br>
=C2=A0...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |=C2=A0 12 +-<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-good_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.20.0.bb</a=
>} |=C2=A0 =C2=A09 +-<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-ugly_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ugly_1.20.0.bb</a=
>} |=C2=A0 10 +-<br>
=C2=A0....<a href=3D"http://18.5.bb" rel=3D"noreferrer" target=3D"_blank">1=
8.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.20.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gstreamer1.0-python_1.20.0.bb</a>} |=C2=A0 =
=C2=A07 +-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-rtsp-server_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-server_1.20.0.bb</a>=
} |=C2=A0 =C2=A08 +-<br>
=C2=A0.../gstreamer/gstreamer1.0-source.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +<br>
=C2=A0...<a href=3D"http://1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">=
1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.0.bb</a>} |=C2=A0=
 =C2=A05 +-<br>
=C2=A0...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 69 ----<br>
=C2=A0...pect-the-idententaion-used-in-meson.patch} |=C2=A0 14 +-<br>
=C2=A0...002-Remove-unused-valgrind-detection.patch | 112 ------<br>
=C2=A0...s-add-support-for-install-the-tests.patch} |=C2=A0 67 ++--<br>
=C2=A0...-use-too-strict-timeout-for-validati.patch |=C2=A0 32 --<br>
=C2=A0...-use-a-dictionaries-for-environment.patch} |=C2=A0 28 +-<br>
=C2=A0...er-script-to-run-the-installed_tests.patch |=C2=A0 72 ++++<br>
=C2=A0...-the-environment-for-installed_tests.patch |=C2=A0 58 ---<br>
=C2=A0...<a href=3D"http://er1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">er1.0_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>} |=C2=A0 2=
5 +-<br>
=C2=A034 files changed, 267 insertions(+), 865 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst-devto=
ols_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gst-devtools_1.18.5.bb<=
/a> =3D&gt; <a href=3D"http://gst-devtools_1.20.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gst-devtools_1.20.0.bb</a>} (83%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst-examp=
les_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gst-examples_1.18.5.bb<=
/a> =3D&gt; <a href=3D"http://gst-examples_1.20.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gst-examples_1.20.0.bb</a>} (82%)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-lib=
av/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-libav_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-liba=
v_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-libav_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.20.0.bb</a>} (66%)<b=
r>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-omx_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.=
18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-omx_1.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">gstreamer1.0-omx_1.20.0.bb</a>} (89%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-bad_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugins-=
bad_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ba=
d_1.20.0.bb</a>} (91%)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-base/0004-glimagesink-Downrank-to-marginal.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-base_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-base_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-base_1.20.0.bb</a>} (85%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-good_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-good_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-good_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-good_1.20.0.bb</a>} (91%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-ugly_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-ugly_1.20.0.bb</a>} (82%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-pyt=
hon_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.20.0.bb</a>} (79=
%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-rtsp-server_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-rtsp-server_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-rtsp-ser=
ver_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-serve=
r_1.20.0.bb</a>} (70%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-sou=
rce.inc<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-vaapi_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaap=
i_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.0.bb</a>} (90%)<b=
r>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
1-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-res=
pect-the-idententaion-used-in-meson.patch =3D&gt; 0001-tests-respect-the-id=
ententaion-used-in-meson.patch} (71%)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
2-Remove-unused-valgrind-detection.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add=
-support-for-install-the-tests.patch =3D&gt; 0002-tests-add-support-for-ins=
tall-the-tests.patch} (65%)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
3-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use=
-a-dictionaries-for-environment.patch =3D&gt; 0003-tests-use-a-dictionaries=
-for-environment.patch} (61%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
4-tests-add-helper-script-to-run-the-installed_tests.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
7-tests-install-the-environment-for-installed_tests.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.5.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.20.0.bb</a>} (72%)<br>
<br>
<br>
base-commit: a179485351a0563d12a2fef3e49971122255ed80<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div>

--000000000000935c7205d679fe77--

