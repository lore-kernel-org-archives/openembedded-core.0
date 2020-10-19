Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web09.10453.1603102620240069999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ty3F3mJz;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id 33so9598491edq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/HeqtLsW17YlalFyFtFwMUH4d+zTm3sSSKJasUfVC1U=;
        b=Ty3F3mJz6dJMDq9Hr89VXj5ZHB31fz35RjRBUoGBu5ejWxKt+/C/RCx93w/iXtry11
         +1e7RmwBvu/mknkMUcXZ1W3fPs1wV1PXSVtKFv2taCN1EHpbpHOpnBt3l09xHdzgaqV2
         xYn6ssYZAAn9c4se6wYh2FZfAJZ0T+uGw0e6/LTH3/NDe3KmiYS9EY4mc+jHvQnfMIwH
         IB3eLNQKgyjbBSLn3c2Q1Nd2j+q6cQO/iYbZC4gvIhsH/RQDlaJ2LtneSLgeSIJg2Yo0
         HLicKJZKAj9S+D5eMiyF0xb1OWvzxCg5XphtAtZx6ykIDGIjwEvb9Mlo4zvokv1F1VkK
         XpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/HeqtLsW17YlalFyFtFwMUH4d+zTm3sSSKJasUfVC1U=;
        b=LU3wgMI0yg6l7c5BgzJF9aAoN0whd2XdcuUGPlaqDIjXHlJ1aJUcsPzIiQR+UyZwpI
         cHH8SuQUdXl7nxBlcjKRQSyqifXo6jzuiz9bVUAkKW+bIbgiIWfxajztmypU6jvY+lNp
         EXAyd5cwwnODTRpfK+bFQ99NrhgG1gk+Chgqvx8iIC/nKsu6Kh2eAB8gj7HnUzdWz+TN
         vUxwYrzEj/q4IrhKwVfyRc8wGPf076iSwg/uxStarAoipuPYDXYDKKwqKuEyY7jvs62o
         LJFxZGHnPj58DdlwVhQmsSQTgyjhKI1xgqJpvkzXqkogHQDA2t+9rtSbzcqivJNt8wN6
         t0vQ==
X-Gm-Message-State: AOAM5306fupuqwhUg3uOgSq4NeTHq8PexPw65ms3f41R9NlHCX41+vlf
	zqXaioyxlfoQYllq7LAiHpTAiSAiZUqQ68zDgXk=
X-Google-Smtp-Source: ABdhPJxCMsLJLHC5N6smxkh+EmmBbt5PXIOHK0Emj1E+qKdd2amkV5TFfNYNDpEWIN6HVfMhd/SSJP/fp5k1y/KlcPQ=
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr16799062edq.59.1603102618508;
 Mon, 19 Oct 2020 03:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
 <CANPvuR=b0hWOqmyPaFer+peo9emNg3Wi=f3+NewnsjnLj-G2ng@mail.gmail.com> <CANNYZj8QeSngMXxoBHzvbq_dNovZJVQ=b21YqAObpGWy69qXeQ@mail.gmail.com>
In-Reply-To: <CANNYZj8QeSngMXxoBHzvbq_dNovZJVQ=b21YqAObpGWy69qXeQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 19 Oct 2020 11:16:47 +0100
Message-ID: <CANPvuR=yK9Y6GVeQsBfTipoY7=Jd=--tLBNJK75iKQi3==i-iw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 00/20] Updates the gstreamer to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's good to know that everything is fine so

Thanks Alex

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
19/10/2020 =C3=A0(s) 11:13:
>
> Patchwork is not the canonical source for the patch queue (this maillist=
 is), so if it doesn't appear there you shouldn't worry too much.
