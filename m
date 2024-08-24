Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F19C52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 06:59:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.8697.1724482754694287178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 23:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 97B0D8A46
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 08:59:09 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.21]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1shkjr-3gFy1A0; Sat, 24 Aug 2024 08:59:07 +0200
Date: Sat, 24 Aug 2024 09:00:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH 1/2] mesa: update 24.0.7 -> 24.2.0
To: openembedded-core@lists.openembedded.org
Message-Id: <3HNPIS.KEMW2G5K7SA42@t-online.de>
In-Reply-To: <17EE97CC1D518AF7.8904@lists.openembedded.org>
References: <17EE97CC1D518AF7.8904@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wZOc0/TKXBAN4z5VVc2d"
X-TOI-EXPURGATEID: 150726::1724482747-E9FF15F3-BB092FA0/0/0 CLEAN NORMAL
X-TOI-MSGID: 743696a5-d2a4-4c7e-977c-82dafd8d7d0d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 06:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203710

--=-wZOc0/TKXBAN4z5VVc2d
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

rebased to master

On Sat, Aug 24 2024 at 08:57:52 AM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
>  - Remove patches that have been merged upstream
>  - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>    Upstream managed to fix this:
>   =20
> <https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_typ=
e=3Dheads#L839>
>  - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>  - Use 'enabled/disabled' for glvnd instead of deprecated 'true/false'
>  - swrast gallium driver has been split into 'softpipe' and=20
> 'llvmpipe'. The use of 'swrast'
>    has been deprecated.
>  - Add package for libgallium and install
>  - Add python3-pyyaml-native dependency
>  - Limit intel_clc to x86-64
>  - Meanwhile theres an install option for intel_clc. Use it instead=20
> of manual install
>  - intel 'iris' and intel 'vulkan' drivers require opencl and thus=20
> need meta-clang layer
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
>  ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------
>  .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
>  ...on-t-encode-build-path-into-binaries.patch | 71=20
> +++++++++++++++----
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
>  meta/recipes-graphics/mesa/mesa.inc           | 49 +++++--------
>  6 files changed, 77 insertions(+), 237 deletions(-)
>  delete mode 100644=20
> meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for=
-clover.patch
>  delete mode 100644=20
> meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-=
Module.h.patch
>  delete mode 100644=20
> meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>  delete mode 100644=20
> meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enable=
d-in-mesa.patch
>=20
> diff --git=20
> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch=20
> b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch
> deleted file mode 100644
> index 1711e22585..0000000000
> ---=20
> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-f=
or-clover.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00=20
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Fri, 8 Mar 2024 15:53:11 +0100
> -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> -
> -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> -Upstream-Status: Inappropriate=20
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?c=
ommit_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd>]
> -
> -Once the merge request above was added, it will only be possible to=20
> provide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet=20
> supported in the mesa recipe.
> -For now reverting this commit allows to still use clover with=20
> opencl-spirv, which would otherwise be broken starting from mesa=20
> 24.0.2.
> -
> -After it was merged, this patch needs to be removed and rusticl=20
> support will be required
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
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
> diff --git=20
> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch=20
> b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch
> deleted file mode 100644
> index 82ad88a079..0000000000
> ---=20
> a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-heade=
r-Module.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00=20
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Mon, 1 Jul 2024 23:09:29 -0700
> -Subject: [PATCH] amd: Include missing llvm IR header Module.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With LLVM-19, Module.h header is not being pulled, which results in
> -compile errors e.g.
> -
> -src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function=20
> for call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
> -  102 |   =20
> unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
> -      |    ~~~~~~^~~~~~~~
> -In file included from=20
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/Type.h:18,
> -                 from=20
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
> -                 from=20
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
> -                 from=20
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-s=
ysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
> -                 from=20
> ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
> -
> -Its getting the definition from llvm/IR/Type.h instead of Module.h=20
> and caused
> -confusion to compiler
> -
> -Upstream-Status: Submitted=20
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ----
> - src/amd/llvm/ac_llvm_helper.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/amd/llvm/ac_llvm_helper.cpp=20
> b/src/amd/llvm/ac_llvm_helper.cpp
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
> diff --git=20
> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h=20
> b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h
> deleted file mode 100644
> index ab16152090..0000000000
> ---=20
> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patc=
h
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00=20
> 2001
> -From: Romain Naour <romain.naour@smile.fr=20
> <mailto:romain.naour@smile.fr>>
> -Date: Tue, 6 Feb 2024 09:47:09 +0100
> -Subject: [PATCH 1/2] drisw: fix build without dri3
> -
> -commit 1887368df41 ("glx/sw: check for modifier support in the=20
> kopper path")
> -added dri3_priv.h header and dri3_check_multibuffer() function in=20
> drisw that
> -can be build without dri3.
> -
> -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o:=20
> in function `driswCreateScreenDriver':
> -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined=20
> reference to `dri3_check_multibuffer'
> -  collect2: error: ld returned 1 exit status
> -
> -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> -dri3_check_multibuffer().
> -
> -Fixes: 1887368df41 ("glx/sw: check for modifier support in the=20
> kopper path")
> -
> -Upstream-Status: Submitted=20
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478>]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr=20
> <mailto:romain.naour@smile.fr>>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
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
> -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct=20
> glx_display *priv,
> -        goto handle_error;
> -    }
> -
> -+#ifdef HAVE_DRI3
> -    if (pdpyp->zink) {
> -       bool err;
> -       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy,=20
> &err);
> -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct=20
> glx_display *priv,
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
> diff --git=20
> a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch=20
> b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> index 5975ab4472..38871b6d11 100644
> ---=20
> a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> +++=20
> b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path=
-into-binaries.patch
> @@ -1,4 +1,4 @@
> -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00=20
> 2001
> +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00=20
> 2001
>  From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org=20
> <mailto:dmitry.baryshkov@linaro.org>>
>  Date: Tue, 16 Jul 2024 12:32:47 +0300
>  Subject: [PATCH] freedreno: don't encode build path into binaries
> @@ -13,33 +13,76 @@ it manually when running the tests.
>  Upstream-Status: Submitted=20
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206>]
>  Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org=20
> <mailto:dmitry.baryshkov@linaro.org>>
>  ---
> + meson.build                      | 1 +
> + meson_options.txt                | 7 +++++++
>   src/freedreno/afuc/meson.build   | 4 ++++
>   src/freedreno/decode/meson.build | 4 +++-
> - src/freedreno/meson.build        | 2 +-
> - 3 files changed, 8 insertions(+), 2 deletions(-)
> + src/freedreno/meson.build        | 5 ++++-
> + 5 files changed, 19 insertions(+), 2 deletions(-)
>=20
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
> + with_intel_tools =3D with_tools.contains('intel') or=20
> with_tools.contains('intel-ui')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 753bebd961e3f..9bc308b512c13 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -537,6 +537,13 @@ option(
> +   description : 'List of tools to build. (Note: `intel-ui` selects=20
> `intel`)',
> + )
> +
> ++option(
> ++  'tools-for-development',
> ++  type : 'boolean',
> ++  value : false,
> ++  description : 'Support running tools from the build tree (for=20
> developers)',
> ++)
> ++
> + option(
> +   'power8',
> +   type : 'feature',
>  diff --git a/src/freedreno/afuc/meson.build=20
> b/src/freedreno/afuc/meson.build
> -index bb7cebf5a748..351cc31ef2de 100644
> +index bb7cebf5a748c..351cc31ef2dec 100644
>  --- a/src/freedreno/afuc/meson.build
>  +++ b/src/freedreno/afuc/meson.build
> -@@ -56,6 +56,7 @@ if with_tests
> +@@ -56,10 +56,12 @@ if with_tests
>     asm_fw =3D custom_target('afuc_test.fw',
>       output: 'afuc_test.fw',
> -     command: [asm, '-g', '6',=20
> files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'),=20
> '@OUTPUT@'],
> ++    env: {'RNN_PATH': rnn_src_path},
> +   )
> +   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
> +     output: 'afuc_test_a7xx.fw',
> +     command: [asm,=20
> files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
>  +    env: {'RNN_PATH': rnn_src_path},
>     )
>     test('afuc-asm',
>       diff,
> -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
>       disasm_fw =3D custom_target('afuc_test.asm',
>         output: 'afuc_test.asm',
> -       command: [disasm, '-u',=20
> files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
> +       command: [disasm, '-u',=20
> files('../.gitlab-ci/reference/afuc_test.fw')],
> ++      env: {'RNN_PATH': rnn_src_path},
> +       capture: true
> +     )
> +     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
> +       output: 'afuc_test_a7xx.asm',
> +       command: [disasm, '-u',=20
> files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
>  +      env: {'RNN_PATH': rnn_src_path},
>         capture: true
>       )
>       test('afuc-disasm',
>  diff --git a/src/freedreno/decode/meson.build=20
> b/src/freedreno/decode/meson.build
> -index 469eeb4eb597..dfa1c12d0d9f 100644
> +index 469eeb4eb5975..915ba11af3b33 100644
>  --- a/src/freedreno/decode/meson.build
>  +++ b/src/freedreno/decode/meson.build
>  @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
> @@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
>=20
>       test('crashdec-' + name,
>  diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
> -index 98e49b8fcf0e..145e72597eb9 100644
> +index 98e49b8fcf0e9..f8bdc5299841b 100644
>  --- a/src/freedreno/meson.build
>  +++ b/src/freedreno/meson.build
> -@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories('rnn')
> +@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories('rnn')
>=20
>   rnn_src_path =3D dir_source_root + '/src/freedreno/registers'
>   rnn_install_path =3D get_option('datadir') + '/freedreno/registers'
>  -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' +=20
> rnn_install_path
>  +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
> ++if with_tools_for_development
> ++  rnn_path =3D rnn_src_path + ':' + rnn_path
> ++endif
>=20
>   dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required:=20
> false,
>                        allow_fallback: true, version: '>=3D5.2')
>  --
> -2.39.2
> -
> +GitLab
> diff --git=20
> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch=20
> b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch
> deleted file mode 100644
> index 036a0b4945..0000000000
> ---=20
> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enab=
led-in-mesa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00=20
> 2001
> -From: Romain Naour <romain.naour@smile.fr=20
> <mailto:romain.naour@smile.fr>>
> -Date: Tue, 6 Feb 2024 09:47:10 +0100
> -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> -
> -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading=20
> between hw and sw drivers")
> -added an automatic zink fallback even when the zink gallium is not
> -enabled at build time.
> -
> -It leads to unexpected error log while loading drisw driver and
> -zink is not installed on the rootfs:
> -
> -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> -
> -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading=20
> between hw and sw drivers")
> -
> -Upstream-Status: Submitted=20
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478>]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr=20
> <mailto:romain.naour@smile.fr>>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
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
> -          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE",=20
> false) &&
> -                     !getenv("GALLIUM_DRIVER");
> -+#endif /* HAVE_ZINK */
> -    }
> - #endif /* GLX_USE_DRM */
> -    if (glx_direct)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc=20
> b/meta/recipes-graphics/mesa/mesa.inc
> index 9fdf496e8b..49a3f58b83 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -12,19 +12,15 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D=20
> "file://docs/license.rst;md5=3D63779ec98d78d823a9dc533a0735ef10"=20
> <file://docs/license.rst;md5=3D63779ec98d78d823a9dc533a0735ef10>
>=20
> +PV =3D "24.2.0"
>  PE =3D "2"
>=20
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz=20
> <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>            =20
> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=20
> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
> -           file://0001-drisw-fix-build-without-dri3.patch=20
> <file://0001-drisw-fix-build-without-dri3.patch/> \
> -          =20
> file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch=20
> <file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch/> \
> -          =20
> file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch=20
> <file://0001-revert-meson-do-not-pull-in-clc-for-clover.patch/> \
> -          =20
> file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=20
> <file://0001-amd-include-missing-llvm-ir-header-module.h.patch/> \
>            =20
> file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\=20
> <file://0001-freedreno-don-t-encode-build-path-into-binaries.patch/>
>  "
>=20
> -SRC_URI[sha256sum] =3D=20
> "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> -PV =3D "24.0.7"
> +SRC_URI[sha256sum] =3D=20
> "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a762ec6950a58addf"
>=20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>=20
> @@ -38,7 +34,7 @@ do_install:append() {
>    fi
>  }
>=20
> -DEPENDS =3D "expat makedepend-native flex-native bison-native=20
> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
> gettext-native"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native=20
> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
> gettext-native python3-pyyaml-native"
>  DEPENDS:append:class-target =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
> 'mesa-native', '', d)}"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
> @@ -77,8 +73,8 @@ EXTRA_OEMESON =3D " \
>      -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
>  "
>=20
> -EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
> '-Dintel-clc=3Dsystem', '', d)}"
> -EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
> '-Dintel-clc=3Denabled', '', d)}"
> +EXTRA_OEMESON:append:class-target:x86-64 =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
> '-Dintel-clc=3Dsystem', '', d)}"
> +EXTRA_OEMESON:append:class-native:x86-64 =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl',=20
> '-Dintel-clc=3Denabled -Dinstall-intel-clc=3Dtrue', '', d)}"
>=20
>  def strip_comma(s):
>      return s.strip(',')
> @@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled,=20
> -Ddri3=3Ddisabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm=20
> >=3D 3.9
>  VULKAN_DRIVERS =3D ""
> -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> +VULKAN_DRIVERS:append:x86 =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', ',opencl', ',intel',=20
> '', d)},amd"
> +VULKAN_DRIVERS:append:x86-64 =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', ',intel',=20
> '', d)},amd"
>  # i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
> +VULKAN_DRIVERS:append:i686 =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', ',intel',=20
> '', d)},amd"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno',=20
> ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'broadcom',=20
> ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'gallium-llvm',=20
> ',swrast', '', d)}"
> @@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>  PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')},=20
> -Dtools=3D'', ${TOOLS_DEPS}"
>=20
>  PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libglvn=
d"
>=20
>  # "gles" requires "opengl"
>  PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,=20
> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
> @@ -145,9 +141,8 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled=20
> -Dgles2=3Denabled, -Dgles1=3Ddisabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>=20
> -# "opencl" requires libclc from meta-clang and spirv-tools from=20
> OE-Core
> -OPENCL_NATIVE =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno',=20
> '-Dopencl-native=3Dtrue', '', d)}"
> -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue=20
> ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled=20
> -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native"
> +# "opencl" requires libclc from meta-clang
> +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd=20
> -Dopencl-spirv=3Dtrue,-Dgallium-opencl=3Ddisabled=20
> -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native"
>=20
>  PACKAGECONFIG[broadcom] =3D ""
>  PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> @@ -157,13 +152,11 @@ PACKAGECONFIG[vc4] =3D ""
>  PACKAGECONFIG[v3d] =3D ""
>  PACKAGECONFIG[zink] =3D ""
>=20
> -GALLIUMDRIVERS =3D "swrast"
> -# gallium swrast was found to crash Xorg on startup in x32 qemu
> -GALLIUMDRIVERS:x86-x32 =3D ""
> -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS =3D "softpipe${@bb.utils.contains=20
> <mailto:softpipe${@bb.utils.contains>('PACKAGECONFIG',=20
> 'gallium-llvm', ',llvmpipe', '', d)}"
> +GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
> +GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
>  # i686 is a 32 bit override for mesa-native
> -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
>=20
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'etnaviv', ',etnaviv',=20
> '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno',=20
> ',freedreno', '', d)}"
> @@ -171,6 +164,7 @@ GALLIUMDRIVERS:append=20
> =3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro',
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'zink', ',zink', '',=20
> d)}"
> +GALLIUMDRIVERS:append =3D"${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', ',iris', '',=20
> d)}"
>=20
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'r600', ',radeonsi',=20
> '', d)}"
> @@ -247,7 +241,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libopencl-mesa libopencl-mesa-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
> -             mesa-vdpau-drivers mesa-tools \
> +             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
>              "
>=20
>  do_install:append () {
> @@ -262,13 +256,6 @@ do_install:append () {
>      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>  }
>=20
> -do_install:append:class-native () {
> -    if ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', 'true',=20
> 'false', d)}; then
> -        install -d ${D}${bindir}
> -        install -m0755 ${B}/src/intel/compiler/intel_clc=20
> ${D}${bindir}
> -    fi
> -}
> -
>  # For the packages that make up the OpenGL interfaces, inject=20
> variables so that
>  # they don't get Debian-renamed (which would remove the -mesa=20
> suffix), and
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> @@ -339,6 +326,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*=20
> ${datadir}/drirc.d"
>  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so=20
> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*=20
> ${datadir}/glvnd/egl_vendor.d"
> +FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
>  FILES:libgbm =3D "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> @@ -366,6 +354,7 @@ FILES:libxatracker-dev =3D=20
> "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>  # catch all to get all the tools and data
>  FILES:${PN}-tools =3D "${bindir} ${datadir}"
>  ALLOW_EMPTY:${PN}-tools =3D "1"
> +INSANE_SKIP:${PN}-megadriver =3D "dev-so"
>=20
>  # Fix upgrade path from mesa to mesa-megadriver
>  RREPLACES:mesa-megadriver =3D "mesa"
> --
> 2.45.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203708):=20
> <https://lists.openembedded.org/g/openembedded-core/message/203708>
> Mute This Topic: <https://lists.openembedded.org/mt/108069172/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-wZOc0/TKXBAN4z5VVc2d
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>rebased to master</div></div><div =
id=3D"geary-quote" dir=3D"auto"><br>On Sat, Aug 24 2024 at 08:57:52 AM +02:=
00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"=
cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;"> - Remo=
ve patches that have been merged upstream
 - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
   Upstream managed to fix this:
   <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.bu=
