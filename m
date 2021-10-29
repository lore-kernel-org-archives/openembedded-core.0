Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC99DC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 06:25:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.2011.1635488718200824104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 23:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T6GqCLOb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id i5so6824081wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNjts4zR423fU50K5vIUroDkMFtWAiUiOUOpdngaU1A=;
        b=T6GqCLObIQGB7tMrNfc0sPKJXgDKCBld+5giAJ1P0Izis1X8b74NiB6bacU+XXS8zy
         E88KANpXk64JHlYGpEu8I6kz1C0DGrpMK2vA5g+FUZshjjJILfSqo6fyKlfBVNc9tBUo
         OCRqnzb2mHCFnTbcc1QgkF+JNk/uuGO4/K/Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNjts4zR423fU50K5vIUroDkMFtWAiUiOUOpdngaU1A=;
        b=zeDRrrXapgSOTGjTbnihBIp8+mcBV/FcXqwqWs6msjS2z3nCimZxkpyro9OsCFPU0u
         FkLWtaZH9Mt8iw0F1umbcirf+w5/FWMWDjJJzXDjzplUnWxs6S5yze3JaKlBGPhIRsrA
         66LCcRcpIaXl3l0zKACXh7Ej6En9++0h1wZ1giZpE0oYfjp1hQotAg8ryR1yCtN80TUX
         s0FWGtjI1SqvW2M5rk+MdfbzkEiyW8nAjbSZqYJaPm8c1YRTV6J+Djo2sg3JBfbaXbtX
         ValXb1RglLkzp/NKbO4gtENrIJNtSOdjIBuMa3446qMAfF6KvazN5Aw+kf+QeEPbYqRy
         3kCg==
X-Gm-Message-State: AOAM531EwPc/ZYQB+SvYGZo3Vz0RUfMKnr4SyHUEuQ7q3G/U24ofRnuQ
	p3G0GjMmsDk3y9jQOfw8JGQR7D3jXdBrSQ==
X-Google-Smtp-Source: 
 ABdhPJx69O6mXgBXk2H14C3HedjW3pI3UakxLqnvFp/1OW/aeQSJN3l4t9mpeyg49QhrzhgjQ43RBw==
X-Received: by 2002:a5d:6d51:: with SMTP id
 k17mr11677743wri.233.1635488715416;
        Thu, 28 Oct 2021 23:25:15 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 o194sm8911600wme.40.2021.10.28.23.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 23:25:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc: Update patches submitted/merged upstream
Date: Fri, 29 Oct 2021 07:25:14 +0100
Message-Id: <20211029062514.3410285-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 06:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157621

I took 5 of our patches and submitted to upstream gcc. This highlighted that
patches 0026 and 0018 should be merged together and some tweaks were made to
try and make it acceptable to upstream. The other patches have their headers
updated to match what was submitted.

The libstdc++ option patch was also cleaned up ready for upstream as the
documentation wasn't quite right.

The CXXFLAGS_FOR_BUILD piece of 0026 is separated out into a new patch which
can be submitted separately to upstream.

Two of the patches have been merged, status updated accordinly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   2 +-
 .../gcc/gcc/0005-optional-libstdc.patch       | 120 +++++-----
 ...ains-something-unsupported-by-the-bu.patch |  61 +++++
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  56 +++--
 ...gcc-Fix-argument-list-too-long-error.patch |  43 ++--
 .../gcc/gcc/0018-export-CPP.patch             | 225 +++++++++++++++---
 ...ous-_FOR_BUILD-and-related-variables.patch | 134 -----------
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  28 ++-
 8 files changed, 374 insertions(+), 295 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 23dfea2319e..8c54fe43df8 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -51,7 +51,6 @@ SRC_URI = "\
            file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
            file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
            file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0026-Fix-various-_FOR_BUILD-and-related-variables.patch \
            file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
            file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
            file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
@@ -64,6 +63,7 @@ SRC_URI = "\
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
+           file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
index c921ac3340c..b856c5dea36 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -1,34 +1,54 @@
-From 57e2c5e35732988c0b287289eb0997b4e9769371 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH] optional libstdc
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 3/5] gcc: Add --nostdlib++ option
 
-gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
+[gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
 will not run correctly since by default the linker will try to link against libstdc++
 which shouldn't exist yet. We need an option to disable -lstdc++
 option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
-driver. This patch adds such an option which only disables the -lstdc++.
+driver. This patch adds such an option which only disables the -lstdc++.]
 
-A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
-do this officially, the likely answer is don't build libstdc++ separately.
+[A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
+do this officially, the likely answer is don't build libstdc++ separately.]
 
-RP 29/6/10
+OpenEmbedded/Yocto Project builds libgcc and the other gcc runtime libraries
+separately from the compiler and slightly differently to the standard gcc build.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+In general this works well but in trying to build them separately we run into
+an issue since we're using our gcc, not xgcc and there is no way to tell configure
+to use libgcc but not look for libstdc++.
 
-Upstream-Status: Inappropriate [embedded specific]
+This adds such an option allowing such configurations to work.
+
+2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
+
+gcc/c-family/ChangeLog:
+
+    * c.opt: Add --nostdlib++ option
+
+gcc/cp/ChangeLog:
+
+    * g++spec.c (lang_specific_driver): Add --nostdlib++ option
+
+gcc/ChangeLog:
+
+    * doc/invoke.texi: Document --nostdlib++ option
+    * gcc.c: Add --nostdlib++ option
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582724.html]
 ---
- gcc/c-family/c.opt  |  4 ++++
- gcc/cp/g++spec.c    |  1 +
- gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
- gcc/gcc.c           |  1 +
- 4 files changed, 37 insertions(+), 1 deletion(-)
+ gcc/c-family/c.opt  | 4 ++++
+ gcc/cp/g++spec.c    | 1 +
+ gcc/doc/invoke.texi | 8 +++++++-
+ gcc/gcc.c           | 1 +
+ 4 files changed, 13 insertions(+), 1 deletion(-)
 
-diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 64e46e7573e..1824380f27a 100644
---- a/gcc/c-family/c.opt
-+++ b/gcc/c-family/c.opt
-@@ -2166,6 +2166,10 @@ nostdinc++
+Index: gcc-11.2.0/gcc/c-family/c.opt
+===================================================================
+--- gcc-11.2.0.orig/gcc/c-family/c.opt
++++ gcc-11.2.0/gcc/c-family/c.opt
+@@ -2153,6 +2153,10 @@ nostdinc++
  C++ ObjC++
  Do not search standard system include directories for C++.
  
@@ -39,11 +59,11 @@ index 64e46e7573e..1824380f27a 100644
  o
  C ObjC C++ ObjC++ Joined Separate
  ; Documented in common.opt
-diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
-index 3c9bd1490b4..818beb61cee 100644
---- a/gcc/cp/g++spec.c
-+++ b/gcc/cp/g++spec.c
-@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
+Index: gcc-11.2.0/gcc/cp/g++spec.c
+===================================================================
+--- gcc-11.2.0.orig/gcc/cp/g++spec.c
++++ gcc-11.2.0/gcc/cp/g++spec.c
+@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_
        switch (decoded_options[i].opt_index)
  	{
  	case OPT_nostdlib:
@@ -51,21 +71,19 @@ index 3c9bd1490b4..818beb61cee 100644
  	case OPT_nodefaultlibs:
  	  library = -1;
  	  break;
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 6659a903bf0..9ee63dbe52f 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -239,6 +239,9 @@ in the following sections.
+Index: gcc-11.2.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-11.2.0.orig/gcc/doc/invoke.texi
++++ gcc-11.2.0/gcc/doc/invoke.texi
+@@ -239,6 +239,7 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
-+-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
-+-fvtv-counts -fvtv-debug @gol
 +-nostdlib++ @gol
  -fext-numeric-literals @gol
  -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
  -flang-info-include-translate-not @gol
-@@ -632,7 +635,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -632,7 +633,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +92,7 @@ index 6659a903bf0..9ee63dbe52f 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -15708,6 +15711,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -15721,6 +15722,11 @@ Specify that the program entry point is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -82,37 +100,15 @@ index 6659a903bf0..9ee63dbe52f 100644
 +@opindex nostdlib++
 +Do not use the standard system C++ runtime libraries when linking.
 +Only the libraries you specify will be passed to the linker.
-+
-+@cindex @option{-lgcc}, use with @option{-nostdlib}
-+@cindex @option{-nostdlib} and unresolved references
-+@cindex unresolved references and @option{-nostdlib}
-+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
-+@cindex @option{-nodefaultlibs} and unresolved references
-+@cindex unresolved references and @option{-nodefaultlibs}
-+One of the standard libraries bypassed by @option{-nostdlib} and
-+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
-+which GCC uses to overcome shortcomings of particular machines, or special
-+needs for some languages.
-+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
-+Collection (GCC) Internals},
-+for more discussion of @file{libgcc.a}.)
-+In most cases, you need @file{libgcc.a} even when you want to avoid
-+other standard libraries.  In other words, when you specify @option{-nostdlib}
-+or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
-+This ensures that you have no unresolved references to internal GCC
-+library subroutines.
-+(An example of such an internal subroutine is @code{__main}, used to ensure C++
-+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
-+GNU Compiler Collection (GCC) Internals}.)
 +
  @item -pie
  @opindex pie
  Produce a dynamically linked position independent executable on targets
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 19c75b6e20d..be7630ffd8c 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1162,6 +1162,7 @@ proper position among the other output files.  */
+Index: gcc-11.2.0/gcc/gcc.c
+===================================================================
+--- gcc-11.2.0.orig/gcc/gcc.c
++++ gcc-11.2.0/gcc/gcc.c
+@@ -1162,6 +1162,7 @@ proper position among the other output f
      %(mflib) " STACK_SPLIT_SPEC "\
      %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
      %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
