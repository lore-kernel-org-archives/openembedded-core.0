Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4C6C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:09:41 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.3735.1720775377010237701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VlOfqHdf;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so24678061fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720775375; x=1721380175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBUwtJnZ/cQaIU8QoKquporPfwNtB286DxtBiHtTGnc=;
        b=VlOfqHdfc4d6321qCRre9ub9CmnvI7/aR6NR0ElXtDQROe43pRafexclAHTMMLYnHC
         XIoxHKyGOHuLzQodYxZXAaX5xSJxXJdt5ErcciB+/mXoGO94CbYxAI1hFqr+pU77EFTO
         E82WLL3uyoGdBCob+N4tVN5eHUb6TEJBRIWRgd7wSLBIY6K86vsYNp3K9OhdmXZd0nJa
         DxYB0KpZenGzHVVpgIBrNFcL2HTXvb4RiGmxWM18WHFtCt5AfsH/by9VChkVQo9ncJUP
         orDQ1i48iDLLx/yBk0gFIBFfQnyzi1M+A016fmCNQWpIHkhVUpfCEC1h2J9giOUiwvO8
         vC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775375; x=1721380175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBUwtJnZ/cQaIU8QoKquporPfwNtB286DxtBiHtTGnc=;
        b=kW4arPpM+ldEB+BjUjMQqX6OZnT3YwECFm5Hvf4ZAlRQpTtC0y9fk4i3Hrld/rb5HR
         6hfPmpJta3wBz6byV4qoJKJC+g9G/+Id1wSHTKUts9rA+7iezXZuuQJ7dwILnl33BstO
         vz0J/5SfUmcWAqhtlnI7e2pRJEpyxwk8ObvDzqzcCWemoVpdBMku2anJ9Qp51/GH8Y8O
         o6qah9jIaKvmIbLYSPEHoZ3aJOIiuTo0//I3N/PJ7wUNGzmUMIQjqM1aT89EFLAF/e6o
         UUoT/ArglmsWwDMrkUTNi7hVcn1eLPpmJJ6az4WQofEXyM3b58HVnNk1OloQURijYsQB
         UOjw==
X-Gm-Message-State: AOJu0Yy8LGcXxNpyz85CRwZscZ14R7F9X3zZYI4Dd31qCjfmOPZT4CWS
	R67RopLI/6HV7JFXKJQD6VJvkRe4/x3EBlB3nCELoqXiB9GoKn2XvjjkDm6Cfypg/NumoN7mi+5
	X9lUHmySaSVqCeeiBi3HeRM33GCHNTA==
X-Google-Smtp-Source: AGHT+IGy23336EOJIj3ZsubMgCYWKnVsF+dQ+8NasSLi43dQfQMIj17prMKQobwcr5LOrAEK3/+F38xIpZEXlxgeLgc=
X-Received: by 2002:a05:651c:1a0a:b0:2ec:5f6e:65ea with SMTP id
 38308e7fff4ca-2eeb3188ccamr87183631fa.38.1720775374702; Fri, 12 Jul 2024
 02:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <17E16678ED058C43.21599@lists.openembedded.org> <D32IGS.SWQABZ55T8L21@t-online.de>
In-Reply-To: <D32IGS.SWQABZ55T8L21@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jul 2024 11:09:23 +0200
Message-ID: <CANNYZj-5k0P3YCvHMHGOVVeT6cZ6n=XqBbZvNjvJb=nvOPpuQw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][-oe-core][PATCHv2] mesa: update
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201815

It would help if the version update is separated from all the
rust/clang/opencl fixes. Please try to make a nice set of simple
commits, instead of bundling everything into one.

Alex

