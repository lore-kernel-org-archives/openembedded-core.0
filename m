Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6791FD33A3D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.28096.1730832360363756622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X2/iNhej;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c9978a221so59660895ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832359; x=1731437159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9FqJA+DlERMXGB8CffAw947cV6HNHOzdUkb/FE4P3Y=;
        b=X2/iNhejL0+KZl513QcynWxyL12lEh36cSt6YYLLO7qHxK3KM105NkwfekydUlewRm
         4MI0fz5OEesoXuqn3kVAar81yAxLIaUec3Vf/6zJY+qsoMIkHXaFiU1GuHRCeVyOolrI
         4SYuwbarBrhKzmh+scpZ0BOoOYwLc9kTXtobO/bg8QNNZTOTEoKnurj+8MUMINCnlqUo
         cwAdDUKsuTySS951lal9Uz2STrjUo4w/SRIsWciydJwr6PY3AbtcFlnSAJVM0vAY3ajw
         yF6uMaIfqxpLybtUaVCWeamnUJWP5RKruViVHkhd/YjJF21ppKvehDstw/17MEMyJR14
         DXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832359; x=1731437159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9FqJA+DlERMXGB8CffAw947cV6HNHOzdUkb/FE4P3Y=;
        b=pVJyj7oANL7c38nMsB9IWqy2K3RoZ8gAL6VeP+LjbztwYMQjN7JpSJLcJx2xIs+cI1
         vxnGlVUDvKbeZIstqIpHevc4VD1/84xSJRGIdLh8b4MCRUposzf8pHNz+yjhrwixWgqn
         kBs+4zPO5v61XGxMmwNwqfL7LWJFXXHO0EUdC+tcmwJLJZ0BYlqJZdu//W5tnaAVWbEk
         ML6KxX1lxdd9+sV3q07dQJwpcxOzgAau7hNq/mihrCsZwwx+yGs8DBC1phHvZtJinEim
         dREwqYODstzF+5+K1RZo6goOHvsodWfjcNeF/c9D6Dqa9MAEByuU+kTGwymHC/WDV0UR
         A77w==
X-Gm-Message-State: AOJu0Yycc5/7V0uhbCJgw1XmPnw8q4zejvVaRm+rcfhU2c2AOLV+46aQ
	tE5JoPuu4prTP55YbjQ2TC8sUOE7iua+y1D7q+wK7Ltmr7uO27QU+lJuTg==
X-Google-Smtp-Source: AGHT+IE0NH4toUtMZyNotDq09wTEkWkt5qn4Jb5UKa6WhgpvAWDGfdHvHkLGJmfP5RegmA7yAFoY7g==
X-Received: by 2002:a17:902:ce90:b0:20c:9821:699d with SMTP id d9443c01a7336-210c6c9354dmr547920925ad.51.1730832359472;
        Tue, 05 Nov 2024 10:45:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 18/19] mesa: update 24.0.7 -> 24.2.2
Date: Tue,  5 Nov 2024 10:45:37 -0800
Message-ID: <20241105184540.3450302-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206746

From: Markus Volk <f_l_k@t-online.de>

 - Remove patches that have been merged upstream
 - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch. Issue was fixed upstream
 - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
 - Use 'enabled/disabled' for glvnd instead of deprecated 'true/false'
 - swrast gallium driver has been split into 'softpipe' and 'llvmpipe'. The use of 'swrast'
   has been deprecated.
   [https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L171]
 - Add package for libgallium and install
 - Add python3-pyyaml-native dependency
 - Limit intel_clc to x86-64
 - Remove OPENCL_NATIVE variable. The according option has been removed
   from meson_options.txt.
 - Meanwhile theres an install option for intel_clc. Use it instead of manual install
 - intel 'iris' and intel 'vulkan' drivers require opencl and thus need meta-clang layer
   [https://gitlab.freedesktop.org/mesa/mesa/-/issues/11141]
 - Remove gallium kmsro option. This is set depending on 'system_has_kms_drm'
   [https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-24.2.2/meson.build#L206]
 - Add vulkan support for older intel graphics

Signed-off-by: Markus Volk <f_l_k@t-online.de>

Note: 'kmsro' needs to be removed from mesa.bbappend in meta-raspberrypi
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 -----------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
 ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
 meta/recipes-graphics/mesa/mesa.inc           | 49 +++++--------
 6 files changed, 77 insertions(+), 237 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
deleted file mode 100644
index 1711e22585a..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 8 Mar 2024 15:53:11 +0100
-Subject: [PATCH] Revert "meson: do not pull in clc for clover"
-
-This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
-Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd]
-
-Once the merge request above was added, it will only be possible to provide opencl spir-v with gallium-rusticl=true. This is not yet supported in the mesa recipe.
-For now reverting this commit allows to still use clover with opencl-spirv, which would otherwise be broken starting from mesa 24.0.2.
-
-After it was merged, this patch needs to be removed and rusticl support will be required
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
deleted file mode 100644
index 82ad88a079c..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Jul 2024 23:09:29 -0700
-Subject: [PATCH] amd: Include missing llvm IR header Module.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With LLVM-19, Module.h header is not being pulled, which results in
-compile errors e.g.
-
-src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for call to ‘unwrap(LLVMOpaqueModule*&)’
-  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
-      |    ~~~~~~^~~~~~~~
-In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
-                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
-
-Its getting the definition from llvm/IR/Type.h instead of Module.h and caused
-confusion to compiler
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/amd/llvm/ac_llvm_helper.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helper.cpp
-index 5d065279ad1..af4a50f8409 100644
---- a/src/amd/llvm/ac_llvm_helper.cpp
-+++ b/src/amd/llvm/ac_llvm_helper.cpp
-@@ -8,6 +8,7 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/IR/IRBuilder.h>
- #include <llvm/IR/LegacyPassManager.h>
-+#include <llvm/IR/Module.h>
- #include <llvm/IR/Verifier.h>
- #include <llvm/Target/TargetMachine.h>
- #include <llvm/MC/MCSubtargetInfo.h>
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
deleted file mode 100644
index ab161520906..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
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
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-        goto handle_error;
-    }
- 
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-          goto handle_error;
-       }
-    }
-+#endif
- 
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 5975ab4472e..38871b6d11f 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Date: Tue, 16 Jul 2024 12:32:47 +0300
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -13,33 +13,76 @@ it manually when running the tests.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 ---
+ meson.build                      | 1 +
+ meson_options.txt                | 7 +++++++
  src/freedreno/afuc/meson.build   | 4 ++++
  src/freedreno/decode/meson.build | 4 +++-