diff --git a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch b/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
new file mode 100644
index 00000000000..6b1833ee794
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
@@ -0,0 +1,61 @@
+From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 28 Oct 2021 11:33:40 +0100
+Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by the build
+ CXX, we see build failures (e.g. using -fmacro-prefix-map for the target).
+
+Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
+
+2021-10-28 Richard Purdie <richard.purdie@linuxfoundation.org>
+
+ChangeLog:
+
+    * Makefile.in: Regenerate.
+    * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ Makefile.in  | 2 ++
+ Makefile.tpl | 2 ++
+ 2 files changed, 4 insertions(+)
+
+Index: gcc-11.2.0/Makefile.in
+===================================================================
+--- gcc-11.2.0.orig/Makefile.in
++++ gcc-11.2.0/Makefile.in
+@@ -172,6 +172,7 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -203,6 +204,7 @@ HOST_EXPORTS = \
+ 	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
+ 	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
+ 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
++	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
+ 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	LD="$(LD)"; export LD; \
+ 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
+Index: gcc-11.2.0/Makefile.tpl
+===================================================================
+--- gcc-11.2.0.orig/Makefile.tpl
++++ gcc-11.2.0/Makefile.tpl
+@@ -175,6 +175,7 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -206,6 +207,7 @@ HOST_EXPORTS = \
+ 	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
+ 	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
+ 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
++	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
+ 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	LD="$(LD)"; export LD; \
+ 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
index c720defa358..37f26f0728b 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
@@ -1,35 +1,41 @@
-From 33a7a55d39c040ba09af2d69f7fa9cf8e6f84c91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH] cpp: honor sysroot.
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocessed source
 
-Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
-preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
-rather than the --sysroot option specified on the commandline. If access to that directory is
-permission denied (unreadable), gcc will error.
+OpenEmbedded/Yocto Project extensively uses the --sysroot support within gcc.
+We discovered that when compiling preprocessed source (.i or .ii files), the
+compiler will try and access the builtin sysroot location rather than the
+--sysroot option specified on the commandline. If access to that directory is
+permission denied (unreadable), gcc will error. This is particularly problematic
+when ccache is involved.
 
-This happens when ccache is in use due to the fact it uses preprocessed source files.
+This patch adds %I to the cpp-output spec macro so the default substitutions for
+-iprefix, -isystem, -isysroot happen and the correct sysroot is used.
 
-The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
--isystem, -isysroot happen and the correct sysroot is used.
+2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
 
