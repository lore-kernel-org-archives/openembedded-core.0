Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.11352.1616412585875923544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 04:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IZxValgs;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id w3so20623316ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wXQZQLhMGnu5OE2yyNqpJxGoMBrUe1DItvcwbiOQLyI=;
        b=IZxValgsE/l0jAN8i/kLSE8bI/ibA7Tv//Qsus/q4jRMVFzGKKFuVEJ6IeNyOHPXTh
         gPKiKnAmhLj1gjHyoGk1oyXhX08XMpSj03SHBW9n3B8vIPWw6FDwHEC8iUd8m3yxmTLa
         Rz68XT8jtsjQPsk03Pe06q6rqijyeqepu4kfBS0WkDuYUjfk7KT+7+YkxtHbmdDIk211
         FfBUtOL8uXdxlQS3iOFl7UWPssB2RXhUVehrWyQeNSXelvmveRwI2KMYgfNMDdQ9Izx2
         1S1ve6PabrENhccfmrTIjbvQMa5aerCd7u7WhDsNbQjO0bFpvuZfBbuVkCmAWujrxY5l
         jA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wXQZQLhMGnu5OE2yyNqpJxGoMBrUe1DItvcwbiOQLyI=;
        b=EbBV41s83xzk2hAGNJ/WXpTF5ER2RnGePv221FI5sRe1uYy8GTNeZnAsiJzLWSNXSZ
         5NxVXaAQvsm4XaABvByBxjuAX0SPIkDKWflIk5OHTbLwyhKCWJZjofAbyJoENUXhDGfn
         W1BRSftz+Tt8dXWiFScSrz6FsAQ3ptQPohltRiGPFp4eec3y1X2xTNQ4lQ+L68kedxYo
         RREq8O5IH83ow3AKQO5g3+xtSoDcIBCvBZPPQtHLijeBUHCoV+bhk6SM0Iy0+dO5JRT7
         Rr13yvO8dARPgVF8L9ioA2xnVz5pxmT/MIbyfH1btbto3WTZ1QxnY13RTtzQ16c/drBd
         CnCQ==
X-Gm-Message-State: AOAM5312yodyh9/YeF8qAqvpvCKT6bqjJUY/hyjORxCVNXpy6hX+6rVc
	mPyYoVnjDZ7Gt+8XSoqj/LI=
X-Google-Smtp-Source: ABdhPJwawACz3z932HkPFrNnahz/To8q7o7gwGz3NPvCile776n1KqtLt60F15vBvPsEUQEYNCBg9A==
X-Received: by 2002:a17:906:151a:: with SMTP id b26mr19000765ejd.492.1616412584325;
        Mon, 22 Mar 2021 04:29:44 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b22sm10902644edv.96.2021.03.22.04.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 04:29:43 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Mar 2021 12:29:42 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 07/16] mesa: update 20.3.4 -> 21.0.0
Message-ID: <20210322112942.3vjqmteke6x6quqz@jama>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-7-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210319084401.576728-7-alex.kanavin@gmail.com>
X-Groupsio-MsgNum: 149775
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fhkgh7tttz33xnfu"
Content-Disposition: inline

--fhkgh7tttz33xnfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 09:43:52AM +0100, Alexander Kanavin wrote:
> 0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> merged upstream.
>=20
> osmesa is now a simple boolean option.
>=20
> Swrast has been removed from dri drivers, so as we need at least one
> driver to enable dri in native/nativesdk, replace it with nouveau
> (which does not take long to build).

so the mesa-gl needs similar change, right?

meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:# When NOT using X11, we need=
 to make sure we have swrast available.
meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:DRIDRIVERS_append =3D "${@bb.=
utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"

Now it's failing with:
http://errors.yoctoproject.org/Errors/Build/118645/

