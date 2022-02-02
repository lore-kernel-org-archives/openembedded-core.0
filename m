Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B3BC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:58:13 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.1823.1643824692395100002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qbh8OwAh;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id c7so194874ljr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqm2NnMezth8m4/PpfEiavh2SwWqbGUb5gCo4iYlSos=;
        b=Qbh8OwAhK73nnZfC0mII+e0ajy+rcA9zCXnTTxLHUqWZ2Z0Yk2amEwRQq2PfvK4EhB
         pQtSXlaXwWyjGzKmK1qzT+jzfoTvkGWYJ7KcOGy+yTYhtuwP0BhCMWWNCKjKwDn+iqIv
         9jQrsqzn6FXcCGQR6itdpuhL4f3oV0v3V5aD8lPlnlmmFC12/zdLm8rA24xD80RVTFeI
         UPQ8jz0pWnm3FH10NBS310qQIEUM5MP7D7qF7k4ZtBbzdAc4uvofTI9SG95naGQDDEuy
         bl17WiEXgw2zGXN/dPApEEYLLYaN6M+9AeLnwS4triGC0ki3/e2JzVyDSmQHQoZ6x092
         ns3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqm2NnMezth8m4/PpfEiavh2SwWqbGUb5gCo4iYlSos=;
        b=FvDrUI63wNUvcWp6W0NAbEteT8HanCtrBFlkmeg9Z2iFkIGpahoY3ruRJeRDDiHryE
         tRqYxssCuuBz7QZo5yNNnlXXV+gxMgDgcYPYzxzGMMRf9Kc2s5A5sERrVmCaqNfOnnSX
         SEJe+dI2hbUBANN2lYFcduEWycYXnbrIGlmsT6RMtMkhIgtJ9v6Z0kVR717B1JL4yDNz
         i//10SEt1TTFT3tOER8r8fcLMZUitGBZMoRCeyOsjhaddt0mHpjNV9C5k3uos16C/l52
         Miv4gmHC+Pk+7rk4g5zzOcD2FgwplOeacYVIfr/U2P5byQ3hsb+VmJbAH557Y6lGTPfg
         2N4w==
X-Gm-Message-State: AOAM532feq/zRhwxb53wHIxOg0jIvEyCvKQUZFG0iDF1Gy5zSdUkLdgW
	ARH/bhocoDjAe13vnBu+xGhYDTfRZSvo6aaX43c=
X-Google-Smtp-Source: 
 ABdhPJxYeINdlHIQUyt+scKgLYNsASLZtDnR8LLo+2lTSaJoWkuqY3QNGXZcGg/ngZ3IozqwbPtLURIsXesQ58pxBf8=
X-Received: by 2002:a2e:a796:: with SMTP id
 c22mr20198584ljf.255.1643824690692;
 Wed, 02 Feb 2022 09:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-5-ch@denx.de>
In-Reply-To: <20220202134233.2091916-5-ch@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Feb 2022 17:57:59 +0000
Message-ID: 
 <CANPvuR=E93iFh61EOqP=AacTiZUA_99drgWEs3xK8KYH1wQyfA@mail.gmail.com>
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.5 -> 1.19.90
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c3069a05d70cc200"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 17:58:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161224

--000000000000c3069a05d70cc200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Claudius

There are some new options on the gstreamer bad that are not updated on
this patch.
more precisely what will be done to use the new gpl option ?

# License-related feature options
option('gpl', type: 'feature', value: 'disabled', yield: true,
  description: 'Allow build plugins that have (A)GPL-licensed dependencies'=
)


Claudius Heine <ch@denx.de> escreveu no dia quarta, 2/02/2022 =C3=A0(s) 13:=
43:

> Features `libmms` and `ofa` where removed upstream.
>
> Patches where rebased.
>
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  ...missing-opencv-data-dir-in-yocto-buil.patch | 17 ++++++++---------
>  .../0005-msdk-fix-includedir-path.patch        | 18 +++++++++---------
>  ....bb =3D> gstreamer1.0-plugins-bad_1.19.90.bb} |  4 +---
>  3 files changed, 18 insertions(+), 21 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.18.5.bb =3D> gstreamer1.0-plugins-bad_1.19.90.=
bb}
> (97%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> index b816709066..2b9854b45e 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-=
resolve-missing-opencv-data-dir-in-yocto-buil.patch
> @@ -19,31 +19,30 @@ diff --git a/ext/opencv/meson.build
> b/ext/opencv/meson.build
>  index 0b0b3fc..0ed3344 100644
>  --- a/ext/opencv/meson.build
>  +++ b/ext/opencv/meson.build
> -@@ -78,20 +78,21 @@ else
> +@@ -84,20 +84,21 @@ if not opencv_found
>   endif
>
>   if opencv_found
>  +  pkgconf_sysroot =3D run_command(python3, '-c', 'import os;
> print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> -   opencv_prefix =3D opencv_dep.get_pkgconfig_variable('prefix')
> +   opencv_prefix =3D opencv_dep.get_variable('prefix')
>     gstopencv_cargs +=3D ['-DOPENCV_PREFIX=3D"' + opencv_prefix + '"']
>
>     # Check the data dir used by opencv for its xml data files
>     # Use prefix from pkg-config to be compatible with cross-compilation
> --  r =3D run_command('test', '-d', opencv_prefix + '/share/opencv')
> -+  r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/opencv')
> +-  r =3D run_command('test', '-d', opencv_prefix + '/share/opencv', chec=
k:
> false)
> ++  r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/opencv', check: false)
>     if r.returncode() =3D=3D 0
>       gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"opencv"'
>     else
> --    r =3D run_command('test', '-d', opencv_prefix + '/share/OpenCV')
> -+    r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/OpenCV')
> +-    r =3D run_command('test', '-d', opencv_prefix + '/share/OpenCV',
> check: false)
> ++    r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/OpenCV', check: false)
>       if r.returncode() =3D=3D 0
>         gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"OpenCV"'
>       else
> --      r =3D run_command('test', '-d', opencv_prefix + '/share/opencv4')
> -+      r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/opencv4')
> +-      r =3D run_command('test', '-d', opencv_prefix + '/share/opencv4',
> check: false)
> ++      r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +
> '/share/opencv4', check: false)
>         if r.returncode() =3D=3D 0
>           gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"opencv4"'
>         else
>  --
>  2.28.0
> -
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fi=
x-includedir-path.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fi=
x-includedir-path.patch
> index cb3bb7d361..5a89be79d0 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fi=
x-includedir-path.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fi=
x-includedir-path.patch
> @@ -16,16 +16,16 @@ diff --git a/sys/msdk/meson.build
> b/sys/msdk/meson.build
>  index 6346c9451..068f38548 100644
>  --- a/sys/msdk/meson.build
>  +++ b/sys/msdk/meson.build
> -@@ -40,7 +40,9 @@ endif
> +@@ -46,7 +46,9 @@ if mfx_api !=3D 'oneVPL'
> +   mfx_dep =3D dependency('libmfx', version: ['>=3D 1.0', '<=3D 1.99'],
> required: false)
>
> - mfx_dep =3D dependency('libmfx', required: false)
> - if mfx_dep.found()
> -+  pkgconf_sysroot =3D run_command(python3, '-c', 'import os;
> print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> -   mfx_incdir =3D mfx_dep.get_pkgconfig_variable('includedir')
> -+  mfx_incdir =3D pkgconf_sysroot +  mfx_incdir
> -   mfx_inc =3D []
> - else
> -   # Old versions of MediaSDK don't provide a pkg-config file
> +   if mfx_dep.found()
> ++    pkgconf_sysroot =3D run_command(python3, '-c', 'import os;
> print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> +     mfx_incdir =3D mfx_dep.get_variable('includedir')
> ++    mfx_incdir =3D pkgconf_sysroot +  mfx_incdir
> +     mfx_inc =3D []
> +     use_msdk =3D true
> +   else
>  --
>  2.17.1
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.19.90.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.5.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.19.90.bb
> index f90dff693d..21ab28cc92 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.19.90.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
>
> file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
>             file://0005-msdk-fix-includedir-path.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
> +SRC_URI[sha256sum] =3D
> "817cde39be30609e562c5b99d0e40527d58bd2319bc7a46eb8bec27f713f55ca"
>
>  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
>
> @@ -61,7 +61,6 @@ PACKAGECONFIG[gcrypt]          =3D
> "-Dhls-crypto=3Dlibgcrypt,,libgcrypt"
>  PACKAGECONFIG[gl]              =3D "-Dgl=3Denabled,-Dgl=3Ddisabled,"
>  PACKAGECONFIG[kms]             =3D "-Dkms=3Denabled,-Dkms=3Ddisabled,lib=
drm"
>  PACKAGECONFIG[libde265]        =3D
> "-Dlibde265=3Denabled,-Dlibde265=3Ddisabled,libde265"
> -PACKAGECONFIG[libmms]          =3D
> "-Dlibmms=3Denabled,-Dlibmms=3Ddisabled,libmms"
>  PACKAGECONFIG[libssh2]         =3D
> "-Dcurl-ssh2=3Denabled,-Dcurl-ssh2=3Ddisabled,libssh2"
>  PACKAGECONFIG[lcms2]           =3D
> "-Dcolormanagement=3Denabled,-Dcolormanagement=3Ddisabled,lcms"
>  PACKAGECONFIG[modplug]         =3D
> "-Dmodplug=3Denabled,-Dmodplug=3Ddisabled,libmodplug"
> @@ -132,7 +131,6 @@ EXTRA_OEMESON +=3D " \
>      -Dmplex=3Ddisabled \
>      -Dmusepack=3Ddisabled \
>      -Dnvcodec=3Ddisabled \
> -    -Dofa=3Ddisabled \
>      -Dopenexr=3Ddisabled \
>      -Dopenni2=3Ddisabled \
>      -Dopensles=3Ddisabled \
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c3069a05d70cc200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0Claudius</div><div><br></div><div>There are=
=C2=A0some new options on the gstreamer bad=C2=A0that=C2=A0are not updated =
on this patch.<div></div></div><div>more precisely what will be done to use=
 the new gpl option ?</div><div><br></div><div># License-related feature op=
tions<br></div><div>option(&#39;gpl&#39;, type: &#39;feature&#39;, value: &=
#39;disabled&#39;, yield: true,<br>=C2=A0 description: &#39;Allow build plu=
gins that have (A)GPL-licensed dependencies&#39;)<br></div><div><br></div><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Cl=
audius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de=
</a>&gt; escreveu no dia quarta, 2/02/2022 =C3=A0(s) 13:43:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Features `libmms` and `ofa` whe=
re removed upstream.<br>
<br>
Patches where rebased.<br>
<br>
Signed-off-by: Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_=
blank">ch@denx.de</a>&gt;<br>
---<br>
=C2=A0...missing-opencv-data-dir-in-yocto-buil.patch | 17 ++++++++---------=
<br>
=C2=A0.../0005-msdk-fix-includedir-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
18 +++++++++---------<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_1.19.90.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.19.90.bb</=
a>} |=C2=A0 4 +---<br>
=C2=A03 files changed, 18 insertions(+), 21 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-bad_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugins-=
bad_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-b=
ad_1.19.90.bb</a>} (97%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-=
opencv-data-dir-in-yocto-buil.patch<br>
index b816709066..2b9854b45e 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch<br>
@@ -19,31 +19,30 @@ diff --git a/ext/opencv/meson.build b/ext/opencv/meson.=
build<br>
=C2=A0index 0b0b3fc..0ed3344 100644<br>
=C2=A0--- a/ext/opencv/meson.build<br>
=C2=A0+++ b/ext/opencv/meson.build<br>
-@@ -78,20 +78,21 @@ else<br>
+@@ -84,20 +84,21 @@ if not opencv_found<br>
=C2=A0 endif<br>
<br>
=C2=A0 if opencv_found<br>
=C2=A0+=C2=A0 pkgconf_sysroot =3D run_command(python3, &#39;-c&#39;, &#39;i=
mport os; print(os.environ.get(&quot;PKG_CONFIG_SYSROOT_DIR&quot;))&#39;).s=
tdout().strip()<br>
-=C2=A0 =C2=A0opencv_prefix =3D opencv_dep.get_pkgconfig_variable(&#39;pref=
ix&#39;)<br>
+=C2=A0 =C2=A0opencv_prefix =3D opencv_dep.get_variable(&#39;prefix&#39;)<b=
r>
=C2=A0 =C2=A0 gstopencv_cargs +=3D [&#39;-DOPENCV_PREFIX=3D&quot;&#39; + op=
encv_prefix + &#39;&quot;&#39;]<br>
<br>
=C2=A0 =C2=A0 # Check the data dir used by opencv for its xml data files<br=
>
=C2=A0 =C2=A0 # Use prefix from pkg-config to be compatible with cross-comp=
ilation<br>
--=C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, opencv_prefix + &#=
39;/share/opencv&#39;)<br>
-+=C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgconf_sysroot + =
opencv_prefix + &#39;/share/opencv&#39;)<br>
+-=C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, opencv_prefix + &#=
39;/share/opencv&#39;, check: false)<br>
++=C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgconf_sysroot + =
opencv_prefix + &#39;/share/opencv&#39;, check: false)<br>
=C2=A0 =C2=A0 if r.returncode() =3D=3D 0<br>
=C2=A0 =C2=A0 =C2=A0 gstopencv_cargs +=3D &#39;-DOPENCV_PATH_NAME=3D&quot;o=
pencv&quot;&#39;<br>
=C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, opencv_pref=
ix + &#39;/share/OpenCV&#39;)<br>
-+=C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgconf_sys=
root + opencv_prefix + &#39;/share/OpenCV&#39;)<br>
+-=C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, opencv_pref=
ix + &#39;/share/OpenCV&#39;, check: false)<br>
++=C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgconf_sys=
root + opencv_prefix + &#39;/share/OpenCV&#39;, check: false)<br>
=C2=A0 =C2=A0 =C2=A0 if r.returncode() =3D=3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gstopencv_cargs +=3D &#39;-DOPENCV_PATH_NAME=3D=
&quot;OpenCV&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, open=
cv_prefix + &#39;/share/opencv4&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgc=
onf_sysroot + opencv_prefix + &#39;/share/opencv4&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, open=
cv_prefix + &#39;/share/opencv4&#39;, check: false)<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D run_command(&#39;test&#39;, &#39;-d&#39;, pkgc=
onf_sysroot + opencv_prefix + &#39;/share/opencv4&#39;, check: false)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if r.returncode() =3D=3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gstopencv_cargs +=3D &#39;-DOPENCV_PATH_=
NAME=3D&quot;opencv4&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0-- <br>
=C2=A02.28.0<br>
-<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch<br>
index cb3bb7d361..5a89be79d0 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-=
fix-includedir-path.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-=
fix-includedir-path.patch<br>
@@ -16,16 +16,16 @@ diff --git a/sys/msdk/meson.build b/sys/msdk/meson.buil=
d<br>
=C2=A0index 6346c9451..068f38548 100644<br>
=C2=A0--- a/sys/msdk/meson.build<br>
=C2=A0+++ b/sys/msdk/meson.build<br>
-@@ -40,7 +40,9 @@ endif<br>
+@@ -46,7 +46,9 @@ if mfx_api !=3D &#39;oneVPL&#39;<br>
+=C2=A0 =C2=A0mfx_dep =3D dependency(&#39;libmfx&#39;, version: [&#39;&gt;=
=3D 1.0&#39;, &#39;&lt;=3D 1.99&#39;], required: false)<br>
<br>
- mfx_dep =3D dependency(&#39;libmfx&#39;, required: false)<br>
- if mfx_dep.found()<br>
-+=C2=A0 pkgconf_sysroot =3D run_command(python3, &#39;-c&#39;, &#39;import=
 os; print(os.environ.get(&quot;PKG_CONFIG_SYSROOT_DIR&quot;))&#39;).stdout=
().strip()<br>
-=C2=A0 =C2=A0mfx_incdir =3D mfx_dep.get_pkgconfig_variable(&#39;includedir=
&#39;)<br>
-+=C2=A0 mfx_incdir =3D pkgconf_sysroot +=C2=A0 mfx_incdir<br>
-=C2=A0 =C2=A0mfx_inc =3D []<br>
- else<br>
-=C2=A0 =C2=A0# Old versions of MediaSDK don&#39;t provide a pkg-config fil=
e<br>
+=C2=A0 =C2=A0if mfx_dep.found()<br>
++=C2=A0 =C2=A0 pkgconf_sysroot =3D run_command(python3, &#39;-c&#39;, &#39=
;import os; print(os.environ.get(&quot;PKG_CONFIG_SYSROOT_DIR&quot;))&#39;)=
.stdout().strip()<br>
+=C2=A0 =C2=A0 =C2=A0mfx_incdir =3D mfx_dep.get_variable(&#39;includedir&#3=
9;)<br>
++=C2=A0 =C2=A0 mfx_incdir =3D pkgconf_sysroot +=C2=A0 mfx_incdir<br>
+=C2=A0 =C2=A0 =C2=A0mfx_inc =3D []<br>
+=C2=A0 =C2=A0 =C2=A0use_msdk =3D true<br>
+=C2=A0 =C2=A0else<br>
=C2=A0-- <br>
=C2=A02.17.1<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.18.5.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-bad_1.19.90.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gstreamer1.0-plugins-bad_1.19.90.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-bad_1.18.5.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-bad_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-bad_1.19.90.bb</a><br>
index f90dff693d..21ab28cc92 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.18.5.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-bad_1.19.90.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gst-plugins-bad/gst-plugins-bad" rel=3D"noreferrer" target=3D"_bl=
ank">https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-opencv-resolve-missin=
g-opencv-data-dir-in-yocto-buil.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-msdk-fix-includedir-p=
ath.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;a164923b94f0d08578a6fcaeaac6e0c05da788a46903a=
1086870e9ca45ad678e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;817cde39be30609e562c5b99d0e40527d58bd2319bc7a=
46eb8bec27f713f55ca&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-bad-${PV}&quot;<br>
<br>
@@ -61,7 +61,6 @@ PACKAGECONFIG[gcrypt]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;-Dhls-crypto=3Dlibgcrypt,,libgcrypt&quot;<br>
=C2=A0PACKAGECONFIG[gl]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 &quot;-Dgl=3Denabled,-Dgl=3Ddisabled,&quot;<br>
=C2=A0PACKAGECONFIG[kms]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;-Dkms=3Denabled,-Dkms=3Ddisabled,libdrm&quot;<br>
=C2=A0PACKAGECONFIG[libde265]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dlibde2=
65=3Denabled,-Dlibde265=3Ddisabled,libde265&quot;<br>
-PACKAGECONFIG[libmms]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dlibmms=
=3Denabled,-Dlibmms=3Ddisabled,libmms&quot;<br>
=C2=A0PACKAGECONFIG[libssh2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dc=
url-ssh2=3Denabled,-Dcurl-ssh2=3Ddisabled,libssh2&quot;<br>
=C2=A0PACKAGECONFIG[lcms2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;-Dcolormanagement=3Denabled,-Dcolormanagement=3Ddisabled,lcms&quot;<br>
=C2=A0PACKAGECONFIG[modplug]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dm=
odplug=3Denabled,-Dmodplug=3Ddisabled,libmodplug&quot;<br>
@@ -132,7 +131,6 @@ EXTRA_OEMESON +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dmplex=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dmusepack=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dnvcodec=3Ddisabled \<br>
-=C2=A0 =C2=A0 -Dofa=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dopenexr=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dopenni2=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dopensles=3Ddisabled \<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div>

--000000000000c3069a05d70cc200--