-[YOCTO #2074]
+gcc/cp/ChangeLog:
+
+    * lang-specs.h: Pass sysroot options to cpp for preprocessed source
+
+gcc/ChangeLog:
 
-RP 2012/04/13
+    * gcc.c: Pass sysroot options to cpp for preprocessed source
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+[YOCTO #2074]
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
 ---
  gcc/cp/lang-specs.h | 2 +-
  gcc/gcc.c           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index 8902ae1d2ed..e99e2fcd6ad 100644
---- a/gcc/cp/lang-specs.h
-+++ b/gcc/cp/lang-specs.h
-@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-11.2.0/gcc/cp/lang-specs.h
+===================================================================
+--- gcc-11.2.0.orig/gcc/cp/lang-specs.h
++++ gcc-11.2.0/gcc/cp/lang-specs.h
+@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.
    {".ii", "@c++-cpp-output", 0, 0, 0},
    {"@c++-cpp-output",
        "%{!E:%{!M:%{!MM:"
@@ -38,11 +44,11 @@ index 8902ae1d2ed..e99e2fcd6ad 100644
        "  %{!fsyntax-only:"
        "    %{fmodule-only:%{!S:-o %g.s%V}}"
        "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 1bc45285384..8737bae5353 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1470,7 +1470,7 @@ static const struct compiler default_compilers[] =
+Index: gcc-11.2.0/gcc/gcc.c
+===================================================================
+--- gcc-11.2.0.orig/gcc/gcc.c
++++ gcc-11.2.0/gcc/gcc.c
+@@ -1470,7 +1470,7 @@ static const struct compiler default_com
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index 814ce18b984..6b6925735d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,37 +1,32 @@
-From 12646c0899dec1b127ce71ebacf2571c1c7360f4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH] gcc: Fix argument list too long error.
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 2/5] gcc: Fix "argument list too long" from install-plugins
 
-There would be an "Argument list too long" error when the
-build directory is longer than 200, this is caused by:
+When building in longer build paths (200+ characters), the
+"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
+"argument list too long error" on some systems.
 
-headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+Avoid this by calling make's sort function on the list which removes
+duplicates and stops the overflow from reaching the echo command.
+The original sort is left to handle the the .h and .def files.
 
-The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
-it, use the $(sort list) of GNU make which can handle the too long list
-would fix the problem, the header would be short enough after sorted.
-The "tr ' ' '\012'" was used for translating the space to "\n", the
-$(sort list) doesn't need this.
+2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+gcc/ChangeLog:
 
-RP: gcc then added *.h and *.def additions to this list, breaking the original
-fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
-issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+    * Makefile.in: Fix "argument list too long" from install-plugins
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
 ---
  gcc/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 7da6f439fff..59c45c81393 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+Index: gcc-11.2.0/gcc/Makefile.in
+===================================================================
+--- gcc-11.2.0.orig/gcc/Makefile.in
++++ gcc-11.2.0/gcc/Makefile.in
+@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
  # We keep the directory structure for files in config, common/config or
  # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
index e6596da5c7d..86ab6574c7b 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
@@ -1,50 +1,199 @@
-From b6e229a13aebfbb3fe38c216fd51b68bf71cfa9c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH] export CPP
-
-The OE environment sets and exports CPP as being the target gcc. When
-building gcc-cross-canadian for a mingw targetted sdk, the following can be found
-in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
-
-configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
-configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
-configure:3666: $? = 0
-configure:3698: result: no
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for build targets
+
+During cross compiling, CPP is being set to the target compiler even for
+build targets. As an example, when building a cross compiler targetting
+mingw, the config.log for libiberty in
+build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log
+shows:
+
 configure:3786: checking how to run the C preprocessor
-configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
-configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
+configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=[sysroot]/x86_64-nativesdk-mingw32-pokysdk-mingw32
+configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=[sysroot]/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
 configure:3876: $? = 0
 
-Note this is a *build* target (in build-x86_64-linux) so it should be
-using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
-headers are very different, using the wrong cpp is a real problem. It is leaking
-into configure through the CPP variable. Ultimately this leads to build
-failures related to not being able to include a process.h file for pem-unix.c.
+This is libiberty being built for the build environment, not the target one
+(i.e. in build-x86_64-linux). As such it should be using the build environment's
+gcc and not the target one. In the mingw case the system headers are quite
+different leading to build failures related to not being able to include a
+process.h file for pem-unix.c.
+
+Further analysis shows the same issue occuring for CPPFLAGS too.
+
+Fix this by adding support for CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD which
+for example, avoids mixing the mingw headers for host binaries on linux
+systems.
+
+2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
+
+ChangeLog:
 