>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...race-between-generating-a-header-and.patch | 31 -------------------
>  ...k-for-all-linux-host_os-combinations.patch | 12 +++----
>  ...02-meson.build-make-TLS-ELF-optional.patch | 14 ++++-----
>  .../{mesa-gl_20.3.4.bb =3D> mesa-gl_21.0.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
>  .../mesa/{mesa_20.3.4.bb =3D> mesa_21.0.0.bb}   |  0
>  6 files changed, 17 insertions(+), 50 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-anv-fix-a-buil=
d-race-between-generating-a-header-and.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_20.3.4.bb =3D> mesa-gl_21.0.=
0.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_20.3.4.bb =3D> mesa_21.0.0.bb} =
(100%)
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-=
between-generating-a-header-and.patch b/meta/recipes-graphics/mesa/files/00=
01-anv-fix-a-build-race-between-generating-a-header-and.patch
> deleted file mode 100644
> index a61e7b2160..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between=
-generating-a-header-and.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From f148d4f1b5b13288b254ead07f1d008d997e2342 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 2 Nov 2020 23:23:53 +0100
> -Subject: [PATCH] anv: fix a build race between generating a header and =
using
> - it
> -
> -anv_batch_chain.c includes genX_bits.h but doesn't ensure it gets
> -generated first. This causes build failures, as observed here:
> -https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1501/=
steps/8/logs/step2d
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/=
merge_requests/7412]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - src/intel/vulkan/meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/intel/vulkan/meson.build b/src/intel/vulkan/meson.buil=
d
> -index 36e1689314e..b713d8eade3 100644
> ---- a/src/intel/vulkan/meson.build
> -+++ b/src/intel/vulkan/meson.build
> -@@ -131,6 +131,7 @@ libanv_files =3D files(
> - anv_deps =3D [
> -   dep_libdrm,
> -   dep_valgrind,
> -+  idep_genxml,
> -   idep_nir_headers,
> -   idep_vulkan_util_headers,
> - ]
> ---=20
> -2.29.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for=
-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/00=
01-meson.build-check-for-all-linux-host_os-combinations.patch
> index 085254323c..b6f86743e1 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-li=
nux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-li=
nux-host_os-combinations.patch
> @@ -1,4 +1,4 @@
> -From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001
> +From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair@alistair23.me>
>  Date: Thu, 14 Nov 2019 13:04:49 -0800
>  Subject: [PATCH] meson.build: check for all linux host_os combinations
> @@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23=
.me>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/meson.build b/meson.build
> -index 898d025..09e3759 100644
> +index 932eb13..efc6171 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -124,7 +124,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wi=
th_gles2
> +@@ -153,7 +153,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wi=
th_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi =3D with_shared_glapi and with_any_opengl
>  =20
> @@ -32,12 +32,12 @@ index 898d025..09e3759 100644
>  =20
>   dri_drivers =3D get_option('dri-drivers')
>   if dri_drivers.contains('auto')
> -@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }=
',
> +@@ -970,7 +970,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }=
',
>   endif
>  =20
>   # TODO: this is very incomplete
> --if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd'].contains(host=
_machine.system())
> -+if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) o=
r host_machine.system().startswith('linux')
> +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].cont=
ains(host_machine.system())
> ++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].cont=
ains(host_machine.system()) or host_machine.system().startswith('linux')
>     pre_args +=3D '-D_GNU_SOURCE'
>   elif host_machine.system() =3D=3D 'sunos'
>     pre_args +=3D '-D__EXTENSIONS__'
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-=
ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make=
-TLS-ELF-optional.patch
> index 89c0d150fa..df2346d336 100644
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opt=
ional.patch
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opt=
ional.patch
> @@ -1,4 +1,4 @@
> -From ce57ce220d9c377beabf4914f33c43118f672ffe Mon Sep 17 00:00:00 2001
> +From 624f430dd0a91344146a2b8d49a69f23560c2fa2 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair@alistair23.me>
>  Date: Thu, 14 Nov 2019 13:08:31 -0800
>  Subject: [PATCH] meson.build: make TLS ELF optional
> @@ -30,23 +30,23 @@ Signed-off-by: Alistair Francis <alistair@alistair23=
.me>
>   2 files changed, 7 insertions(+), 1 deletion(-)
>  
>  diff --git a/meson.build b/meson.build
> -index c5136ea..185270d 100644
> +index efc6171..8450968 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -424,7 +424,7 @@ endif
> +@@ -448,7 +448,7 @@ endif
>  =20
>   # Android uses emutls for versions <=3D P/28. For USE_ELF_TLS we need =
ELF TLS.
>   use_elf_tls =3D false
> --if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system(=
)) and (not with_platform_android or get_option('platform-sdk-version') >=
=3D 29)
> -+if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system(=
)) and (not with_platform_android or get_option('platform-sdk-version') >=
=3D 29) and get_option('elf-tls')
> +-if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machin=
e.system()) and (not with_platform_android or get_option('platform-sdk-vers=
ion') >=3D 29)
> ++if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machin=
e.system()) and (not with_platform_android or get_option('platform-sdk-vers=
ion') >=3D 29) and get_option('elf-tls')
>     pre_args +=3D '-DUSE_ELF_TLS'
>     use_elf_tls =3D true
>   endif
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 2d39d13..72006eb 100644
> +index fc73f6e..d7482c0 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -368,6 +368,12 @@ option(
> +@@ -420,6 +420,12 @@ option(
>     value : true,
>     description : 'Enable direct rendering in GLX and EGL for DRI',
>   )
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb b/meta/recipes=
-graphics/mesa/mesa-gl_21.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics=
/mesa/mesa.inc
> index 9f8ec112cf..e9b72ce063 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,10 +19,9 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mes=
a-${PV}.tar.xz \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pat=
ch \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.p=
atch \
> -           file://0001-anv-fix-a-build-race-between-generating-a-header=
-and.patch \
>             "
>  
> -SRC_URI[sha256sum] =3D "dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221=
480e44180849b4084"
> +SRC_URI[sha256sum] =3D "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808=
ca0dd26ba522e0d84"
>  
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> @@ -103,8 +102,8 @@ PACKAGECONFIG[elf-tls] =3D "-Delf-tls=3Dtrue, -Delf-=
tls=3Dfalse"
>  PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisa=
bled,libxvmc"
>  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-pro=
tocols"
>  
> -DRIDRIVERS_class-native =3D "swrast"
> -DRIDRIVERS_class-nativesdk =3D "swrast"
> +DRIDRIVERS_class-native =3D "nouveau"
> +DRIDRIVERS_class-nativesdk =3D "nouveau"
>  DRIDRIVERS_append_x86_class-target =3D ",r100,r200,nouveau,i965,i915"
>  DRIDRIVERS_append_x86-64_class-target =3D ",r100,r200,nouveau,i965,i915=
"
>  # "dri" requires "opengl"
> @@ -168,8 +167,7 @@ GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACK=
AGECONFIG', 'lima', ',lima', '
>  PACKAGECONFIG[panfrost] =3D ""
>  GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st', ',panfrost', '', d)}"
>  
> -OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium',=
 'classic', d)}"
> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone"
> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
>  
>  PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled=
,libunwind"
>  
> diff --git a/meta/recipes-graphics/mesa/mesa_20.3.4.bb b/meta/recipes-gr=
aphics/mesa/mesa_21.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_20.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa_21.0.0.bb
> --=20
> 2.29.2
>=20

>=20
>=20
>=20


--fhkgh7tttz33xnfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYFh/oQAKCRA3VSO3ZXaA
HAjYAJ98tiIhTQV1hNCra2/hZDyOcUWTsgCfZ+N6Dx2XF2YFWEbmgpMmJNTisKU=
=FBG7
-----END PGP SIGNATURE-----

--fhkgh7tttz33xnfu--
