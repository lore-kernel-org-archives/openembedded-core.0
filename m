Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE294C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.24231.1746204924143826154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWY2W5o5;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b074d908e56so1755115a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204923; x=1746809723; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpV4n8xRX3P55h7I3F2IlS5CFZqJz8w7NcwBkpd0qeA=;
        b=QWY2W5o5TAWONJ9h+T61lEpnkguC+r42KINbiHbKk/7n8a4L1PfD/Kf/JGvfjdydeO
         7mWXA6V6WMes2a/jAN5PKdyeGl5EyV9+OM56Q2EZUX2dTOZ9ciBITujqzD7XACDXfVFQ
         yU8Vqch54posOGk/D9Erjf1iGybW7lhRHEd2vJ9CBxd15zY+T+t9R0mbfWTtWP7evVy5
         A4c9lnEPed3UY7qzDVq357Raq4tqXX54W7iDHWcsi1gk+iL8as2kTSdIqtFfI0amR5Fz
         yEB9aqGyDwvwXXINx5sVmRZBlwGl92QLycCnTvT90RTBiUfdgLF+pp2tzcBzN1tyz7be
         5uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204923; x=1746809723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpV4n8xRX3P55h7I3F2IlS5CFZqJz8w7NcwBkpd0qeA=;
        b=LhREyNSshUM/c6+b5+FerMI+/3+g/NkijYCSAtAwTruYVvSfrtcgPhqLP1j6sz+9p9
         RCsakKKHxL5OegDlgHO/4dXLXTf7rHYHKKawlpTIrukUzVNS6jJzcBydAEcGyvF7t9M8
         aTtU3j5sWaA//7H8NT6qWMMhVihO5tG88GV6jUdhXuwbsrsYSCkA/366DxJF6kFBch5z
         2UGEdPskpT9zsovaY61DyoMKQMhLku0smVzC4Yws/N2bKLN125ZfpJ/Y0oysR/4G6kS9
         M71zbxL2blvE9UiJXG4kQchS+fgGaQ+gZ2MiIvSf5qdhrKi4N3nxcmyDAgaLKLMtcZpI
         CCkg==
X-Gm-Message-State: AOJu0YyLx/790gkmYFXwZ1+TU4yoK3SOBfItRKCdTqLq9lX08B0MtTDU
	WkmzIdDBLXx6/HnKL2nvA+Q7sDmEV9NGks/qFOtecDSbal3jOAjPfVgbU4D7
X-Gm-Gg: ASbGncspJpRjTEvLi1iuJRdnNV9YwXJuz1KqRQ9gmMa80N5EeduJHzLDZSsJBuMG6eL
	JhjQEdsJShtjOp8R35y2spn89elinMv5+rbnMVG1/xOXK+hGtbXhUpRRGznSXBMuQ5tDhPb0Rut
	DDDRoQBO+dhOztQEktENeVU1Jmpznzlz6cLVNLFHyDFBTzoFzswhunchQhYOynZ7otsSc66r1pM
	RIAxNRVEON8itK98TA3s+BzYTG7Gl9VHh7VGRuWavfOF+5fPRI54+gYwCnqFmJ/oRBJNktBOS+a
	73jD2lB/mf1MeN4oBYldZ+Rl4y8KbPJD
X-Google-Smtp-Source: AGHT+IHFLSTUXwxnD98GxpeIymeMhkMpejlz6czI9oP/x48nfpdrmsVBgwZfMbz+19yhbM8GUc4MnA==
X-Received: by 2002:a17:90b:2641:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-30a4e68887cmr6439057a91.33.1746204923032;
        Fri, 02 May 2025 09:55:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 May 2025 09:55:18 -0700
Subject: [PATCH v6 4/6] mesa: Fix header search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-clang-merge-v6-4-00f2c2e9ff68@gmail.com>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
In-Reply-To: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215915

mesa build currently emits CLANG_RESOURCE_DIR into compiled objects and
meson calculates it from llvm cmake files from sysroot and it points to
absolute paths in target sysroot. To fix this backport a patch that does
not rely on CLANG_RESOURCE_DIR, however, this patch still leaves it in
code as fallback via FALLBACK_CLANG_RESOURCE_DIR, we are on LLVM 20.x
which will not use this variable, lets just remove detection so it does
not encode hardcoded paths.

Fixes

ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/libMesaOpenCL.so.1.0.0 in package libopencl-mesa contains reference to TMPDIR [buildpaths]
ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../0001-clover-Don-t-include-libclc-headers.patch | 143 +++++++++++++++++++++
 ...ver-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 +++++
 meta/recipes-graphics/mesa/mesa.inc                |   2 +
 3 files changed, 179 insertions(+)