On Fri, 12 Jul 2024 at 09:27, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Fix a typo
>
> On Fri, Jul 12 2024 at 09:27:46 AM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - Remove two patches that have been merged upstream - Remove 0001-Revert-=
meson-do-not-pull-in-clc-for-clover.patch Upstream managed to fix this: htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=3Dhe=
ads#L839 - Add dependencies for clang and gcc-runtime to provide needed hea=
ders. Add a dependency for bindgen-cli-native to allow creating the rust bi=
ndings - Disable rusticl build for mesa-native - Add a PACKAGECONFIG for ru=
sticl. Drop OPENCL_NATIVE since the according option has been removed from =
meson_options.txt - inherit rust to make rusticl buildable - Add a crude ha=
ck to make the compiler includes visible to bindgen-cli Without this the he=
aders will be taken from host and that is inappropriate for yocto/oe If the=
y are not found the build fails There is still a compile issue left that su=
ggests to me that a rust update is required: error[E0658]: use of unstable =
library feature 'offset_of' --> src/gallium/frontends/rusticl/rusticl_mesa_=
bindings.rs:3:13312 | 3 | ...() - 8usize] ; ["Offset of field: _IO_FILE::_f=
lags"] [:: std :: mem :: offset_of ! (_IO_FILE , _flags) - 0usize] ; ["Offs=
et of field: ... | ^^^^^^^^^^^^^^^^^^^^^^^^^^ | =3D note: see issue #106655=
 <https://github.com/rust-lang/rust/issues/106655> for more information err=
or[E0658]: use of unstable library feature 'offset_of' --> src/gallium/fron=
tends/rusticl/rusticl_mesa_bindings.rs:3:13418 Signed-off-by: Markus Volk <=
f_l_k@t-online.de> --- ...-meson-do-not-pull-in-clc-for-clover.patch | 53 -=
---------------- .../0001-drisw-fix-build-without-dri3.patch | 58 ---------=
---------- ...sdetects-64bit-atomics-on-mips-clang.patch | 2 +- ...n.build-=
workaround-for-rusticl-build.patch | 25 ++++++++ ...on-t-try-zink-if-not-en=
abled-in-mesa.patch | 42 -------------- .../{mesa-gl_24.0.7.bb =3D> mesa-gl=
_24.1.3.bb} | 0 meta/recipes-graphics/mesa/mesa.inc | 25 ++++---- .../mesa/=
{mesa_24.0.7.bb =3D> mesa_24.1.3.bb} | 0 8 files changed, 41 insertions(+),=
 164 deletions(-) delete mode 100644 meta/recipes-graphics/mesa/files/0001-=
Revert-meson-do-not-pull-in-clc-for-clover.patch delete mode 100644 meta/re=
cipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch create mo=
de 100644 meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaro=
und-for-rusticl-build.patch delete mode 100644 meta/recipes-graphics/mesa/f=
iles/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch rename meta/re=
cipes-graphics/mesa/{mesa-gl_24.0.7.bb =3D> mesa-gl_24.1.3.bb} (100%) renam=
e meta/recipes-graphics/mesa/{mesa_24.0.7.bb =3D> mesa_24.1.3.bb} (100%) di=
ff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-i=
n-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson=
-do-not-pull-in-clc-for-clover.patch deleted file mode 100644 index 1711e22=
585..0000000000 --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch +++ /dev/null @@ -1,53 +0,0 @@ -From 051f=
41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001 -From: Markus=
 Volk <f_l_k@t-online.de> -Date: Fri, 8 Mar 2024 15:53:11 +0100 -Subject: [=
PATCH] Revert "meson: do not pull in clc for clover" - -This reverts commit=
 815a6647eb1383e9dc704ffcc266d85f3b13338a. -Upstream-Status: Inappropriate =
[https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?comm=
it_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd] - -Once the merge request=
 above was added, it will only be possible to provide opencl spir-v with ga=
llium-rusticl=3Dtrue. This is not yet supported in the mesa recipe. -For no=
w reverting this commit allows to still use clover with opencl-spirv, which=
 would otherwise be broken starting from mesa 24.0.2. - -After it was merge=
d, this patch needs to be removed and rusticl support will be required - -S=
igned-off-by: Markus Volk <f_l_k@t-online.de> ---- - meson.build | 3 ++- - =
src/compiler/meson.build | 2 +- - 2 files changed, 3 insertions(+), 2 delet=
ions(-) - -diff --git a/meson.build b/meson.build -index 2db6185..741b5d1 1=
00644 ---- a/meson.build -+++ b/meson.build -@@ -813,6 +813,7 @@ if _opencl=
 !=3D 'disabled' - error('The Clover OpenCL state tracker requires rtti') -=
 endif - -+ with_clc =3D true - with_gallium_opencl =3D true - with_opencl_=
icd =3D _opencl =3D=3D 'icd' - else -@@ -837,7 +838,7 @@ if with_gallium_ru=
sticl - endif - - dep_clc =3D null_dep --if with_gallium_opencl or with_clc=
 -+if with_clc - dep_clc =3D dependency('libclc') - endif - -diff --git a/s=
rc/compiler/meson.build b/src/compiler/meson.build -index 8d73544..1dae56d =
100644 ---- a/src/compiler/meson.build -+++ b/src/compiler/meson.build -@@ =
-79,7 +79,7 @@ subdir('nir') - - subdir('spirv') - --if with_clc -+if with_=
opencl_spirv - subdir('clc') - endif - if with_gallium diff --git a/meta/re=
cipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/re=
cipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch deleted f=
ile mode 100644 index ab16152090..0000000000 --- a/meta/recipes-graphics/me=
sa/files/0001-drisw-fix-build-without-dri3.patch +++ /dev/null @@ -1,58 +0,=
0 @@ -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 200=
1 -From: Romain Naour <romain.naour@smile.fr> -Date: Tue, 6 Feb 2024 09:47:=
09 +0100 -Subject: [PATCH 1/2] drisw: fix build without dri3 - -commit 1887=
368df41 ("glx/sw: check for modifier support in the kopper path") -added dr=
i3_priv.h header and dri3_check_multibuffer() function in drisw that -can b=
e build without dri3. - - i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a=
.p/drisw_glx.c.o: in function `driswCreateScreenDriver': - drisw_glx.c:(.te=
xt.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multi=
buffer' - collect2: error: ld returned 1 exit status - -Add HAVE_DRI3 guard=
 around dri3_priv.h header and the zink code using -dri3_check_multibuffer(=
). - -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper=
 path") - -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/27478] -Signed-off-by: Romain Naour <romain.naour@smi=
le.fr> -Signed-off-by: Khem Raj <raj.khem@gmail.com> ---- - src/glx/drisw_g=
lx.c | 4 ++++ - 1 file changed, 4 insertions(+) - -diff --git a/src/glx/dri=
sw_glx.c b/src/glx/drisw_glx.c -index 3d3f752..4b19e2d 100644 ---- a/src/gl=
x/drisw_glx.c -+++ b/src/glx/drisw_glx.c -@@ -32,7 +32,9 @@ - #include <dlf=
cn.h> - #include "dri_common.h" - #include "drisw_priv.h" -+#ifdef HAVE_DRI=
3 - #include "dri3_priv.h" -+#endif - #include <X11/extensions/shmproto.h> =
- #include <assert.h> - #include <vulkan/vulkan_core.h> -@@ -995,6 +997,7 @=
@ driswCreateScreenDriver(int screen, struct glx_display *priv, - goto hand=
le_error; - } - -+#ifdef HAVE_DRI3 - if (pdpyp->zink) { - bool err; - psc->=
has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err); -@@ -1005,6 +1=
008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv, - go=
to handle_error; - } - } -+#endif - - glx_config_destroy_list(psc->base.con=
figs); - psc->base.configs =3D configs; --- -2.44.0 - diff --git a/meta/rec=
ipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.=
patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomic=
s-on-mips-clang.patch index baa98a0d46..6b5d5ea1a5 100644 --- a/meta/recipe=
s-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.pat=
ch +++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomi=
cs-on-mips-clang.patch @@ -1,4 +1,4 @@ -From 02cc21800fe29f566add525e63f619=
c0536d6e7b Mon Sep 17 00:00:00 2001 +From 251f18fec005c522d0bf91b36ddbc89d0=
6c86f76 Mon Sep 17 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: =
Mon, 13 Jan 2020 15:23:47 -0800 Subject: [PATCH] meson misdetects 64bit ato=
mics on mips/clang diff --git a/meta/recipes-graphics/mesa/files/0001-rusti=
cl-meson.build-workaround-for-rusticl-build.patch b/meta/recipes-graphics/m=
esa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch new f=
ile mode 100644 index 0000000000..ed4c35a378 --- /dev/null +++ b/meta/recip=
es-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-buil=
d.patch @@ -0,0 +1,25 @@ +From b34ee4014ee9e3466ebafbd53745d9f9a13379da Mon=
 Sep 17 00:00:00 2001 +From: Markus Volk <f_l_k@t-online.de> +Date: Thu, 11=
 Jul 2024 22:52:16 +0200 +Subject: [PATCH] rusticl/meson.build: workaround =
for rusticl build + +Signed-off-by: Markus Volk <f_l_k@t-online.de> +--- + =
src/gallium/frontends/rusticl/meson.build | 1 + + 1 file changed, 1 inserti=
on(+) + +diff --git a/src/gallium/frontends/rusticl/meson.build b/src/galli=
um/frontends/rusticl/meson.build +index eef09d8f01e..efac4cab964 100644 +--=
- a/src/gallium/frontends/rusticl/meson.build ++++ b/src/gallium/frontends/=
rusticl/meson.build +@@ -211,6 +211,7 @@ rusticl_llvm_bindings_rs =3D rust.=
bindgen( + c_args : [ + rusticl_bindgen_c_args, + pre_args, ++ '-I@include@=
', '-I@include_cpp@', '-I@include_cpp_target_sys@' + ], + dependencies : [ =
+ dep_clang, +-- +2.45.2 + diff --git a/meta/recipes-graphics/mesa/files/00=
02-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphi=
cs/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch delet=
ed file mode 100644 index 036a0b4945..0000000000 --- a/meta/recipes-graphic=
s/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch +++ /d=
ev/null @@ -1,42 +0,0 @@ -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon=
 Sep 17 00:00:00 2001 -From: Romain Naour <romain.naour@smile.fr> -Date: Tu=
e, 6 Feb 2024 09:47:10 +0100 -Subject: [PATCH 2/2] glxext: don't try zink i=
f not enabled in mesa - -Commit 7d9ea77b459 ("glx: add automatic zink fallb=
ack loading between hw and sw drivers") -added an automatic zink fallback e=
ven when the zink gallium is not -enabled at build time. - -It leads to une=
xpected error log while loading drisw driver and -zink is not installed on =
the rootfs: - - MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so =
- -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers") - -Upstream-Status: Submitted [https://gitlab.freedesktop=
.org/mesa/mesa/-/merge_requests/27478] -Signed-off-by: Romain Naour <romain=
.naour@smile.fr> -Signed-off-by: Khem Raj <raj.khem@gmail.com> ---- - src/g=
lx/glxext.c | 2 ++ - 1 file changed, 2 insertions(+) - -diff --git a/src/gl=
x/glxext.c b/src/glx/glxext.c -index 05c825a..7a06aa9 100644 ---- a/src/glx=
/glxext.c -+++ b/src/glx/glxext.c -@@ -908,9 +908,11 @@ __glXInitialize(Dis=
play * dpy) - #endif /* HAVE_DRI3 */ - if (!debug_get_bool_option("LIBGL_DR=
I2_DISABLE", false)) - dpyPriv->dri2Display =3D dri2CreateDisplay(dpy); -+#=
if defined(HAVE_ZINK) - if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)=
 - try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) && - =
!getenv("GALLIUM_DRIVER"); -+#endif /* HAVE_ZINK */ - } - #endif /* GLX_USE=
_DRM */ - if (glx_direct) --- -2.44.0 - diff --git a/meta/recipes-graphics/=
mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb simil=
arity index 100% rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb r=
ename to meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb diff --git a/meta/rec=
ipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc index 258=
1ccb120..c6141cd815 100644 --- a/meta/recipes-graphics/mesa/mesa.inc +++ b/=
meta/recipes-graphics/mesa/mesa.inc @@ -16,12 +16,10 @@ PE =3D "2" SRC_URI =
=3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \ file://0001-m=
eson-misdetects-64bit-atomics-on-mips-clang.patch \ - file://0001-drisw-fix=
-build-without-dri3.patch \ - file://0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch \ - file://0001-Revert-meson-do-not-pull-in-clc-for-clove=
r.patch \ + file://0001-rusticl-meson.build-workaround-for-rusticl-build.pa=
tch \ " -SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efe=
a000ae2c7d96db93f6c26a" +SRC_URI[sha256sum] =3D "63236426b25a745ba6aa2d6daf=
8cd769d5ea01887b0745ab7124d2ef33a9020d" UPSTREAM_CHECK_GITTAGREGEX =3D "mes=
a-(?P<pver>\d+(\.\d+)+)" @@ -36,7 +34,7 @@ do_install:append() { } DEPENDS =
=3D "expat makedepend-native flex-native bison-native libxml2-native zlib c=
hrpath-replacement-native python3-mako-native gettext-native" -DEPENDS:appe=
nd:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa=
-native', '', d)}" +DEPENDS:append:class-target =3D " ${@bb.utils.contains(=
'PACKAGECONFIG', 'opencl', 'mesa-native gcc-runtime', '', d)}" EXTRANATIVEP=
ATH +=3D "chrpath-native" PROVIDES =3D " \ ${@bb.utils.contains('PACKAGECON=
FIG', 'opengl', 'virtual/libgl', '', d)} \ @@ -47,7 +45,7 @@ PROVIDES =3D "=
 \ virtual/mesa \ " -inherit meson pkgconfig python3native gettext features=
_check +inherit meson rust pkgconfig python3native gettext features_check B=
BCLASSEXTEND =3D "native nativesdk" @@ -75,7 +73,13 @@ EXTRA_OEMESON =3D " =
\ " EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECO=
NFIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}" -EXTRA_OEMESON:append:cla=
ss-native =3D " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-cl=
c=3Denabled', '', d)}" +EXTRA_OEMESON:append:class-native =3D " ${@bb.utils=
.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Denabled -Dgallium-rusti=
cl=3Dfalse', '', d)}" + +do_configure:prepend() { + sed -i "s|@include@|${S=
TAGING_INCDIR}|" ${S}/src/gallium/frontends/rusticl/meson.build + sed -i "s=
|@include_cpp@|${STAGING_INCDIR}\/c++\/14.1.0|" ${S}/src/gallium/frontends/=
rusticl/meson.build + sed -i "s|@include_cpp_target_sys@|${STAGING_INCDIR}\=
/c++\/14.1.0\/${TARGET_SYS}|" ${S}/src/gallium/frontends/rusticl/meson.buil=
d +} def strip_comma(s): return s.strip(',') @@ -142,9 +146,10 @@ PACKAGECO=
NFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3Ddisabled -Dg=
les2 # "egl" requires "opengl" PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -De=
gl=3Ddisabled" -# "opencl" requires libclc from meta-clang and spirv-tools =
from OE-Core -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'fre=
edreno', '-Dopencl-native=3Dtrue', '', d)}" -PACKAGECONFIG[opencl] =3D "-Dg=
allium-opencl=3Dicd -Dopencl-spirv=3Dtrue ${OPENCL_NATIVE},-Dgallium-opencl=
=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native" +=
# "opencl-clover" requires libclc from meta-clang +PACKAGECONFIG[opencl-clo=
ver] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,-Dgallium-opencl=3Dd=
isabled -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native" +# "o=
pencl" requires libclc, bindgen-cli and clang from meta-clang +PACKAGECONFI=
G[opencl] =3D "-Dgallium-opencl=3Ddisabled -Dgallium-rusticl=3Dtrue,-Dgalli=
um-rusticl=3Dfalse,libclc bindgen-cli-native python3-ply-native clang" PACK=
AGECONFIG[broadcom] =3D "" PACKAGECONFIG[etnaviv] =3D "" diff --git a/meta/=
recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa_24.1=
.3.bb similarity index 100% rename from meta/recipes-graphics/mesa/mesa_24.=
0.7.bb rename to meta/recipes-graphics/mesa/mesa_24.1.3.bb
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201810): https://lists.openembedded.org/g/openembedde=
d-core/message/201810
> Mute This Topic: https://lists.openembedded.org/mt/107178236/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