ild?ref_type=3Dheads#L839">https://gitlab.freedesktop.org/mesa/mesa/-/blob/=
main/meson.build?ref_type=3Dheads#L839</a>
 - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
 - Use 'enabled/disabled' for glvnd instead of deprecated 'true/false'
 - swrast gallium driver has been split into 'softpipe' and 'llvmpipe'. The=
 use of 'swrast'
   has been deprecated.
 - Add package for libgallium and install
 - Add python3-pyyaml-native dependency
 - Limit intel_clc to x86-64
 - Meanwhile theres an install option for intel_clc. Use it instead of manu=
al install
 - intel 'iris' and intel 'vulkan' drivers require opencl and thus need met=
a-clang layer

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
 ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
 meta/recipes-graphics/mesa/mesa.inc           | 49 +++++--------
 6 files changed, 77 insertions(+), 237 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-n=
ot-pull-in-clc-for-clover.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-missi=
ng-llvm-IR-header-Module.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-w=
ithout-dri3.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-=
zink-if-not-enabled-in-mesa.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull=
-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-mes=
on-do-not-pull-in-clc-for-clover.patch
deleted file mode 100644
index 1711e22585..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc=
-for-clover.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
-Date: Fri, 8 Mar 2024 15:53:11 +0100
-Subject: [PATCH] Revert "meson: do not pull in clc for clover"
-
-This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
-Upstream-Status: Inappropriate [<a href=3D"https://gitlab.freedesktop.org/=
mesa/mesa/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9aff=
d9124b45bc60c2bd">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd</a>]
-
-Once the merge request above was added, it will only be possible to provid=
e opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported in t=
he mesa recipe.
-For now reverting this commit allows to still use clover with opencl-spirv=
, which would otherwise be broken starting from mesa 24.0.2.
-
-After it was merged, this patch needs to be removed and rusticl support wi=
ll be required
-
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
----
- meson.build              | 3 ++-
- src/compiler/meson.build | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 2db6185..741b5d1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
-     error('The Clover OpenCL state tracker requires rtti')
-   endif
-=20
-+  with_clc =3D true
-   with_gallium_opencl =3D true
-   with_opencl_icd =3D _opencl =3D=3D 'icd'
- else
-@@ -837,7 +838,7 @@ if with_gallium_rusticl
- endif
-=20
- dep_clc =3D null_dep
--if with_gallium_opencl or with_clc
-+if with_clc
-   dep_clc =3D dependency('libclc')
- endif
-=20
-diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544..1dae56d 100644
---- a/src/compiler/meson.build
-+++ b/src/compiler/meson.build
-@@ -79,7 +79,7 @@ subdir('nir')
-=20
- subdir('spirv')
-=20
--if with_clc
-+if with_opencl_spirv
-   subdir('clc')
- endif
- if with_gallium
diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm=
-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Inclu=
de-missing-llvm-IR-header-Module.h.patch
deleted file mode 100644
index 82ad88a079..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-hea=
der-Module.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;
-Date: Mon, 1 Jul 2024 23:09:29 -0700
-Subject: [PATCH] amd: Include missing llvm IR header Module.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With LLVM-19, Module.h header is not being pulled, which results in
-compile errors e.g.
-
-src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for ca=
ll to =E2=80=98unwrap(LLVMOpaqueModule*&amp;)=E2=80=99
-  102 |    unwrap(module)-&gt;setTargetTriple(TM-&gt;getTargetTriple().get=
Triple());
-      |    ~~~~~~^~~~~~~~
-In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-n=
ative/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-n=
ative/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-n=
ative/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-n=
ative/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibraryI=
nfo.h:14,
-                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
-
-Its getting the definition from llvm/IR/Type.h instead of Module.h and cau=
sed
-confusion to compiler
-
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/29993">https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/29993</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- src/amd/llvm/ac_llvm_helper.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helper=
.cpp
-index 5d065279ad1..af4a50f8409 100644
---- a/src/amd/llvm/ac_llvm_helper.cpp
-+++ b/src/amd/llvm/ac_llvm_helper.cpp
-@@ -8,6 +8,7 @@
- #include &lt;llvm/Analysis/TargetLibraryInfo.h&gt;
- #include &lt;llvm/IR/IRBuilder.h&gt;
- #include &lt;llvm/IR/LegacyPassManager.h&gt;
-+#include &lt;llvm/IR/Module.h&gt;
- #include &lt;llvm/IR/Verifier.h&gt;
- #include &lt;llvm/Target/TargetMachine.h&gt;
- #include &lt;llvm/MC/MCSubtargetInfo.h&gt;
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-=
dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-=
dri3.patch
deleted file mode 100644
index ab16152090..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.pa=
tch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.nao=
ur@smile.fr</a>&gt;
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper path=
")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw th=
at
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in fu=
nction `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference t=
o `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path=
")
-
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/27478">https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/27478</a>]
-Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">r=
omain.naour@smile.fr</a>&gt;
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include &lt;dlfcn.h&gt;
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include &lt;X11/extensions/shmproto.h&gt;
- #include &lt;assert.h&gt;
- #include &lt;vulkan/vulkan_core.h&gt;
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display=
 *priv,
-        goto handle_error;
-    }
-=20
-+#ifdef HAVE_DRI3
-    if (pdpyp-&gt;zink) {
-       bool err;
-       psc-&gt;has_multibuffer =3D dri3_check_multibuffer(priv-&gt;dpy, &a=
mp;err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_displ=
ay *priv,
-          goto handle_error;
-       }
-    }
-+#endif
-=20
-    glx_config_destroy_list(psc-&gt;base.configs);
-    psc-&gt;base.configs =3D configs;
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-b=
uild-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freed=
reno-don-t-encode-build-path-into-binaries.patch
index 5975ab4472..38871b6d11 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-pa=
th-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-pa=
th-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org">=
dmitry.baryshkov@linaro.org</a>&gt;
 Date: Tue, 16 Jul 2024 12:32:47 +0300
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -13,33 +13,76 @@ it manually when running the tests.
 Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/30206">https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/30206</a>]
 Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@lin=
