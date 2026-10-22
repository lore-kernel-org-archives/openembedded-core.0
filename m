Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17044.1792650782567113978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 23:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bqb5qEch;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd76b1361dso10144185ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792650782; x=1793255582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6LkiTjXf77ygAYRHmUIQqCix9YK0tX5reP4E5MCyuc=;
        b=bqb5qEchQ6ReQRs+fOvhEGh2DQ+iRX3Ka1CmjCmT5fI0FOjaSj67Qc8ycuByvAsVQc
         Ioen7c3+C2/sOjnxqjF3e3Bc9J0ow/Lk46Hg9/hkgGB0UWlKtMh1b3XLrhhLoHY+4auh
         vj1EQzul7EjAMKplo5tEQx89NBh23ZQE6xPXgZq3mP2Jzr19XlqcnepJRYnMRfauJHsD
         UeUWjhavesRIDMpvzqOy6olzZ6eqYL4X/SImZadr9QhqzAMoL1AxD5nIy4GwTqDVw4Ak
         GgunrWM7kVcoUfJJCH2GpokV8ckLNbqve9g5B2CaGE0ZBGfNaU1KSENoZ+I/CXnVXHIe
         eDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650782; x=1793255582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6LkiTjXf77ygAYRHmUIQqCix9YK0tX5reP4E5MCyuc=;
        b=f4iLdMXCYrU3Yz7yce6+TfxUs+di+W4VxHSArC5ilRc/1XFcW3DIp4xnebxIyyW7n+
         Zf6P5taJqnAY1NV0+7xA/NtVUo2z8CpiI+96f3rrz9KKpaJRupM39u+LfxO2hIAa9LEe
         Uor27oOiZf5Ji0JE3kfWJOGLmGw9MWEFWCd5knw+mj8sdWWjFhPf7wMEACED7op6gPev
         jq3V5VQF87P7+LAJoFSh9fI25ekJCdy66kA740ZC3wMCyGSLcCU8oY26HrolP212U7qH
         LwA2vRlytolP4xr+asP67dFdHtddGI/q//y2PJpSWmyyE9hmfXwCiqAPq83Xf5Oib7o6
         fAew==
X-Gm-Message-State: AFq9FYI8oqN/LX3EU4KICcPXdfIEtLSaXdaK9fS5+/w8y/dadnIRpK4s
	mBUq/nLL5AvB4GipHNOKMgTp2J5ABejf098TX2H3F3HmrBM1c0TNT02EG4yYuA+aZMk=
X-Gm-Gg: AYBFou3cWkZz2HAxkcSUw3aYYILM7AlpwCh22ijbTFRIpowaYPjmE4OdYMLbjux+UO4
	zbq3DmVt0c75m64BX6yFl5GcX5LnId80Z4edBmdGIhz223SvCpWpwNjPE7zgIFziRfPBcGRzh9o
	hg/Wcmrr3oDWcJE4l+9zwl7vIQDsuEWm4KA1Ot5oY6/bUqgoYLjcp1gaFa+qkvlk2IGA2/7Q/z8
	M80fDJhrTk/QrzGpZxMBB89bf/HmUu+/CgsLMjqQewdtwKVvetiKBO3s7q3vkyYmZiQGoFnyAL/
	1NdGGNy2at9s7HxPQxj3GxPuSTDDVqp2nesqY+CI2C5/j5ivpHQ6th+GD642Xg7KgRjMM7yphl/
	XFNUneJCoiUuM84yiu1xaP0A+HgET+C+mQCDKGMvz1LAiGVxzDPH4GX61HWDSS3M1EfgdjIKoe1
	TRtLNCyMLFqAirskOuqJn+qO2UGxrohyR7l5B+n2isLHpoy3k0FznHez3iqH4IFLWkgJotoLnhh
	Qv/6v6CdB0y0ykVxsRaOVTUtVLn9xlz3LyBDMtRgfkwon+jFYJd8yq6f0hcuLsTuZN10ZERprmV
	pNxnWKSeVKf5oLXCDg0e3amn+iEcKu7KGqvBrKjT8/unZHglx4djI8/xqIj9dXhwdTZNQuXaQ0q
	YRJLRIu1sX8495zk12HKljLXRcZt6Xst/16Ns0q1Qs0is/z4XRHq+YkO+WRAzxZCzhm1dJNh6+5
	KJwA5c+LBfHk8C2Zqqve71Agae7sR1cRtblYZqdPwqR0KF9vyqvNpoTK7ZEUJpw4n7ZZF3dqBPi
	hfgwzcRlcI9U1fjh5tSKFkkoZVAGXI=
