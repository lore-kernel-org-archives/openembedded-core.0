Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7F5ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:45:02 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.48295.1725871493880660369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gq1oGkXc;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75d044201so14941861fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871492; x=1726476292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+5s1zenrALSyBWMeuno88qx5rKrhT4n/feU+gl3kik=;
        b=gq1oGkXcI6LNKMSMQbYTuWoeqQbtKNd8aHORvGbHfN5XX9UAuhBQIXioI+YeJOjyIB
         mNyTpMnOIj2GnAp4U3BQYZq5jUyetqgUX1tjAU0WWJ71VhBciKpZzCvFyFCatIgrYSIN
         N8x1rXzBCnhl/YMRt0SgTcLgDblq8fMSPVJFRXbEhIY683dII+ijLj72rmLLfn+h7LND
         y188M8EFqH5Tkf2guEvUeU0uRh+8ZvLTJoYVnzq0UpkKtujCBpLr1ao26Uy5ePCKqi++
         6WqgukQ+EVnRZKLBPeAH9QizoA5LqT9rq+Fvv59p+6JNHweVVFlJ3WsNBLraAA9j0bxW
         21DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871492; x=1726476292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+5s1zenrALSyBWMeuno88qx5rKrhT4n/feU+gl3kik=;
        b=UjkzeFwZa7YIu27c75Y2M/iLMPIul7GZt/ukriHqjXqetsT905ZOhtTPSOI+7Yro+b
         89y3QHnRb5iBGuoESMIWfEb1P48ujHCULE7Sma5Wreu/tLywpBReBruEpl0XbcPbv428
         +IlSh857sDcE5SD5ili1uBvqAQIJfpEDPBPgMKpgE76le495YTgaqdQ4KRXFoPJydJw2
         5V2PwOfkEtxgwGqaOUZmRxKAS1ttVF5xDNN6xUt3hbEpUMtv901g5eP+SrjhhExV4Gaz
         V+qRolgasg6U5QPinQqRJgT1tG0zBWCdqFQVmLESvnBHH/MQvpfNSwNp9aCwKW1m4FwV
         MQBg==
X-Gm-Message-State: AOJu0Yxmbry04cBMbz7A8LFyhCv7KrnpVP43ohgzXErzz9Z4kRoHDQTu
	krDUFsBPrqDwc3dsTw5vGg+pqlADY0a+5Bdec+ooEZDEB9Ot2SIsTf6O1F5S68DlKyuSm8B8JY6
	9JpivvTno5pxTQWSWtLzqgrAvZq9j8Q==
X-Google-Smtp-Source: AGHT+IFztIHiqakwG1COwR0M9hv2A9N1S/aJDRqOIfYvrJqFsyMWwDeh3baTbnxu7sRYTfsIJutIU5yGwRIl0WrLK1Y=
X-Received: by 2002:a2e:b8d0:0:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2f657d49dddmr57126591fa.15.1725871491532; Mon, 09 Sep 2024
 01:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240908165102.3699657-1-f_l_k@t-online.de>
In-Reply-To: <20240908165102.3699657-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2024 10:44:40 +0200
Message-ID: <CANNYZj91+H0FyxRQtWy4WTox+1a1X+ZUrpAXoQyfiqL8Xt9Vdw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 24.0.7 -> 24.2.2
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204318

Ongoing work to keep mesa current is appreciated, but you should start
marking it RFC as well, and make it clear in the commit message that
this won't be taken until someone sits down and gets clang integrated
into core. I would love to see the project users making that
contribution, but we should put a bit of pressure on them in the shape
of shipping outdated mesa in a release.

Alex

