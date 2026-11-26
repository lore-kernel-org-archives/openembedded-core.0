Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1828.1795712303651323224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K8d9qJ0p;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so5956796eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712303; x=1796317103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIUGu8UsrTCNLaGF7IRodOsLjzU1+ME1pjT/0l0OaHQ=;
        b=K8d9qJ0pE9JN3xH3BK09mRnmWN4pnP4bCFN6HVSOxSHc+I32koDypaThEwPr7Rm0Jy
         gymqDAf7ov0ja5ekVB5KgUWwHx5Hopbk3F58wY9yep/lxC6zHpoQWsnIbHKn5v7qCRjl
         EgO+lflvPgThHC8IdoXBZOWKvIFcMHXu36ZAWQPw5p7GgOVDk6k3e9kwGY+i9Tg3GOPN
         z/lKrp/w7yZ7+TM4KKS2cv/CQJARqo8RkWVNWARq/5SrvUp23hN35yNe0tnTu4Kr3+KP
         +hF/WBRRFZziYbaxlWQgMA/88G/kMpibfKqf/syFsP0PAs4bWghFy5zo+rqJC9fLAnyL
         0cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712303; x=1796317103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIUGu8UsrTCNLaGF7IRodOsLjzU1+ME1pjT/0l0OaHQ=;
        b=M46WDx5WxrajJAQsIRiMV2r05YbPyKtP/ItkzAYjAx2RMjRGxhLXskm9+dJTljwDeG
         vypajzjmUEoP3+CQJNz1aVsRNh1fPw7yEjH50vsf9kXYatVt73LLOAH6S92XzIm34zxA
         Jf7b+PS+y76ibMsq9ZlUk10XEMgB69PMez4vn2LUKM5GnreIPt87qeSWXaIhB3k52ZPK
         PceAJkv0URkupAZexcmksq10xc0gPeglO19wD42n4/paZ81mMQvZpgGRFn3U1vGMF07B
         IP2Iwc3uVfDnNIrTllCN0hG5d5DInCWN19ionkcil+Nvjvsf01jr0UoxDsK8X4FQlyWH
         y/9g==
X-Gm-Message-State: APuU4Z+lSgfkS0L5RqjYAPDYwpYxqsA6oeH7cAWA+6LrrAMOMfTzf++L
	OTZThAvvcxbf0r3DLytwvt0MDGNTlKqVuYfNYSniGCleyTpVHPdJkDFToee22vM1
X-Gm-Gg: AZFdTZc1SGafLWLpjR7QGmN1ZvuERRClMTT19ambn+8tZIx8k1TAmd3wLDtbr44kIbP
	5aOAAJZ0S3FfQ8J/1BWjCBz14aWw+vXo/iI0dLlgkKdJvm00qB+N0AJSTrGAsRUBDPrWzelC63g
	tMdgMy7J6QQo7Wy3glhtU5jlcYUMMz9R28HNWQXjpzmQAMSWzsm1A3XIDHwTWO4ap1OuLf976Uz
	8xyNCJwYX0UzD5JoRhzVfVdie64JpVDeVPQwyVfCBun0zYJSMVxnKTH7ZbdBFXzYZ14vnRuLouf
	ZWgjmy74Qo9da4rA25bmdPxsLmti7uqkkc+ugtM7Y9bbbQtCNCQEGKnb6MZlgh4rS+oU+W5srEe
	gQahZR8HaRRFpgkuVfKITnjzdx9Fb1SM+AuhYGt4dM/7LgNChCHEwyITL212Q5biI0hBSwAyR6H
	QcjbGhlSDxaHIwGjXj6pGVMkt6ogSKUhKiomrziYZ8MG2guJDSLQucqVU/9d+kSGLmxllXdjqug
	tCrbMofh2mv3idBOzIW1NwCj2alVar/QssT8WB8OP4kr+A3+aY3Tn92XSTGwlU4N6DwdcRnkpT0
	UblFjHaHVTKf67PPSHVv1oFz39aKlSxb2RWfYuFpQFiqxiCLbF2Swcf81Yh3kQUS559xwm7xDUs
	eWSRfdAurxuWDNRsnklUlcFsj6WBnfNqEqA5bmTHNjVKvcYjR9bbw4KIZ+VKxAUBkYvn/bPZRSt
	VnXUPoU5DTAsROWNbMyaYjZI4z3mtRAt69YolnpPDpovnY+7F/twvEnyqY+J29Gaq0BEN4/6Q7p
	X0M02h8Xa48jn3kF+AaFxxurpBvOY4nZYvC+5PaEkm7AO7BvI248tx0M5cyT7rmd5QRbchdeDnm
	x9A1M2W2ctPcKqRL5vG+FUZz7w==
X-Received: by 2002:a05:7300:6d03:b0:375:b560:a323 with SMTP id 5a478bee46e88-3856c0ce045mr30858980eec.1.1795712302763;
        Thu, 26 Nov 2026 08:58:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm35395295eec.0.2026.11.26.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:58:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 1/2] compiler-rt: Add option to provide libatomic instead of gcc-runtime
Date: Thu, 26 Nov 2026 08:58:18 -0800
Message-ID: <20261126165819.1624670-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251325
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
v2: Rebased

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