X-Received: by 2002:a17:903:a90:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2ea43dbbd51mr39512285ad.18.1792650781784;
        Wed, 21 Oct 2026 23:33:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435492sm19471765ad.33.2026.10.21.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:33:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] compiler-rt: Add option to provide libatomic instead of gcc-runtime
Date: Wed, 21 Oct 2026 23:32:58 -0700
Message-ID: <20261022063258.880903-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 06:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248422
Content-Type: text/plain; charset="utf-8"

Add LIBATOMIC_PROVIDER to select the recipe providing libatomic for the
target. It defaults to "gcc-runtime", which keeps the current behaviour.

With LIBATOMIC_PROVIDER = "compiler-rt"

- compiler-rt builds its standalone shared libatomic from atomic.c and
  installs it with the same layout as gcc-runtime: libatomic.so.1.2.0
  with soname libatomic.so.1, the libatomic.so.1 and libatomic.so
  symlinks, a libatomic.a archive, and the libatomic_asneeded.a and
  libatomic_asneeded.so files gcc 16 links by default. They go in the
  libatomic, libatomic-dev and libatomic-staticdev packages, so package
  names and runtime dependencies stay the same.
- gcc-runtime no longer builds or packages libatomic for the target.
- Recipes built with gcc also depend on compiler-rt, since gcc links
  -latomic_asneeded into every link.

The upstream standalone libatomic does not link as is, LLVM links
shared libraries with -z defs and compiler-rt uses -nodefaultlibs, but
the generic __atomic_* functions call memcpy/memcmp, so link with libc.
atomic.c has no constructors, so link it with -nostartfiles.

The shared library keeps one lock table per process for atomics that
are not lock free, e.g. 64-bit atomics on riscv32, as libatomic does.
The atomic builtins in the static libclang_rt.builtins archive would
instead give each executable and shared library its own hidden lock
table, which loses updates when they access the same object.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes/toolchain/gcc.bbclass            |  2 ++
 meta/conf/bitbake.conf                        |  2 ++
 .../recipes-devtools/clang/compiler-rt_git.bb | 28 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  9 +++---
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index 0ed49ba892..bb9215f47b 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -17,6 +17,8 @@ READELF = "${HOST_PREFIX}readelf"
 PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${MLPREFIX}compilerlibs = "${MLPREFIX}gcc-runtime"
+# libatomic, which gcc links by default, comes from compiler-rt in this case
+BASE_DEFAULT_DEPS:append:class-target = "${@' ${MLPREFIX}compiler-rt' if d.getVar('LIBATOMIC_PROVIDER') == 'compiler-rt' else ''}"
 
 PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${MLPREFIX}cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d353a7cd2c..fc6a991add 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -406,6 +406,8 @@ FILESYSTEM_PERMS_TABLES ?=  "files/fs-perms.txt \
 TCMODE ??= "default"
 TCLIBC ??= "glibc"
 TC_CXX_RUNTIME ??= "gnu"
+# Recipe providing libatomic for the target: "gcc-runtime" or "compiler-rt"
+LIBATOMIC_PROVIDER ??= "gcc-runtime"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index a265c2aa93..9fc9c0adef 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -35,7 +35,12 @@ RPROVIDES:${PN}-dev += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc-d
 RPROVIDES:${PN}-dbg += "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libgcc-dbg", "", d)}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "crt", "", d)}"
+PACKAGECONFIG:append:class-target = "${@' libatomic' if d.getVar('LIBATOMIC_PROVIDER') == 'compiler-rt' else ''}"
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
+PACKAGECONFIG[libatomic] = "-DCOMPILER_RT_BUILD_STANDALONE_LIBATOMIC=ON \
+                            -DCOMPILER_RT_LIBATOMIC_LINK_FLAGS=-nostartfiles \
+                            -DCOMPILER_RT_LIBATOMIC_LINK_LIBS_${COMPILER_RT_ARCH}=c, \
+                            -DCOMPILER_RT_BUILD_STANDALONE_LIBATOMIC=OFF,patchelf-native"
 PACKAGECONFIG[profile] = "-DCOMPILER_RT_BUILD_PROFILE=ON,-DCOMPILER_RT_BUILD_PROFILE=OFF"
 # Context Profiling, might need to enable 'profile' too
 PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_BUILD_CTX_PROFILE=OFF"
