Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18136.1795794435223274311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ZZeqH09l;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: ddrake@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4831670f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794433; x=1796399233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DiBssBnBFzWbFVWX6kWJR+tlAPdSvyDVsW3nAA+JOk=;
        b=ZZeqH09lhUY7qKlNdOGwQXlUqb06uoRczDLDpm4/lPJilVg94aK/P0ZvByMFMCxDF7
         iTrraFyKLx2SYsYs1fSqaASWuJ1DcZLqmI+1EMEWj6wHuNNqEuc0sueECCpE5oR10sb/
         6rScd2HbWTss0bnt7z8fvOzNpBsNx7f/a2CSLGrBM19C3T3w+8foXLtUCELNwah1lF7b
         PVhwbhJHfBA8wd9QH0fkxsnYzp1IyFy/f5oQKX9hSY7Wz+y7qqt2WXNv7MLBjk9i+v3D
         m7LTI4IPkMFp9wWOtC8YSQU4r0aj3w0/XA6kwJcC6C8AyA0ycuyb7bn/EM2ieWySCFLN
         PgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794433; x=1796399233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DiBssBnBFzWbFVWX6kWJR+tlAPdSvyDVsW3nAA+JOk=;
        b=EgyRiQzFhqcUTu9+4rXpIDDPKrpUTH64mqgvlhoSfsI08y2sc84+oRcePXlaoYowH+
         VLbAcWO9jV9U0ZhfibW8TGmCLG/Ar04HrfKVD0wnYFaGBaag2/ehdVLTjS4lQtAiiqak
         LdB2Hcn1p2S+j3gvCHr2iTnThlb1poGtFs9A9TambqhdtfltHetqOzSmd0l0w3gtx0YQ
         5iqrRI1FXgSUbRfGZpOp5WvZWnsbs//uPamC+07ZbyE6gSeESiJM8eSnXEPZWX6zfpO9
         2fnPgFk9mqaj9qMeOANT441pdaN41RTBur5slkCaHBs4MrqrINqgAtJJvTlwIYaefZaG
         zHfA==
X-Gm-Message-State: APuU4Z9iOM46YDUIUk05tZDYmx9a6xcIsB+ml4LOstj+3zWRMhgE+Ji6
	P3mP4BB0AWFrX4D7xWKNR32+Ktv7pE0EWEuy5YeFtYVvRONe6WSFz3ljTn8UJGGF2LkpcXOFsQi
	fji5VPJY=
X-Gm-Gg: AZFdTZcTgzDu1AUusPeBt/4AbA7g3dc/WVc/3KrgOjPzbNHj6gdhxzL3kwZBnGx/MCN
	226Oo4GklKNycY1wGJxu5pHM7ZbYVsM4N9a51qcai0xQdmhwlL9f/n6xS1cErMVXOk8Yoyv1NFv
	ifnGRc5iWnLnHV0kKMONjBHpz/GGlpyObj6OeTfmEnQxZft6poLKLx+dQznrL0s8uz3zwsRwDVG
	EgB+sB7m+MI3mTxJgQ2CIlaxCO21ch6lCOx2/Yr/4msHDcWEcghXqw2mGRLOsN3OiSeAg1Qx5iK
	hjj7gcPRDWZ5BxYrBcxUidSmU5pADbBsl02+sPJfLaqsAalEmrnpO6I+8A/9SJZYyN0E0pZ4wZO
	M/JDI4Jm2MA2umr+s/NKJUopUiMrH4TgPhdvgTQF+0145i2BXWMm97KWJ666A9dXQt8f+QCPQE8
	kxfKQ7X1PSsG8AFJ3uPchTD2chUMQonyTZX0tVhzCYwT21A3yRKox9oi/HlyMPnPne4d4yJ8tyC
	/sXNbCQjW3xn54iH/ee7TmHT7zk7pswCRdm28JcJI0tHNXlJwxayZboxE8o98YQwnHwT76l1kAG
	2y6bY4hi0eHaaDU52erWq82EEvk=
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr524983205e9.6.1795794433076;
        Fri, 27 Nov 2026 07:47:13 -0800 (PST)