On Sun, 8 Sept 2024 at 18:50, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
>  - Remove patches that have been merged upstream
>  - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch. Issue wa=
s fixed upstream
>  - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>  - Use 'enabled/disabled' for glvnd instead of deprecated 'true/false'
>  - swrast gallium driver has been split into 'softpipe' and 'llvmpipe'. T=
he use of 'swrast'
>    has been deprecated.
>    [https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.bui=
ld#L171]
>  - Add package for libgallium and install
>  - Add python3-pyyaml-native dependency
>  - Limit intel_clc to x86-64
>  - Remove OPENCL_NATIVE variable. The according option has been removed
>    from meson_options.txt.
>  - Meanwhile theres an install option for intel_clc. Use it instead of ma=
nual install
>  - intel 'iris' and intel 'vulkan' drivers require opencl and thus need m=
eta-clang layer
>    [https://gitlab.freedesktop.org/mesa/mesa/-/issues/11141]
>  - Remove gallium kmsro option. This is set depending on 'system_has_kms_=
drm'
>    [https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.bui=
ld#L206]
>  - Add vulkan support for older intel graphics
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
> Note: 'kmsro' needs to be removed from mesa.bbappend in meta-raspberrypi
> ---
>  ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
>  ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------
>  .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
>  ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
>  meta/recipes-graphics/mesa/mesa.inc           | 49 +++++--------
>  6 files changed, 77 insertions(+), 237 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build=
-without-dri3.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-tr=
y-zink-if-not-enabled-in-mesa.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pu=
ll-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-m=
eson-do-not-pull-in-clc-for-clover.patch
> deleted file mode 100644
> index 1711e22585..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-c=
lc-for-clover.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Fri, 8 Mar 2024 15:53:11 +0100
> -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> -
> -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> -Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa=
/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45b=
c60c2bd]
> -
> -Once the merge request above was added, it will only be possible to prov=
ide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported in=
 the mesa recipe.
> -For now reverting this commit allows to still use clover with opencl-spi=
rv, which would otherwise be broken starting from mesa 24.0.2.
> -
> -After it was merged, this patch needs to be removed and rusticl support =
will be required
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - meson.build              | 3 ++-
> - src/compiler/meson.build | 2 +-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 2db6185..741b5d1 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
> -     error('The Clover OpenCL state tracker requires rtti')
> -   endif
> -
> -+  with_clc =3D true
> -   with_gallium_opencl =3D true
> -   with_opencl_icd =3D _opencl =3D=3D 'icd'
> - else
> -@@ -837,7 +838,7 @@ if with_gallium_rusticl
> - endif
> -
> - dep_clc =3D null_dep
> --if with_gallium_opencl or with_clc
> -+if with_clc
> -   dep_clc =3D dependency('libclc')
> - endif
> -
> -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> -index 8d73544..1dae56d 100644
> ---- a/src/compiler/meson.build
> -+++ b/src/compiler/meson.build
> -@@ -79,7 +79,7 @@ subdir('nir')
> -
> - subdir('spirv')
> -
> --if with_clc
> -+if with_opencl_spirv
> -   subdir('clc')
> - endif
> - if with_gallium
> diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-ll=
vm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Inc=
lude-missing-llvm-IR-header-Module.h.patch
> deleted file mode 100644
> index 82ad88a079..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-h=
eader-Module.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 1 Jul 2024 23:09:29 -0700
> -Subject: [PATCH] amd: Include missing llvm IR header Module.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With LLVM-19, Module.h header is not being pulled, which results in
> -compile errors e.g.
> -
> -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for =
call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
> -  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTrip=
le());
> -      |    ~~~~~~^~~~~~~~
> -In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
> -                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibrar=
yInfo.h:14,
> -                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
> -
> -Its getting the definition from llvm/IR/Type.h instead of Module.h and c=
aused
> -confusion to compiler
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/amd/llvm/ac_llvm_helper.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_help=
er.cpp
> -index 5d065279ad1..af4a50f8409 100644
> ---- a/src/amd/llvm/ac_llvm_helper.cpp
> -+++ b/src/amd/llvm/ac_llvm_helper.cpp
> -@@ -8,6 +8,7 @@
> - #include <llvm/Analysis/TargetLibraryInfo.h>
> - #include <llvm/IR/IRBuilder.h>
> - #include <llvm/IR/LegacyPassManager.h>
> -+#include <llvm/IR/Module.h>
> - #include <llvm/IR/Verifier.h>
> - #include <llvm/Target/TargetMachine.h>
> - #include <llvm/MC/MCSubtargetInfo.h>
> diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch
> deleted file mode 100644
> index ab16152090..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.=
patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:09 +0100
> -Subject: [PATCH 1/2] drisw: fix build without dri3
> -
> -commit 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
> -added dri3_priv.h header and dri3_check_multibuffer() function in drisw =
that
> -can be build without dri3.
> -
> -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in =
function `driswCreateScreenDriver':
> -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference=
 to `dri3_check_multibuffer'
> -  collect2: error: ld returned 1 exit status
> -
> -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> -dri3_check_multibuffer().
> -
> -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/drisw_glx.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
> -index 3d3f752..4b19e2d 100644
> ---- a/src/glx/drisw_glx.c
> -+++ b/src/glx/drisw_glx.c
> -@@ -32,7 +32,9 @@
> - #include <dlfcn.h>
> - #include "dri_common.h"
> - #include "drisw_priv.h"
> -+#ifdef HAVE_DRI3
> - #include "dri3_priv.h"
> -+#endif
> - #include <X11/extensions/shmproto.h>
> - #include <assert.h>
> - #include <vulkan/vulkan_core.h>
> -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_displ=
ay *priv,
> -        goto handle_error;
> -    }
> -
> -+#ifdef HAVE_DRI3
> -    if (pdpyp->zink) {
> -       bool err;
> -       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err);
> -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_dis=
play *priv,
> -          goto handle_error;
> -       }
> -    }
> -+#endif
> -
> -    glx_config_destroy_list(psc->base.configs);
> -    psc->base.configs =3D configs;
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode=
-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-fre=
edreno-don-t-encode-build-path-into-binaries.patch
> index 5975ab4472..38871b6d11 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
> @@ -1,4 +1,4 @@
> -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
> +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
>  From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  Date: Tue, 16 Jul 2024 12:32:47 +0300
>  Subject: [PATCH] freedreno: don't encode build path into binaries
> @@ -13,33 +13,76 @@ it manually when running the tests.
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/30206]
>  Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  ---
> + meson.build                      | 1 +
> + meson_options.txt                | 7 +++++++
>   src/freedreno/afuc/meson.build   | 4 ++++
>   src/freedreno/decode/meson.build | 4 +++-
> - src/freedreno/meson.build        | 2 +-
> - 3 files changed, 8 insertions(+), 2 deletions(-)
> + src/freedreno/meson.build        | 5 ++++-
> + 5 files changed, 19 insertions(+), 2 deletions(-)
>
> +diff --git a/meson.build b/meson.build
> +index 3bc837813f967..5c94e76649c63 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -76,6 +76,7 @@ if with_tools.contains('all')
> +     'imagination',
> +   ]
> + endif
> ++with_tools_for_development =3D get_option('tools-for-development')
> +
> + with_any_vulkan_layers =3D get_option('vulkan-layers').length() !=3D 0
> + with_intel_tools =3D with_tools.contains('intel') or with_tools.contain=
s('intel-ui')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 753bebd961e3f..9bc308b512c13 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -537,6 +537,13 @@ option(
> +   description : 'List of tools to build. (Note: `intel-ui` selects `int=
el`)',
> + )
> +
> ++option(
> ++  'tools-for-development',
> ++  type : 'boolean',
> ++  value : false,
> ++  description : 'Support running tools from the build tree (for develop=
ers)',
> ++)
> ++
> + option(
> +   'power8',
> +   type : 'feature',
>  diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.b=
uild
> -index bb7cebf5a748..351cc31ef2de 100644
> +index bb7cebf5a748c..351cc31ef2dec 100644
>  --- a/src/freedreno/afuc/meson.build
>  +++ b/src/freedreno/afuc/meson.build
> -@@ -56,6 +56,7 @@ if with_tests
> +@@ -56,10 +56,12 @@ if with_tests
>     asm_fw =3D custom_target('afuc_test.fw',
>       output: 'afuc_test.fw',
> -     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm=
'), '@OUTPUT@'],
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPU=
T@'],
> ++    env: {'RNN_PATH': rnn_src_path},
> +   )
> +   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
> +     output: 'afuc_test_a7xx.fw',
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@=
OUTPUT@'],
>  +    env: {'RNN_PATH': rnn_src_path},
>     )
>     test('afuc-asm',
>       diff,
> -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
>       disasm_fw =3D custom_target('afuc_test.asm',
>         output: 'afuc_test.asm',
> -       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw'), '-g', '630'],
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw')],
> ++      env: {'RNN_PATH': rnn_src_path},
> +       capture: true
> +     )
> +     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
> +       output: 'afuc_test_a7xx.asm',
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_=
a7xx.fw')],
>  +      env: {'RNN_PATH': rnn_src_path},
>         capture: true
>       )
>       test('afuc-disasm',
>  diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/mes=
on.build
> -index 469eeb4eb597..dfa1c12d0d9f 100644
> +index 469eeb4eb5975..915ba11af3b33 100644
>  --- a/src/freedreno/decode/meson.build
>  +++ b/src/freedreno/decode/meson.build
>  @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
> @@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
>
>       test('crashdec-' + name,
>  diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
> -index 98e49b8fcf0e..145e72597eb9 100644
> +index 98e49b8fcf0e9..f8bdc5299841b 100644
>  --- a/src/freedreno/meson.build
>  +++ b/src/freedreno/meson.build
> -@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories('rnn')
> +@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories('rnn')
>
>   rnn_src_path =3D dir_source_root + '/src/freedreno/registers'
>   rnn_install_path =3D get_option('datadir') + '/freedreno/registers'
>  -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' + rnn_inst=
all_path
>  +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
> ++if with_tools_for_development
> ++  rnn_path =3D rnn_src_path + ':' + rnn_path
> ++endif
>
>   dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: fals=
e,
>                        allow_fallback: true, version: '>=3D5.2')
>  --
> -2.39.2
> -
> +GitLab
> diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-=
if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext=
-don-t-try-zink-if-not-enabled-in-mesa.patch
> deleted file mode 100644
> index 036a0b4945..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-=
enabled-in-mesa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:10 +0100
> -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> -
> -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
> -added an automatic zink fallback even when the zink gallium is not
> -enabled at build time.
> -
> -It leads to unexpected error log while loading drisw driver and
> -zink is not installed on the rootfs:
> -
> -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> -
> -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/glxext.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/glx/glxext.c b/src/glx/glxext.c
> -index 05c825a..7a06aa9 100644
> ---- a/src/glx/glxext.c
> -+++ b/src/glx/glxext.c
> -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
> - #endif /* HAVE_DRI3 */
> -       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
> -          dpyPriv->dri2Display =3D dri2CreateDisplay(dpy);
> -+#if defined(HAVE_ZINK)
> -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
> -          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", fa=
lse) &&
> -                     !getenv("GALLIUM_DRIVER");
> -+#endif /* HAVE_ZINK */
> -    }
> - #endif /* GLX_USE_DRM */
> -    if (glx_direct)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 9fdf496e8b..ecea7e94de 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -16,15 +16,11 @@ PE =3D "2"
>
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> -           file://0001-drisw-fix-build-without-dri3.patch \
> -           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patc=
h \
> -           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch =
\
> -           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
>  "
>
> -SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae=
2c7d96db93f6c26a"
> -PV =3D "24.0.7"
> +SRC_URI[sha256sum] =3D "fd077d3104edbe459e2b8597d2757ec065f9bd2d620b8c0b=
9cc88c2bf9891d02"
> +PV =3D "24.2.2"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -38,7 +34,7 @@ do_install:append() {
>    fi
>  }
>
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native python3-pyyaml-nat=
ive gettext-native"
>  DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
> @@ -77,8 +73,8 @@ EXTRA_OEMESON =3D " \
>      -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
>  "
>
> -EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
> -EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
> +EXTRA_OEMESON:append:class-target:x86-64 =3D " ${@bb.utils.contains('PAC=
KAGECONFIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
> +EXTRA_OEMESON:append:class-native:x86-64 =3D " ${@bb.utils.contains('PAC=
KAGECONFIG', 'opencl', '-Dintel-clc=3Denabled -Dinstall-intel-clc=3Dtrue', =
'', d)}"
>
>  def strip_comma(s):
>      return s.strip(',')
> @@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=
=3Ddisabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
>  VULKAN_DRIVERS =3D ""
> -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> +VULKAN_DRIVERS:append:x86 =3D "${@bb.utils.contains('PACKAGECONFIG', ',o=
pencl', ',intel', '', d)},intel_hasvk,amd"
> +VULKAN_DRIVERS:append:x86-64 =3D "${@bb.utils.contains('PACKAGECONFIG', =
'opencl', ',intel', '', d)},intel_hasvk,amd"
>  # i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
> +VULKAN_DRIVERS:append:i686 =3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
pencl', ',intel', '', d)},intel_hasvk,amd"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'broadco=
m', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'gallium=
-llvm', ',swrast', '', d)}"
> @@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>  PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
>
>  PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libglvn=
d"
>
>  # "gles" requires "opengl"
>  PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3D=
disabled -Dgles2=3Ddisabled"
> @@ -145,32 +141,30 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=
=3Denabled, -Dgles1=3Ddisabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>
> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
> -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc =
spirv-tools python3-ply-native"
> +# "opencl" requires libclc from meta-clang
> +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,=
-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools pytho=
n3-ply-native"
>
>  PACKAGECONFIG[broadcom] =3D ""
>  PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>  PACKAGECONFIG[freedreno] =3D ""
> -PACKAGECONFIG[kmsro] =3D ""
>  PACKAGECONFIG[vc4] =3D ""
>  PACKAGECONFIG[v3d] =3D ""
>  PACKAGECONFIG[zink] =3D ""
>
> -GALLIUMDRIVERS =3D "swrast"
> +GALLIUMDRIVERS =3D "softpipe${@bb.utils.contains('PACKAGECONFIG', 'galli=
um-llvm', ',llvmpipe', '', d)}"
>  # gallium swrast was found to crash Xorg on startup in x32 qemu
>  GALLIUMDRIVERS:x86-x32 =3D ""
> -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
> +GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
>  # i686 is a 32 bit override for mesa-native
> -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
>
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'etnaviv=
', ',etnaviv', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
> -GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro',=
 ',kmsro', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'vc4', '=
,vc4', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'v3d', '=
,v3d', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'zink', =
',zink', '', d)}"
> +GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'opencl'=
, ',iris', '', d)}"
>
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',radeonsi', '', d)}"
> @@ -247,7 +241,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libopencl-mesa libopencl-mesa-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
> -             mesa-vdpau-drivers mesa-tools \
> +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
>              "
>
>  do_install:append () {
> @@ -262,13 +256,6 @@ do_install:append () {
>      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>  }
>
> -do_install:append:class-native () {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', =
d)}; then
> -        install -d ${D}${bindir}
> -        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
> -    fi
> -}
> -
>  # For the packages that make up the OpenGL interfaces, inject variables =
so that
>  # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> @@ -339,6 +326,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
>  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
> +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
>  FILES:libgbm =3D "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> @@ -366,6 +354,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=
 ${libdir}/libxatracker.la \
>  # catch all to get all the tools and data
>  FILES:${PN}-tools =3D "${bindir} ${datadir}"
>  ALLOW_EMPTY:${PN}-tools =3D "1"
> +INSANE_SKIP:${PN}-megadriver =3D "dev-so"
>
>  # Fix upgrade path from mesa to mesa-megadriver
>  RREPLACES:mesa-megadriver =3D "mesa"
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204303): https://lists.openembedded.org/g/openembedde=
d-core/message/204303
> Mute This Topic: https://lists.openembedded.org/mt/108339964/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