-The fix is to ensure we export a sane CPP value into the build
-environment when using build targets. We could define a CPP_FOR_BUILD value which may be
-the version which needs to be upstreamed but for now, this fix is good enough to
-avoid the problem.
+    * Makefile.tpl: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
+    * Makefile.in: Regenerate.
+    * configure: Regenerate.
+    * configure.ac: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
 
-RP 22/08/2013
+gcc/ChangeLog:
 
-Upstream-Status: Pending
+    * configure: Regenerate.
+    * configure.ac: Use CPPFLAGS_FOR_BUILD for GMPINC
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727.html]
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=84401ce5fb4ecab55decb472b168100e7593e01f]
 ---
- Makefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 047be0255e2..af19589fa95 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -149,6 +149,7 @@ BUILD_EXPORTS = \
- 	AR="$(AR_FOR_BUILD)"; export AR; \
- 	AS="$(AS_FOR_BUILD)"; export AS; \
+ Makefile.in      | 6 ++++++
+ Makefile.tpl     | 6 ++++++
+ configure        | 4 ++++
+ configure.ac     | 4 ++++
+ gcc/configure    | 2 +-
+ gcc/configure.ac | 2 +-
+ 6 files changed, 22 insertions(+), 2 deletions(-)
+
+Index: gcc-11.2.0/Makefile.in
+===================================================================
+--- gcc-11.2.0.orig/Makefile.in
++++ gcc-11.2.0/Makefile.in
+@@ -151,6 +151,8 @@ BUILD_EXPORTS = \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPP="$(CPP_FOR_BUILD)"; export CPP; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -198,6 +200,8 @@ HOST_EXPORTS = \
+ 	AR="$(AR)"; export AR; \
+ 	AS="$(AS)"; export AS; \
+ 	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
++	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
++	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
+ 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
+ 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	LD="$(LD)"; export LD; \
+@@ -353,6 +357,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPP_FOR_BUILD = @CPP_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+Index: gcc-11.2.0/Makefile.tpl
+===================================================================
+--- gcc-11.2.0.orig/Makefile.tpl
++++ gcc-11.2.0/Makefile.tpl
+@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
  	CC="$(CC_FOR_BUILD)"; export CC; \
