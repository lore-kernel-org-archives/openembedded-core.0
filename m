Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C25C3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 11:39:58 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.20015.1742989193569406318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 04:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJMUFrr5;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so5696439241.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742989192; x=1743593992; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Dlod587K10+HJ0+P07+73ASXY7fDaTBfot9pgg6Snw=;
        b=IJMUFrr5RCCtwUz8Xoj5hLmClFjb/zSM0z1rSqAiztqUqV2VMnJvXusBpeaKY8iCvL
         5W98lGxCZtc28ejmxlzGp8Jy/S0Z4ESRQuybT3Y9bq/oZ/a0vPB+4TaOTGabqQrGmVCm
         HAuqxvd9N6iGfJH+92LUdxlFRkbZTYlomdRGE97pOE7nbtCbrF9H9VjM0ifD53rPPzo9
         NYxV+wHfEUKC1YxshxgO++wT9Tr2A6zsWkcw978KIhkKBlDtX4t8SLRSz+NyfU1dQE1c
         fiwKtltuscmZEd+/iGOZEyJN4gAU5wBtr20kAis9PSSVI2pibAFFDvoYlobqUJCvh7+l
         6jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989192; x=1743593992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Dlod587K10+HJ0+P07+73ASXY7fDaTBfot9pgg6Snw=;
        b=aJibolIN5FlLQ+S41CvXEesAA9l0hYkagLRAw+Rz1YxCPV4ORo/xnVKiEw17Q/W0Ds
         HLmGSNXan2nsDJ0SuhnSeMCYsuzzZvh4bP9ZuGHA8V0S2F9DsHXoIgUyf0v0jGbQ2ZG5
         jUyOXNZf7Ig68RPkF+X+5X2vj0weN1QU71m8nH3c/Ls5t7ANWzN9gXMhztetz9bRr4gn
         Mfz9ay/tqSC2imDkQKrZL0e1ySkpX5gWkbA711hvphPJoNDeNVg0VUNYaXNqLAi0+t+o
         Vviq5kK3mg2yfI643qMf8/fIecKzhE2dB5osdy2mvgIpAPVW5Unyy48ac/zimzNT+Dta
         e9dw==
X-Forwarded-Encrypted: i=1; AJvYcCUc36n7SbveUtFqDJFKphZ8Ub8ACMY57L+nwGSCv/Q0j54ARwKShgqN/eOLVd1gcGvlnLYWMHZ7VnEXDM2uQPspsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yym3RWc3eoKUMvZWlhpISROZzJb/VG/99UW+aaBj8MvjdxbxDSX
	S+YmK7Pf/iAeEZ2kMVQujdH49pOPDzuBPNerM1TEWi1XjXJ/d3pLu7DBPSIbSskQzyccLz3DPsn
	qcgc3gFAjpYyVI2KzhQWf5R6cmTI=
X-Gm-Gg: ASbGncvAKEul31W7fu2yy4+Se+oSqed3efz32T4JLDbd0PTPSi8MXXe9LTbFu1gQIR3
	NqiQpap0uZjqbft4MqKmitNupFnw2e51eLijvj1bVAyGwgZq3jwOXZznQ2iQToZtQxzSHw5X8Xu
	WkWPSBC+WWsyHS2beactW98IzE49ZmxU9HtIbuOg==
X-Google-Smtp-Source: AGHT+IEMTtxylITRzqEBSYvdNJJ8FvUbilrFRhfAG9lfooSj0o1aAEL6xwCFV086E6YBARKZpTHnmqMepNk4fcMqj3I=
X-Received: by 2002:a05:6102:548d:b0:4c1:8ebb:400e with SMTP id
 ada2fe7eead31-4c50d4b4088mr16912451137.8.1742989190969; Wed, 26 Mar 2025
 04:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250326063647.1941-1-leimaohui@fujitsu.com> <20250326063647.1941-7-leimaohui@fujitsu.com>
In-Reply-To: <20250326063647.1941-7-leimaohui@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Mar 2025 11:39:39 +0000
X-Gm-Features: AQ5f1JoAIHDnanVW2mAKYVDB_d89p8MRFqWmPtIqr3x8k38aj0tgk-0tCePw3Rc
Message-ID: <CANPvuRk0_a2YWt9Yfc4-2CQ=29sU7w5t3tRTEoHov8jyiRUEOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] gstreamer1.0-{plugins-bad, python}:
 upgrade 1.24.12 -> 1.26.0
To: leimaohui@fujitsu.com
Cc: Anuj Mittal <anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org, 
	Lei Maohui <leihaohui@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000093413806313d4b2c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 11:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213646

--00000000000093413806313d4b2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lei,

