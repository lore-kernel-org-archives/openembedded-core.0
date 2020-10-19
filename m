Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.10326.1603101997624805915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2pZFTiK;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dn5so9587269edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Dn5OnFvvGH/9hy/hC4lkTuh44Zg9+fVatGr72UakyrU=;
        b=M2pZFTiKunwU30MtBomYDmA0S+kEqU788I4Bn+30UwW2bmuP0jp35Rg6ZvetiF5hZU
         uFy/f9rmNo8dfxHWBRj0Uz8kzPYRHQsaEIob4WD/wCpn218UK+H2SJxRebVCOafvKgU7
         ySn3qBK21BMULCwHeSbeHo4OlPWwSjQ382aPmNVK43LKjoQytAvBnA6nYKcKSVWoQDf2
         vnszGCezSrj/BVDl7rCFcRyrIGuVWVSM/7CjAiRSl42QMX6mpUeCpolhs4oKWcPFOPBj
         4W/C6KnvWozf3h0Z6KSMBMAC3b9GKIgxOSYrFv88421ZMn4iqEEqd3eY3hAkD41usx3e
         HSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Dn5OnFvvGH/9hy/hC4lkTuh44Zg9+fVatGr72UakyrU=;
        b=dqZ80TkduHvE3M4eputjuP4qgkzqMQliayHjKpcFHCvdAZRw2MFnEm9CqY/cwjRrCg
         qCSx72f+oghCyjkZouNFKoXzExz8XapQLx9zahmJIKUxQT8JALgCwiDD+HiEwo+VWxOg
         vqpUqhQYawVy/8nlEVnfj4nrjWwefASKz77s3cky9Z1d/LHZ5yrZCGHJkqNRckqHa1ZU
         lQJu/6AozGpkg96bWvlagx4PCvJjNfkp/6P4HLwhTZbZneeAl+G8I4H5e8tOPkhKitxy
         aJrjmTX0sV84eU6p1D8zFjcL3HKzC03er4Pc/1KF40HsVIb//9pdep2wjCxotB1ZTb7U
         4M2A==
X-Gm-Message-State: AOAM533LC/0ZZwpU1GJZdUvJCZknRKAP7TtKA/77j5mVE+E1jvfhPABc
	xocMCv8NIULCvEFV588H78Ip8sOoBP5a1WhIzRGBanIvlnlddQ==
X-Google-Smtp-Source: ABdhPJyF+f9k4uRFnhP4Dz5m6f9YKL6tEJ595UZBADaLK0H8DSgEDPPhF+A4O+wOHk2eNplt9+czpHbkru6lWy9UrLo=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr17126621edb.19.1603101990573;
 Mon, 19 Oct 2020 03:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 19 Oct 2020 11:06:19 +0100