-+	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPP="$(CPP_FOR_BUILD)"; export CPP; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -201,6 +203,8 @@ HOST_EXPORTS = \
+ 	AR="$(AR)"; export AR; \
+ 	AS="$(AS)"; export AS; \
+ 	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
++	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
++	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
+ 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
+ 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	LD="$(LD)"; export LD; \
+@@ -356,6 +360,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPP_FOR_BUILD = @CPP_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+Index: gcc-11.2.0/configure
+===================================================================
+--- gcc-11.2.0.orig/configure
++++ gcc-11.2.0/configure
+@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
+ DLLTOOL_FOR_BUILD
+ CXX_FOR_BUILD
+ CXXFLAGS_FOR_BUILD
++CPPFLAGS_FOR_BUILD
++CPP_FOR_BUILD
+ CFLAGS_FOR_BUILD
+ CC_FOR_BUILD
+ AS_FOR_BUILD
+@@ -4092,6 +4094,7 @@ if test "${build}" != "${host}" ; then
+   AR_FOR_BUILD=${AR_FOR_BUILD-ar}
+   AS_FOR_BUILD=${AS_FOR_BUILD-as}
+   CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
++  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
+   CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
+   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
+@@ -9809,6 +9812,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+Index: gcc-11.2.0/configure.ac
+===================================================================
+--- gcc-11.2.0.orig/configure.ac
++++ gcc-11.2.0/configure.ac
+@@ -1347,6 +1347,7 @@ if test "${build}" != "${host}" ; then
+   AR_FOR_BUILD=${AR_FOR_BUILD-ar}
+   AS_FOR_BUILD=${AS_FOR_BUILD-as}
+   CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
++  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
+   CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
+   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
+@@ -3321,6 +3322,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
+ AC_SUBST(AS_FOR_BUILD)
+ AC_SUBST(CC_FOR_BUILD)
+ AC_SUBST(CFLAGS_FOR_BUILD)
++AC_SUBST(CPP_FOR_BUILD)
++AC_SUBST(CPPFLAGS_FOR_BUILD)
+ AC_SUBST(CXXFLAGS_FOR_BUILD)
+ AC_SUBST(CXX_FOR_BUILD)
+ AC_SUBST(DLLTOOL_FOR_BUILD)
+Index: gcc-11.2.0/gcc/configure
+===================================================================
+--- gcc-11.2.0.orig/gcc/configure
++++ gcc-11.2.0/gcc/configure
+@@ -12699,7 +12699,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
+Index: gcc-11.2.0/gcc/configure.ac
+===================================================================
+--- gcc-11.2.0.orig/gcc/configure.ac
++++ gcc-11.2.0/gcc/configure.ac
+@@ -2023,7 +2023,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
deleted file mode 100644
index c2698f9eebd..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From cd5db101e3c4e72248f988a67ce28be8e24f66d4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:42:45 +0000
-Subject: [PATCH] Fix various _FOR_BUILD and related variables
-
-When doing a FOR_BUILD thing, you have to override CFLAGS with
-CFLAGS_FOR_BUILD. And if you use C++, you also have to override
-CXXFLAGS with CXXFLAGS_FOR_BUILD.
-Without this, when building for mingw, you end up trying to use
-the mingw headers for a host build.
-
-The same goes for other variables as well, such as CPPFLAGS,
-CPP, and GMPINC.
-
-Upstream-Status: Pending
-
-Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in      | 6 ++++++
- Makefile.tpl     | 5 +++++
- gcc/Makefile.in  | 2 +-
- gcc/configure    | 2 +-
- gcc/configure.ac | 2 +-
- 5 files changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index af19589fa95..d0116a23e1a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
- 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -171,6 +172,9 @@ BUILD_EXPORTS = \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
-+	CPP="$(CC_FOR_BUILD) -E" \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
-@@ -188,6 +192,7 @@ HOST_SUBDIR = @host_subdir@
- HOST_EXPORTS = \
- 	$(BASE_EXPORTS) \
- 	CC="$(CC)"; export CC; \
-+	CPP="$(CC) -E"; export CPP; \
- 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
- 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-@@ -776,6 +781,7 @@ BASE_FLAGS_TO_PASS = \
- 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
- 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
- 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
-+	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
- 	"EXPECT=$(EXPECT)" \
- 	"FLEX=$(FLEX)" \
- 	"INSTALL=$(INSTALL)" \
-diff --git a/Makefile.tpl b/Makefile.tpl
-index 6e0337fb48f..4fcac93d3d8 100644
---- a/Makefile.tpl
-+++ b/Makefile.tpl
-@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
- 	CC="$(CC_FOR_BUILD)"; export CC; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -173,6 +174,9 @@ BUILD_EXPORTS = \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
-+	CPP="$(CC_FOR_BUILD) -E" \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
-@@ -190,6 +194,7 @@ HOST_SUBDIR = @host_subdir@
- HOST_EXPORTS = \
- 	$(BASE_EXPORTS) \
- 	CC="$(CC)"; export CC; \
-+	CPP="$(CC) -E"; export CPP; \
- 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
- 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 9b17d120aa1..3053d05903c 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -820,7 +820,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
- BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
- BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
- BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
--		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
-+		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
- 
- # Actual name to use when installing a native compiler.
- GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
-diff --git a/gcc/configure b/gcc/configure
-index e663052cad2..b0906aa3e96 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -12699,7 +12699,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 2b84875b028..bfbd8946e8a 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -2023,7 +2023,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 2e65740ec0d..97c271373bd 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,20 +1,26 @@
-From 9bbce1b5a10caf636eee137e5a229e5434a6c8f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
 
-Upstream-Status: Pending
+Add a definition of the musl linker used on the nios2 platform.
 
-Signed-off-by: Marek Vasut <marex@denx.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
+
+gcc/ChangeLog:
+
+    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723.html]
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
 ---
  gcc/config/nios2/linux.h | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 08edf1521f6..15696d86241 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
+Index: gcc-11.2.0/gcc/config/nios2/linux.h
+===================================================================
+--- gcc-11.2.0.orig/gcc/config/nios2/linux.h
++++ gcc-11.2.0/gcc/config/nios2/linux.h
 @@ -30,6 +30,7 @@
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
  
-- 
2.32.0