leimaohui via lists.openembedded.org <leimaohui=3D
fujitsu.com@lists.openembedded.org> escreveu (quarta, 26/03/2025 =C3=A0(s)
06:37):

> From: Lei Maohui <leihaohui@fujitsu.com>
>
> Couple these two together since 1.26.0 version of gstpython add depends o=
n
> "analytics" plugin of gstbad
>
> When build 1.26.0 gstreamer1.0-python, issue occurs:
>
> |../../../../../../workspace/sources/gstreamer1.0-python/meson.build:23:1=
3:
> ERROR: Dependency "gstreamer-analytics-1.0" not found, tried pkgconfig
>
> Source code:
>   | $ vi  workspace/sources/gstreamer1.0-python/meson.build
>   | 23 gstbad_dep =3D dependency('gstreamer-analytics-1.0', version :gst_=
req,
>   | 24   fallback : [])
>
> Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
> ---
>  ...issing-opencv-data-dir-in-yocto-buil.patch | 27 ++++++++++---------
>  ....bb =3D> gstreamer1.0-plugins-bad_1.26.0.bb} |  5 ++--
>  ...24.12.bb =3D> gstreamer1.0-python_1.26.0.bb} |  4 +--
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.24.12.bb =3D> gstreamer1.0-plugins-bad_1.26.0.=
bb}
> (97%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb
> =3D> gstreamer1.0-python_1.26.0.bb} (88%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> index 4d0d0e2693..49be4c1eb4 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> @@ -1,6 +1,6 @@
> -From bd389203124592cfd91fb020ea05a5e4ad1c1394 Mon Sep 17 00:00:00 2001
> -From: Andrey Zhizhikin <andrey.z@gmail.com>
> -Date: Mon, 27 Jan 2020 10:22:35 +0000
> +From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Tue, 25 Mar 2025 00:55:27 +0000
>

What is the reason to change the author of this patch?

Jose

 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
>
>  When Yocto build is performed, opencv searches for data dir using simple
> @@ -17,16 +17,19 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com=
>
>   1 file changed, 3 insertions(+)
>
>  diff --git a/gst-libs/gst/opencv/meson.build
> b/gst-libs/gst/opencv/meson.build
> -index 1d337f1..f47939a 100644
> +index 64e913e..42a0958 100644
>  --- a/gst-libs/gst/opencv/meson.build
>  +++ b/gst-libs/gst/opencv/meson.build
> -@@ -52,6 +52,9 @@ if opencv_found
> -   # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format
> string is not a string literal [-Werror,-Wformat-nonliteral]
> -   gstopencv_cargs +=3D
> cxx.get_supported_arguments(['-Wno-missing-include-dirs',
> '-Wno-format-nonliteral'])
> +@@ -61,6 +61,9 @@ gstopencv_cargs +=3D ['-DOPENCV_PREFIX=3D"' + opencv_p=
refix
> + '"']
> + # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format
> string is not a string literal [-Werror,-Wformat-nonliteral]
> + gstopencv_cargs +=3D
> cxx.get_supported_arguments(['-Wno-missing-include-dirs',
> '-Wno-format-nonliteral'])
>
> -+  pkgconf_sysroot =3D run_command(python3, '-c', 'import os;
> print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> -+  opencv_prefix =3D pkgconf_sysroot + opencv_prefix
> ++pkgconf_sysroot =3D run_command(python3, '-c', 'import os;
> print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> ++opencv_prefix =3D pkgconf_sysroot + opencv_prefix
>  +
> -   # Check the data dir used by opencv for its xml data files
> -   # Use prefix from pkg-config to be compatible with cross-compilation
> -   r =3D run_command('test', '-d', opencv_prefix + '/share/opencv', chec=
k:
> false)
> + # Check the data dir used by opencv for its xml data files
> + # Use prefix from pkg-config to be compatible with cross-compilation
> + fsmod =3D import('fs')
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.26.0.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.26.0.bb
> index 91d9150359..8970afdcef 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.b=
b
> @@ -10,7 +10,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
>             file://0002-avoid-including-sys-poll.h-directly.patch \
>
> file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
> +SRC_URI[sha256sum] =3D
> "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
>
>  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
>
> @@ -28,10 +28,11 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>      bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
> -    sndfile ttml uvch264 webp \
> +    sndfile ttml uvch264 webp analytics \
>      ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
>  "
>
> +PACKAGECONFIG[analytics]       =3D
> "-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddisabled,"
>  PACKAGECONFIG[aom]             =3D "-Daom=3Denabled,-Daom=3Ddisabled,aom=
"
>  PACKAGECONFIG[assrender]       =3D
> "-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass"
>  PACKAGECONFIG[avtp]            =3D "-Davtp=3Denabled,-Davtp=3Ddisabled,l=
ibavtp"
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.26.0.bb
> similarity index 88%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
> index f62cb159c2..04c96a879f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
> @@ -8,9 +8,9 @@ LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f=
740"
>
>  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D
> "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
> +SRC_URI[sha256sum] =3D
> "e5046a05d77abb15671ad01cd1908d17d62e5a06f5d7841be4342ade2a3fb8db"
>
> -DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject
> gstreamer1.0-plugins-bad"
>  RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base
> python3-pygobject"
>
>  PNREAL =3D "gst-python"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213634):
> https://lists.openembedded.org/g/openembedded-core/message/213634
> Mute This Topic: https://lists.openembedded.org/mt/111912607/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000093413806313d4b2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Hi Lei,<=
/span></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">leimaohui via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;leimaohui=3D<a href=3D"mailto:fuj=
itsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt;=
 escreveu (quarta, 26/03/2025 =C3=A0(s) 06:37):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Lei Maohui &lt;<a href=3D"mailto:lei=
haohui@fujitsu.com" target=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
<br>
Couple these two together since 1.26.0 version of gstpython add depends on =
&quot;analytics&quot; plugin of gstbad<br>
<br>
When build 1.26.0 gstreamer1.0-python, issue occurs:<br>
=C2=A0 |../../../../../../workspace/sources/gstreamer1.0-python/meson.build=
:23:13: ERROR: Dependency &quot;gstreamer-analytics-1.0&quot; not found, tr=
ied pkgconfig<br>
<br>
Source code:<br>
=C2=A0 | $ vi=C2=A0 workspace/sources/gstreamer1.0-python/meson.build<br>
=C2=A0 | 23 gstbad_dep =3D dependency(&#39;gstreamer-analytics-1.0&#39;, ve=
rsion :gst_req,<br>
=C2=A0 | 24=C2=A0 =C2=A0fallback : [])<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" targ=
et=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...issing-opencv-data-dir-in-yocto-buil.patch | 27 ++++++++++--------=
-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_1.26.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.26.0.bb</a>=
} |=C2=A0 5 ++--<br>
=C2=A0...<a href=3D"http://24.12.bb" rel=3D"noreferrer" target=3D"_blank">2=
4.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.26.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gstreamer1.0-python_1.26.0.bb</a>} |=C2=A0 4=
 +--<br>