Return-Path: <ddrake@baylibre.com>
Received: from numbers ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm350261255e9.4.2026.11.27.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:47:12 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>,
	Daniel Drake <ddrake@baylibre.com>
Subject: [PATCH 2/2] mesa: upgrade 26.2.4 -> 26.3.1
Date: Fri, 27 Nov 2026 15:46:52 +0000
Message-ID: <20261127154652.253316-3-ddrake@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127154652.253316-1-ddrake@baylibre.com>
References: <20261127154652.253316-1-ddrake@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251404
Content-Type: text/plain; charset="utf-8"

Release notes:
https://docs.mesa3d.org/relnotes/26.3.0.html
https://docs.mesa3d.org/relnotes/26.3.1.html

The Venus (virtio) Vulkan driver now requires venus-protocol 1.1.3
instead of carrying the protocol headers in-tree.

Removed patches, included in 26.3:
* 0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
  (part of 265a2d4f0f8 "amd: import addrlib v10.9")
* 0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
  (aac5108bbfa "gallivm: adapt for JITLink in LLVM 23")

Removed patches, no longer needed:
* 0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
  The jay_predication typed enum is gone and the upstream code now
  compiles fine with gcc 12.

Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 ...uiltin_cpu_supports-for-avx2-detecti.patch | 55 -------------------
 ...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 -----------------
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 36 ------------
 meta/recipes-graphics/mesa/mesa.inc           | 12 ++--
 4 files changed, 6 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
