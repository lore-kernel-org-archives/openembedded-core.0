Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8044C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 07:58:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.14306.1721375890322580563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 00:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id 4440243378;
	Fri, 19 Jul 2024 09:58:08 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.38.70]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUiV8-1k37Ts0; Fri, 19 Jul 2024 09:58:03 +0200
Date: Fri, 19 Jul 2024 09:59:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: update 24.0.7 -> 24.1.3
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org,
	dmitry.baryshkov@linaro.org
Message-Id: <Q62VGS.2DL6SVGVPX9L1@t-online.de>
In-Reply-To: <20240718222542dff059ea@mail.local>
References: <20240712094928.66832-1-f_l_k@t-online.de>
	<20240718222542dff059ea@mail.local>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/gL9lKCaRMANGM3eCYfy"
X-TOI-EXPURGATEID: 150726::1721375883-D37F7B59-E91E5DC3/0/0 CLEAN NORMAL
X-TOI-MSGID: 5074cc4b-2252-4ae4-94d4-b65873ac045c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 07:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202253

--=-/gL9lKCaRMANGM3eCYfy
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello Alexandre,

I also updated to 23.1.4, which has been released in the meantime. The 
freedreno patch failed, so I took the latest version from the merge 
request

On Fri, Jul 19 2024 at 12:25:42 AM +02:00:00, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> Hello Markus,
> 
> Can you rebase on master?
> 
> Thanks!
> 
> On 12/07/2024 11:49:28+0200, Markus Volk wrote:
>>  - Remove two patches that have been merged upstream
>>  - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>>    Upstream managed to fix this:
>>    
>> <https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839>
>>  - Drop OPENCL_NATIVE since the according option has been removed 
>> from meson_options.txt
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...-meson-do-not-pull-in-clc-for-clover.patch | 53 
>> -----------------
>>   .../0001-drisw-fix-build-without-dri3.patch   | 58 
>> -------------------
>>   ...sdetects-64bit-atomics-on-mips-clang.patch |  2 +-
>>   ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 --------------
>>   .../{mesa-gl_24.0.7.bb => mesa-gl_24.1.3.bb}  |  0
>>   meta/recipes-graphics/mesa/mesa.inc           | 10 +---
>>   .../mesa/{mesa_24.0.7.bb => mesa_24.1.3.bb}   |  0
>>   7 files changed, 4 insertions(+), 161 deletions(-)
>>   delete mode 100644 
>> meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>>   delete mode 100644 
>> meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>>   delete mode 100644 
>> meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
>>   rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb => 
>> mesa-gl_24.1.3.bb} (100%)
>>   rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb => 
>> mesa_24.1.3.bb} (100%)
>> 
>>  diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch 
>> b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>>  deleted file mode 100644
>>  index 1711e22585..0000000000
>>  --- 
>> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>>  +++ /dev/null
>>  @@ -1,53 +0,0 @@
>>  -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 
>> 2001
>>  -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>  -Date: Fri, 8 Mar 2024 15:53:11 +0100
>>  -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
>>  -
>>  -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
>>  -Upstream-Status: Inappropriate 
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd>]
>>  -
>>  -Once the merge request above was added, it will only be possible 
>> to provide opencl spir-v with gallium-rusticl=true. This is not yet 
>> supported in the mesa recipe.
>>  -For now reverting this commit allows to still use clover with 
>> opencl-spirv, which would otherwise be broken starting from mesa 
>> 24.0.2.
>>  -
>>  -After it was merged, this patch needs to be removed and rusticl 
>> support will be required
>>  -
>>  -Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ----
>>  - meson.build              | 3 ++-
>>  - src/compiler/meson.build | 2 +-
>>  - 2 files changed, 3 insertions(+), 2 deletions(-)
>>  -
>>  -diff --git a/meson.build b/meson.build
>>  -index 2db6185..741b5d1 100644
>>  ---- a/meson.build
>>  -+++ b/meson.build
>>  -@@ -813,6 +813,7 @@ if _opencl != 'disabled'
>>  -     error('The Clover OpenCL state tracker requires rtti')
>>  -   endif
>>  -
>>  -+  with_clc = true
>>  -   with_gallium_opencl = true
>>  -   with_opencl_icd = _opencl == 'icd'
>>  - else
>>  -@@ -837,7 +838,7 @@ if with_gallium_rusticl
>>  - endif
>>  -
>>  - dep_clc = null_dep
>>  --if with_gallium_opencl or with_clc
>>  -+if with_clc
>>  -   dep_clc = dependency('libclc')
>>  - endif
>>  -
>>  -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
>>  -index 8d73544..1dae56d 100644
>>  ---- a/src/compiler/meson.build
>>  -+++ b/src/compiler/meson.build
>>  -@@ -79,7 +79,7 @@ subdir('nir')
>>  -
>>  - subdir('spirv')
>>  -
>>  --if with_clc
>>  -+if with_opencl_spirv
>>  -   subdir('clc')
>>  - endif
>>  - if with_gallium
>>  diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch 
>> b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>>  deleted file mode 100644
>>  index ab16152090..0000000000
>>  --- 
>> a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>>  +++ /dev/null
>>  @@ -1,58 +0,0 @@
>>  -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Romain Naour <romain.naour@smile.fr 
>> <mailto:romain.naour@smile.fr>>
>>  -Date: Tue, 6 Feb 2024 09:47:09 +0100
>>  -Subject: [PATCH 1/2] drisw: fix build without dri3
>>  -
>>  -commit 1887368df41 ("glx/sw: check for modifier support in the 
>> kopper path")
>>  -added dri3_priv.h header and dri3_check_multibuffer() function in 
>> drisw that
>>  -can be build without dri3.
>>  -
>>  -  i686-buildroot-linux-gnu/bin/ld: 
>> src/glx/libglx.a.p/drisw_glx.c.o: in function 
>> `driswCreateScreenDriver':
>>  -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined 
>> reference to `dri3_check_multibuffer'
>>  -  collect2: error: ld returned 1 exit status
>>  -
>>  -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code 
>> using
>>  -dri3_check_multibuffer().
>>  -
>>  -Fixes: 1887368df41 ("glx/sw: check for modifier support in the 
>> kopper path")
>>  -
>>  -Upstream-Status: Submitted 
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478>]
>>  -Signed-off-by: Romain Naour <romain.naour@smile.fr 
>> <mailto:romain.naour@smile.fr>>
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - src/glx/drisw_glx.c | 4 ++++
>>  - 1 file changed, 4 insertions(+)
>>  -
>>  -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
>>  -index 3d3f752..4b19e2d 100644
>>  ---- a/src/glx/drisw_glx.c
>>  -+++ b/src/glx/drisw_glx.c
>>  -@@ -32,7 +32,9 @@
>>  - #include <dlfcn.h>
>>  - #include "dri_common.h"
>>  - #include "drisw_priv.h"
>>  -+#ifdef HAVE_DRI3
>>  - #include "dri3_priv.h"
>>  -+#endif
>>  - #include <X11/extensions/shmproto.h>
>>  - #include <assert.h>
>>  - #include <vulkan/vulkan_core.h>
>>  -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct 
>> glx_display *priv,
>>  -        goto handle_error;
>>  -    }
>>  -
>>  -+#ifdef HAVE_DRI3
>>  -    if (pdpyp->zink) {
>>  -       bool err;
>>  -       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, 
>> &err);
>>  -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct 
>> glx_display *priv,
>>  -          goto handle_error;
>>  -       }
>>  -    }
>>  -+#endif
>>  -
>>  -    glx_config_destroy_list(psc->base.configs);
>>  -    psc->base.configs = configs;
>>  ---
>>  -2.44.0
>>  -
>>  diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
>> b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
>>  index baa98a0d46..6b5d5ea1a5 100644
>>  --- 
>> a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
>>  +++ 
>> b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
>>  @@ -1,4 +1,4 @@
>>  -From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 
>> 2001
>>  +From 251f18fec005c522d0bf91b36ddbc89d06c86f76 Mon Sep 17 00:00:00 
>> 2001
>>   From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>   Date: Mon, 13 Jan 2020 15:23:47 -0800
>>   Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
>>  diff --git 
>> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch 
>> b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
>>  deleted file mode 100644
>>  index 036a0b4945..0000000000
>>  --- 
>> a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
>>  +++ /dev/null
>>  @@ -1,42 +0,0 @@
>>  -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Romain Naour <romain.naour@smile.fr 
>> <mailto:romain.naour@smile.fr>>
>>  -Date: Tue, 6 Feb 2024 09:47:10 +0100
>>  -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
>>  -
>>  -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading 
>> between hw and sw drivers")
>>  -added an automatic zink fallback even when the zink gallium is not
>>  -enabled at build time.
>>  -
>>  -It leads to unexpected error log while loading drisw driver and
>>  -zink is not installed on the rootfs:
>>  -
>>  -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
>>  -
>>  -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading 
>> between hw and sw drivers")
>>  -
>>  -Upstream-Status: Submitted 
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478>]
>>  -Signed-off-by: Romain Naour <romain.naour@smile.fr 
>> <mailto:romain.naour@smile.fr>>
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - src/glx/glxext.c | 2 ++
>>  - 1 file changed, 2 insertions(+)
>>  -
>>  -diff --git a/src/glx/glxext.c b/src/glx/glxext.c
>>  -index 05c825a..7a06aa9 100644
>>  ---- a/src/glx/glxext.c
>>  -+++ b/src/glx/glxext.c
>>  -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
>>  - #endif /* HAVE_DRI3 */
>>  -       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
>>  -          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
>>  -+#if defined(HAVE_ZINK)
>>  -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
>>  -          try_zink = 
>> !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
>>  -                     !getenv("GALLIUM_DRIVER");
>>  -+#endif /* HAVE_ZINK */
>>  -    }
>>  - #endif /* GLX_USE_DRM */
>>  -    if (glx_direct)
>>  ---
>>  -2.44.0
>>  -
>>  diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb 
>> b/meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
>>  rename to meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc 
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index 2581ccb120..b403a2481a 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -16,12 +16,9 @@ PE = "2"
>> 
>>   SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz 
>> <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>>              
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>  -           file://0001-drisw-fix-build-without-dri3.patch 
>> <file://0001-drisw-fix-build-without-dri3.patch/> \
>>  -           
>> file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch 
>> <file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch/> \
>>  -           
>> file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch 
>> <file://0001-revert-meson-do-not-pull-in-clc-for-clover.patch/> \
>>   "
>> 
>>  -SRC_URI[sha256sum] = 
>> "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
>>  +SRC_URI[sha256sum] = 
>> "63236426b25a745ba6aa2d6daf8cd769d5ea01887b0745ab7124d2ef33a9020d"
>> 
>>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>> 
>>  @@ -142,9 +139,8 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled 
>> -Dgles2=enabled, -Dgles1=disabled -Dgles2
>>   # "egl" requires "opengl"
>>   PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>> 
>>  -# "opencl" requires libclc from meta-clang and spirv-tools from 
>> OE-Core
>>  -OPENCL_NATIVE = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno', 
>> '-Dopencl-native=true', '', d)}"
>>  -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true 
>> ${OPENCL_NATIVE},-Dgallium-opencl=disabled 
>> -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
>>  +# "opencl" requires libclc from meta-clang
>>  +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd 
>> -Dopencl-spirv=true,-Dgallium-opencl=disabled 
>> -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
>> 
>>   PACKAGECONFIG[broadcom] = ""
>>   PACKAGECONFIG[etnaviv] = ""
>>  diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb 
>> b/meta/recipes-graphics/mesa/mesa_24.1.3.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
>>  rename to meta/recipes-graphics/mesa/mesa_24.1.3.bb
>>  --
>>  2.45.2
>> 
> 
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#201817): 
>> <https://lists.openembedded.org/g/openembedded-core/message/201817>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/107179247/3617179>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org 
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-core/unsub> 
>> [alexandre.belloni@bootlin.com 
>> <mailto:alexandre.belloni@bootlin.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>


--=-/gL9lKCaRMANGM3eCYfy
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hello Alexandre,</div><div><br></div><div>I also updated to 23.1.4, which has been released in the meantime. The freedreno patch failed, so I took the latest version from the merge request</div></div><div id="geary-quote" dir="auto"><br>On Fri, Jul 19 2024 at 12:25:42 AM +02:00:00, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hello Markus,

Can you rebase on master?

Thanks!

On 12/07/2024 11:49:28+0200, Markus Volk wrote:
<blockquote> - Remove two patches that have been merged upstream
 - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
   Upstream managed to fix this:
   <a href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839">https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839</a>
 - Drop OPENCL_NATIVE since the according option has been removed from meson_options.txt
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  ...-meson-do-not-pull-in-clc-for-clover.patch | 53 -----------------
  .../0001-drisw-fix-build-without-dri3.patch   | 58 -------------------
  ...sdetects-64bit-atomics-on-mips-clang.patch |  2 +-
  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 --------------
  .../{mesa-gl_24.0.7.bb =&gt; mesa-gl_24.1.3.bb}  |  0
  meta/recipes-graphics/mesa/mesa.inc           | 10 +---
  .../mesa/{mesa_24.0.7.bb =&gt; mesa_24.1.3.bb}   |  0
  7 files changed, 4 insertions(+), 161 deletions(-)
  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
  delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
  delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
  rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb =&gt; mesa-gl_24.1.3.bb} (100%)
  rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb =&gt; mesa_24.1.3.bb} (100%)
 
 diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
 deleted file mode 100644
 index 1711e22585..0000000000
 --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
 +++ /dev/null
 @@ -1,53 +0,0 @@
 -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
 -From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 -Date: Fri, 8 Mar 2024 15:53:11 +0100
 -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
 -
 -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
 -Upstream-Status: Inappropriate [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd</a>]
 -
 -Once the merge request above was added, it will only be possible to provide opencl spir-v with gallium-rusticl=true. This is not yet supported in the mesa recipe.
 -For now reverting this commit allows to still use clover with opencl-spirv, which would otherwise be broken starting from mesa 24.0.2.
 -
 -After it was merged, this patch needs to be removed and rusticl support will be required
 -
 -Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ----
 - meson.build              | 3 ++-
 - src/compiler/meson.build | 2 +-
 - 2 files changed, 3 insertions(+), 2 deletions(-)
 -
 -diff --git a/meson.build b/meson.build
 -index 2db6185..741b5d1 100644
 ---- a/meson.build
 -+++ b/meson.build
 -@@ -813,6 +813,7 @@ if _opencl != 'disabled'
 -     error('The Clover OpenCL state tracker requires rtti')
 -   endif
 - 
 -+  with_clc = true
 -   with_gallium_opencl = true
 -   with_opencl_icd = _opencl == 'icd'
 - else
 -@@ -837,7 +838,7 @@ if with_gallium_rusticl
 - endif
 - 
 - dep_clc = null_dep
 --if with_gallium_opencl or with_clc
 -+if with_clc
 -   dep_clc = dependency('libclc')
 - endif
 - 
 -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
 -index 8d73544..1dae56d 100644
 ---- a/src/compiler/meson.build
 -+++ b/src/compiler/meson.build
 -@@ -79,7 +79,7 @@ subdir('nir')
 - 
 - subdir('spirv')
 - 
 --if with_clc
 -+if with_opencl_spirv
 -   subdir('clc')
 - endif
 - if with_gallium
 diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
 deleted file mode 100644
 index ab16152090..0000000000
 --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
 +++ /dev/null
 @@ -1,58 +0,0 @@
 -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
 -From: Romain Naour &lt;<a href="mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt;
 -Date: Tue, 6 Feb 2024 09:47:09 +0100
 -Subject: [PATCH 1/2] drisw: fix build without dri3
 -
 -commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 -added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
 -can be build without dri3.
 -
 -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
 -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
 -  collect2: error: ld returned 1 exit status
 -
 -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
 -dri3_check_multibuffer().
 -
 -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 -
 -Upstream-Status: Submitted [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478</a>]
 -Signed-off-by: Romain Naour &lt;<a href="mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt;
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
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
 -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
 -        goto handle_error;
 -    }
 - 
 -+#ifdef HAVE_DRI3
 -    if (pdpyp-&gt;zink) {
 -       bool err;
 -       psc-&gt;has_multibuffer = dri3_check_multibuffer(priv-&gt;dpy, &amp;err);
 -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
 -          goto handle_error;
 -       }
 -    }
 -+#endif
 - 
 -    glx_config_destroy_list(psc-&gt;base.configs);
 -    psc-&gt;base.configs = configs;
 --- 
 -2.44.0
 -
 diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 index baa98a0d46..6b5d5ea1a5 100644
 --- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 +++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 @@ -1,4 +1,4 @@
 -From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
 +From 251f18fec005c522d0bf91b36ddbc89d06c86f76 Mon Sep 17 00:00:00 2001
  From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
  Date: Mon, 13 Jan 2020 15:23:47 -0800
  Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
 diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 deleted file mode 100644
 index 036a0b4945..0000000000
 --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 +++ /dev/null
 @@ -1,42 +0,0 @@
 -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
 -From: Romain Naour &lt;<a href="mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt;
 -Date: Tue, 6 Feb 2024 09:47:10 +0100
 -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
 -
 -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 -added an automatic zink fallback even when the zink gallium is not
 -enabled at build time.
 -
 -It leads to unexpected error log while loading drisw driver and
 -zink is not installed on the rootfs:
 -
 -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
 -
 -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 -
 -Upstream-Status: Submitted [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478</a>]
 -Signed-off-by: Romain Naour &lt;<a href="mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt;
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
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
 -          dpyPriv-&gt;dri2Display = dri2CreateDisplay(dpy);
 -+#if defined(HAVE_ZINK)
 -       if (!dpyPriv-&gt;dri3Display &amp;&amp; !dpyPriv-&gt;dri2Display)
 -          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &amp;&amp;
 -                     !getenv("GALLIUM_DRIVER");
 -+#endif /* HAVE_ZINK */
 -    }
 - #endif /* GLX_USE_DRM */
 -    if (glx_direct)
 --- 
 -2.44.0
 -
 diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
 rename to meta/recipes-graphics/mesa/mesa-gl_24.1.3.bb
 diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
 index 2581ccb120..b403a2481a 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -16,12 +16,9 @@ PE = "2"
  
  SRC_URI = "<a href="https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \
             <a href="file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch</a> \
 -           <a href="file://0001-drisw-fix-build-without-dri3.patch">file://0001-drisw-fix-build-without-dri3.patch</a> \
 -           <a href="file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch">file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch</a> \
 -           <a href="file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch">file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch</a> \
  "
  
 -SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
 +SRC_URI[sha256sum] = "63236426b25a745ba6aa2d6daf8cd769d5ea01887b0745ab7124d2ef33a9020d"
  
  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
  
 @@ -142,9 +139,8 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
  # "egl" requires "opengl"
  PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
  
 -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
 -OPENCL_NATIVE = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
 -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
 +# "opencl" requires libclc from meta-clang
 +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
  
  PACKAGECONFIG[broadcom] = ""
  PACKAGECONFIG[etnaviv] = ""
 diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa_24.1.3.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
 rename to meta/recipes-graphics/mesa/mesa_24.1.3.bb
 -- 
 2.45.2
 
</blockquote>
<blockquote> 
 -=-=-=-=-=-=-=-=-=-=-=-
 Links: You receive all messages sent to this group.
 View/Reply Online (#201817): <a href="https://lists.openembedded.org/g/openembedded-core/message/201817">https://lists.openembedded.org/g/openembedded-core/message/201817</a>
 Mute This Topic: <a href="https://lists.openembedded.org/mt/107179247/3617179">https://lists.openembedded.org/mt/107179247/3617179</a>
 Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>]
 -=-=-=-=-=-=-=-=-=-=-=-
 
</blockquote>

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div></blockquote></div>
--=-/gL9lKCaRMANGM3eCYfy--