- src/freedreno/meson.build        | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
+ src/freedreno/meson.build        | 5 ++++-
+ 5 files changed, 19 insertions(+), 2 deletions(-)
 
+diff --git a/meson.build b/meson.build
+index 3bc837813f967..5c94e76649c63 100644
+--- a/meson.build
++++ b/meson.build
+@@ -76,6 +76,7 @@ if with_tools.contains('all')
+     'imagination',
+   ]
+ endif
++with_tools_for_development = get_option('tools-for-development')
+ 
+ with_any_vulkan_layers = get_option('vulkan-layers').length() != 0
+ with_intel_tools = with_tools.contains('intel') or with_tools.contains('intel-ui')
+diff --git a/meson_options.txt b/meson_options.txt
+index 753bebd961e3f..9bc308b512c13 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -537,6 +537,13 @@ option(
+   description : 'List of tools to build. (Note: `intel-ui` selects `intel`)',
+ )
+ 
++option(
++  'tools-for-development',
++  type : 'boolean',
++  value : false,
++  description : 'Support running tools from the build tree (for developers)',
++)
++
+ option(
+   'power8',
+   type : 'feature',
 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
-index bb7cebf5a748..351cc31ef2de 100644
+index bb7cebf5a748c..351cc31ef2dec 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
-@@ -56,6 +56,7 @@ if with_tests
+@@ -56,10 +56,12 @@ if with_tests
    asm_fw = custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
+     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   asm_fw_a7xx = custom_target('afuc_test_a7xx.fw',
+     output: 'afuc_test_a7xx.fw',
+     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
      diff,
-@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
+@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
      disasm_fw = custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw')],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     disasm_fw_a7xx = custom_target('afuc_test_a7xx.asm',
+       output: 'afuc_test_a7xx.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
      test('afuc-disasm',
 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
+index 469eeb4eb5975..915ba11af3b33 100644
 --- a/src/freedreno/decode/meson.build
 +++ b/src/freedreno/decode/meson.build
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
@@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
  
      test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index 98e49b8fcf0e9..f8bdc5299841b 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
-@@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
+@@ -6,7 +6,10 @@ inc_freedreno_rnn = include_directories('rnn')
  
  rnn_src_path = dir_source_root + '/src/freedreno/registers'
  rnn_install_path = get_option('datadir') + '/freedreno/registers'
 -rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
 +rnn_path = get_option('prefix') + '/' + rnn_install_path
++if with_tools_for_development
++  rnn_path = rnn_src_path + ':' + rnn_path
++endif
  
  dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
                       allow_fallback: true, version: '>=5.2')
 -- 
-2.39.2
-
+GitLab
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b49453..00000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
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
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9fdf496e8b3..ecea7e94de8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,15 +16,11 @@ PE = "2"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
 "
 
-SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-PV = "24.0.7"
+SRC_URI[sha256sum] = "fd077d3104edbe459e2b8597d2757ec065f9bd2d620b8c0b9cc88c2bf9891d02"
+PV = "24.2.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -38,7 +34,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native python3-pyyaml-native gettext-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
@@ -77,8 +73,8 @@ EXTRA_OEMESON = " \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
-EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
-EXTRA_OEMESON:append:class-native = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', '', d)}"
+EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
+EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled -Dinstall-intel-clc=true', '', d)}"
 
 def strip_comma(s):
     return s.strip(',')
@@ -108,10 +104,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86 = ",intel,amd"
-VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
+VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', ',opencl', ',intel', '', d)},intel_hasvk,amd"
+VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
 # i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 = ",intel,amd"
+VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
@@ -137,7 +133,7 @@ PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
+PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -145,32 +141,30 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
+# "opencl" requires libclc from meta-clang
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
 PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
 PACKAGECONFIG[zink] = ""
 
-GALLIUMDRIVERS = "swrast"
+GALLIUMDRIVERS = "softpipe${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',llvmpipe', '', d)}"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86 = ",i915,crocus"
+GALLIUMDRIVERS:append:x86-64 = ",i915,crocus"
 # i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:i686 = ",i915,crocus"
 
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',iris', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
@@ -247,7 +241,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
+             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
             "
 
 do_install:append () {
@@ -262,13 +256,6 @@ do_install:append () {
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
 
-do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
 # For the packages that make up the OpenGL interfaces, inject variables so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
@@ -339,6 +326,7 @@ FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
+FILES:mesa-gallium-drivers = "${libdir}/libgallium-*.so"
 FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
@@ -366,6 +354,7 @@ FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
 # catch all to get all the tools and data
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
+INSANE_SKIP:${PN}-megadriver = "dev-so"
 
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver = "mesa"

