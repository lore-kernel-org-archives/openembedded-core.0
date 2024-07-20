Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2E0C3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 16:28:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.9169.1721492906531972313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 09:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VX9X9ckR;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea79e6979so3153314e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 09:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721492905; x=1722097705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+nDoW3K4SgfFJvLzCA8VnEPv0622X4lATJo8haMA+00=;
        b=VX9X9ckRYb/tJLfqnmj4u9YE5Bbl55GskTzwZuW9j9N2MWAVo1NzTKdwRKD5CAyO/z
         gviD4rbQF7onZKm69bi5Eq/iKYEj4WSKmh9I7dNXRzNF4cHpERaiMwwAFSeL3R2DS5k5
         F4u9+Uh4SJ05OGMfZ+xEGAv9eJV4smH9IINfaG7pc2WdgkHSYQjDTKMdhyRcGrLW+0u4
         kOToX4RdTad/Gld0ByO+YPgkokUzzHFOcuHSy1cEzMVTxqLIE2JRmsFn2asKJeHE4CEw
         1K0gYkQGUxvbzVggRZ71JUD2Eei48CKcfr9WRD2nHYczXre0AgL9aBnu+VVIjPA8C+Ee
         qoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721492905; x=1722097705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nDoW3K4SgfFJvLzCA8VnEPv0622X4lATJo8haMA+00=;
        b=xKESe3/lCkXWmcUaQFeDm6KE2c/dEIqM01TzjnFZZhCUSU7us+nMwo6kUhr1jUHo/U
         JxrdTsq9c5TUJSoohsV7XCzixc1k5dqjKMMxm0dRS1syDe808kWFXr6iUWO575tNDSZu
         9dc2XTvdjdrKSSdcppPUu1HMEgMsAlDxmqSOCjH0FeexiAN91Fj1+VrsIOkw912NLWq8
         t1LtJd2d2z4IAslyfYCybjFEusp5990kiHBvoZ4Uurx/GMZoURdvnJcJKGr7SrnG5/dA
         dO/8fzyOc4SddO90nDTMsE8WRQCLD3W4UIHd6R3gXbMsCJS+IzAKI6vhCjyfPqWeoPTw
         FDew==
X-Gm-Message-State: AOJu0Yz6FAw6NLxqF0GmfUfQiDTeWG5w5Dp7SYsXkvhCxAToOZJbuDD5
	xZsS+a2kz2vmG0JJ+vuYRURKuWNa2Qv1XAoCn34jpkEBxYOPTe2gfDcRJGnZJ1cv+szrLhwXI5h
	iOn7JdGaNo6X3Qflnoz6BuKE+Fr4=
X-Google-Smtp-Source: AGHT+IFP361rcNwBM4+JTQDVgxZE9yNMqx4DITkgq0FtMY/BshRPdJwcQQIT1ggieyZeukp6gcmpgVpYnSDXKp1ESQQ=
X-Received: by 2002:a05:6512:2209:b0:52e:9fda:f18a with SMTP id
 2adb3069b0e04-52efb885868mr1287069e87.44.1721492904364; Sat, 20 Jul 2024
 09:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240720133626.1223952-1-f_l_k@t-online.de>
In-Reply-To: <20240720133626.1223952-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 20 Jul 2024 18:28:12 +0200
Message-ID: <CANNYZj94km6rspYN3e04GG5A4EZZNO0C5mSnH_GnyCm5yFFX_Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] mesa: update 24.0.7 -> 24.1.4
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 16:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202290

I think this last version should be good; these drivers are specific
to x86 hardware and are needed only with meta-intel really. So it's up
to Intel folks how they want to provide graphical support (probably by
making meta-intel enable opencl and depend on meta-clang).

Alex