>
> Alex
>
> On Mon, 19 Oct 2020 at 12:06, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> Is there a problem with this that I don't understand?
>> This version of the series does not appear on.
>> https://patchwork.openembedded.org/project/oe-core/series
>>
>> Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia domingo,
>> 18/10/2020 =C3=A0(s) 13:10:
>> >
>> > V2:
>> > - Fixes the build of vulkan plugin
>> > - Fixes pacth headers
>> > - Upgrade orc 0.4.31 -> 0.4.32
>> >
>> > V3:
>> > - gstreamer1.0: Fix reproducibility issue around libcap
>> > - gstreamer1.0-python: install append is not need any more
>> > - gstreamer1.0-plugins-[good/bad]: disable new meson options
>> > - gstreamer1.0-plugins-[base/good/bad]: add new meson option as PACKA=
GECONFIG
>> > - Update pacth headers
>> >
>> > Jose Quaresma (20):
>> >   gstreamer1.0: upgrade to version 1.18.0
>> >   gstreamer1.0: Fix reproducibility issue around libcap
>> >   gstreamer1.0-plugins-base: upgrade to version 1.18.0
>> >   gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
>> >   gstreamer1.0-plugins-good: upgrade to version 1.18.0
>> >   gstreamer1.0-plugins-good: disable new meson options
>> >   gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
>> >   gstreamer1.0-plugins-bad: upgrade to version 1.18.0
>> >   gstreamer1.0-plugins-bad: disable new meson options
>> >   gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
>> >   gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
>> >   gstreamer1.0-python: upgrade to version 1.18.0
>> >   gstreamer1.0-python: install append is not need any more
>> >   gstreamer1.0-rtsp-server: upgrade to version 1.18.0
>> >   gstreamer1.0-vaapi: upgrade to version 1.18.0
>> >   gst-examples: upgrade to version 1.18.0
>> >   gstreamer1.0-omx: upgrade to version 1.18.0
>> >   gstreamer1.0-libav: upgrade to version 1.18.0
>> >   gst-devtools: add version 1.18.0 (gst-validate -> gst-devtools)
>> >   orc: Upgrade 0.4.31 -> 0.4.32
>> >
>> >  .../orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb}      |   3 +-
>> >  ...ct-has-a-different-signature-on-musl.patch |  10 +-
>> >  .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
>> >  ...001-Make-player-examples-installable.patch |  24 +-
>> >  ...mples_1.16.0.bb =3D> gst-examples_1.18.0.bb} |   4 +-
>> >  .../gstreamer/gst-validate_1.16.2.bb          |  25 --
>> >  .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
>> >  .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  21 ++
>> >  ...x_1.16.2.bb =3D> gstreamer1.0-omx_1.18.0.bb} |   4 +-
>> >  ...alized-warnings-when-compiling-with.patch} |   8 +-
>> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>> >  ...avoid-including-sys-poll.h-directly.patch} |   8 +-
>> >  ...sentinals-for-gst_structure_get-etc.patch} |  43 ++--
>> >  ...ssing-opencv-data-dir-in-yocto-buil.patch} |   8 +-
>> >  ....bb =3D> gstreamer1.0-plugins-bad_1.18.0.bb} |  38 +--
>> >  ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
>> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>> >  ...02-meson-Add-variables-for-gir-files.patch | 235 ----------------=
--
>> >  ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
>> >  ...v-fb-Make-sure-config.h-is-included.patch} |   8 +-
>> >  ...04-glimagesink-Downrank-to-marginal.patch} |   8 +-
>> >  ...bb =3D> gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
>> >  ...defines-GLsync-to-fix-compile-on-som.patch |  70 ------
>> >  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |   8 +-
>> >  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} |  17 +-
>> >  ...bb =3D> gstreamer1.0-plugins-ugly_1.18.0.bb} |   5 +-
>> >  ...son.build-fix-builds-with-python-3.8.patch |  24 --
>> >  ....16.2.bb =3D> gstreamer1.0-python_1.18.0.bb} |  24 +-
>> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>> >  ....bb =3D> gstreamer1.0-rtsp-server_1.18.0.bb} |   9 +-
>> >  .../0001-vaapsink-downgrade-to-marginal.patch |  46 ----
>> >  ...1.16.2.bb =3D> gstreamer1.0-vaapi_1.18.0.bb} |  16 +-
>> >  ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +-
>> >  ...002-Remove-unused-valgrind-detection.patch | 112 +++++++++
>> >  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>> >  ...eson-Add-option-for-installed-tests.patch} |  20 +-
>> >  .../0003-meson-Add-valgrind-feature.patch     |  74 ------
>> >  .../gstreamer/gstreamer1.0/capfix.patch       |  37 ---
>> >  ...er1.0_1.16.2.bb =3D> gstreamer1.0_1.18.0.bb} |  29 +--
>> >  39 files changed, 350 insertions(+), 880 deletions(-)
>> >  rename meta/recipes-devtools/orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb} =
(86%)
>> >  rename meta/recipes-multimedia/gstreamer/{gst-validate =3D> gst-devt=
ools}/0001-connect-has-a-different-signature-on-musl.patch (76%)
>> >  create mode 100644 meta/recipes-multimedia/gstreamer/gst-devtools_1.=
18.0.bb
>> >  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb =3D=
> gst-examples_1.18.0.bb} (91%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.=
16.2.bb
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-li=
bav_1.16.2.bb
>> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-li=
bav_1.18.0.bb
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb=
 =3D> gstreamer1.0-omx_1.18.0.bb} (92%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{f=
ix-maybe-uninitialized-warnings-when-compiling-with-Os.patch =3D> 0001-fix-=
maybe-uninitialized-warnings-when-compiling-with.patch} (80%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{a=
void-including-sys-poll.h-directly.patch =3D> 0002-avoid-including-sys-poll=
.h-directly.patch} (79%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{e=
nsure-valid-sentinels-for-gst_structure_get-etc.patch =3D> 0003-ensure-vali=
d-sentinals-for-gst_structure_get-etc.patch} (69%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{o=
pencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch =3D> 0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch} (91%)
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1=
.16.2.bb =3D> gstreamer1.0-plugins-bad_1.18.0.bb} (85%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{=
get-caps-from-src-pad-when-query-caps.patch =3D> 0001-ENGR00312515-get-caps=
-from-src-pad-when-query-caps.patch} (81%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-base/0002-meson-Add-variables-for-gir-files.patch
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{=
0003-ssaparse-enhance-SSA-text-lines-parsing.patch =3D> 0002-ssaparse-enhan=
ce-SSA-text-lines-parsing.patch} (98%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{=
0005-viv-fb-Make-sure-config.h-is-included.patch =3D> 0003-viv-fb-Make-sure=
-config.h-is-included.patch} (80%)
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{=
0009-glimagesink-Downrank-to-marginal.patch =3D> 0004-glimagesink-Downrank-=
to-marginal.patch} (85%)
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_=
1.16.2.bb =3D> gstreamer1.0-plugins-base_1.18.0.bb} (78%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_=
1.16.2.bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} (84%)
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_=
1.16.2.bb =3D> gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-py=
thon/0001-meson.build-fix-builds-with-python-3.8.patch
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2=
.bb =3D> gstreamer1.0-python_1.18.0.bb} (50%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rt=
sp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1=
.16.2.bb =3D> gstreamer1.0-rtsp-server_1.18.0.bb} (74%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-va=
api/0001-vaapsink-downgrade-to-marginal.patch
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.=
bb =3D> gstreamer1.0-vaapi_1.18.0.bb} (82%)
>> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-Remove-unused-valgrind-detection.patch
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>> >  rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Ad=
d-option-for-installed-tests.patch =3D> 0003-meson-Add-option-for-installed=
-tests.patch} (97%)
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-meson-Add-valgrind-feature.patch
>> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/ca=
pfix.patch
>> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb =3D=
> gstreamer1.0_1.18.0.bb} (72%)
>> >
>> > --
>> > 2.28.0
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma
>>
>>=20
>>


--=20
best regards,
Jos=C3=A9 Quaresma