aro.org">dmitry.baryshkov@linaro.org</a>&gt;
 ---
+ meson.build                      | 1 +
+ meson_options.txt                | 7 +++++++
  src/freedreno/afuc/meson.build   | 4 ++++
  src/freedreno/decode/meson.build | 4 +++-
- src/freedreno/meson.build        | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
+ src/freedreno/meson.build        | 5 ++++-
+ 5 files changed, 19 insertions(+), 2 deletions(-)
=20
+diff --git a/meson.build b/meson.build
+index 3bc837813f967..5c94e76649c63 100644
+--- a/meson.build
++++ b/meson.build
+@@ -76,6 +76,7 @@ if with_tools.contains('all')
+     'imagination',
+   ]
+ endif
++with_tools_for_development =3D get_option('tools-for-development')
+=20
+ with_any_vulkan_layers =3D get_option('vulkan-layers').length() !=3D 0
+ with_intel_tools =3D with_tools.contains('intel') or with_tools.contains(=
'intel-ui')
+diff --git a/meson_options.txt b/meson_options.txt
+index 753bebd961e3f..9bc308b512c13 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -537,6 +537,13 @@ option(
+   description : 'List of tools to build. (Note: `intel-ui` selects `intel=
`)',
+ )
+=20
++option(
++  'tools-for-development',
++  type : 'boolean',
++  value : false,
++  description : 'Support running tools from the build tree (for developer=
s)',
++)
++
+ option(
+   'power8',
+   type : 'feature',
 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.bui=
ld
-index bb7cebf5a748..351cc31ef2de 100644
+index bb7cebf5a748c..351cc31ef2dec 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
-@@ -56,6 +56,7 @@ if with_tests
+@@ -56,10 +56,12 @@ if with_tests
    asm_fw =3D custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm')=
, '@OUTPUT@'],
+     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@=
'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
+     output: 'afuc_test_a7xx.fw',
+     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OU=
TPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
      diff,
-@@ -120,6 +122,7 @@ if cc.sizeof('size_t') &gt; 4
+@@ -120,11 +122,13 @@ if cc.sizeof('size_t') &gt; 4
      disasm_fw =3D custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw=
'), '-g', '630'],
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw=
')],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
+       output: 'afuc_test_a7xx.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_a7=
xx.fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
      test('afuc-disasm',
 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson=
.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
+index 469eeb4eb5975..915ba11af3b33 100644
 --- a/src/freedreno/decode/meson.build
 +++ b/src/freedreno/decode/meson.build
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
@@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
 =20
      test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index 98e49b8fcf0e9..f8bdc5299841b 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
-@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories('rnn')
+@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories('rnn')
 =20
  rnn_src_path =3D dir_source_root + '/src/freedreno/registers'
  rnn_install_path =3D get_option('datadir') + '/freedreno/registers'
 -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' + rnn_instal=
l_path
 +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
++if with_tools_for_development
++  rnn_path =3D rnn_src_path + ':' + rnn_path
++endif
 =20
  dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
                       allow_fallback: true, version: '&gt;=3D5.2')
 --=20
-2.39.2
-
+GitLab
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if=
-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-d=
on-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b4945..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-en=
abled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.nao=
ur@smile.fr</a>&gt;
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw a=
nd sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw a=
nd sw drivers")
-
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/27478">https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/27478</a>]
-Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">r=
omain.naour@smile.fr</a>&gt;
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv-&gt;dri2Display =3D dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv-&gt;dri3Display &amp;&amp; !dpyPriv-&gt;dri2Display)
-          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", fals=
e) &amp;&amp;
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 9fdf496e8b..49a3f58b83 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -12,19 +12,15 @@ SECTION =3D "x11"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "<a href=3D"file://docs/license.rst;md5=3D63779ec98d7=
8d823a9dc533a0735ef10" "=3D"">file://docs/license.rst;md5=3D63779ec98d78d82=
3a9dc533a0735ef10"</a>
=20
+PV =3D "24.2.0"
 PE =3D "2"
=20
 SRC_URI =3D "<a href=3D"https://mesa.freedesktop.org/archive/mesa-${PV}.ta=
r.xz">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \
            <a href=3D"file://0001-meson-misdetects-64bit-atomics-on-mips-c=
lang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch<=
/a> \
-           <a href=3D"file://0001-drisw-fix-build-without-dri3.patch">file=
://0001-drisw-fix-build-without-dri3.patch</a> \
-           <a href=3D"file://0002-glxext-don-t-try-zink-if-not-enabled-in-=
mesa.patch">file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch<=
/a> \
-           <a href=3D"file://0001-Revert-meson-do-not-pull-in-clc-for-clov=
er.patch">file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch</a> =
\
-           <a href=3D"file://0001-amd-Include-missing-llvm-IR-header-Modul=
e.h.patch">file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch</a=
> \
            <a href=3D"file://0001-freedreno-don-t-encode-build-path-into-b=
inaries.patch\">file://0001-freedreno-don-t-encode-build-path-into-binaries=
.patch\</a>
 "
=20
-SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c=
7d96db93f6c26a"
-PV =3D "24.0.7"
+SRC_URI[sha256sum] =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a76=
2ec6950a58addf"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
=20
@@ -38,7 +34,7 @@ do_install:append() {
   fi
 }
=20
-DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-nati=
ve zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-nati=
ve zlib chrpath-replacement-native python3-mako-native gettext-native pytho=
n3-pyyaml-native"
 DEPENDS:append:class-target =3D " <a href=3D"mailto:${@bb.utils.contains">=
${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
@@ -77,8 +73,8 @@ EXTRA_OEMESON =3D " \
     -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
 "
=20
-EXTRA_OEMESON:append:class-target =3D " <a href=3D"mailto:${@bb.utils.cont=
ains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Dsy=
stem', '', d)}"
-EXTRA_OEMESON:append:class-native =3D " <a href=3D"mailto:${@bb.utils.cont=
ains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Den=
abled', '', d)}"
+EXTRA_OEMESON:append:class-target:x86-64 =3D " <a href=3D"mailto:${@bb.uti=
ls.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-c=
lc=3Dsystem', '', d)}"
+EXTRA_OEMESON:append:class-native:x86-64 =3D " <a href=3D"mailto:${@bb.uti=
ls.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-c=
lc=3Denabled -Dinstall-intel-clc=3Dtrue', '', d)}"
=20
 def strip_comma(s):
     return s.strip(',')
@@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Dd=
isabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm &gt;=3D=
 3.9
 VULKAN_DRIVERS =3D ""
-VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
-VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
+VULKAN_DRIVERS:append:x86 =3D "<a href=3D"mailto:${@bb.utils.contains">${@=
bb.utils.contains</a>('PACKAGECONFIG', ',opencl', ',intel', '', d)},amd"
+VULKAN_DRIVERS:append:x86-64 =3D "<a href=3D"mailto:${@bb.utils.contains">=
${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
 # i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
+VULKAN_DRIVERS:append:i686 =3D "<a href=3D"mailto:${@bb.utils.contains">${=
@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
 VULKAN_DRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
@@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
=20
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
-PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
+PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libglvnd"
=20
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3Ddi=
sabled -Dgles2=3Ddisabled"
@@ -145,9 +141,8 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Den=
abled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('PACKAGECONFIG', 'freedreno', '-Dopencl-native=3Dtrue', '', d)}"
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue ${=
OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc sp=
irv-tools python3-ply-native"
+# "opencl" requires libclc from meta-clang
+PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,-D=
gallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools python3=
-ply-native"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
@@ -157,13 +152,11 @@ PACKAGECONFIG[vc4] =3D ""
 PACKAGECONFIG[v3d] =3D ""
 PACKAGECONFIG[zink] =3D ""
=20
-GALLIUMDRIVERS =3D "swrast"
-# gallium swrast was found to crash Xorg on startup in x32 qemu
-GALLIUMDRIVERS:x86-x32 =3D ""
-GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
+GALLIUMDRIVERS =3D "<a href=3D"mailto:softpipe${@bb.utils.contains">softpi=
pe${@bb.utils.contains</a>('PACKAGECONFIG', 'gallium-llvm', ',llvmpipe', ''=
, d)}"
+GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
+GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
 # i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
+GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
=20
 GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
@@ -171,6 +164,7 @@ GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGE=
CONFIG', 'kmsro', ',kmsro',
 GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'zink', ',zink', '', d)}"
+GALLIUMDRIVERS:append =3D"<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'opencl', ',iris', '', d)}"
=20
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb=
.utils.contains</a>('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
@@ -247,7 +241,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
+             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
             "
=20
 do_install:append () {
@@ -262,13 +256,6 @@ do_install:append () {
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
=20
-do_install:append:class-native () {
-    if <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('P=
ACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
 # For the packages that make up the OpenGL interfaces, inject variables so=
 that
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
@@ -339,6 +326,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/d=
rirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpower=
vr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.=
d"
+FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
 FILES:libgbm =3D "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
@@ -366,6 +354,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so $=
{libdir}/libxatracker.la \
 # catch all to get all the tools and data
 FILES:${PN}-tools =3D "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools =3D "1"
+INSANE_SKIP:${PN}-megadriver =3D "dev-so"
=20
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver =3D "mesa"
<div>--=20
</div>2.45.2

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#203708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203708">https://lists.openembedded.org/g/openembedd=
ed-core/message/203708</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108069172/361=
8223">https://lists.openembedded.org/mt/108069172/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-wZOc0/TKXBAN4z5VVc2d--