On Sat, 20 Jul 2024 at 15:36, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
>  - Remove two patches that have been merged upstream
>  - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>    Upstream managed to fix this:
>    https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839
>  - Drop OPENCL_NATIVE since the according option has been removed from meson_options.txt
>  - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>  - gallium-iris and intel-vulkan both require libclc. Make them dependent opn opencl
>    PACKAGECONFIG
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
>  .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
>  ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
>  .../{mesa-gl_24.0.7.bb => mesa-gl_24.1.4.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           | 23 +++---
>  .../mesa/{mesa_24.0.7.bb => mesa_24.1.4.bb}   |  0
>  7 files changed, 68 insertions(+), 179 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb => mesa-gl_24.1.4.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb => mesa_24.1.4.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> deleted file mode 100644
> index 1711e22585..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Fri, 8 Mar 2024 15:53:11 +0100
> -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> -
> -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> -Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd]
> -
> -Once the merge request above was added, it will only be possible to provide opencl spir-v with gallium-rusticl=true. This is not yet supported in the mesa recipe.
> -For now reverting this commit allows to still use clover with opencl-spirv, which would otherwise be broken starting from mesa 24.0.2.
> -
> -After it was merged, this patch needs to be removed and rusticl support will be required
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
> -@@ -813,6 +813,7 @@ if _opencl != 'disabled'
> -     error('The Clover OpenCL state tracker requires rtti')
> -   endif
> -
> -+  with_clc = true
> -   with_gallium_opencl = true
> -   with_opencl_icd = _opencl == 'icd'
> - else
> -@@ -837,7 +838,7 @@ if with_gallium_rusticl
> - endif
> -
> - dep_clc = null_dep
> --if with_gallium_opencl or with_clc
> -+if with_clc
> -   dep_clc = dependency('libclc')
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
> diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
> deleted file mode 100644
> index ab16152090..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:09 +0100
> -Subject: [PATCH 1/2] drisw: fix build without dri3
> -
> -commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
> -added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
> -can be build without dri3.
> -
> -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
> -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
> -  collect2: error: ld returned 1 exit status
> -
> -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> -dri3_check_multibuffer().
> -
> -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
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
> -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
> -        goto handle_error;
> -    }
> -
> -+#ifdef HAVE_DRI3
> -    if (pdpyp->zink) {
> -       bool err;
> -       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
> -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
> -          goto handle_error;
> -       }
> -    }
> -+#endif
> -
> -    glx_config_destroy_list(psc->base.configs);
> -    psc->base.configs = configs;
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> index 5975ab4472..38871b6d11 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> @@ -1,4 +1,4 @@
> -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
> +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
>  From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  Date: Tue, 16 Jul 2024 12:32:47 +0300
>  Subject: [PATCH] freedreno: don't encode build path into binaries
> @@ -13,33 +13,76 @@ it manually when running the tests.
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
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
> ++with_tools_for_development = get_option('tools-for-development')
> +
> + with_any_vulkan_layers = get_option('vulkan-layers').length() != 0
> + with_intel_tools = with_tools.contains('intel') or with_tools.contains('intel-ui')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 753bebd961e3f..9bc308b512c13 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -537,6 +537,13 @@ option(
> +   description : 'List of tools to build. (Note: `intel-ui` selects `intel`)',
> + )
> +
> ++option(
> ++  'tools-for-development',
> ++  type : 'boolean',
> ++  value : false,
> ++  description : 'Support running tools from the build tree (for developers)',
> ++)
> ++
> + option(
> +   'power8',
> +   type : 'feature',
>  diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
> -index bb7cebf5a748..351cc31ef2de 100644
> +index bb7cebf5a748c..351cc31ef2dec 100644
>  --- a/src/freedreno/afuc/meson.build
>  +++ b/src/freedreno/afuc/meson.build
> -@@ -56,6 +56,7 @@ if with_tests
> +@@ -56,10 +56,12 @@ if with_tests
>     asm_fw = custom_target('afuc_test.fw',
>       output: 'afuc_test.fw',
> -     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> ++    env: {'RNN_PATH': rnn_src_path},
> +   )
> +   asm_fw_a7xx = custom_target('afuc_test_a7xx.fw',
> +     output: 'afuc_test_a7xx.fw',
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
>  +    env: {'RNN_PATH': rnn_src_path},
>     )
>     test('afuc-asm',
>       diff,
> -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
>       disasm_fw = custom_target('afuc_test.asm',
>         output: 'afuc_test.asm',
> -       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw')],
> ++      env: {'RNN_PATH': rnn_src_path},
> +       capture: true
> +     )
> +     disasm_fw_a7xx = custom_target('afuc_test_a7xx.asm',
> +       output: 'afuc_test_a7xx.asm',
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
>  +      env: {'RNN_PATH': rnn_src_path},
>         capture: true
>       )
>       test('afuc-disasm',
>  diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
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
> -@@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
> +@@ -6,7 +6,10 @@ inc_freedreno_rnn = include_directories('rnn')
>
>   rnn_src_path = dir_source_root + '/src/freedreno/registers'
>   rnn_install_path = get_option('datadir') + '/freedreno/registers'
>  -rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
>  +rnn_path = get_option('prefix') + '/' + rnn_install_path
> ++if with_tools_for_development
> ++  rnn_path = rnn_src_path + ':' + rnn_path
> ++endif
>
>   dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
>                        allow_fallback: true, version: '>=5.2')
>  --
> -2.39.2
> -
> +GitLab
> diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
> deleted file mode 100644
> index 036a0b4945..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:10 +0100
> -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> -
> -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
> -added an automatic zink fallback even when the zink gallium is not
> -enabled at build time.
> -
> -It leads to unexpected error log while loading drisw driver and
> -zink is not installed on the rootfs:
> -
> -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> -
> -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
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
> -          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
> -+#if defined(HAVE_ZINK)
> -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
> -          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
> -                     !getenv("GALLIUM_DRIVER");
> -+#endif /* HAVE_ZINK */
> -    }
> - #endif /* GLX_USE_DRM */
> -    if (glx_direct)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 973b762135..499006655d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -16,14 +16,11 @@ PE = "2"
>
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> -           file://0001-drisw-fix-build-without-dri3.patch \
> -           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> -           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>             file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
>  "
>
> -SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> +SRC_URI[sha256sum] = "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c69c8c51579937ade1"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -107,10 +104,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
>  VULKAN_DRIVERS = ""
> -VULKAN_DRIVERS:append:x86 = ",intel,amd"
> -VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
> +VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
> +VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
>  # i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 = ",intel,amd"
> +VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
> @@ -144,9 +141,8 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>
> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> -OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
> -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> +# "opencl" requires libclc from meta-clang
> +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
>
>  PACKAGECONFIG[broadcom] = ""
>  PACKAGECONFIG[etnaviv] = ""
> @@ -159,10 +155,10 @@ PACKAGECONFIG[zink] = ""
>  GALLIUMDRIVERS = "swrast"
>  # gallium swrast was found to crash Xorg on startup in x32 qemu
>  GALLIUMDRIVERS:x86-x32 = ""
> -GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86 = ",i915,crocus"
> +GALLIUMDRIVERS:append:x86-64 = ",i915,crocus"
>  # i686 is a 32 bit override for mesa-native
> -GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:i686 = ",i915,crocus"
>
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> @@ -170,6 +166,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro',
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
> +GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',iris', '', d)}"
>
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
> diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa_24.1.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
> rename to meta/recipes-graphics/mesa/mesa_24.1.4.bb
> --
> 2.45.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202288): https://lists.openembedded.org/g/openembedded-core/message/202288
> Mute This Topic: https://lists.openembedded.org/mt/107452067/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