=C2=A03 files changed, 20 insertions(+), 16 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-bad_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-bad_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-bad_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-=
bad_1.26.0.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-python_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-py=
thon_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.26.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.26.0.bb</a>} (=
88%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-=
opencv-data-dir-in-yocto-buil.patch<br>
index 4d0d0e2693..49be4c1eb4 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch<br>
@@ -1,6 +1,6 @@<br>
-From bd389203124592cfd91fb020ea05a5e4ad1c1394 Mon Sep 17 00:00:00 2001<br>
-From: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com" target=3D=
"_blank">andrey.z@gmail.com</a>&gt;<br>
-Date: Mon, 27 Jan 2020 10:22:35 +0000<br>
+From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001<br>
+From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_b=
lank">leimaohui@fujitsu.com</a>&gt;<br>
+Date: Tue, 25 Mar 2025 00:55:27 +0000<br></blockquote><div><br>What is the=
 reason=C2=A0to change the author=C2=A0of this patch?<br><br>Jose</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0Subject: [PATCH] opencv: resolve missing opencv data dir in yocto bui=
ld<br>
<br>
=C2=A0When Yocto build is performed, opencv searches for data dir using sim=
ple<br>
@@ -17,16 +17,19 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 3 insertions(+)<br>
<br>
=C2=A0diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/me=
son.build<br>
-index 1d337f1..f47939a 100644<br>
+index 64e913e..42a0958 100644<br>
=C2=A0--- a/gst-libs/gst/opencv/meson.build<br>
=C2=A0+++ b/gst-libs/gst/opencv/meson.build<br>
-@@ -52,6 +52,9 @@ if opencv_found<br>
-=C2=A0 =C2=A0# /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: f=
ormat string is not a string literal [-Werror,-Wformat-nonliteral]<br>
-=C2=A0 =C2=A0gstopencv_cargs +=3D cxx.get_supported_arguments([&#39;-Wno-m=
issing-include-dirs&#39;, &#39;-Wno-format-nonliteral&#39;])<br>
+@@ -61,6 +61,9 @@ gstopencv_cargs +=3D [&#39;-DOPENCV_PREFIX=3D&quot;&#39;=
 + opencv_prefix + &#39;&quot;&#39;]<br>
+ # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string=
 is not a string literal [-Werror,-Wformat-nonliteral]<br>
+ gstopencv_cargs +=3D cxx.get_supported_arguments([&#39;-Wno-missing-inclu=
de-dirs&#39;, &#39;-Wno-format-nonliteral&#39;])<br>
<br>
-+=C2=A0 pkgconf_sysroot =3D run_command(python3, &#39;-c&#39;, &#39;import=
 os; print(os.environ.get(&quot;PKG_CONFIG_SYSROOT_DIR&quot;))&#39;).stdout=
().strip()<br>
-+=C2=A0 opencv_prefix =3D pkgconf_sysroot + opencv_prefix<br>
++pkgconf_sysroot =3D run_command(python3, &#39;-c&#39;, &#39;import os; pr=
int(os.environ.get(&quot;PKG_CONFIG_SYSROOT_DIR&quot;))&#39;).stdout().stri=
p()<br>
++opencv_prefix =3D pkgconf_sysroot + opencv_prefix<br>
=C2=A0+<br>
-=C2=A0 =C2=A0# Check the data dir used by opencv for its xml data files<br=
>
-=C2=A0 =C2=A0# Use prefix from pkg-config to be compatible with cross-comp=
ilation<br>
-=C2=A0 =C2=A0r =3D run_command(&#39;test&#39;, &#39;-d&#39;, opencv_prefix=
 + &#39;/share/opencv&#39;, check: false)<br>
+ # Check the data dir used by opencv for its xml data files<br>
+ # Use prefix from pkg-config to be compatible with cross-compilation<br>
+ fsmod =3D import(&#39;fs&#39;)<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-bad_1.24.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-bad_1.26.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">gstreamer1.0-plugins-bad_1.26.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-bad_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.24.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-bad_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-pl=
ugins-bad_1.26.0.bb</a><br>
index 91d9150359..8970afdcef 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-bad_1.24.12.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.26.0.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gst-plugins-bad/gst-plugins-bad" rel=3D"noreferrer" target=3D"_bl=
ank">https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-avoid-including-sys-p=
oll.h-directly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-opencv-resolve-missin=
g-opencv-data-dir-in-yocto-buil.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;3d386af3d1dbd1a06c74a6251250c269b481e703f0e32=
55ba89ef6c1e063afea&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f8287a84c5f66368a5a50da5f969994a02c47f20220ff=
e1ca3154193e65af216&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-bad-${PV}&quot;<br>
<br>
@@ -28,10 +28,11 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;op=
engl&#39;, &#39;gl&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0bz2 closedcaption curl dash dtls hls openssl sbc smooth=
streaming \<br>
-=C2=A0 =C2=A0 sndfile ttml uvch264 webp \<br>
+=C2=A0 =C2=A0 sndfile ttml uvch264 webp analytics \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;mx32=
&#39;, &#39;&#39;, &#39;rsvg&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
+PACKAGECONFIG[analytics]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Danalyticsov=
erlay=3Denabled,-Danalyticsoverlay=3Ddisabled,&quot;<br>
=C2=A0PACKAGECONFIG[aom]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;-Daom=3Denabled,-Daom=3Ddisabled,aom&quot;<br>
=C2=A0PACKAGECONFIG[assrender]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dassren=
der=3Denabled,-Dassrender=3Ddisabled,libass&quot;<br>
=C2=A0PACKAGECONFIG[avtp]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;-Davtp=3Denabled,-Davtp=3Ddisabled,libavtp&quot;<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-python_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-pyt=
hon_1.24.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gs=
treamer1.0-python_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-python_1.26.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-python_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-pyth=
on_1.24.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
python_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_=
1.26.0.bb</a><br>
index f62cb159c2..04c96a879f 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-pyth=
on_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.2=
4.12.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-pyth=
on_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.26=
.0.bb</a><br>
@@ -8,9 +8,9 @@ LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc34deae4e395ca07e725a=
b0076a5f740&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/$%=
7BPNREAL%7D/$%7BPNREAL%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x=
z</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d679e2ca3e655a7328627c4670c324fc22f588d2cb8ec=
d2fa7a6a42df51132cc&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e5046a05d77abb15671ad01cd1908d17d62e5a06f5d78=
41be4342ade2a3fb8db&quot;<br>
<br>
-DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject=
&quot;<br>
+DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject=
 gstreamer1.0-plugins-bad&quot;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;gstreamer1.0 gstreamer1.0-plugins-base pyth=
on3-pygobject&quot;<br>
<br>
=C2=A0PNREAL =3D &quot;gst-python&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213634): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213634" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/213634</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111912607/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111912607/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000093413806313d4b2c--