@@ -57,6 +62,8 @@ def get_compiler_rt_arch(bb, d):
         return 'armhf'
     return d.getVar('HOST_ARCH')
 
+COMPILER_RT_ARCH = "${@get_compiler_rt_arch(bb, d)}"
+
 INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
@@ -115,8 +122,29 @@ do_install:append () {
         ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtend-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtend.o
         ln -sf clang/${INSTALL_VER}/lib/linux/clang_rt.crtend-${@get_compiler_rt_arch(bb, d)}.o ${D}${nonarch_libdir}/crtendS.o
     fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libatomic', 'true', 'false', d)}; then
+        # Install libatomic with the same names and layout as gcc-runtime
+        install -d ${D}${libdir}
+        mv ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.atomic-${COMPILER_RT_ARCH}.so \
+           ${D}${libdir}/libatomic.so.1.2.0
+        patchelf --set-soname libatomic.so.1 ${D}${libdir}/libatomic.so.1.2.0
+        ln -sf libatomic.so.1.2.0 ${D}${libdir}/libatomic.so.1
+        ln -sf libatomic.so.1.2.0 ${D}${libdir}/libatomic.so
+        ${AR} rcs ${D}${libdir}/libatomic.a \
+            ${B}/compiler-rt/lib/builtins/CMakeFiles/clang_rt.atomic*-${COMPILER_RT_ARCH}.dir/atomic.c.o
+        ln -sf libatomic.a ${D}${libdir}/libatomic_asneeded.a
+        # gcc links -latomic_asneeded by default
+        printf '/* GNU ld script\n   Add DT_NEEDED entry for -latomic only if needed.  */\nINPUT ( AS_NEEDED ( -latomic ) )\n' \
+            > ${D}${libdir}/libatomic_asneeded.so
+    fi
 }
 
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'libatomic', 'libatomic libatomic-dev libatomic-staticdev', '', d)}"
+SUMMARY:libatomic = "C11/C++11 atomics support library from compiler-rt"
+FILES:libatomic = "${libdir}/libatomic.so.*"
+FILES:libatomic-dev = "${libdir}/libatomic.so ${libdir}/libatomic_asneeded.so"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a ${libdir}/libatomic_asneeded.a"
+
 FILES:${PN} += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/lib*${SOLIBSDEV} \
                 ${nonarch_libdir}/clang/${INSTALL_VER}/*.txt \
                 ${nonarch_libdir}/clang/${INSTALL_VER}/share/*.txt \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 626bf955f8..aabb899324 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -47,7 +47,10 @@ RUNTIMELIBITM:loongarch64 = ""
 RUNTIMELIBSSP ?= ""
 RUNTIMELIBSSP:mingw32 ?= "libssp"
 
-RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
+# compiler-rt can provide libatomic for the target instead
+RUNTIMELIBATOMIC = "${@'' if d.getVar('LIBATOMIC_PROVIDER') == 'compiler-rt' else 'libatomic'}"
+RUNTIMELIBATOMIC:class-nativesdk = "libatomic"
+RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp ${RUNTIMELIBATOMIC} ${RUNTIMELIBITM} \
     ${@bb.utils.contains('FORTRAN', ',fortran', 'libquadmath', '', d)} \
 "
 # Only build libstdc++ for newlib
@@ -193,9 +196,7 @@ PACKAGES = "\
     libgomp \
     libgomp-dev \
     libgomp-staticdev \
-    libatomic \
-    libatomic-dev \
-    libatomic-staticdev \
+    ${@'${RUNTIMELIBATOMIC} ${RUNTIMELIBATOMIC}-dev ${RUNTIMELIBATOMIC}-staticdev' if d.getVar('RUNTIMELIBATOMIC') else ''} \
     libitm \
     libitm-dev \
     libitm-staticdev \