diff --git a/meta/recipes-graphics/mesa/files/0001-clover-Don-t-include-libclc-headers.patch b/meta/recipes-graphics/mesa/files/0001-clover-Don-t-include-libclc-headers.patch
new file mode 100644
index 0000000000000000000000000000000000000000..0f9a01d823ed7d9a1a8ea5ccc6acac5314eafbe4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-clover-Don-t-include-libclc-headers.patch
@@ -0,0 +1,143 @@
+From e94da9ccbc099468df752227716880efef66411b Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npopov@redhat.com>
+Date: Thu, 27 Feb 2025 15:44:27 +0100
+Subject: [PATCH] clover: Don't include libclc headers
+
+Per https://github.com/llvm/llvm-project/issues/119967 these
+headers are internal implementation details of libclc and were
+never supposed to be installed. They are not available anymore
+since LLVM 20. Instead opencl-c.h should be used.
+
+There already ise a code path for including opencl-c.h, so always
+use it.
+
+This didn't work for me out of the box, because the build system
+currently hardcodes the clang resource directory, which is incorrect
+for Fedora at least. Fix this by using GetResourcePath +
+CLANG_RESOURCE_DIR provided by clang instead. This is basically
+the same as what is done in clc_helper.c
+
+I've still retained the old behavior as a fallback just in case
+(e.g. if clang is linked statically?)
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33805/]
+Reviewed-by: Karol Herbst <kherbst@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33805>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../frontends/clover/llvm/invocation.cpp      | 53 +++++++++++++------
+ src/gallium/frontends/clover/meson.build      |  5 +-
+ 2 files changed, 39 insertions(+), 19 deletions(-)
+
+diff --git a/src/gallium/frontends/clover/llvm/invocation.cpp b/src/gallium/frontends/clover/llvm/invocation.cpp
+index 3cbb05b..ca030b4 100644
+--- a/src/gallium/frontends/clover/llvm/invocation.cpp
++++ b/src/gallium/frontends/clover/llvm/invocation.cpp
+@@ -24,6 +24,8 @@
+ // OTHER DEALINGS IN THE SOFTWARE.
+ //
+ 
++#include <dlfcn.h>
++
+ #include <llvm/IR/DiagnosticPrinter.h>
+ #include <llvm/IR/DiagnosticInfo.h>
+ #include <llvm/IR/LLVMContext.h>
+@@ -39,6 +41,8 @@
+ #include <clang/Frontend/TextDiagnosticBuffer.h>
+ #include <clang/Frontend/TextDiagnosticPrinter.h>
+ #include <clang/Basic/TargetInfo.h>
++#include <clang/Config/config.h>
++#include <clang/Driver/Driver.h>
+ 
+ #if LLVM_VERSION_MAJOR >= 20
+ #include <llvm/Support/VirtualFileSystem.h>
+@@ -323,6 +327,30 @@ namespace {
+       return c;
+    }
+ 
++   std::string getResourceDirectory() {
++      Dl_info info;
++      if (dladdr((void *)clang::CompilerInvocation::CreateFromArgs, &info) == 0) {
++         return FALLBACK_CLANG_RESOURCE_DIR;
++      }
++
++      char *libclang_path = realpath(info.dli_fname, NULL);
++      if (libclang_path == nullptr) {
++         return FALLBACK_CLANG_RESOURCE_DIR;
++      }
++
++      // GetResourcePath is a way to retrieve the actual libclang resource dir based on a given
++      // binary or library.
++      std::string clang_resource_dir =
++#if LLVM_VERSION_MAJOR >= 20
++         clang::driver::Driver::GetResourcesPath(std::string(libclang_path));
++#else
++         clang::driver::Driver::GetResourcesPath(std::string(libclang_path), CLANG_RESOURCE_DIR);
++#endif
++      free(libclang_path);
++
++      return clang_resource_dir;
++   }
++
+    std::unique_ptr<Module>
+    compile(LLVMContext &ctx, clang::CompilerInstance &c,
+            const std::string &name, const std::string &source,
+@@ -331,25 +359,18 @@ namespace {
+       c.getFrontendOpts().ProgramAction = clang::frontend::EmitLLVMOnly;
+       c.getHeaderSearchOpts().UseBuiltinIncludes = true;
+       c.getHeaderSearchOpts().UseStandardSystemIncludes = true;
+-      c.getHeaderSearchOpts().ResourceDir = CLANG_RESOURCE_DIR;
+ 
+-      if (use_libclc) {
+-         // Add libclc generic search path
+-         c.getHeaderSearchOpts().AddPath(LIBCLC_INCLUDEDIR,
+-                                         clang::frontend::Angled,
+-                                         false, false);
++      std::string clang_resource_dir = getResourceDirectory();
++      c.getHeaderSearchOpts().ResourceDir = clang_resource_dir;
+ 
+-         // Add libclc include
+-         c.getPreprocessorOpts().Includes.push_back("clc/clc.h");
+-      } else {
+-         // Add opencl-c generic search path
+-         c.getHeaderSearchOpts().AddPath(CLANG_RESOURCE_DIR,
+-                                         clang::frontend::Angled,
+-                                         false, false);
++      // Add opencl-c generic search path
++      std::string clang_include_path = clang_resource_dir + "/include";
++      c.getHeaderSearchOpts().AddPath(clang_include_path,
++                                      clang::frontend::Angled,
++                                      false, false);
+ 
+-         // Add opencl include
+-         c.getPreprocessorOpts().Includes.push_back("opencl-c.h");
+-      }
++      // Add opencl include
++      c.getPreprocessorOpts().Includes.push_back("opencl-c.h");
+ 
+       // Add definition for the OpenCL version
+       const auto dev_version = dev.device_version();
+diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/frontends/clover/meson.build
+index e569b86..56a9894 100644
+--- a/src/gallium/frontends/clover/meson.build
++++ b/src/gallium/frontends/clover/meson.build
+@@ -10,7 +10,6 @@ clover_opencl_cpp_args = [
+   '-DCL_USE_DEPRECATED_OPENCL_2_0_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_2_1_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_2_2_APIS',
+-  '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'includedir')),
+   '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'libexecdir'))
+ ]
+ clover_incs = [inc_include, inc_src, inc_gallium, inc_gallium_aux]
+@@ -43,9 +42,9 @@ libclllvm = static_library(
+   cpp_args : [
+     clover_cpp_args,
+     clover_opencl_cpp_args,
+-    '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
++    '-DFALLBACK_CLANG_RESOURCE_DIR="@0@"'.format(join_paths(
+       dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'libdir'), 'clang',
+-      dep_llvm.version(), 'include',
++      dep_llvm.version()
+     )),
+   ],
+   gnu_symbol_visibility : 'hidden',
diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch b/meta/recipes-graphics/mesa/files/0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch
new file mode 100644
index 0000000000000000000000000000000000000000..8b2ce2f63b3abba293f735a32e2ac4b976aeb402
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch
@@ -0,0 +1,34 @@
+From 5ea5c5d48e049d7b10b7ffb814e84e3ddef7fff9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Apr 2025 19:00:14 -0700
+Subject: [PATCH] gallium/clover: Do not use LLVM_LIBRARY_DIR for
+ FALLBACK_CLANG_RESOURCE_DIR
+
+This option -DFALLBACK_CLANG_RESOURCE_DIR is synthesized by meson from
+LLVM_LIBRARY_DIR which is resolved to absolute path under <recipe_sysroot>
+and its used in clover front-end as string in .c files, which encodes it
+into binary as string and shows up in yocto QA error.
+
+ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/libMesaOpenCL.so.1.0.0 in package libopencl-mesa contains reference to TMPDIR [buildpaths]
+ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.
+ERROR: Logfile of failure stored in: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/temp/log.do_package_qa.974870
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gallium/frontends/clover/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/frontends/clover/meson.build
+index 56a9894..32c21d6 100644
+--- a/src/gallium/frontends/clover/meson.build
++++ b/src/gallium/frontends/clover/meson.build
+@@ -43,7 +43,7 @@ libclllvm = static_library(
+     clover_cpp_args,
+     clover_opencl_cpp_args,
+     '-DFALLBACK_CLANG_RESOURCE_DIR="@0@"'.format(join_paths(
+-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'libdir'), 'clang',
++     '/usr/lib/clang',
+       dep_llvm.version()
+     )),
+   ],
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c477b774628eb49dacae8b64244d3e98bfcc2588..49b3de1ba796c9b729f5353414261396ed45d8a5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
            file://0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch \
+           file://0001-clover-Don-t-include-libclc-headers.patch \
+           file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch \
 "
 
 SRC_URI[sha256sum] = "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6d4c45638627fdc97"

-- 
2.49.0