deleted file mode 100644
index 2b30c1b5c7..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From b00409956cd1a58f1c676de9cbfd2c688ca3fc9f Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 13 Aug 2026 00:00:00 +0000
-Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
-
-__builtin_cpu_supports("avx2") lowers to a PC-relative reference to the
-libgcc/compiler-rt __cpu_model global. With clang+lld, linking that
-reference into a shared library fails because __cpu_model is treated as
-preemptible there:
-
-  relocation R_X86_64_PC32 cannot be used against symbol '__cpu_model';
-  recompile with -fPIC
-
-Check CPUID directly instead, which avoids the __cpu_model reference
-entirely and works with both GCC and Clang.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43820]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/amd/addrlib/src/core/addrswizzlersimd.h | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/src/amd/addrlib/src/core/addrswizzlersimd.h b/src/amd/addrlib/src/core/addrswizzlersimd.h
-index fd53e40..ce30204 100644
---- a/src/amd/addrlib/src/core/addrswizzlersimd.h
-+++ b/src/amd/addrlib/src/core/addrswizzlersimd.h
-@@ -57,6 +57,8 @@
- #if ADDR_HAS_AVX2
- #if _MSC_VER
- #include <Windows.h>
-+#else
-+#include <cpuid.h>
- #endif
- #include <immintrin.h>
- 
-@@ -85,7 +87,18 @@ static inline bool CpuSupportsAvx2() {
- #if _MSC_VER
-     return IsProcessorFeaturePresent(PF_AVX2_INSTRUCTIONS_AVAILABLE);
- #elif defined(__GNUC__)
--    return __builtin_cpu_supports("avx2");
-+    // __builtin_cpu_supports() lowers to a PC-relative reference to the
-+    // libgcc/compiler-rt __cpu_model global, which some clang+lld
-+    // configurations reject when linking into a shared library (the
-+    // symbol is treated as preemptible: "relocation R_X86_64_PC32 cannot
-+    // be used against symbol '__cpu_model'"). Check CPUID directly instead.
-+    unsigned int eax, ebx, ecx, edx;
-+    if (__get_cpuid_max(0, nullptr) < 7)
-+    {
-+        return false;
-+    }
-+    __cpuid_count(7, 0, eax, ebx, ecx, edx);
-+    return (ebx & bit_AVX2) != 0;
- #else
- #error "What platform is this?"
- #endif
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
deleted file mode 100644
index 756b68a898..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From cda383625f5d1fd06657fb998b7d1370a7fabd8f Mon Sep 17 00:00:00 2001
-Message-ID: <cda383625f5d1fd06657fb998b7d1370a7fabd8f.1791114851.git.marcel@ziswiler.com>
-From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
-Date: Wed, 30 Sep 2026 14:10:14 +0800
-Subject: [PATCH] gallivm: adapt for JITLink in LLVM 23
-
-In LLVM 23, the ObjectLinkingLayerCreator callback now takes an
-additional memory manager argument.
-
-Adapt for this API change.
-
-This argument eliminates the need to create a InProcessMemoryManager
-by ourselves so a dedicated implementation is added.
-
-Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16325
-Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16325]
----
- src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
-index 09d56e543ee..bc9d7837ecd 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
-@@ -346,6 +346,13 @@ LPJit::LPJit() :jit_dylib_count(0) {
-          .setJITTargetMachineBuilder(std::move(JTMB))
- #ifdef USE_JITLINK
-          .setObjectLinkingLayerCreator(
-+#if LLVM_VERSION_MAJOR >= 23
-+            /* LLVM 23 added a JITLinkMemoryManager argument, use it as our
-+             * JITLinkMemoryManager. */
-+            [&](ExecutionSession &ES, llvm::jitlink::JITLinkMemoryManager &MM) {
-+               return std::make_unique<ObjectLinkingLayer>(ES, MM);
-+            })
-+#else
- #if LLVM_VERSION_MAJOR >= 21
-             /* LLVM 21 removed the Triple argument */
-             [&](ExecutionSession &ES) {
-@@ -355,6 +362,7 @@ LPJit::LPJit() :jit_dylib_count(0) {
-                return std::make_unique<ObjectLinkingLayer>(
-                   ES, ExitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));
-             })
-+#endif
- #else
- #if LLVM_USE_INTEL_JITEVENTS
-          .RegisterJITEventListener(
--- 
-2.52.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
deleted file mode 100644
index b923c4c1fb..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ccfa5a6555f6eb035ace12cba1ce3e785a47895f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 14 Jun 2026 17:42:19 +0200
-Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
-
-This is a C23 feature and not supported by gcc < 13, which
-many host distros still have (e.g. Debian 12).
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/intel/compiler/jay/jay_ir.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 3b819cb..34b8877 100644
---- a/src/intel/compiler/jay/jay_ir.h
-+++ b/src/intel/compiler/jay/jay_ir.h
-@@ -518,7 +518,7 @@ jay_type_is_any_float(enum jay_type t)
-    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
- }
- 
--enum jay_predication : uint8_t {
-+enum jay_predication {
-    /** No predication. */
-    JAY_NOT_PREDICATED = 0,
- 
-@@ -592,7 +592,7 @@ typedef struct jay_inst {
-    bool decrement_dep:1;
-    uint8_t padding   :1;
- 
--   enum jay_predication predication;
-+   uint8_t predication;
-    gen_condition conditional_mod;
- 
-    jay_def cond_flag; /**< conditional flag */
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6ef725c9a7..a938114e1a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,15 +17,12 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
-           file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
-           file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch \
            file://0001-meson-check-TLSDESC-support-with-a-shared-library.patch \
            "
 
-SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
-PV = "26.2.4"
+SRC_URI[sha256sum] = "4e4e438eac7b840a9383988cbb7c08dad8041da544b9319fc26d319fa7348961"
+PV = "26.3.1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -164,7 +161,10 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
 
-PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers libdrm"
+VULKAN_DEPS = "glslang-native vulkan-loader vulkan-headers libdrm"
+VULKAN_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ' venus-protocol', '', d)}"
+
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',${VULKAN_DEPS}"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 # mesa development and testing tools support, per driver
-- 
2.56.1