Message-ID: <CANPvuR=b0hWOqmyPaFer+peo9emNg3Wi=f3+NewnsjnLj-G2ng@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Updates the gstreamer to version 1.18.0
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there a problem with this that I don't understand?
This version of the series does not appear on.
https://patchwork.openembedded.org/project/oe-core/series

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia domingo,
18/10/2020 =C3=A0(s) 13:10:
>
> V2:
> - Fixes the build of vulkan plugin
> - Fixes pacth headers
> - Upgrade orc 0.4.31 -> 0.4.32
>
> V3:
> - gstreamer1.0: Fix reproducibility issue around libcap
> - gstreamer1.0-python: install append is not need any more
> - gstreamer1.0-plugins-[good/bad]: disable new meson options
> - gstreamer1.0-plugins-[base/good/bad]: add new meson option as PACKAGECO=
NFIG
> - Update pacth headers
>
> Jose Quaresma (20):
>   gstreamer1.0: upgrade to version 1.18.0
>   gstreamer1.0: Fix reproducibility issue around libcap
>   gstreamer1.0-plugins-base: upgrade to version 1.18.0
>   gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
>   gstreamer1.0-plugins-good: upgrade to version 1.18.0
>   gstreamer1.0-plugins-good: disable new meson options
>   gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
>   gstreamer1.0-plugins-bad: upgrade to version 1.18.0
>   gstreamer1.0-plugins-bad: disable new meson options
>   gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
>   gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
>   gstreamer1.0-python: upgrade to version 1.18.0
>   gstreamer1.0-python: install append is not need any more
>   gstreamer1.0-rtsp-server: upgrade to version 1.18.0
>   gstreamer1.0-vaapi: upgrade to version 1.18.0
>   gst-examples: upgrade to version 1.18.0
>   gstreamer1.0-omx: upgrade to version 1.18.0
>   gstreamer1.0-libav: upgrade to version 1.18.0
>   gst-devtools: add version 1.18.0 (gst-validate -> gst-devtools)
>   orc: Upgrade 0.4.31 -> 0.4.32
>
>  .../orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb}      |   3 +-
>  ...ct-has-a-different-signature-on-musl.patch |  10 +-
>  .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
>  ...001-Make-player-examples-installable.patch |  24 +-
>  ...mples_1.16.0.bb =3D> gst-examples_1.18.0.bb} |   4 +-
>  .../gstreamer/gst-validate_1.16.2.bb          |  25 --
>  .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
>  .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  21 ++
>  ...x_1.16.2.bb =3D> gstreamer1.0-omx_1.18.0.bb} |   4 +-
>  ...alized-warnings-when-compiling-with.patch} |   8 +-
>  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>  ...avoid-including-sys-poll.h-directly.patch} |   8 +-
>  ...sentinals-for-gst_structure_get-etc.patch} |  43 ++--
>  ...ssing-opencv-data-dir-in-yocto-buil.patch} |   8 +-
>  ....bb =3D> gstreamer1.0-plugins-bad_1.18.0.bb} |  38 +--
>  ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
>  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>  ...02-meson-Add-variables-for-gir-files.patch | 235 ------------------
>  ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
>  ...v-fb-Make-sure-config.h-is-included.patch} |   8 +-
>  ...04-glimagesink-Downrank-to-marginal.patch} |   8 +-
>  ...bb =3D> gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
>  ...defines-GLsync-to-fix-compile-on-som.patch |  70 ------
>  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |   8 +-
>  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} |  17 +-
>  ...bb =3D> gstreamer1.0-plugins-ugly_1.18.0.bb} |   5 +-
>  ...son.build-fix-builds-with-python-3.8.patch |  24 --
>  ....16.2.bb =3D> gstreamer1.0-python_1.18.0.bb} |  24 +-
>  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>  ....bb =3D> gstreamer1.0-rtsp-server_1.18.0.bb} |   9 +-
>  .../0001-vaapsink-downgrade-to-marginal.patch |  46 ----
>  ...1.16.2.bb =3D> gstreamer1.0-vaapi_1.18.0.bb} |  16 +-
>  ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +-
>  ...002-Remove-unused-valgrind-detection.patch | 112 +++++++++
>  ...even-when-cross-compiling-if-introsp.patch |  36 ---
>  ...eson-Add-option-for-installed-tests.patch} |  20 +-
>  .../0003-meson-Add-valgrind-feature.patch     |  74 ------
>  .../gstreamer/gstreamer1.0/capfix.patch       |  37 ---
>  ...er1.0_1.16.2.bb =3D> gstreamer1.0_1.18.0.bb} |  29 +--
>  39 files changed, 350 insertions(+), 880 deletions(-)
>  rename meta/recipes-devtools/orc/{orc_0.4.31.bb =3D> orc_0.4.32.bb} (86%=
)
>  rename meta/recipes-multimedia/gstreamer/{gst-validate =3D> gst-devtools=
}/0001-connect-has-a-different-signature-on-musl.patch (76%)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0=
.bb
>  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb =3D> gs=
t-examples_1.18.0.bb} (91%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.16.2=
.bb
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_=
1.16.2.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_=
1.18.0.bb
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb =3D=
> gstreamer1.0-omx_1.18.0.bb} (92%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{fix-m=
aybe-uninitialized-warnings-when-compiling-with-Os.patch =3D> 0001-fix-mayb=
e-uninitialized-warnings-when-compiling-with.patch} (80%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{avoid=
-including-sys-poll.h-directly.patch =3D> 0002-avoid-including-sys-poll.h-d=
irectly.patch} (79%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{ensur=
e-valid-sentinels-for-gst_structure_get-etc.patch =3D> 0003-ensure-valid-se=
ntinals-for-gst_structure_get-etc.patch} (69%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch =3D> 0004-opencv-reso=
lve-missing-opencv-data-dir-in-yocto-buil.patch} (91%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.=
2.bb =3D> gstreamer1.0-plugins-bad_1.18.0.bb} (85%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{get-=
caps-from-src-pad-when-query-caps.patch =3D> 0001-ENGR00312515-get-caps-fro=
m-src-pad-when-query-caps.patch} (81%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0002-meson-Add-variables-for-gir-files.patch
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0003=
-ssaparse-enhance-SSA-text-lines-parsing.patch =3D> 0002-ssaparse-enhance-S=
SA-text-lines-parsing.patch} (98%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0005=
-viv-fb-Make-sure-config.h-is-included.patch =3D> 0003-viv-fb-Make-sure-con=
fig.h-is-included.patch} (80%)
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0009=
-glimagesink-Downrank-to-marginal.patch =3D> 0004-glimagesink-Downrank-to-m=
arginal.patch} (85%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16=
.2.bb =3D> gstreamer1.0-plugins-base_1.18.0.bb} (78%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16=
.2.bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} (84%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16=
.2.bb =3D> gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python=
/0001-meson.build-fix-builds-with-python-3.8.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb =
=3D> gstreamer1.0-python_1.18.0.bb} (50%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-s=
erver/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.=
2.bb =3D> gstreamer1.0-rtsp-server_1.18.0.bb} (74%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/=
0001-vaapsink-downgrade-to-marginal.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb =
=3D> gstreamer1.0-vaapi_1.18.0.bb} (82%)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-R=
emove-unused-valgrind-detection.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-m=
eson-build-gir-even-when-cross-compiling-if-introsp.patch
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-op=
tion-for-installed-tests.patch =3D> 0003-meson-Add-option-for-installed-tes=
ts.patch} (97%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-m=
eson-Add-valgrind-feature.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix=
.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb =3D> gs=
treamer1.0_1.18.0.bb} (72%)
>
> --
> 2.28.0
>


--=20
best regards,
Jos=C3=A9 Quaresma
