Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5591.1793252418430789673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OCGvc/sB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FQctlhAe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1862c5efd-97770899-0fc7-42b5-8452-34f4cd0048db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252417;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xLVcZxsRol+DzzBMGQzQ4JjvdGZGGryWhDsPSKt1Pqw=;
	b=OCGvc/sBLZvRQpNvco8p4MN/O6+fgpX137ArCz9bABIGtEnNVGLsS3fWyH3BLec4
	r1TRzbWu6GqoBLGjoT2OPN+gBHvMNk0Iq9dAoqW0o7ooGEGU7Wtuhkk0gFyEljDqJgz
	drzxlQDrOm/2rO1+0hkBAZJqKAyz6+4qI61viPi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252417;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xLVcZxsRol+DzzBMGQzQ4JjvdGZGGryWhDsPSKt1Pqw=;
	b=FQctlhAeWWoWTVGAYfVAEf6kC/xOFyvo43RH208Uab5d+zz/Nd8DzaRQ6Ko9sy83
	EF2RIfwOJvuofJQde1A69pL5R/OqqkxpHjXFNZq92ePNVJc6n36eLJJeannV7wU1vd/
	Txufjdm+K+CJ6tRfWF/NcxVdy3K2guKCkmhaXSZg=
Content-Type: multipart/mixed; boundary="===============5697684865264202175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.2.6 SUCCEEDED
Message-ID: <010101a1862c5efd-97770899-0fc7-42b5-8452-34f4cd0048db-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248891

--===============5697684865264202175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.2.4-26.2.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d5e439dbe2e54a2890a1ed929d1e9c1fc61da173 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 29 Oct 2026 05:18:04 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.2.4 -> 26.2.6

Mesa 26.2.4 Release Notes / 2026-10-01
======================================

Mesa 26.2.4 is a bug fix release which fixes bugs found since the 26.2.3
release.

Mesa 26.2.4 implements the OpenGL 4.6 API, but the version reported by
glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being used.
Some drivers don't support all the features required in OpenGL 4.6. OpenGL
4.6 is **only** available if requested at context creation.
Compatibility contexts may report a lower version depending on each driver.

Mesa 26.2.4 implements the OpenCL 3.1 API, but the version reported by
the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and
CL_DEVICE_OPENCL_C_ALL_VERSIONS
clGetDeviceInfo queries depends on the particular driver being used.

Mesa 26.2.4 implements the Vulkan 1.4 API, but the version reported by
the apiVersion property of the VkPhysicalDeviceProperties struct
depends on the particular driver being used.

SHA checksums
-------------

::

    SHA256: bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9
    mesa-26.2.4.tar.xz
    SHA512: 42e793561661a567e72c7324d071ab9f82d3a9f1e000827ed989b8d5fcc2cd16e50c
    02808d43465b3135c25a3cad77649ba0bf9e35d95b848f8fc8d8b9ce327c
    mesa-26.2.4.tar.xz

New features
------------

- None

Bug fixes
---------

- "TY the Tasmanian Tiger 3" always crashes in the same cutscene on amd gpus
- VK_VALVE_video_encode_rgb_conversion always outputs limited color range
- X-Plane 12 (2014780) Flickering artifacts on textures with Intel Arc B580
- [DG2] ANV: Enshrouded (1203620) - character invisible, transparent billboards
  rendered as opaque spheres on discrete Arc GPU
- [RADV] GFX8: Black screen in UE5 DX12 (Half Sword) after commit 15990c78b8e
  ("allow DCC for concurrent images without DCC stores")
- anv: VK_EXT_calibrated_timestamps returns a GPU timestamp ahead of CPU time on
  Arc B390 (Panther Lake), crashing Unreal Engine 5.8
- asahi: Mario Kart WiiCompiled graphical glitches
- dEQP-VK.image.swapchain_mutable.wayland.2d.r8g8b8a8_srgb_r8g8b8a8_unorm_draw_t
  exture_format_list crash
- radeonsi/va: vaGetImage to I420/YUYV fails with UNSUPPORTED_RT_FORMAT since
  Mesa 26.2 on GPUs with VPE (Radeon 890M)
- radeonsi: GPU page fault (SQC) / context loss when using Iris shaderpacks on
  RX 9070 XT (gfx1201)
- radv: NULL deref in radv_get_vgt_shader_key after binding a compute shader
  object
- radv: PCIe 4.0 x4 fails the "PCIe 3.0 x8" bandwidth check for VRAM command
  buffers by 4 MB/s (rounded per-lane constants); up to 13% decode loss in
  llama.cpp
- radv: UNREACHABLE clearing DEPTH|STENCIL when the dynamic render pass has no
  stencil attachment
- radv: VkDescriptorUpdateTemplate takes a pointer to the set_layout memory

Changes
-------

Allen Ballway (1):
- intel/compiler: fix bounds check in Wa_18035690555
Benjamin Cheng (1):
- ac/video: Adjust HEVC min_qp for VCN1/VCN2
Boris Brezillon (2):

- pan/kmod: Make sure all executables live in the same 4G VA range
- panvk: Don't downcast CS func address to a 32-bit VA

Caio Oliveira (1):
- brw: Re-lower immediate offsets after mesh nir_opt_offsets
Christian Gmeiner (3):

- lavapipe: Guard BDA handle arrays with bda_lock
- etnaviv: Capture varyings not read by the fragment shader
- etnaviv: Keep transform feedback active across flushes

Cooper Morgan (3):

- vulkan/wsi: keep present timing records that do not fit the output array
- vulkan/wsi: keep GOOGLE display timing records that do not fit
- anti-lag: convert GPU timestamps to ns in double precision

David Rosca (8):

- vulkan/video: Don't update OBU size with NULL data_ptr
- vl/bitstream: Fix coding ue() for large numbers
- vl/bitstream: Don't use internal buffer for size only use
- vl/bitstream: Move overflow check to vl_bitstream_write_byte_start_code
- radv/video: Fix handling size limit in GetEncodedVideoSessionParameters
- va: Drop format support checks in vlVaPostProc
- va: Don't check format support in EndPicture for processing
- radv/video: Only report BT709/Limited support for RGB conversion on VCN5

David Sanders (1):
- radv: reset compute pipeline after IES in vkCmdExecuteGeneratedCommandsEXT
Dmitry Baryshkov (3):

- freedreno/a2xx: don't type-pun the immediate values through a cast
- tu: resolve wide formats with a shader on A702
- freedreno/qrisc: fix hang on a650 / a660 firmware

Eric Engestrom (2):

- docs: add sha sum for 26.2.3
- .pick_status.json: Update to 30da39187d8d3cf03c58ecd2bebb497b84501f51

Eric R. Smith (1):
- pvr: move assert for buffer usage
Georg Lehmann (4):

- aco/sched_vopd: work around GFX11 VOPD interlock hazard
- aco/optimizer: do not truncate constants before resolving extracts
- aco/opcodes: add dest/src types for VOPD opcodes
- aco/insert_fp_mode: handle both vopd opcodes

Glenn Kennard (1):
- nv30: Fix for loops in fragment shaders on nv40
Helen Koike (1):
- vulkan/overlay: Draw on the present queue when possible
Ian Romanick (1):
- brw: Only HALT for ter

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...avoid-builtin_cpu_supports-for-avx2-detecti.patch |  2 +-
 ...dreno-don-t-encode-build-path-into-binaries.patch |  2 +-
 .../0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch  | 12 ++++--------
 ...check-TLSDESC-support-with-a-shared-library.patch |  8 ++++----
 ...eson-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...-compiler-jay-jay_ir.h-do-not-used-typed-en.patch |  2 +-
 ...u_math.c-do-not-use-arm-fpu-instructions-if.patch |  2 +-
 meta/recipes-graphics/mesa/mesa.inc                  |  4 ++--
 8 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index 2b30c1b5c7..9b28f6e518 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From b00409956cd1a58f1c676de9cbfd2c688ca3fc9f Mon Sep 17 00:00:00 2001
+From c40a9c62ea37e749698739e67a120508df008ff7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index d580277124..0699caf24f 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From a61daaf354bd84dfa849f8da6028ddc71f1af7dc Mon Sep 17 00:00:00 2001
+From f5fc579842eb28da6efb9d6631de6e0397a34fab Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
index 756b68a898..13e28f6c62 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
@@ -1,5 +1,4 @@
-From cda383625f5d1fd06657fb998b7d1370a7fabd8f Mon Sep 17 00:00:00 2001
-Message-ID: <cda383625f5d1fd06657fb998b7d1370a7fabd8f.1791114851.git.marcel@ziswiler.com>
+From b2cf560b16b2d9215fa0172e1154260a38c72d1c Mon Sep 17 00:00:00 2001
 From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
 Date: Wed, 30 Sep 2026 14:10:14 +0800
 Subject: [PATCH] gallivm: adapt for JITLink in LLVM 23
@@ -21,10 +20,10 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/work_item
  1 file changed, 8 insertions(+)
 
 diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
-index 09d56e543ee..bc9d7837ecd 100644
+index 9a02de3..81a5f27 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
-@@ -346,6 +346,13 @@ LPJit::LPJit() :jit_dylib_count(0) {
+@@ -341,6 +341,13 @@ LPJit::LPJit() :jit_dylib_count(0) {
           .setJITTargetMachineBuilder(std::move(JTMB))
  #ifdef USE_JITLINK
           .setObjectLinkingLayerCreator(
@@ -38,7 +37,7 @@ index 09d56e543ee..bc9d7837ecd 100644
  #if LLVM_VERSION_MAJOR >= 21
              /* LLVM 21 removed the Triple argument */
              [&](ExecutionSession &ES) {
-@@ -355,6 +362,7 @@ LPJit::LPJit() :jit_dylib_count(0) {
+@@ -350,6 +357,7 @@ LPJit::LPJit() :jit_dylib_count(0) {
                 return std::make_unique<ObjectLinkingLayer>(
                    ES, ExitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));
              })
@@ -46,6 +45,3 @@ index 09d56e543ee..bc9d7837ecd 100644
  #else
  #if LLVM_USE_INTEL_JITEVENTS
           .RegisterJITEventListener(
--- 
-2.52.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch b/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch
index 397e9935d4..2660845b9d 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch
@@ -1,4 +1,4 @@
-From f5bde7a5bda6bc10eafd132e0a8a8e7ce9a69779 Mon Sep 17 00:00:00 2001
+From f5674ad8bb8ce348811d9c77eeba94ef0a11aee7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Sun, 25 Oct 2026 09:09:05 -0700
 Subject: [PATCH] meson: check TLSDESC support with a shared library
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 
 diff --git a/build-support/conftest-tlsdesc.c b/build-support/conftest-tlsdesc.c
 new file mode 100644
-index 00000000000..2351f6fef10
+index 0000000..2351f6f
 --- /dev/null
 +++ b/build-support/conftest-tlsdesc.c
 @@ -0,0 +1,23 @@
@@ -55,10 +55,10 @@ index 00000000000..2351f6fef10
 +}
 +#endif
 diff --git a/meson.build b/meson.build
-index f725f833a52..75430283eb2 100644
+index 37f2fd4..a7a7c6a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -651,10 +651,25 @@ if not have_mtls_dialect
+@@ -643,10 +643,25 @@ if not have_mtls_dialect
      # The way to specify the TLSDESC dialect is architecture-specific.
      # We probe both because there is not a fallback guaranteed to work for all
      # future architectures.
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 77a0ba3d8b..6a4bf56d61 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From c3a359d39e387e785883cb740934a0dc4e6376db Mon Sep 17 00:00:00 2001
+From 7971d9a057da471897f9dc700bee8aab18a97cc7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index b923c4c1fb..be9c1afcc2 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From ccfa5a6555f6eb035ace12cba1ce3e785a47895f Mon Sep 17 00:00:00 2001
+From 281351633d05dddcfde24f73bf238eda9097d01a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index 0d0fdace2c..65cac33905 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 89c46de92e974202c1cabce25bb4d9441830b8b6 Mon Sep 17 00:00:00 2001
+From c3045eefac02311285a40168a49d4624b8314648 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 64f5de12b4..d80915da03 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,8 +24,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-check-TLSDESC-support-with-a-shared-library.patch \
            "
 
-SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
-PV = "26.2.4"
+SRC_URI[sha256sum] = "b9436b3e1a8be76fbd4823dc884f90596ab7c6ac5e1867a305e66ffccfb31a92"
+PV = "26.2.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============5697684865264202175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.2.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch file://0001-meson-check-TLSDESC-support-with-a-shared-library.patch" to "https://archive.mesa3d.org/mesa-26.2.6.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch file://0001-gallivm-adapt-for-JITLink-
 in-LLVM-23.patch file://0001-meson-check-TLSDESC-support-with-a-shared-library.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.4.so", added "/usr/lib/libgallium-26.2.6.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 45517568 to 45554432 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.2.4.so", added "/usr/lib/.debug/libgallium-26.2.6.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 773266816 to 773791480 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 202252 to 202461 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.2.4/src/intel/ds -> /usr/src/debug/mesa/26.2.6/src/intel/ds, directory renamed /usr/src/debug/mesa/26.2.4/src/util -> /usr/src/debug/mesa/26.2.6/src/util, directory renamed /usr/src/debug/mesa/26.2.4/src/util/format -> /usr/src/debug/mesa/26.2.6/src/util/format, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.2.6/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/shaders -> /usr/src/debug/mesa/26.2.6/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/util -> /usr/src/debug/mesa/26.2.6/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/wsi -> /usr/src/debug/mesa/26.2.6/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa -> /usr/src/debug/mesa/26.2.6/src/mesa, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/genxml -> /usr/src/debug/mesa/26.2.6/src
 /intel/genxml, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/spirv -> /usr/src/debug/mesa/26.2.6/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/nir -> /usr/src/debug/mesa/26.2.6/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.2.6/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/runtime -> /usr/src/debug/mesa/26.2.6/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.2.4/src/loader -> /usr/src/debug/mesa/26.2.6/src/loader, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler -> /usr/src/debug/mesa/26.2.6/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/dev -> /usr/src/debug/mesa/26.2.6/src/intel/dev, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.2.6/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/common -> /
 usr/src/debug/mesa/26.2.6/src/amd/common, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/vulkan -> /usr/src/debug/mesa/26.2.6/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.2.6/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/vulkan -> /usr/src/debug/mesa/26.2.6/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.2.6/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/jay -> /usr/src/debug/mesa/26.2.6/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/isl -> /usr/src/debug/mesa/26.2.6/src/intel/isl, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/brw -> /usr/src/debug/mesa/26.2.6/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.2.6/src/gallium/drivers/radeonsi,
  directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/program -> /usr/src/debug/mesa/26.2.6/src/mesa/program, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler -> /usr/src/debug/mesa/26.2.6/src/compiler, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/gen -> /usr/src/debug/mesa/26.2.6/src/intel/compiler/gen, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.2.6/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.2.4/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.2.6/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.2.4/src/nouveau/headers -> /usr/src/debug/mesa/26.2.6/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/elk -> /usr/src/debug/mesa/26.2.6/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.2.4/src/virtio/vulkan -> /usr/src/debug/mesa/26.2.6/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/int
 el/blorp -> /usr/src/debug/mesa/26.2.6/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.2.6/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.2.6/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/auxiliary -> /usr/src/debug/mesa/26.2.6/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/glsl -> /usr/src/debug/mesa/26.2.6/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/compiler -> /usr/src/debug/mesa/26.2.6/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.2.6/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/perf -> /usr/src/debug/mesa/26.2.6/src/intel/perf
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 250567753 to 250580661 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 84457192 to 84502248 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.2.4" to "26.2.6"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.2.4 [default] to 26.2.6 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.4.so moved to /usr/lib/libgallium-26.2.6.so

--===============5697684865264202175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-changelog.txt"

TWVzYSAyNi4yLjQgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMTAtMDEKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi40IGlzIGEgYnVnIGZpeCByZWxlYXNlIHdo
aWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMwpyZWxlYXNlLgoKTWVzYSAyNi4y
LjQgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRl
ZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZF
UlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBh
bGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipv
bmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRp
YmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBl
YWNoIGRyaXZlci4KCk1lc2EgMjYuMi40IGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJ
Q0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNs
R2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJl
aW5nIHVzZWQuCgpNZXNhIDI2LjIuNCBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0
IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBW
a1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAg
ICBTSEEyNTY6IGJjZTVmN2ZiZWJiOTM0MzczYjg2Yzk5OWEwNjRkNTJmYjUwNjU4NzhkYzU3ZjI4
N2Y5NTM0NjY0OGVjODMyZTkKICAgIG1lc2EtMjYuMi40LnRhci54egogICAgU0hBNTEyOiA0MmU3
OTM1NjE2NjFhNTY3ZTcyYzczMjRkMDcxYWI5ZjgyZDNhOWYxZTAwMDgyN2VkOTg5YjhkNWZjYzJj
ZDE2ZTUwYwogICAgMDI4MDhkNDM0NjViMzEzNWMyNWEzY2FkNzc2NDliYTBiZjllMzVkOTViODQ4
ZjhmYzhkOGI5Y2UzMjdjCiAgICBtZXNhLTI2LjIuNC50YXIueHoKCk5ldyBmZWF0dXJlcwotLS0t
LS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSAiVFkgdGhlIFRhc21hbmlh
biBUaWdlciAzIiBhbHdheXMgY3Jhc2hlcyBpbiB0aGUgc2FtZSBjdXRzY2VuZSBvbiBhbWQgZ3B1
cwotIFZLX1ZBTFZFX3ZpZGVvX2VuY29kZV9yZ2JfY29udmVyc2lvbiBhbHdheXMgb3V0cHV0cyBs
aW1pdGVkIGNvbG9yIHJhbmdlCi0gWC1QbGFuZSAxMiAoMjAxNDc4MCkgRmxpY2tlcmluZyBhcnRp
ZmFjdHMgb24gdGV4dHVyZXMgd2l0aCBJbnRlbCBBcmMgQjU4MAotIFtERzJdIEFOVjogRW5zaHJv
dWRlZCAoMTIwMzYyMCkgLSBjaGFyYWN0ZXIgaW52aXNpYmxlLCB0cmFuc3BhcmVudCBiaWxsYm9h
cmRzCiAgcmVuZGVyZWQgYXMgb3BhcXVlIHNwaGVyZXMgb24gZGlzY3JldGUgQXJjIEdQVQotIFtS
QURWXSBHRlg4OiBCbGFjayBzY3JlZW4gaW4gVUU1IERYMTIgKEhhbGYgU3dvcmQpIGFmdGVyIGNv
bW1pdCAxNTk5MGM3OGI4ZQogICgiYWxsb3cgRENDIGZvciBjb25jdXJyZW50IGltYWdlcyB3aXRo
b3V0IERDQyBzdG9yZXMiKQotIGFudjogVktfRVhUX2NhbGlicmF0ZWRfdGltZXN0YW1wcyByZXR1
cm5zIGEgR1BVIHRpbWVzdGFtcCBhaGVhZCBvZiBDUFUgdGltZSBvbgogIEFyYyBCMzkwIChQYW50
aGVyIExha2UpLCBjcmFzaGluZyBVbnJlYWwgRW5naW5lIDUuOAotIGFzYWhpOiBNYXJpbyBLYXJ0
IFdpaUNvbXBpbGVkIGdyYXBoaWNhbCBnbGl0Y2hlcwotIGRFUVAtVksuaW1hZ2Uuc3dhcGNoYWlu
X211dGFibGUud2F5bGFuZC4yZC5yOGc4YjhhOF9zcmdiX3I4ZzhiOGE4X3Vub3JtX2RyYXdfdAog
IGV4dHVyZV9mb3JtYXRfbGlzdCBjcmFzaAotIHJhZGVvbnNpL3ZhOiB2YUdldEltYWdlIHRvIEk0
MjAvWVVZViBmYWlscyB3aXRoIFVOU1VQUE9SVEVEX1JUX0ZPUk1BVCBzaW5jZQogIE1lc2EgMjYu
MiBvbiBHUFVzIHdpdGggVlBFIChSYWRlb24gODkwTSkKLSByYWRlb25zaTogR1BVIHBhZ2UgZmF1
bHQgKFNRQykgLyBjb250ZXh0IGxvc3Mgd2hlbiB1c2luZyBJcmlzIHNoYWRlcnBhY2tzIG9uCiAg
UlggOTA3MCBYVCAoZ2Z4MTIwMSkKLSByYWR2OiBOVUxMIGRlcmVmIGluIHJhZHZfZ2V0X3ZndF9z
aGFkZXJfa2V5IGFmdGVyIGJpbmRpbmcgYSBjb21wdXRlIHNoYWRlcgogIG9iamVjdAotIHJhZHY6
IFBDSWUgNC4wIHg0IGZhaWxzIHRoZSAiUENJZSAzLjAgeDgiIGJhbmR3aWR0aCBjaGVjayBmb3Ig
VlJBTSBjb21tYW5kCiAgYnVmZmVycyBieSA0IE1CL3MgKHJvdW5kZWQgcGVyLWxhbmUgY29uc3Rh
bnRzKTsgdXAgdG8gMTMlIGRlY29kZSBsb3NzIGluCiAgbGxhbWEuY3BwCi0gcmFkdjogVU5SRUFD
SEFCTEUgY2xlYXJpbmcgREVQVEh8U1RFTkNJTCB3aGVuIHRoZSBkeW5hbWljIHJlbmRlciBwYXNz
IGhhcyBubwogIHN0ZW5jaWwgYXR0YWNobWVudAotIHJhZHY6IFZrRGVzY3JpcHRvclVwZGF0ZVRl
bXBsYXRlIHRha2VzIGEgcG9pbnRlciB0byB0aGUgc2V0X2xheW91dCBtZW1vcnkKCkNoYW5nZXMK
LS0tLS0tLQoKQWxsZW4gQmFsbHdheSAoMSk6Ci0gaW50ZWwvY29tcGlsZXI6IGZpeCBib3VuZHMg
Y2hlY2sgaW4gV2FfMTgwMzU2OTA1NTUKQmVuamFtaW4gQ2hlbmcgKDEpOgotIGFjL3ZpZGVvOiBB
ZGp1c3QgSEVWQyBtaW5fcXAgZm9yIFZDTjEvVkNOMgpCb3JpcyBCcmV6aWxsb24gKDIpOgoKLSBw
YW4va21vZDogTWFrZSBzdXJlIGFsbCBleGVjdXRhYmxlcyBsaXZlIGluIHRoZSBzYW1lIDRHIFZB
IHJhbmdlCi0gcGFudms6IERvbid0IGRvd25jYXN0IENTIGZ1bmMgYWRkcmVzcyB0byBhIDMyLWJp
dCBWQQoKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gYnJ3OiBSZS1sb3dlciBpbW1lZGlhdGUgb2Zmc2V0
cyBhZnRlciBtZXNoIG5pcl9vcHRfb2Zmc2V0cwpDaHJpc3RpYW4gR21laW5lciAoMyk6CgotIGxh
dmFwaXBlOiBHdWFyZCBCREEgaGFuZGxlIGFycmF5cyB3aXRoIGJkYV9sb2NrCi0gZXRuYXZpdjog
Q2FwdHVyZSB2YXJ5aW5ncyBub3QgcmVhZCBieSB0aGUgZnJhZ21lbnQgc2hhZGVyCi0gZXRuYXZp
djogS2VlcCB0cmFuc2Zvcm0gZmVlZGJhY2sgYWN0aXZlIGFjcm9zcyBmbHVzaGVzCgpDb29wZXIg
TW9yZ2FuICgzKToKCi0gdnVsa2FuL3dzaToga2VlcCBwcmVzZW50IHRpbWluZyByZWNvcmRzIHRo
YXQgZG8gbm90IGZpdCB0aGUgb3V0cHV0IGFycmF5Ci0gdnVsa2FuL3dzaToga2VlcCBHT09HTEUg
ZGlzcGxheSB0aW1pbmcgcmVjb3JkcyB0aGF0IGRvIG5vdCBmaXQKLSBhbnRpLWxhZzogY29udmVy
dCBHUFUgdGltZXN0YW1wcyB0byBucyBpbiBkb3VibGUgcHJlY2lzaW9uCgpEYXZpZCBSb3NjYSAo
OCk6CgotIHZ1bGthbi92aWRlbzogRG9uJ3QgdXBkYXRlIE9CVSBzaXplIHdpdGggTlVMTCBkYXRh
X3B0cgotIHZsL2JpdHN0cmVhbTogRml4IGNvZGluZyB1ZSgpIGZvciBsYXJnZSBudW1iZXJzCi0g
dmwvYml0c3RyZWFtOiBEb24ndCB1c2UgaW50ZXJuYWwgYnVmZmVyIGZvciBzaXplIG9ubHkgdXNl
Ci0gdmwvYml0c3RyZWFtOiBNb3ZlIG92ZXJmbG93IGNoZWNrIHRvIHZsX2JpdHN0cmVhbV93cml0
ZV9ieXRlX3N0YXJ0X2NvZGUKLSByYWR2L3ZpZGVvOiBGaXggaGFuZGxpbmcgc2l6ZSBsaW1pdCBp
biBHZXRFbmNvZGVkVmlkZW9TZXNzaW9uUGFyYW1ldGVycwotIHZhOiBEcm9wIGZvcm1hdCBzdXBw
b3J0IGNoZWNrcyBpbiB2bFZhUG9zdFByb2MKLSB2YTogRG9uJ3QgY2hlY2sgZm9ybWF0IHN1cHBv
cnQgaW4gRW5kUGljdHVyZSBmb3IgcHJvY2Vzc2luZwotIHJhZHYvdmlkZW86IE9ubHkgcmVwb3J0
IEJUNzA5L0xpbWl0ZWQgc3VwcG9ydCBmb3IgUkdCIGNvbnZlcnNpb24gb24gVkNONQoKRGF2aWQg
U2FuZGVycyAoMSk6Ci0gcmFkdjogcmVzZXQgY29tcHV0ZSBwaXBlbGluZSBhZnRlciBJRVMgaW4g
dmtDbWRFeGVjdXRlR2VuZXJhdGVkQ29tbWFuZHNFWFQKRG1pdHJ5IEJhcnlzaGtvdiAoMyk6Cgot
IGZyZWVkcmVuby9hMnh4OiBkb24ndCB0eXBlLXB1biB0aGUgaW1tZWRpYXRlIHZhbHVlcyB0aHJv
dWdoIGEgY2FzdAotIHR1OiByZXNvbHZlIHdpZGUgZm9ybWF0cyB3aXRoIGEgc2hhZGVyIG9uIEE3
MDIKLSBmcmVlZHJlbm8vcXJpc2M6IGZpeCBoYW5nIG9uIGE2NTAgLyBhNjYwIGZpcm13YXJlCgpF
cmljIEVuZ2VzdHJvbSAoMik6CgotIGRvY3M6IGFkZCBzaGEgc3VtIGZvciAyNi4yLjMKLSAucGlj
a19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDMwZGEzOTE4N2Q4ZDNjZjAzYzU4ZWNkMmJlYmI0OTdi
ODQ1MDFmNTEKCkVyaWMgUi4gU21pdGggKDEpOgotIHB2cjogbW92ZSBhc3NlcnQgZm9yIGJ1ZmZl
ciB1c2FnZQpHZW9yZyBMZWhtYW5uICg0KToKCi0gYWNvL3NjaGVkX3ZvcGQ6IHdvcmsgYXJvdW5k
IEdGWDExIFZPUEQgaW50ZXJsb2NrIGhhemFyZAotIGFjby9vcHRpbWl6ZXI6IGRvIG5vdCB0cnVu
Y2F0ZSBjb25zdGFudHMgYmVmb3JlIHJlc29sdmluZyBleHRyYWN0cwotIGFjby9vcGNvZGVzOiBh
ZGQgZGVzdC9zcmMgdHlwZXMgZm9yIFZPUEQgb3Bjb2RlcwotIGFjby9pbnNlcnRfZnBfbW9kZTog
aGFuZGxlIGJvdGggdm9wZCBvcGNvZGVzCgpHbGVubiBLZW5uYXJkICgxKToKLSBudjMwOiBGaXgg
Zm9yIGxvb3BzIGluIGZyYWdtZW50IHNoYWRlcnMgb24gbnY0MApIZWxlbiBLb2lrZSAoMSk6Ci0g
dnVsa2FuL292ZXJsYXk6IERyYXcgb24gdGhlIHByZXNlbnQgcXVldWUgd2hlbiBwb3NzaWJsZQpJ
YW4gUm9tYW5pY2sgKDEpOgotIGJydzogT25seSBIQUxUIGZvciB0ZXJtaW5hdGVfaWYgb2Ygbm9u
LWhlbHBlciBwaXhlbHMKSWNlbm93eSBaaGVuZyAoMyk6CgotIGdhbGxpdm06IGZpeCBlbmFibGVt
ZW50IG9mIFJJU0MtViBaYnMgZXh0ZW5zaW9uCi0gdnVsa2FuL3dzaTogc3VwcG9ydCBhbGxvY2F0
aW5nIG1vcmUgbWVtb3J5IGZvciBidWZmZXJzCi0gbWVzb246IGxpc3QgTUlQUyg2NCkgaW4gbGx2
bV9oYXNfbWNqaXQgbGlzdAoKSm9iIE5vb3JtYW4gKDIpOgoKLSBpcjM6IGludGVycHJldCBjb25z
dCBcQGxvYWQvc3RvcmVfZ2xvYmFsX29mZnNldCBvZmZzZXQgYXMgdW5zaWduZWQKLSBuaXIvbG93
ZXJfdGV4OiBjb3B5IHRleHR1cmUvc2FtcGxlcl9ub25fdW5pZm9ybSBmbGFncwoKSm9zZSBNYXJp
YSBDYXNhbm92YSBDcmVzcG8gKDIpOgoKLSB2YzQ6IGhlbHBlciB2YzRfZ2V0X2NsaXBfd2luZG93
KCkgZm9yIHRoZSBjbGlwIHdpbmRvdyBjb21wdXRhdGlvbgotIHZjNDogc2tpcCBkcmF3cyB3aG9z
ZSBjbGlwIHdpbmRvdyBpcyBlbXB0eQoKSnlvdGlyYW5qYW4gQmh1eWFuICgxKToKLSByYWRlb25z
aTogaW52YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBhdCBJQiBzdGFydCBvbiBnZngxMgpLYWphbCBL
YWphbCAoMik6CgotIGZyZWVkcmVuby9hNnh4OiB1cGxvYWQgYSBkdW1teSBzYW1wbGVyIHdoZW4g
dGV4dHVyZXMgYnV0IG5vIHNhbXBsZXJzIGJvdW5kCi0gcnVzdGljbC9rZXJuZWw6IGVtaXQgaW1h
Z2UvdGV4dHVyZSBiYXJyaWVycyBhZnRlciBhIGtlcm5lbCBsYXVuY2gKCktvbnN0YW50aW4gU2V1
cmVyICgxKToKLSByYWR2L3J0OiBSZXN0b3JlIGhpdCBhdHRyaWJzIGFmdGVyIHJlamVjdGluZyBB
QUJCcwpMaW9uZWwgTGFuZHdlcmxpbiAoNik6CgotIGFudjogcmVzcGVjdCBiaXRfc2l6ZS9udW1f
Y29tcG9uZW50IGZyb20gdGhlIElSIHdpdGggYWNjZWxlcmF0aW9uIHN0cnVjdHVyZXMKLSBibG9y
cDogZml4IHNoYWRlciBrZXJuZWwgcG9pbnRlciB3aXRoIG11bHRpIHNpemUga2VybmVscwotIGFu
djogYWRkIG1pc3NpbmcgY29uc3RhbnQgY2FjaGUgaW52YWxpZGF0aW9uIGluIERHQyBwYXRoCi0g
bmlyL2xvd2VyX2lucHV0X2F0dGFjaG1lbnRzOiBhZGQgc3VwcG9ydCBmb3IgaGVhcCBzdWJwYXNz
IGltYWdlIGxvYWQKLSBhbnY6IGRpc2FibGUgRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVfQ1lD
TEVTIHdpdGggVW5yZWFsRW5naW5lIDUuOAotIHZ1bGthbi93c2k6IGFkZCBtaXNzaW5nIHVzYWdl
MiBmbGFncwoKTG9yZW56byBSb3NzaSAoMik6CgotIHBhbi9iaTogRml4IHNwaWxsIGNvc3Qgb3Zl
cmVzdGltYXRpb24KLSBrcmFpZC9vcHRfY29weV9wcm9wOiBGaXggemVyby1leHRlbnNpb24gb24g
NjQtYml0IHN3aXp6bGVzCgpMdWlnaSBTYW50aXZldHRpICgyKToKCi0gcHZyOiBzcGVjdWxhdGl2
ZSBmaXggZm9yIG91dC1vZi1ib3VuZCBhY2Nlc3Mgb2Ygd2luc3lzX2hlYXBzCi0gcHZyOiBzZXQg
dGhlIFVNIHN0cmlkZSB3aGVuIHF1ZXJ5aW5nIGhlYXAgc3RhdGljIGFyZWFzCgpNYXJlayBPbMWh
w6FrICgxKToKLSByYWR2OiBmaXggY2hlY2tpbmcgd2hldGhlciBhIEZTIGlzIHByZXNlbnQKTWF0
dCBUdXJuZXIgKDExKToKCi0gZHJpOiBhbGxvY2F0ZSBNU0FBIGNvbG9yIGJ1ZmZlcnMgZm9yIGRy
aXN3IGltYWdlIGxvYWRlciBidWZmZXJzCi0gbGx2bXBpcGU6IGRvbid0IHNraXAgZHJhdydzIHZp
ZXdwb3J0IGNsaXBwaW5nIHdpdGhvdXQgdGhlIGxpbmVhciByYXN0ZXJpemVyCi0gbWVzYTogdXNl
IGEgYnl0ZS1hcnJheSBmb3JtYXQgZm9yIEdMX1JHQkE4IHRleHR1cmUgYnVmZmVycwotIG1lc2E6
IHN0b3JlIGJvb2xlYW4gY3VzdG9tIGdsR2V0IHZhbHVlcyBpbiB2YWx1ZV9ib29sCi0gbWVzYTog
cGFjayBHTF9NQVhfQ09NQklORURfRElNRU5TSU9OUyB3aXRob3V0IGRlcGVuZGluZyBvbiBieXRl
IG9yZGVyCi0gZHJpOiBkZXNjcmliZSBHUjE2MTYgYXMgUjE2RzE2X1VOT1JNCi0gdXRpbDogZml4
IHRoZSBaMzJfRkxPQVRfUzhYMjRfVUlOVCBjbGVhciB2YWx1ZSBvbiBiaWctZW5kaWFuCi0gdXRp
bC9mb3JtYXQ6IHN0b3JlIFIxMUcxMUIxMF9GTE9BVCBhbmQgUjlHOUI5RTVfRkxPQVQgaW4gaG9z
dCBieXRlIG9yZGVyCi0gdXRpbC9hc3RjOiByZWFkIHRoZSAxMjgtYml0IGJsb2NrIGFzIGxpdHRs
ZS1lbmRpYW4gd29yZHMKLSB1dGlsL2Zvcm1hdDogbWFrZSB0aGUgRlhUMSBjb2RlYyBpbmRlcGVu
ZGVudCBvZiBob3N0IGJ5dGUgb3JkZXIKLSBnYWxsaXZtOiByZWludGVycHJldCBpbWFnZSB0ZXhl
bHMgdXNpbmcgdGhlIHNoYWRlcidzIGZvcm1hdCBxdWFsaWZpZXIKCk1pa2UgQmx1bWVua3JhbnR6
ICg5KToKCi0gbGF2YXBpcGU6IGluZGVwZW5kZW50bHkgY2FsY3VsYXRlIHNyYy9kc3QgYmxpdCBk
ZXB0aAotIGxhdmFwaXBlOiBhZGQgbW9yZSBsYXlvdXRzIHRvIGx2cF9ob3N0X2NvcHlfaW1hZ2Vf
bGF5b3V0cwotIGxhdmFwaXBlOiBoYW5kbGUgcGxhbmFyIHZpZXdzIGFzIHJlbmRlcmluZyBhdHRh
Y2htZW50cwotIGxsdm1waXBlOiB1c2Ugb3NfZnJlZV9hbGlnbmVkIGZvciBub24tdm1hIGNhc2UK
LSBsYXZhcGlwZTogdXBkYXRlIHJldHVybmVkIHNpemUgaW4gR2V0UGlwZWxpbmVDYWNoZURhdGEK
LSB6aW5rOiBkb24ndCBjbGFpbSBWUkFNIG9uIGNwdSBpbXBsZW1lbnRhdGlvbnMKLSB6aW5rOiBj
aGVjayBzd2FwY2hhaW4gdGltbGluZSB3aGVuIHBydW5pbmcKLSB6aW5rOiBzdG9wIGxlYWtpbmcg
c3dhcGNoYWlucwotIHppbms6IGNsYW1wIHByZXNlbnQgcmVnaW9ucyB0byAweDAgd2hlbiBvdXQg
b2YgYm91bmRzCgpNaWtoYWlsIE1saGNubiAoMik6CgotIHBhbnZrL2NzZjogZmx1c2ggdGhlIEZB
VSBzdG9yZXMgYmVmb3JlIGluZGlyZWN0IGRyYXdzIHJlYWQgdGhlbQotIHBhbnZrL2NzZjogZ2l2
ZSBjb21wdXRlIGpvYnMgdGhlIFRMUyBzaXplIG9mIHRoZSBzaGFyZWQgYWxsb2NhdGlvbgoKT2xp
dmVyIENsYXJrZSAoMSk6Ci0gYXNhaGkvYWd4OiBBZGQgc2hpZnQgbWFzayBmb3IgYml0ZmllbGRf
ZXh0cmFjdCBhbmQgZnVzZWQgc2hpZnQgb3BzClBhdHJpY2sgR2Fza2luICgxKToKLSBlZ2w6IGRv
bid0IGNsb2JiZXIgYW4gaW5pdGlhbGl6ZWQgZGlzcGxheSdzIGRldmljZSBpbiBlZ2xHZXRQbGF0
Zm9ybURpc3BsYXkKUmFuZHkgUGFsYW1hciAoMSk6Ci0gYWNvL2luc2VydF9mcF9tb2RlOiBmaXgg
cm91bmRpbmcgbW9kZSBmb3IgZm1hX21peGhpX2YxNgpSaHlzIFBlcnJ5ICgxKToKLSBhY28vcmE6
IGNoZWNrIG5leHQgcmVnaXN0ZXIgYWdhaW5zdCBib3VuZHMgaW4gc3ViZHdvcmQgZ2V0X3JlZ19z
aW1wbGUgcGF0aApSeWFuIFpoYW5nICgyKToKCi0gcGFudms6IHZhbGlkYXRlIGRlc2NyaXB0b3Ig
Y291bnRzIGluIHNoYWRlciBkZXNlcmlhbGl6YXRpb24KLSBwYW52ay9jc2Y6IGNoZWNrIG1hbGxv
YyByZXR1cm4gdmFsdWVzIGluIHF1ZXVlIHN1Ym1pdCBzdG9yYWdlIGluaXQKClNhbXVlbCBQaXRv
aXNldCAoMTIpOgoKLSByYWR2OiBmaXggaW5pdGlhbGl6aW5nIHRoZSBEQ0MgcHJlZGljYXRpb24g
dmFsdWUgd2hlbiBzdG9yZXMgYXJlbid0IHN1cHBvcnRlZAotIHJhZHY6IGZpeCBpbml0aWFsaXpp
bmcgRENDIHdpdGggbWlwbWFwcyBvbiBHRlg4Ci0gcmFkdjogZGlzYWJsZSBiaW5uaW5nIGNvcnJl
Y3RseSBvbiBHRlg5LTExCi0gcmFkdjogZml4IGEgdHlwbyB3aGVuIGNvbXB1dGluZyB0aGUgYmlu
bmluZyBzaXplIG9uIEdGWDEwLTExLjcKLSByYWR2OiBhZGQgcmFkdl9kaXNhYmxlX2Jpbm5pbmdf
Z2Z4MTEgYW5kIGVuYWJsZSBmb3IgU3Vuc2V0IE92ZXJkcml2ZQotIG5pci9sb3dlcl9hYm9ydDog
Zml4IHBheWxvYWQgYWxpZ25tZW50IHRvIDgtYnl0ZXMKLSByYWR2OiBkbyBub3QgYWJvcnQgd2hl
biB0aGUgYXBwIHNwZWNpZmllcyBhbiBpbnZhbGlkIG1vZGlmaWVyCi0gcmFkdjogZG8gbm90IGFi
b3J0IHdoZW4gYSBHUFUgaGFuZyByZXBvcnQgaXMgY3JlYXRlZCB3aXRoCiAgZGV2aWNlRmF1bHRW
ZW5kb3JCaW5hcnkKLSByYWR2OiBmaXggZGVwdGgvc3RlbmNpbCBhc3BlY3RzIGZvciByZXNvbHZl
cwotIHJhZHY6IGZpeCBpbW11dGFibGUgc2FtcGxlcnMgbGlmZXRpbWUgd2l0aCBkZXNjcmlwdG9y
IHVwZGF0ZSB0ZW1wbGF0ZXMKLSByYWR2OiBmaXggZGlydHlpbmcgZ3JhcGhpY3Mgc2hhZGVycyB3
aGVuIHNoYWRlciBvYmplY3RzIGFyZSBib3VuZAotIHJhZHY6IGlnbm9yZSBhc3BlY3RzIHRoYXQg
aGF2ZSBubyBlZmZlY3RzIGR1cmluZyBjbGVhcnMKClRhcGFuaSBQw6RsbGkgKDEpOgotIGFudjog
YWRkIGFkZGl0aW9uYWwgaGV1cmlzdGljIHRvIHNpbWQzMiBhc3N1bXB0aW9uIHBhc3MKVGltb3Ro
eSBBcmNlcmkgKDEpOgotIG5pcjogdGVtcG9yYXJpbHkgZGlzYWJsZSBmbG9hdGluZyBwb2ludCBl
eGNlcHRpb24gZmxhZ3MKVHVwaWxpIEtyaXNobmEgR293dGhhbSBSZWRkeSAoMSk6Ci0gZnJlZWRy
ZW5vL2E2eHg6IGVuYWJsZSBmMTYgaW5maW5pdGllcyBmb3IgZnJlZWRyZW5vIGRyaXZlcgpWYWxl
bnRpbmUgQnVybGV5ICgyKToKCi0gbmlyL2xvd2VyX3N1Ymdyb3VwczogRml4IHZvdGUgbG93ZXJp
bmcgd2l0aCB2ZWN0b3IgYmFsbG90cwotIGlyMzogTG93ZXIgcXVhZCB2b3RlcwoKVmluc29uIExl
ZSAoMSk6Ci0gcHBzOiBJbml0aWFsaXplIENvdW50ZXIgbWVtYmVyIHZhcmlhYmxlIHVuaXRzClZp
bsOtY2l1cyAoMSk6Ci0gYWMvZ3B1X2luZm86IG1ha2UgUENJZSA0LjAgYW5kIDUuMCBsYW5lIGJh
bmR3aWR0aCBleGFjdCBtdWx0aXBsZXMgb2YgMy4wCllpd2VpIFpoYW5nICgxKToKLSBwYW4va21v
ZDogZHVtbXkgQk8gaXMgcGVyIFZNIGZvciBlbXVsYXRlZCBzcGFyc2UKam9lLndhbmcgKDEpOgot
IHJhZHY6IGFsc28gYXBwbHkgdGhlIERpUlQgNCBIaVogd29ya2Fyb3VuZCBwcm9maWxlIHRvIHRo
ZSBuYXRpdmUgcG9ydAptYXR0aGV3cGVyaXV0ICgxKToKLSB2ZW51czogaG9ub3IgdGhlIHZpcnRp
by1ncHUgYmxvYiBhbGlnbm1lbnQKCk1lc2EgMjYuMi41IFJlbGVhc2UgTm90ZXMgLyAyMDI2LTEw
LTE0Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpNZXNhIDI2LjIuNSBp
cyBhIGJ1ZyBmaXggcmVsZWFzZSB3aGljaCBmaXhlcyBidWdzIGZvdW5kIHNpbmNlIHRoZSAyNi4y
LjQKcmVsZWFzZS4KCk1lc2EgMjYuMi41IGltcGxlbWVudHMgdGhlIE9wZW5HTCA0LjYgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKZ2xHZXRTdHJpbmcoR0xfVkVSU0lPTikgb3IgZ2xH
ZXRJbnRlZ2VydihHTF9NQUpPUl9WRVJTSU9OKSAvCmdsR2V0SW50ZWdlcnYoR0xfTUlOT1JfVkVS
U0lPTikgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KU29tZSBk
cml2ZXJzIGRvbid0IHN1cHBvcnQgYWxsIHRoZSBmZWF0dXJlcyByZXF1aXJlZCBpbiBPcGVuR0wg
NC42LiBPcGVuR0wKNC42IGlzICoqb25seSoqIGF2YWlsYWJsZSBpZiByZXF1ZXN0ZWQgYXQgY29u
dGV4dCBjcmVhdGlvbi4KQ29tcGF0aWJpbGl0eSBjb250ZXh0cyBtYXkgcmVwb3J0IGEgbG93ZXIg
dmVyc2lvbiBkZXBlbmRpbmcgb24gZWFjaCBkcml2ZXIuCgpNZXNhIDI2LjIuNSBpbXBsZW1lbnRz
IHRoZSBPcGVuQ0wgMy4xIEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBDTF9E
RVZJQ0VfVkVSU0lPTiwgQ0xfREVWSUNFX05VTUVSSUNfVkVSU0lPTiBhbmQKQ0xfREVWSUNFX09Q
RU5DTF9DX0FMTF9WRVJTSU9OUwpjbEdldERldmljZUluZm8gcXVlcmllcyBkZXBlbmRzIG9uIHRo
ZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKTWVzYSAyNi4yLjUgaW1wbGVtZW50cyB0
aGUgVnVsa2FuIDEuNCBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgYXBpVmVy
c2lvbiBwcm9wZXJ0eSBvZiB0aGUgVmtQaHlzaWNhbERldmljZVByb3BlcnRpZXMgc3RydWN0CmRl
cGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuCgpTSEEgY2hlY2tzdW1z
Ci0tLS0tLS0tLS0tLS0KCjo6CgogICAgU0hBMjU2OiA3OTRiM2QxNzI5MDc1ZGFlN2ViZDQ3Yzcy
ODNiN2NhMGNkYjVkZWM2NjhmN2YxMWNjMGE1ZDgyZjYxMzhhMGE1CiAgICBtZXNhLTI2LjIuNS50
YXIueHoKICAgIFNIQTUxMjogMDhjN2Q3ZWE0MjZkZGZiMGY3YmM1MWIwNmUxOGMzNjNhNGQzMWNm
MWE4YjIwMzgyOGJiNDU1ZWRhMDE4OWU0MWQyMjEKICAgIDVlYjlmNjI3NTg1ZWQxMWUwZDBmMjMx
YTZhOGM5ZjBjNzE3NjIzODc2MGNkNzZiNjJlMjBjMzVjY2Q2YQogICAgbWVzYS0yNi4yLjUudGFy
Lnh6CgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgotIE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0t
LS0KCi0gTWVzYSAyNi4yLjEgR3JvdW5kIFRydXRoIEFtYmllbnQgT2NjbHVzaW9uIEJyb2tlbiBv
biBObyBNYW4ncyBTa3kKLSBNZXNoIHNoYWRlciB1bmlmb3JtL2NvbnN0YW50IHJlbmRlcmluZyBp
c3N1ZQotIFJBRFYgcmVncmVzc2lvbiBpbiBNZXNhIDI2LjIueCDigJMgTm8gTWFuJ3MgU2t5IGhh
cyBicm9rZW4vZGFyayBzdW5saWdodCBvbiBSWAogIDc5MDAgWFQKLSBSZWdyZXNzaW9uOiBEM0Qx
MiBkcml2ZXIgYW5kIERSSSBicm9rZW4gdW5kZXIgV1NMIGluIDI1LjAuNAotIFNJR0lMTCB3aXRo
IGxsdm1waXBlIG9uIEFSTXY5KD8pIHdpdGhvdXQgU1ZFCi0gWC1QbGFuZSAxMiBlbmNvdW50ZXJp
bmcgYSBHUFUgY3Jhc2ggb24gbG9hZCBhZnRlciByZWNlbnQgdXBkYXRlLgotIFtGb3J0cyBSVFNd
IENvcnJ1cHQgcmVuZGVyaW5nIG9mIGNvbXByZXNzZWQgdGV4dHVyZXMKLSBhY286IGlsbGVnYWwg
Vk9QMyB2X2NuZG1hc2tfYjMyIHdpdGggdHdvIFNHUFIgb3BlcmFuZHMgb24gR0ZYNi05IGluCiAg
ZW1pdF9zY2FsZWRfb3AgKGZwMzIgZGVub3JtIHByZXNlcnZlKSDihpIgd3JvbmcgcmVzdWx0cwot
IHJhZGVvbnNpOiBpbmNvcnJlY3QgcmVuZGVyaW5nIGluIERvb20gMzogQkZHCi0gcmFkdi9hbWRn
cHU6IHBhZGRpbmcgVk0gcGFnZSAoUkFERU9OX0ZMQUdfVk1fUEFEXzFQQUdFKSBpcyBuZXZlciB1
bm1hcHBlZCBvbgogIEJPIGRlc3Ryb3k7IFZBIHJldXNlIHRoZW4gZmFpbHMgd2l0aCAidmEgLi4u
IGNvbmZsaWN0IiBvbiBHRlg5Ci0gcnVzdGljbDogY291bGQgbm90IGluaXRpYWxpemUgU1ZNIHN1
cHBvcnQgd2l0aCByYWRlb25zaSx6aW5rCi0gemluazogd3JvbmcgcGlwZWxpbmUgYWZ0ZXIgYSB2
ZXJ0ZXgtbGF5b3V0LW9ubHkgY2hhbmdlIHdpdGhvdXQKICBWS19FWFRfdmVydGV4X2lucHV0X2R5
bmFtaWNfc3RhdGUKCkNoYW5nZXMKLS0tLS0tLQoKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gaXJpczog
RnJlZSBjb21wdXRlIGNvbXBpbGF0aW9uIGNvbnRleHQgb24gZmFpbHVyZQpDaHJpc3RpYW4gR21l
aW5lciAoMik6CgotIGV0bmF2aXY6IFVwZGF0ZSB2YWxpZF9idWZmZXJfcmFuZ2UgZm9yIHN0cmVh
bSBvdXRwdXQgYnVmZmVycwotIGV0bmF2aXY6IFNraXAgcmVuZGVyIGNvbXBhdGliaWxpdHkgZm9y
IGV4dGVybmFsIFRTIHBsYW5lIHJlc291cmNlcwoKQ29ubm9yIEFiYm90dCAoMSk6Ci0gdnVsa2Fu
L2dyYXBoaWNzX3N0YXRlOiBEb24ndCBnZXQgSUFMIHN0YXRlIHdoZW4gbm90IG5lZWRlZApEZXJl
ayBMZXNobyAoMSk6Ci0gemluazogQ2F0Y2ggYWxsIHByaW9yIHVwZGF0ZXMgdG8gc291cmNlIHZh
bGlkX2J1ZmZlcl9yYW5nZS4KRG1pdHJ5IEJhcnlzaGtvdiAoNyk6CgotIGZyZWVkcmVuby9jb21t
b246IGZsYWcgYSB3b3JrYXJvdW5kIGZvciBDUF9EUkFXX0FVVE8gaXNzdWUgaW4gYTYzMF9zcWUK
LSBmcmVlZHJlbm8vcmVnaXN0ZXJzOiBkZWZpbmUgZm9ybWF0IG9mIHRoZSBQQ19BVVRPX1ZFUlRF
WF9TVFJJREUgcmVnaXN0ZXIKLSBmcmVlZHJlbm8vYTZ4eDogd29ya2Fyb3VuZCBhbiBpc3N1ZSBp
biBhNjMwX3NxZS5mdwotIHR1OiB3b3JrYXJvdW5kIGFuIGlzc3VlIGluIGE2MzBfc3FlLmZ3Ci0g
ZnJlZWRyZW5vL2E1eHg6IHNldCB0aGUgc2FtcGxlIGNvdW50IGJlZm9yZSB0aGUgR01FTSByZXN0
b3JlIGJsaXRzCi0gZnJlZWRyZW5vL2E1eHg6IHdyaXRlIHRoZSBsaW5lYXIgY2VudHJvaWQgaW50
ZXJwb2xhdG9yIHJlZ2lkCi0gaXIzOiBrZWVwIHRoZSBtc2FhIGtleSBmb3Igc2hhZGVycyB0aGF0
IGludGVycG9sYXRlIGF0IGdsX1NhbXBsZUlECgpEb21pbmlxdWUgQmVsaGFjaGVtaSAoMSk6Ci0g
cGNvOiBmaXggd29ya2dyb3VwIGJhcnJpZXIgcmFjZSB3aGVuIHJldXNlZCBhY3Jvc3MgbG9vcCBp
dGVyYXRpb25zCkR5bGFuIEJha2VyICgxKToKLSBpbnRlbC9qYXk6IERvbid0IGF0dGVtcHQgdG8g
ZG8gd29yayB3aGVuIHRoZXJlIGlzIG5vbmUKRXJpYyBFbmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBh
ZGQgc2hhIHN1bSBmb3IgMjYuMi40Ci0gLnBpY2tfc3RhdHVzLmpzb246IFVwZGF0ZSB0byA4MWRm
ZjdjNjRmYjBjMWYyMDMxZDA0Y2NmZjk5NzIyMzNlMmUwNTI0Ci0gLnBpY2tfc3RhdHVzLmpzb246
IE1hcmsgYTgyZWQ4NTA4ODk1NDIwNmZiMWMzMGQwMTZmMTgzMTBmYTYxNDI3OSBhcwogIGRlbm9t
aW5hdGVkCgpFcmljIFIuIFNtaXRoICgxKToKLSBwYW5mcm9zdDogZml4IFVCIGluIHBhbl9jc2Yg
cG9pbnRlciBiYXNlZCB0eXBlLXB1bm5pbmcKRmFiaW8gUGlwYXJvICgxKToKLSB2YzQ6IGRvbid0
IHJldXNlIGZsYWdzIGZyb20gYmVmb3JlIGEgdGhyZWFkIHN3aXRjaApGcmFuayBCaW5ucyAoMSk6
Ci0gcHZyOiBmaXggZm9yIGpvYiBzYW1wbGVzIGJlaW5nIGluaXRpYWxpc2VkIHRvIDAKRnJhbmsg
Qm91d2VyICgxKToKLSBwdnI6IGZpeCBmb3IgbXVsdGlzYW1wbGluZyB3aXRoIG5vIGF0dGFjaG1l
bnRzCkdlb3JnIExlaG1hbm4gKDQpOgoKLSB2dG46IGFkZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhh
Y3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGFkZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhhY3QgR0xT
THN0ZDQ1MEZtYQotIHJhZHY6IGZvcmNlIGV4YWN0IEdMU0xzdGQ0NTBGbWEgZm9yIE5vIE1hbiBT
a3kKLSBhY286IGZpeCBjb25zdGFudCBidXMgdmlvbGF0aW9uIGZvciBzY2FsZWQgdHJhbnNjZW5k
ZW50YWwgb3AKCkd1c3Rhdm8gTm9yb25oYSBTaWx2YSAoMSk6Ci0gdmVudXM6IGRvbid0IHJ1biBh
IHRocmVhZCdzIFRMUyB0ZWFyZG93biBmcm9tIGFuIHVubG9hZGVkIGRyaXZlcgpJYW4gUm9tYW5p
Y2sgKDEpOgotIG5pci9hbGdlYnJhaWM6IERvbid0IGdlbmVyYXRlIDY0LWJpdCBpYWRkMyB3aGVu
IG5vdCBzdXBwb3J0ZWQKSWNlbm93eSBaaGVuZyAoMik6CgotIGxsdm1waXBlOiBkbyBub3QgY2Fs
bCBMTFZNTGlua0luTUNKSVQoKSB3aGVuIHVzaW5nIE9yY0pJVAotIG1lc29uOiBsaW5rIGluIG9y
Y2ppdCBpbnN0ZWFkIG9mIG1jaml0IHdoZW4gdXNpbmcgT3JjSklUCgpKYWRlIE1hY2hvICgxKToK
LSBnYWxsaXVtL3N3OiBGaXggbGx2bXBpcGUgYmVpbmcgY2hvc2VuIHdoZW4gbm90IHdhbnRlZApK
ZW9uZ2lrIENoYSAoMSk6Ci0gZ2Z4c3RyZWFtOiBhbGxvdyBWS19FWFRfdmVydGV4X2F0dHJpYnV0
ZV9kaXZpc29yIGFnYWluCkpvcmRhbiBKdXN0ZW4gKDIpOgoKLSBpbnRlbC9nZW4vY29tcGFjdDog
Rml4IHR5cG8gaW4gWGUzUCBjb21wYWN0IHRhYmxlcwotIGludGVsL2dlbi9jb21wYWN0OiBGaXgg
VU5DT01QXzNTUkNfU09VUkNFIGZvciBYZTNQCgpLYXJvbCBIZXJic3QgKDIpOgoKLSBydXN0aWNs
L2NvbnRleHQ6IHNraXAgbm9uIFNWTSBkZXZpY2VzIGluIGNsU1ZNQWxsb2MKLSBydXN0aWNsL3Bs
YXRmb3JtOiBza2lwIG5vbiBTVk0gZGV2aWNlcyB3aGVuIGNyZWF0aW5nIHRoZSBWTSBoZWFwCgpL
b25zdGFudGluIFNldXJlciAoMSk6Ci0gcmFkdjogQWxpZ24gYnZoIHRvIDEyOCBieXRlcyBvbiBH
RlgxMgpMZW9uIFNlZW1hbm4gKDEpOgotIHppbms6IHVwZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiBv
bmx5IHRoZSB2ZXJ0ZXggaW5wdXQgc3RhdGUgY2hhbmdlcwpMaW9uZWwgTGFuZHdlcmxpbiAoNCk6
CgotIGFudjogZml4IGR5bmFtaWMgYnVmZmVyIGJhc2Ugb2Zmc2V0IHVwbG9hZAotIGFudjogc3Rv
cmUgYXZhaWxhYmlsdHkgYmVmb3JlIHdyaXRpbmcgcGFydGlhbCByZXN1bHRzCi0gYW52OiBmZW5j
ZSBNSSBhdmFpbGFiaWx0eSB3cml0ZXMKLSBhbnY6IHRyYWNrIHRoZSBxdWVyeSBwb29sIGNvcGll
cyBmb3IgcmVzZXRzCgpMb2tib25kbyBLdW5nICgxKToKLSBsbHZtcGlwZTogZml4IHVic2FuIHNo
aWZ0IGV4cG9uZW50IHRvbyBsYXJnZSBlcnJvcgpMdWNpZSBIYXJ0bWFubiAoMSk6Ci0gZ2FsbGl2
bTogUXVlcnkgaG9zdCBDUFUgZmVhdHVyZXMgb24gYWFyY2g2NCB0b28KTWFyZWsgT2zFocOhayAo
MSk6CgotIHJhZHY6IGZpeCB0byB1c2UgSFRJTEUgZmlsbHMgaW5zdGVhZCBvZiBSTVcgc2hhZGVy
cyB0byByZXN0b3JlIHByZXZpb3VzCiAgYmVoYXZpb3IKCk1hcnkgR3VpbGxlbWFyZCAoMyk6Cgot
IG52ay9udmttZDogaGFuZGxlIGV4ZWNfY291bnQgPT0gMCBpbiBudmttZF9ub3V2ZWF1X2V4ZWNf
Y3R4X2V4ZWMKLSBub3V2ZWF1L21tZTogQWRkIGRlcGVuZGVuY3kgb24gbXRoZCBmb3IgRFJFQUQv
RFdSSVRFCi0gbm91dmVhdS9tbWU6IEZpeCBzY3JhdGNoX3NoYXJlXzNkX3RvX2NvbXB1dGUgdGVz
dAoKTWF0dCBUdXJuZXIgKDkpOgoKLSBnYWxsaXZtOiBkb24ndCB1c2UgdGhlIHMzdGMgYW5kIHJn
dGMgSklUIGRlY29kZXJzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBwaWNrIHRoZSByaWdodCBs
YW5lIGZvciBpbWFnZSBzdG9yZXMgd2lkZXIgdGhhbiAzMiBiaXRzIG9uIGJpZy1lbmRpYW4KLSBn
YWxsaXZtOiBmaXggZmlyc3RfYWN0aXZlX2ludm9jYXRpb24oKSBvbiBiaWctZW5kaWFuCi0gZ2Fs
bGl2bTogZml4IHVucGFja182NF8yeDMyX3NwbGl0IGZvciBzY2FsYXJzIG9uIGJpZy1lbmRpYW4K
LSBnYWxsaXZtOiBvbmx5IHVzZSB2bWF4ZnAgZm9yIDMyLWJpdCBmbG9hdHMKLSBnYWxsaXZtOiBk
b24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBOYU4gb3BlcmFuZHMgbXVzdCBiZSBpZ25v
cmVkCi0gZ2FsbGl2bTogdXNlIFZTWCBmb3Igcm91bmRpbmcgd2hlbiBhdmFpbGFibGUKLSBnYWxs
aXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBWU1ggaXMgYXZhaWxhYmxlCi0g
bmlyLCBnbHNsLCBnYWxsaXVtOiBrZWVwIHRoZSBoYWx2ZXMgb2YgbG93ZXJlZCA2NC1iaXQgSU8g
aW4gbWVtb3J5IG9yZGVyCgpNYXR0aGlldSBNb2F0dGkgKDEpOgotIHBhbi9iaTogUmVzdG9yZSBW
QV9NRU1PUllfQUNDRVNTX0ZPUkNFIGZvciBzcGlsbHMgYW5kIHJlZmlsbHMKTWlrZSBCbHVtZW5r
cmFudHogKDI3KToKCi0gemluay9rb3BwZXI6IGZpeCBjaGVjayBmb3IgYXN5bmMgcHJlc2VudHMK
LSB6aW5rL2tvcHBlcjogd2FpdCBvbiBhc3luYyBwcmVzZW50cyB3aGVuIHVwZGF0aW5nIHN3YXBj
aGFpbgotIHppbmsva29wcGVyOiBzdG9wIGxlYWtpbmcgc3dhcGNoYWlucyBoYXJkZXIKLSB6aW5r
L2tvcHBlcjogZG8gYSBmdWxsIGdsdGhyZWFkL3RjIHN5bmMgd2hlbiBzZXR0aW5nIHN3YXAgaW50
ZXJ2YWwKLSB6aW5rL2tvcHBlcjogdXNlIHRoZSBhY3R1YWwgY3VycmVudCBpbWFnZSBleHRlbnQg
d2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5rOiByZXR1cm4gb24gZmx1c2hfZnJvbnRi
dWZmZXIgaWYgc3dhcGNoYWluIGlzIGtpbGwKLSB6aW5rL2tvcHBlcjogZml4IHJldHVybiB2YWx1
ZSBpbiBhY3F1aXJlCi0ga29wcGVyOiBtb3ZlIGV2ZW50IHNlbGVjdGlvbiBmb3IgcHJlc2VudCBp
bnRvIGtvcHBlckdldFN5bmNWYWx1ZXMKLSB6aW5rL2tvcHBlcjogYWRkIGxvY2tpbmcgYXJvdW5k
IEFOSSBhbmQgUVAKLSB6aW5rL2tvcHBlcjogZml4IGludmFsaWQgcmVhZCBkdXJpbmcgc3dhcGNo
YWluIHRlYXJkb3duCi0gdXRpbC90ZXhjb21wcmVzc19yZ3RjOiB6ZXJvLWluaXRpYWxpemUgZW5j
b2RlIHZhcmlhYmxlcwotIHppbmsvc3luYzogcGx1ZyBhbiBleHRyZW1lbHkgdHJpY2t5IGhvbGUg
aW4gcmVvcmRlcmluZyBsb2dpYwotIHV0aWwvZGlza19jYWNoZTogb25seSBzdWJ0cmFjdCBhbiBl
dmljdGVkIGl0ZW0gaWYgdW5saW5rIHN1Y2NlZWRlZAotIHV0aWwvZGlza19jYWNoZTogcHV0IGd1
YXJkIHBhZ2VzIGFyb3VuZCB0aGUgaW5kZXggbWFwcGluZwotIHV0aWwvZGlza19jYWNoZTogcmV0
dXJuIHdoZXRoZXIgZXZpY3RfbHJ1X2l0ZW0gcmVtb3ZlZCBhIGZpbGUKLSB1dGlsL2Rpc2tfY2Fj
aGU6IHJlY29tcHV0ZSBhbiBpbXBvc3NpYmxlIHNpemUgY291bnRlciBvbiBvcGVuCi0gdXRpbC9k
aXNrX2NhY2hlOiByZWNvbXB1dGUgdGhlIHNpemUgd2hlbiBldmljdGlvbiBjYW5ub3QgaGVscAot
IHV0aWwvZGlza19jYWNoZTogcmVtb3ZlIHN0YWxlIC50bXAgZmlsZXMgd2hlbiByZWNvbXB1dGlu
ZyB0aGUgc2l6ZQotIHN0L3Bibzogc2tpcCBkZWxldGVfY29tcHV0ZV9zdGF0ZSBmb3Igc2hhZGVy
cyBuZXZlciBjcmVhdGVkCi0gemluazogY2xlYXIgdGhlIGdlbmVyYXRlZCB0Y3MgbmlyIHBvaW50
ZXIgYWZ0ZXIgaXQgaXMgZnJlZWQKLSB6aW5rOiBjaGVjayB1bmZsdXNoZWQgdW5kZXIgdGhlIHVz
YWdlIG11dGV4IGluIHRoZSB1bmZsdXNoZWQgd2FpdAotIHppbms6IHRha2UgcmFsbG9jX2xvY2sg
YXJvdW5kIHNjcmVlbi1wYXJlbnRlZCByYWxsb2NzCi0gemluazogc3RvcCBwYXJlbnRpbmcgdGhl
IHNjcmVlbidzIHNlbWFwaG9yZSBhcnJheXMgdG8gdGhlIHNjcmVlbgotIHppbms6IHNlcmlhbGl6
ZSB1bnRocmVhZGVkIGJhdGNoIHN1Ym1pc3Npb24gcGVyIHNjcmVlbgotIHppbms6IGZvcmNlIHN5
bmMgYWZ0ZXIgdW5iaW5kLCBldmVuIHdpdGggR0VORVJBTCBsYXlvdXRzCi0gemluazogZW5zdXJl
IGRlc2NyaXB0b3IgYnVmZmVycyBzdGF5IG1hcHBhYmxlIHdpdGhvdXQgQkFSIGFsbG9jCi0gemlu
azogYXZvaWQgY29uc3RhbnRseSBmYWlsaW5nIEJBUiBhbGxvY2F0aW9ucyBvbiBzeXN0ZW1zIHdp
dGhvdXQgUmVCQVIKCk1pa2hhaWwgTWxoY25uICgyKToKCi0gdXRpbC90YzogcmVzZXQgZW5kX2Nh
bGwgd2hlbiBycCBpbmZvIGlzIHJldXNlZCBhZnRlciBzeW5jCi0gdXRpbC90YzogZml4IGJ1ZmZl
ciBvdmVyLXJlYWQgYW5kIHRocmVhZCByYWNlIGluIHN0YWdpbmcgdGV4dHVyZV9zdWJkYXRhCgpO
aWtpdGEgS29udG9uICgxKToKLSByYWRlb25zaTogaW52YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBh
dCBJQiBzdGFydCBvbiBhbGwgZ2Z4IGxldmVscwpPbGl2aWEgTGVlICgxKToKLSBwYW52azogZml4
IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBHZXRJbnN0YW5jZVByb2NBZGRyCk9tYXIgUmFz
aHdhbiAoMik6CgotIG5pci9pbnN0cl9zZXQ6IGNvbXBhcmUgdGV4IGRlZiB3aGVuIENTRWluZyB0
ZXh0dXJlIGluc3RydWN0aW9ucwotIG5pci9pbnN0cl9zZXQ6IGNvbXBhcmUgdGV4IGRlc3RfdHlw
ZSBpbnN0ZWFkIG9mIGJpdCBzaXplIHdoZW4gQ1NFaW5nIHRleHR1cmUKICBpbnN0cnVjdGlvbnMK
ClBldGVyIFF1YXlsZSAoMSk6Ci0gcHZyOiBmaXggc3RyZWFtLW91dCBQRFMgZGF0YSBzaXplIHVu
aXRzIGluIENTQiBkdW1wClBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICgzKToKCi0gcmFkZW9u
c2k6IHJlbW92ZSBpbnZhbGlkIGFzc2VydAotIHJhZGVvbnNpL2dmeDEyOiBkb250IHNldCBCTyBt
ZXRhZGF0YSBvbiBpbXBvcnQKLSB3aW5zeXMvYW1kZ3B1OiBmaXggaW1wb3J0L2Rlc3Ryb3kgcmFj
ZSBhZ2FpbgoKUm9iIENsYXJrICgxKToKLSBmcmVlZHJlbm8vY29tbW9uOiBGaXggYTcwMiBjaGlw
LWlkClNhbXVlbCBQaXRvaXNldCAoNCk6CgotIHJhZHYvcnQ6IGZpeCBjaGVja2luZyBlcnJvcnMg
Zm9yIGltcG9ydGVkIGJpbmFyaWVzCi0gcmFkdi9ydDogZml4IGltcG9ydGluZyBwaXBlbGluZSBi
aW5hcmllcwotIHJhZHYvbmlyOiBmaXggZGV0ZXJtaW5pbmcgaWYgYSBWUyBpbnB1dCBsb2NhdGlv
biBpcyBoaWdoIDY0LWJpdAotIHJhZHYvYW1kZ3B1OiB1bm1hcCB0aGUgZmlyc3QgcGFnZSB1c2Vk
IHRvIGltcGxlbWVudCBWTSBwYWRkaW5nCgpTaW1vbiBQZXJyZXR0YSAoMSk6Ci0gcGNvOiB0ZW1w
b3JhcmlseSBkaXNhYmxlIHZ0eGluIGFsbG9jYXRpb24gZHVlIHRvIHZlYyBoYW5kbGluZyBidWcK
VGhvbmcgVGhhaSAoMSk6Ci0gZHJpY29uZjogQWRkIGlnbm9yZV9tYXBfaW52YWxpZGF0ZV9idWZm
ZXIgb3B0aW9uClRpbW90aHkgQXJjZXJpICg1KToKCi0gcmFkZW9uc2k6IGNvcnJlY3RseSBkZXRl
Y3QgYW5kIHNldCBtZXNoIHNoYWRlcnMgYXMgZGlydHkKLSByYWRlb25zaTogd2lkZW4gYmluZF9o
aXN0b3J5IGJpdGZpZWxkCi0gZ2FsbGl1bS90Yy96aW5rOiB3aWRlbiByZWJpbmRfbWFzayB0byBz
dXBwb3J0IHVzZSBieSBtZXNoIHNoYWRlcnMKLSB6aW5rOiBmaXggcmViaW5kaW5nIHN1cHBvcnQg
Zm9yIG1lc2ggc2hhZGVycwotIHV0aWwvZm9ybWF0OiBmaXggdHlwbyBpbiB0aGUgQlBUQyBjb21w
cmVzc29yCgpWaW5zb24gTGVlICgxKToKLSBlZ2w6IEZpeCBpbnQtdG8tdm9pZC1wb2ludGVyLWNh
c3Qgd2FybmluZyBvbiBtYWNPUwptYXR0aGV3cGVyaXV0ICgxKToKLSB2ZW51czogc2tpcCB2aXJ0
aW8tZ3B1IGRldmljZXMgd2l0aG91dCAzRAptaXR1bDcyICgxKToKLSByYWR2OiBDbGVhciBzdGFs
ZSB2ZXJ0ZXggdXNlciBTR1BSIHN0YXRlIHdoZW4gYmluZGluZyBtZXNoIHNoYWRlcnMKc29rYSAo
MSk6Ci0gemluazogY2hlY2sgdGhlIHByaW1pdGl2ZSB0eXBlIGFmdGVyIHppbmtfYmF0Y2hfcnAo
KQoKTWVzYSAyNi4yLjYgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMTAtMjgKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi42IGlzIGEgYnVnIGZpeCByZWxlYXNl
IHdoaWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuNQpyZWxlYXNlLgoKTWVzYSAy
Ni4yLjYgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBv
cnRlZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9S
X1ZFUlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRo
ZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9y
dCBhbGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMg
Kipvbmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21w
YXRpYmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBv
biBlYWNoIGRyaXZlci4KCk1lc2EgMjYuMi42IGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJ
LCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9E
RVZJQ0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05T
CmNsR2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVy
IGJlaW5nIHVzZWQuCgpNZXNhIDI2LjIuNiBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwg
YnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRo
ZSBWa1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGlj
dWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoK
ICAgIFRCRC4KCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0t
LS0tLS0tLQoKLSBBQ086IHNfYml0c2V0MCByZXRhcmdldGVkIHRvIGV4ZWMgZHJvcHMgdGhlIFZD
QyBjb25kaXRpb24gKDI2LjIgcmVncmVzc2lvbgogIGZyb20gOTg0YWE2ZTA4NTUsIFJBRFYsIFJE
TkEyIHRvIFJETkE0LCBLeXR5UFM1KQotIEFOVjogQXNzZXJ0IG9uIHZrR2V0UGh5c2ljYWxEZXZp
Y2VJbWFnZUZvcm1hdFByb3BlcnRpZXMyCi0gQ29uZmlkZW50aWFsIGlzc3VlICMxNjYzMAotIEdQ
VUxvc3REZXZpY2Ugb24gNjgwMCBYVCAobWVzYS0yNi4wLlgpCi0gSW50ZWwgTWV0ZW9yIExha2U6
IFVuaWdpbmUgSGVhdmVuIGFuZCBWYWxsZXkgdHJpZ2dlciBHUFUgaGFuZ3Mgd2l0aCBNZXNhCiAg
MjYuMi4w4oCTMjYuMi40OyB3b3JrIHdpdGggMjYuMS44Ci0gV2l0Y2hlciAzIFJlbWFzdGVyZWQg
LSBHcmFwaGljYWwvdmlzdWFsIGJ1ZyB0aGF0IGFjdCBsaWtlIGFuIG92ZXJsYXkKLSBbVHVybmlw
L0E2NTBdIEhhbmdzIGluIHNldmVyYWwgc2V2ZXJhbCBnYW1lcyBkdWUgdG8gc29tZSBtaXNzaW5n
IHNoYWRlcig/KQogIHdvcmthcm91bmQKLSBkM2QxMiAoV1NMMiwgTlZJRElBIFJUWCA1MDkwKTog
c2VsZi1kZWFkbG9jayBpbiBkM2QxMl9ib19uZXcoKSwgcmVjbGFpbSB1bmRlcgogIHBiX3NsYWIg
bWFuYWdlciBtdXRleCBoYW5ncyBSUENTMyBvbiBjb21wcmVzc2VkIHRleHR1cmUgdXBsb2FkCi0g
ZnJlZWRyZW5vOiBnYXJibGVkIHRleHQgcmVuZGVyZWQgYnkgcGRmLmpzIG9uIHNuYXBkcmFnb24g
eDEgZWxpdGUKLSBrb3BwZXI6IG5vbi1kbWFidWYgc3cgdGV4dHVyZSB1cGRhdGUgaXMgYnJva2Vu
Ci0gbGF2YXBpcGU6IG1haW50ZW5hbmNlOCBkZXB0aC9zdGVuY2lsIDwtPiBjb2xvciB2a0NtZENv
cHlJbWFnZSBjb3BpZXMgb25seQogIHNhbXBsZSAwIG9mIG11bHRpc2FtcGxlZCBEMzJfU0ZMT0FU
X1M4X1VJTlQgYW5kIEQyNF9VTk9STV9TOF9VSU5UIGltYWdlcwotIGxhdmFwaXBlOiBuZXcgUlQg
ZmFpbHMKLSB2M2R2OiBncHUgaGFuZyB3aGVuIGFuIGlubGluZSB1bmlmb3JtIGJsb2NrIGNvbWVz
IGJlZm9yZSBhIHNhbXBsZWQgaW1hZ2UKCkNoYW5nZXMKLS0tLS0tLQoKM21ybzc3N28gKDEpOgot
IG5pci9vcHRfdmFyeWluZ3M6IHVzZSBuaXJfc3JjX3Jld3JpdGUgd2hlbiBzaHJpbmtpbmcgdmFy
eWluZyBhcnJheXMKQWVyb01vZGVzICgxKToKLSBtZXNvbjogZml4IEdOVSBxc29ydF9yIGRldGVj
dGlvbiBmb3IgR0NDCkNhaW8gT2xpdmVpcmEgKDQpOgoKLSBpbnRlbC9jb21waWxlcjogRml4IGNv
b3BlcmF0aXZlIG1hdHJpeCBjb252ZXJzaW9uIHNpZ25lZG5lc3MKLSBqYXk6IFVwZGF0ZSBQSEkg
dW5pZm9ybSBmaWVsZCB3aGVuIHNwaWxsaW5nIGl0cyBkZXN0aW5hdGlvbgotIGdlbjogRml4IHR5
cG8gaW4gdmFsaWRhdGlvbiBmb3Igc3BlY2lhbCByZXN0cmljdGlvbnMKLSBqYXk6IERvbid0IGxv
d2VyIFUzMiBtb3ZzIHRvIEYzMiB3aGVuIGNtb2QgaXMgYmVpbmcgdXNlZAoKQ2FsbHVtIEZhcmUg
KDEpOgotIGlyMzogRml4IHBvdGVudGlhbCBvdXQtb2YtcmFuZ2UgbG9hZF9jb25zdF9pcjMgYmFz
ZSBvZmZzZXQKQ2hyaXN0aWFuIEdtZWluZXIgKDMpOgoKLSBldG5hdml2OiBibHQ6IFByb2dyYW0g
dGhlIHNvdXJjZSBUUyBmb3IgbWlwbWFwIGdlbmVyYXRpb24KLSBldG5hdml2OiBVcGRhdGUgc2Ft
cGxlciBzb3VyY2VzIGJlZm9yZSBkZXJpdmluZyBzdGF0ZQotIGV0bmF2aXY6IEV4cG9zZSBvbmx5
IHRoZSBsaW5lYXIgbW9kaWZpZXIgZm9yIE5WMTIKCkNvbm5vciBBYmJvdHQgKDMpOgoKLSB0dTog
RG9uJ3QgYmFpbCBhZnRlciB0aGUgZmlyc3QgaW5zdHIgd2hlbiBnYXRoZXJpbmcgcHVzaCBjb25z
dCByYW5nZQotIHR1OiBGaXggYmluZGxlc3MgZGVzY3JpcHRvciBpbnZhbGlkYXRlIHNlcXVlbmNl
Ci0gaXIzOiBPbmx5IGNhbGwgbmlyX29wdF9zaHJpbmtfdmVjdG9ycyBvbmNlCgpEYW5pZWwgU2No
w7xybWFubiAoMik6CgotIG5pci9sb3dlcl9jb250aW51ZV9jb25zdHJ1Y3RzOiBwcmVzZXJ2ZSBw
aGkgc291cmNlcyB3aGVuIHNpbXBsaWZ5aW5nIGxvb3AKICBqdW1wcwotIG5pci9sb3dlcl9jb250
aW51ZV9jb25zdHJ1Y3RzOiBwcmVzZXJ2ZSBTU0EgZG9taW5hbmNlIGFjcm9zcyBuZXN0ZWQgZXhp
dHMKCkRhbnlsbyBQaWxpYWlldiAoMyk6CgotIHR1L2E2eHg6IFNldCBjb3JyZWN0IHZhbHVlIGZv
ciBHUkFTX01PREVfQ05UTAotIHR1L2E2eHg6IEludmFsaWRhdGUgc2hhcmVkIGNvbnN0cyBiZWZv
cmUgZGlzYWJsaW5nIHRoZW0KLSBmcmVlZHJlbm86IEZpeHVwIGluY29ycmVjdGx5IGNvcGllZCBB
NlhYX1RQTDFfREJHX0VDT19DTlRMIGZvciBBNjUwCgpEYXZlIEFpcmxpZSAoNSk6CgotIGxsdm1w
aXBlOiBoYW5kbGUgaW5kaXJlY3QgZ2VvbWV0cnkgc2hhZGVyIGlucHV0cwotIGxsdm1waXBlOiBh
ZGQgdmVjdG9yIHdpZHRoIHRvIHRoZSBkaXNrIGNhY2hlLgotIGxhdmFwaXBlOiBmaXggbXVsdGlz
YW1wbGUgZGVwdGg8LT5jb2xvciBjb3BpZXMuCi0gZWdsL3N1cmZhY2VsZXNzOiBkb24ndCBwcm9i
ZSBkZXZpY2UgbmFtZSBpZiBmZCBpcyBpbnZhbGlkLgotIGxsdm1waXBlOiBhZHZhbmNlIDFEIGZy
YW1lYnVmZmVyIGZldGNoZXMgYXQgZm91ciBsYW5lcwoKRGF2aWQgUm9zY2EgKDUpOgoKLSByYWRl
b25zaS9tbTogU2V0IGVycm9yIHdoZW4gZmFpbGluZyB0byBtYXAgYml0c3RyZWFtIGJ1ZmZlcgot
IHJhZGVvbnNpL21tOiBEb24ndCByZXR1cm4gZmVlZGJhY2sgd2hlbiBhbGxvY2F0aW5nIGJ1ZmZl
ciBmYWlscwotIHJhZGVvbnNpL21tOiBGaXggcGlwZV9jb250ZXh0IGxlYWsgd2hlbiBjc19jcmVh
dGUgZmFpbHMKLSByYWRlb25zaS9tbTogQ2hlY2sgZW1iZWRkZWQgYnVmZmVyIG1hcCBmYWlscwot
IHJhZGVvbnNpL21tOiBJbmNyZWFzZSBvYnVfc2l6ZSBsZW5ndGggdG8gMiBieXRlcyBpbiBBVjEg
c2VxdWVuY2UgaGVhZGVyCgpEbWl0cnkgQmFyeXNoa292ICgzKToKCi0gaXIzOiBkbyBub3QgbGV0
IGZ1bGwtcmVnaXN0ZXIgd3JpdGVzIHJlc2V0IGhhbGYtcmVnaXN0ZXIgZGVsYXlzIGJlZm9yZSBh
Nnh4Ci0gaXIzOiByZXNlcnZlIGltYWdlIGRpbWVuc2lvbnMgZm9yIHJlYWQtd3JpdGUgaW1hZ2Vz
IG9uIGE1eHgKLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGVhciBQSVBFX0JJTkRfT1BFTkNMIGJl
Zm9yZSBjaGVja2luZyBmb3JtYXQgc3VwcG9ydAoKRG9taW5pcXVlIEJlbGhhY2hlbWkgKDEpOgot
IHB2cjogYW1lbmQgc2hhcmVkIG1lbW9yeSBjb2VmZiByZWcgY291bnQgdG8gdXNlIERXT1JEIGdy
YW51bGFyaXR5CkR5bGFuIEJha2VyICgxKToKLSBtZXNvbjogaW1ndWktc2RsMy12dWxrYW4gbmVl
ZHMgdGhlIHZ1bGthbiBsb2FkZXIgaGVhZGVycwpFbW1hIEFuaG9sdCAoMyk6CgotIGZyZWVkcmVu
bzogRW5zdXJlIHRoYXQgdGhlIGdlbmVyYXRlZCBwYWNrIGhlYWRlcnMgYXJlIHN0YWJsZSBiZXR3
ZWVuIGJ1aWxkcy4KLSBpc2FzcGVjOiBGaXggZW5jb2RlciBvdXRwdXQgc3RhYmlsaXR5LgotIG5p
ci9vcHRfYWxnZWJyYWljX3Rlc3Q6IEZpeCB1bml0IHRlc3QgY29kZWdlbiBvdXRwdXQgc3RhYmls
aXR5LgoKRXJpYyBFbmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBhZGQgc2hhIHN1bSBmb3IgMjYuMi41
Ci0gLnBpY2tfc3RhdHVzLmpzb246IFVwZGF0ZSB0byBhMGFlYTBkMmQ5MzIwNjRkZDZkZTdmODU2
ZDQ5YmY2OWY3OWVlMWRlCi0gLnBpY2tfc3RhdHVzLmpzb246IE1hcmsgNGJmM2U3NTM3ODNmYWM2
NmZiNzA1OWU0MjNlZjA0OTMzNGUxODZkNSBhcwogIGRlbm9taW5hdGVkCgpFcmlrIEZheWUtTHVu
ZCAoMTMpOgoKLSBwYW5mcm9zdDogcGx1ZyBwcmVjb21wLXNoYWRlciBsZWFrCi0gcGFudms6IGZp
eCBhbGxvd19tZXJnaW5nX3dvcmtncm91cHMgbG9naWMKLSBwYW52azogZHJvcCByZWR1bmRhbnQg
ZGVzY3JpcHRvci1jb3B5Ci0gcGFuL2xpYjogZml4IHJlcGVhdGVkIHdpZHRoX3B4IGNoZWNrCi0g
cGFuL2xpYjogZml4IGNvcHktcGFzdGEgYnVnCi0gcGFuL2xpYjogZG8gbm90IGZvbGQgaW50byB0
aGUgc2FtZSBvcCB0d2ljZQotIHBhbmZyb3N0OiBmcmVlIGNvcnJlY3QgaGFuZGxlCi0gcGFuL2Jp
OiBoYW5kbGUgdGxzLXN0b3JlcyBpbiBoZWxwZXIgYW5hbHlzaXMKLSB2dWxrYW4vbWV0YTogY29y
cmVjdCBpbWFnZS1yZXNvbHZlIGZvciAzRCBpbWFnZQotIHBhbnZrOiBwcm9wZXJseSBpZ25vcmUg
ZGVwdGgtc3RlbmNpbCBhc3BlY3RNYXNrCi0gdnVsa2FuL21ldGE6IGZpeHVwIHR5cG8KLSBwYW52
azogdHJhY2sgaGVhcCBidWRnZXQgYWNyb3NzIGluc3RhbmNlcwotIHBhbnZrOiB3cml0ZV9pbWFn
ZV92aWV3X2Rlc2MgZGVhbHMgd2l0aCBpbWFnZXMsIG5vdCBzYW1wbGVycwoKRmFicmljaW8gQWtp
byAoMSk6Ci0gZnJlZWRyZW5vL2E1eHg6IFJlbG9hZCB0ZXh0dXJlcywgU1NCT3MgYW5kIGltYWdl
cyBhZnRlciB0aGUgcHJvZ3JhbQpGYWl0aCBFa3N0cmFuZCAoMik6CgotIHBhbi9uaXI6IERvbid0
IHVzZSBuYXJyb3dfYXJyYXlfaW5kZXggd2l0aCB3aWRlX2luZGljZXMKLSBrb3BwZXI6IERvbid0
IGNhbGwgc3dyYXN0X3VwZGF0ZV90ZXhfYnVmZmVyKCkgaWYgd2UgZG9uJ3QgaGF2ZSBzd3Jhc3QK
Ckdlb3JnIExlaG1hbm4gKDQpOgoKLSB2YzQ6IHNldCBsb3dlcl9pbnQ2NF9vcHRpb25zIHRvIG5v
dCBzdXBwb3J0IGFueSA2NGJpdCBhbHUKLSB2M2R2OiBzZXQgbG93ZXJfaW50NjRfb3B0aW9ucyB0
byBub3Qgc3VwcG9ydCBhbnkgNjRiaXQgYWx1Ci0gcmFkdjogZXhwb3NlIGZwMTYgb24gZ2Z4OCBm
b3IgdmtkM2QtcHJvdG9uCi0gYWNvL2lzZWw6IGZpeCBzZ3ByIHN1YiBkd29yZCBuaXJfb3BfdmVj
IHdpdGggdW5kZWZzCgpIVFJNQyAoMSk6Ci0gdjNkdjoga2VlcCBkZXNjcmlwdG9ycyBhbGlnbmVk
IGFmdGVyIGlubGluZSB1bmlmb3JtIGJsb2NrcwpIZXJtYW4gU2VtZW5vZmYgKDEpOgoKLSBpbnRl
bC9pOTE1OiBmaXggSTkxNV9QQVJBTV9IQVNfQ09OVEVYVF9GUkVRX0hJTlQgY2hlY2sgYW5kIGxv
dyBsYXRlbmN5IHBhcmFtCiAgdmFsdWUKCklhZ28gVG9yYWwgUXVpcm9nYSAoMSk6Ci0gdjNkdjog
Rml4IGVhcmx5LWV6IG9uIHY3MQpJYW4gUm9tYW5pY2sgKDQpOgoKLSBicnc6IEZpeCByZWdpb25z
X292ZXJsYXAgZm9yIGFjY3VtdWxhdG9ycwotIGJydzogQ1NFTCBjYW5ub3QgbWl4IHR5cGUgc2l6
ZXMgZXZlbiBmb3IgaW1tZWRpYXRlcwotIGJydzogQ1NFTCBjYW5ub3QgaGF2ZSBpbW1lZGlhdGUg
c3JjMQotIGJydzogRml4IDE2LWJpdCB0eXBlIGhhbmRsaW5nIGluIGNvbnN0YW50IGNvbWJpbmlu
ZwoKSmFjayBCb3lraW4gKDEpOgotIHJhZHYvdmlkZW86IHJlbW92ZSBkZWNvZGUgdGllcjMKSmVz
c2UgTmF0YWxpZSAoMik6CgotIGQzZDEyOiBTdG9wIHJlY2xhaW0gcmV0cmllcyB3aGVuIHRoZSBm
ZW5jZSB3YWl0IGZhaWxzCi0gZDNkMTI6IFJlY2xhaW0gYnVmZmVyIG1lbW9yeSBvdXRzaWRlIG1h
bmFnZXIgbG9ja3MKCkpvYiBOb29ybWFuICgxKToKLSB0dTogZml4IHRleGVsIGJ1ZmZlciBlbXVs
YXRpb24gYm91bmRzIGNoZWNrCkpvc2UgTWFyaWEgQ2FzYW5vdmEgQ3Jlc3BvICgxKToKLSBicm9h
ZGNvbS9jb21waWxlcjoga2VlcCByb2J1c3QgU1NCTyBzdG9yZXMgc2NhbGFyIGZvciBib3VuZHMg
Y2hlY2tpbmcKSnVhbiBBLiBTdWFyZXogUm9tZXJvICgxKToKLSBlZ2wvZ2JtOiBJZ25vcmUgY3Vy
cmVudCBmcm9tIGJ1ZmZlciBpbiBoYXNfZnJlZV9idWZmZXJzCkthcm9sIEhlcmJzdCAoNik6Cgot
IHV0aWwvcXVldWU6IHJlbW92ZSBsb2NrZWQgYXJndW1lbnQgZnJvbSB1dGlsX3F1ZXVlX2tpbGxf
dGhyZWFkcwotIHV0aWwvcXVldWU6IHJlbW92ZSBsb2NrZWQgYXJndW1lbnQgZnJvbSB1dGlsX3F1
ZXVlX2FkanVzdF9udW1fdGhyZWFkcwotIHV0aWwvcXVldWU6IEZpeCBkZWFkLWxvY2sgYmV0d2Vl
biBxdWV1ZV9maW5pc2ggYW5kIHF1ZXVlX2tpbGxfdGhyZWFkcwotIHJ1c3RpY2wvcHJvZ3JhbTog
aW1wbGVtZW50IENMX0lOVkFMSURfU1BFQ19JRCBlcnJvciBmb3IKICBjbFNldFByb2dyYW1TcGVj
aWFsaXphdGlvbkNvbnN0YW50Ci0gcnVzdGljbC9zcGlydjogYWRkIFNQSVJWQmluOjpzcGVjaWFs
aXplCi0gcnVzdGljbC9wcm9ncmFtOiBmaXggc3BlYyBjb25zdGFudHMKCktvbnN0YW50aW4gU2V1
cmVyICgxKToKLSBsYXZhcGlwZTogRml4IERHQyArIGNvbmRpdGlvbmFsIHJlbmRlcmluZwpLcnp5
c3p0b2YgU29rb8WCb3dza2kgKDEpOgotIGxpbWE6IGNsb3NlIHRoZSBzY3JlZW4gZmQgb24gZGVz
dHJveSBhbmQgb24gZmFpbGVkIGNyZWF0aW9uCkxlb24gU2VlbWFubiAoMSk6Ci0gdmJvOiBGaXgg
ZXh0cmEgdmVydGV4IGRyYXduIG9uIGxpbmUgbG9vcCBlbmQgYWZ0ZXIgYnVmZmVyIHdyYXAKTGlv
bmVsIExhbmR3ZXJsaW4gKDYpOgoKLSBicnc6IGZpeCBvb2Igc291cmNlIGFjY2VzcwotIHZ1bGth
bi93c2k6IGZpeCBhIGJ1bmNoIG9mIGluY29ycmVjdCBlcnJvciBjb2RlIGNoZWNrcwotIGFudjog
YXZvaWQgbGVhayBvbiBpbnRlcm5hbCBrZXJuZWxzCi0gYW52OiBmaXggcG90ZW50aWFsIHNldF9s
YXlvdXQgbnVsbCBwb2ludGVyIGFjY2VzcwotIGludGVsL2NvbXBpbGVyOiBhbHdheXMgcnVuIHF1
ZXJ5IG9wdGltaXphdGlvbiBwYXNzZXMgb24gc3VwcG9ydGluZyBIVwotIGFudjogYmFpbCBlYXJs
eSBvbiB1bnN1cHBvcnRlZCBpbWFnZSBmb3JtYXQKCkxva2JvbmRvIEt1bmcgKDEpOgotIHV0aWw6
IEZpeCBtaXNhbGlnbmVkIGFkZHJlc3MgZm9yICdnY19zbGFiJwpNYXJ0aW4gUm91a2FsYSAobsOp
IFBlcmVzKSAoMSk6Ci0gUmV2ZXJ0ICJjaS10cm9uOiBieXBhc3MgY2FjaGluZyBwcm94eSBmb3Ig
ZG9ja2VyIGltYWdlcyIKTWFyeSBHdWlsbGVtYXJkICgxKToKLSBudms6IERvIG5vdCBvdmVyd3Jp
dGUgcHJldl9zdWJjIGlmIG5vIG1ldGhvZCB3ZXJlIGVtaXR0ZWQKTWF0dCBUdXJuZXIgKDQpOgoK
LSBnYWxsaXZtOiBkb24ndCBlbWl0IGEgc2NhbGFyIGxsdm0ubmVhcmJ5aW50IG9uIFBvd2VyUEMK
LSBnYWxsaXZtOiB0cnVuY2F0ZSBpbnRlZ2VyIGNvbnN0YW50cyB0byB0aGUgdHlwZSB3aWR0aAot
IG1lc2E6IHplcm8gcGlwZV9tZW1vcnlfaW5mbyBiZWZvcmUgcXVlcnlpbmcgaXQKLSBtZXNhOiBk
b24ndCByZWFkIHBhc3QgdGhlIG5hbWUgd2hlbiBtYXRjaGluZyBhIHJlc291cmNlIHdpdGhvdXQg
aXRzIFswXQoKTWHDrXJhIENhbmFsICgxKToKLSB2M2R2OiBkcm9wIHRoZSAiYWNjdW1fZmQiIGFz
c2VydGlvbiBpbiBtZXJnZV9zeW5jb2JqcygpCk1pa2UgQmx1bWVua3JhbnR6ICg0MCk6CgotIHpp
bms6IHVwZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiB0aGUgZHJhdyBtb2RlIG5lZWRzIGEgZGlmZmVy
ZW50IG9uZQotIHppbms6IHVwZGF0ZSB0aGUgbGFzdCB2ZXJ0ZXggc3RhZ2UgdmFyaWFudCB3aGVu
IGl0cyBrZXkgY2hhbmdlcwotIHppbms6IGVtaXQgZ2xvYmFsIGJpbmRpbmcgYmFycmllcnMgYmVm
b3JlIHNldHRpbmcgYmF0Y2ggdXNhZ2UKLSB6aW5rOiBjb3VudCBldmVyeSBoZWxkIHN3YXBjaGFp
biBpbWFnZSBhZ2FpbnN0IHRoZSBhY3F1aXJlIGxpbWl0Ci0gemluazogc3RvcCByZXRyeWluZyBz
d2FwY2hhaW4gYWNxdWlyZXMgdGhhdCBjYW5ub3Qgc3VjY2VlZAotIHppbms6IHN0b3Agc3Bpbm5p
bmcgb24gc3dhcGNoYWluIHJlYWRiYWNrcyB0aGF0IGNhbid0IGFjcXVpcmUgYW4gaW1hZ2UKLSB6
aW5rOiBkb24ndCBhY3F1aXJlIGEgbmV3IHN3YXBjaGFpbiBpbWFnZSB0byByZWFkIHByZXNlbnRl
ZCBjb250ZW50Ci0gemluazogbWFyayBzd2FwY2hhaW4gcmVhZGJhY2sgY29waWVzIHN0YWxlIG9u
IEdFTkVSQUwgbGF5b3V0IGJhcnJpZXJzCi0gemluazogY3JlYXRlIHN3YXBjaGFpbiByZWFkYmFj
ayBjb3BpZXMgYXMgc3RhbGUKLSB6aW5rOiB1c2UgcmVhZGJhY2sgY29waWVzIHdoZW4gYSBwcmVz
ZW50ZWQgaW1hZ2UgY2Fubm90IGJlIHJlYWNxdWlyZWQKLSB6aW5rOiB3YWl0IGZvciB0aGUgYWNx
dWlyZSBiZWZvcmUgcHJlc2VudGluZyBhbiBpbWFnZSBmb3IgcmVhZGJhY2sKLSB6aW5rOiByZWN5
Y2xlIHByZXNlbnQgc2VtYXBob3JlcyB3aGVuIHRoZWlyIGltYWdlIGlzIGFjcXVpcmVkIGFnYWlu
Ci0gemluazogcmVzb2x2ZSBzd2FwY2hhaW4gYmxpdCBzb3VyY2VzIGJlZm9yZSBhbnkgYmxpdCBw
YXRoIHJlYWRzIHRoZW0KLSB6aW5rOiBvbmx5IHRyeSBESVNKT0lOVCBmb3IgbXVsdGktcGxhbmFy
IGZvcm1hdHMgaW4gZmluZF9nb29kX21vZAotIHdnbDoga2VlcCB0aGUgR0FMTElVTV9EUklWRVIg
bmFtZSB2YWxpZCBmb3IgZHJpY29uZgotIHdnbDogZG9uJ3Qgd2FpdCBmb3IgdGhlIGdwdSBvbiB6
aW5rIHN3YXBzCi0gd2dsOiBkb24ndCBjaG9vc2UgcGJ1ZmZlci1vbmx5IHBpeGVsIGZvcm1hdHMg
Zm9yIHdpbmRvd3MKLSBhbnYraGFzdms6IGtlZXAgc2hhZGVySW50OCB3aXRoIG5vXzE2Yml0Ci0g
bGF2YXBpcGU6IG9ubHkgYWR2ZXJ0aXNlIFZLX0VYVF9oZWFkbGVzc19zdXJmYWNlIHdpdGggV1NJ
Ci0gemluazogb25seSBlbmFibGUgVktfRVhUX2hlYWRsZXNzX3N1cmZhY2Ugd2l0aCBWS19LSFJf
c3VyZmFjZQotIG1lc2E6IHJhaXNlIElOVkFMSURfVkFMVUUgZm9yIGJhZCBtc3J0dCB0ZXh0dXJl
IHNhbXBsZSBjb3VudHMKLSBtZXNhOiByYWlzZSBJTlZBTElEX0VOVU0gZm9yIG1zcnR0IHRleHRh
cmdldHMgdGhhdCBhcmUgbm90IDJkIG9yIGEgZmFjZQotIG1lc2E6IHJhaXNlIHRoZSBPVlJfbXVs
dGl2aWV3IGRyYXcgZXJyb3JzIGZvciB4ZmIgYW5kIGV4dHJhIHN0YWdlcwotIG1lc2E6IGFsbG93
IG11bHRpdmlldyBhdHRhY2htZW50cyBvZiBhbnkgdGV4dHVyZSBsZXZlbAotIG1lc2E6IGdpdmUg
UmVuZGVyYnVmZmVyU3RvcmFnZU11bHRpc2FtcGxlRVhUIHRoZSBJTlZBTElEX1ZBTFVFIHNhbXBs
ZSBsaW1pdAotIG1lc2E6IGFsbG93IHJlYWRpbmcgZnJvbSBFWFRfbXVsdGlzYW1wbGVkX3JlbmRl
cl90b190ZXh0dXJlIHJlbmRlcmJ1ZmZlcnMKLSBtZXNhOiBkb24ndCBtaXggaW1wbGljaXQgYW5k
IGV4cGxpY2l0IG11bHRpc2FtcGxlIGF0dGFjaG1lbnRzCi0gemluazogY3JlYXRlIG1zcnRzcyB0
cmFuc2llbnRzIHdpdGggb25seSB0aGUgYXR0YWNoZWQgbGV2ZWwKLSB6aW5rOiByZWxvYWQgbXNy
dHNzIHRyYW5zaWVudHMgYWZ0ZXIgdHJhbnNmZXIgd3JpdGVzIHRvIHRoZSBpbWFnZQotIHJhZGVv
bnNpOiByZS1lbWl0IHRoZSBzcXR0IHBpcGVsaW5lIHdoZW4gc2hhZGVyIHN0YXRlcyBhcmUgZW1p
dHRlZAotIG1lc2Evc3Q6IHBhc3MgUElQRV9JTUFHRV9BQ0NFU1MgYml0cyB0byBtYWtlX2ltYWdl
X2hhbmRsZV9yZXNpZGVudAotIHppbms6IHNoYXJlIGJpbmRsZXNzIGhhbmRsZXMgYmV0d2VlbiBj
b250ZXh0cwotIHppbms6IHRyYWNrIGJpbmRsZXNzIGltYWdlIGFjY2VzcyBwZXIgY29udGV4dAot
IHppbms6IGRyb3AgYmluZGxlc3MgcmVzaWRlbmN5IG9uIGNvbnRleHQgZGVzdHJveQotIHppbms6
IGZpeCBiaW5kbGVzcyBpbWFnZSBidWZmZXIgZGVzY3JpcHRvcnMKLSB6aW5rOiBpbmRleCBiaW5k
bGVzcyBidWZmZXIgYXJyYXlzIHdpdGhvdXQgdGhlIGhhbmRsZSBvZmZzZXQKLSB6aW5rOiBjb25z
aXN0ZW50bHkgdXNlIGF0b21pY3MgZm9yIGN0eC0+cm9idXN0X2N0eF9jb3VudCBhY2Nlc3MKLSB6
aW5rOiB1bmxvY2sgdGhlIGNvcHkgY29udGV4dCB3aGVuIHRpbWVzdGFtcCBxdWVyeSBjcmVhdGlv
biBmYWlscwotIHppbms6IGRvbid0IHVwZGF0ZSB1bm9yZGVyZWQgc3RhdGUgaW4gZ2V0X2NtZGJ1
ZigpIGluIHRoZSBwcmVzZW5jZSBvZiBjdXJyZW50CiAgdXNhZ2UKLSB6aW5rOiBjcmVhdGUgbWVz
aCBmdWxsIHByb2dyYW1zIHdoZW4gcmVwbGFjaW5nIG1lc2ggc2VwYXJhYmxlIHByb2dyYW1zCgpP
bGl2ZXIgQ2xhcmtlICgxKToKLSByYWR2OiBkaXNhYmxlIDh4IE1TQUEgZm9yIFZSUyBpbiBkZXZp
Y2UgcHJvcGVydGllcwpQZXl0b24gTGVlICgyKToKCi0gcmFkZW9uc2kvdnBlOiBmaXggWVVWNDIy
IG91dHB1dCB3aWR0aCBpc3N1ZQotIHJhZGVvbnNpL3ZwZTogZml4IDNEIExVVCBjaGFubmVsIG9y
ZGVyIGFuZCBQUSB0b25lIG1hcHBpbmcKClJoeXMgUGVycnkgKDMpOgoKLSByYWR2OiBzdG9wIGNo
ZWNraW5nIGRpcnR5IGJpdCBpbiBDbWRFeGVjdXRlQ29tbWFuZHMgSGlaIHdvcmthcm91bmQKLSBh
Y286IGFkZCBhIGNvdXBsZSBhY29fYWx1X29wY29kZV9pbmZvIG1ldGhvZHMKLSBhY28vb3B0X3Bv
c3RSQTogY2hlY2sgZm9yIHRpZWQgZGVmcyBpbiB0cnlfb3B0aW1pemVfYnJhbmNoaW5nX3NlcXVl
bmNlCgpSb2IgQ2xhcmsgKDEpOgotIGZyZWVkcmVuby9hNnh4OiBGaXggZmJmZXRjaCB3aXRoIG1z
cnR0ClNhbXVlbCBQaXRvaXNldCAoNik6CgotIHJhZHY6IGZpeCB0aGUgVk1BIGhlYXAgc2l6ZSBm
b3IgdGhlIGRlc2NyaXB0b3Igc2V0cyBhbGxvY2F0b3IKLSByYWR2OiBmaXggYSBtZW1vcnkgbGVh
ayB3aGVuIGFsbG9jYXRpbmcgYSBwb29sIGVudHJ5IGZhaWxlZAotIHJhZHY6IGZpeCB0aGUgZXJy
b3IgY29kZSB3aGVuIGFsbG9jYXRpbmcgYSBwb29sIGVudHJ5IGZhaWxlZAotIHJhZHY6IGFsbG93
IG11bHRpc2FtcGxpbmcgd2l0aCAyRCBDVUJFX0NPTVBBVElCTEUgaW1hZ2VzIHdpdGggTVNSVFNT
Ci0gcmFkdjogZml4IGVtaXR0aW5nIFJTUkMyIGZvciB2ZXJ0ZXggcHJvbG9ncwotIHJhZHYvcnQ6
IGZpeCBvdmVyd3JpdGluZyBzdGFjayBzaXplIG9uIHBhcnRpYWwgY2FjaGUgaGl0cwoKU2tpcGlu
IEFuZHJleSAoMyk6CgotIGRyaTM6IGlnbm9yZSBJZGxlTm90aWZ5IGZvciBhIHJldXNlZCBwaXht
YXAgWElECi0gd3NpL3gxMTogaWdub3JlIElkbGVOb3RpZnkgZm9yIGEgcmV1c2VkIHBpeG1hcCBY
SUQKLSB2bC9kcmkzOiBpZ25vcmUgSWRsZU5vdGlmeSBmb3IgYSByZXVzZWQgcGl4bWFwIFhJRAoK
VGFwYW5pIFDDpGxsaSAoMSk6Ci0gaXJpczogdXBkYXRlIG5pciBpbmZvcm1hdGlvbiB3aXRoaW4g
aXJpc19mb3JjZV9kdWFsX2NvbG9yX2JsZW5kClRpbW90aHkgQXJjZXJpICgxKToKLSBzdC9tZXNh
OiBwYXNzIHRoZSBlZGdlIGZsYWcgdmVydGV4IGVsZW1lbnQgdG8gdGhlIGRyYXcgbW9kdWxlClZh
bGVudGluZSBCdXJsZXkgKDIpOgoKLSBsYXZhcGlwZTogR3VhcmQgVktfRVhUX211bHRpc2FtcGxl
ZF9yZW5kZXJfdG9fc3dhcGNoYWluIHdpdGgKICBMVlBfVVNFX1dTSV9QTEFURk9STQotIHppbmsv
Y2k6IE1vdmUgZ2x4XEBnbHgtbWFrZS1jdXJyZW50IHRvIGZsYWtlcwoKWWl3ZWkgWmhhbmcgKDIz
KToKCi0gdmVudXM6IGZpeCBETVIgb24gaW1wb3J0IGZhaWx1cmUKLSB2ZW51czogYW1lbmQgVExT
IHJpbmcgZXJyb3IgY2hlY2sgaW4gcGlwZWxpbmUgY2FjaGUgcmV0cmlldmFsCi0gdmVudXM6IGZp
eCBhIHJhY2UgY29uZGl0aW9uIGZvciBUTFMgcmluZyBjcmVhdGlvbnMKLSB2ZW51czogcmV0dXJu
IFRJTUVPVVQgaW5zdGVhZCBvZiBOT1RfUkVBRFkgb24gZmVuY2Ugd2FpdCB0aW1lb3V0Ci0gdmVu
dXM6IGZpeCBsZWdhY3kgc2VtYXBob3JlIHdhaXQgdmFsdWVzIHRvIGFsaWduIHdpdGggc2VtYXBo
b3JlcwotIHZlbnVzOiBmaXggbG9ja2xlc3MgcXVlcnkgb2YgZGVzY3JpcHRvciBzaXplIGNhY2hl
Ci0gdmVudXM6IGZpeCB2a19jb21tYW5kX3Bvb2wgYWRvcHRpb24KLSB2ZW51czogcmVjeWNsZSBz
ZmIgY21kcyB3aGVuIHdhaXQgaXMgZG9uZSBlbHNld2hlcmUKLSB2ZW51czogYXZvaWQgbmV3IHNm
YiBjbWRzIGJlaW5nIHByZW1hdHVyZWx5IHJlY3ljbGVkCi0gdmVudXMvc2ltX3N5bmNvYmo6IGFt
ZW5kIHRvIHNldCBlcnJubyBvbiB3YWl0IHRpbWVvdXQKLSB2ZW51cy92aXJ0Z3B1OiBhdm9pZCBw
b3RlbnRpYWwgZG91YmxlIEJPIGRlc3Ryb3kKLSB2ZW51czogZml4IG1haW50NyB6ZXJvIGxheWVy
ZWRBcGlDb3VudCB3aXRoIG5vbi1OVUxMIHBMYXllcmVkQXBpcwotIHZlbnVzOiBhdm9pZCBVQiBp
biB2bl9nZXRfYWhiX2ltYWdlX3Byb3BzCi0gdmVudXM6IGF2b2lkIG51bGwgcHRyIGRlcmVmZXJl
bmNlIGZvciB6ZXJvIGV4dGVybmFsIGltYWdlIGhhbmRsZVR5cGUKLSB2ZW51czogcHJvcGVybHkg
c2NydWIgVmtHcmFwaGljc1BpcGVsaW5lQ3JlYXRlSW5mbzo6cmVuZGVyUGFzcwotIHZ1bGthbi9y
dW50aW1lL21lc29uOiBhdm9pZCBkdXBsaWNhdGUgaGVhZGVyIGdlbiBkZXBzIGxpc3QKLSB2ZW51
czogZml4IHBXYWl0RHN0U3RhZ2VNYXNrIHdoZW4gZHJvcHBpbmcgaW1wb3J0ZWQgc2VtYXBob3Jl
cwotIHZlbnVzL3NpbV9zeW5jb2JqOiBjb252ZXJ0IGFic29sdXRlIHRpbWVvdXQgYmFjayB0byBy
ZWxhdGl2ZQotIHZlbnVzOiBhdm9pZCBkZWFkbG9jayBpbiBjcyB1cGxvYWQgZm9yIGd1ZXN0IHZy
YW0KLSB2ZW51czogaWdub3JlIFZrSW1wb3J0TWVtb3J5RmRJbmZvS0hSIGlmIGhhbmRsZVR5cGUg
aXMgMAotIHZlbnVzOiBmaXggcGxhbmFyIGZvcm1hdCBob3N0IGNvcHkgc2l6ZSBjYWxjCi0gdmVu
dXM6IGNvbnNpZGVyIGJ1ZmZlciB1c2FnZSAyIHdoZW4gZml4aW5nIGV4dGVybmFsIGJ1ZmZlciBw
TmV4dAotIHZlbnVzOiBvbmx5IGNhbGwgdm5fd3NpX3N5bmNfd2FpdCB3aXRoIHZhbGlkIHN5bmMg
ZmQKCmJzbGV0dGUgKDEpOgotIG5hazogbmV2ZXIgZW5jb2RlIElEUC40QSB3aXRoIGFuIGltbWVk
aWF0ZSBzb3VyY2UKbGx5eXIgKDEpOgotIHJhZHYvYW1kZ3B1OiBmaXggQk8gbGlzdCBsZWFrIG9u
IGNvbW1hbmQgc3VibWl0IGZhaWx1cmUKb3NtYW4ueWFnY2kgKDEpOgotIGVnbC9kcmkyOiBkZXN0
cm95IHRoZSBkaXNwbGF5IGxvY2sgd2hlbiB0aGUgZGlzcGxheSBpcyBkZXN0cm95ZWQKc29rYSAo
Myk6CgotIHppbms6IHdhaXQgZm9yIGRtYS1idWYgZmVuY2VzIHdoZW4gdGhlIGJhdGNoIGVuZHMK
LSB6aW5rOiB0cmFjayBiYXRjaCBkbWFidWYgZXhwb3J0cyBpbiBhIGhhc2hfdGFibGUgaW5zdGVh
ZCBvZiBhIHNldAotIHppbms6IHdhaXQgZm9yIGRtYS1idWYgcmVhZGVycyBvbmx5IHdoZW4gd3Jp
dGluZwo=

--===============5697684865264202175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.2.4-26.2.6.patch"

RnJvbSBkNWU0MzlkYmUyZTU0YTI4OTBhMWVkOTI5ZDFlOWMxZmM2MWRhMTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDU6MTg6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLXRvb2xzLW5hdGl2ZSxtZXNhOiB1cGdyYWRlIDI2LjIuNCAtPiAyNi4yLjYKCk1lc2EgMjYu
Mi40IFJlbGVhc2UgTm90ZXMgLyAyMDI2LTEwLTAxCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CgpNZXNhIDI2LjIuNCBpcyBhIGJ1ZyBmaXggcmVsZWFzZSB3aGljaCBmaXhl
cyBidWdzIGZvdW5kIHNpbmNlIHRoZSAyNi4yLjMKcmVsZWFzZS4KCk1lc2EgMjYuMi40IGltcGxl
bWVudHMgdGhlIE9wZW5HTCA0LjYgQVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKZ2xH
ZXRTdHJpbmcoR0xfVkVSU0lPTikgb3IgZ2xHZXRJbnRlZ2VydihHTF9NQUpPUl9WRVJTSU9OKSAv
CmdsR2V0SW50ZWdlcnYoR0xfTUlOT1JfVkVSU0lPTikgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KU29tZSBkcml2ZXJzIGRvbid0IHN1cHBvcnQgYWxsIHRoZSBm
ZWF0dXJlcyByZXF1aXJlZCBpbiBPcGVuR0wgNC42LiBPcGVuR0wKNC42IGlzICoqb25seSoqIGF2
YWlsYWJsZSBpZiByZXF1ZXN0ZWQgYXQgY29udGV4dCBjcmVhdGlvbi4KQ29tcGF0aWJpbGl0eSBj
b250ZXh0cyBtYXkgcmVwb3J0IGEgbG93ZXIgdmVyc2lvbiBkZXBlbmRpbmcgb24gZWFjaCBkcml2
ZXIuCgpNZXNhIDI2LjIuNCBpbXBsZW1lbnRzIHRoZSBPcGVuQ0wgMy4xIEFQSSwgYnV0IHRoZSB2
ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBDTF9ERVZJQ0VfVkVSU0lPTiwgQ0xfREVWSUNFX05VTUVS
SUNfVkVSU0lPTiBhbmQKQ0xfREVWSUNFX09QRU5DTF9DX0FMTF9WRVJTSU9OUwpjbEdldERldmlj
ZUluZm8gcXVlcmllcyBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2Vk
LgoKTWVzYSAyNi4yLjQgaW1wbGVtZW50cyB0aGUgVnVsa2FuIDEuNCBBUEksIGJ1dCB0aGUgdmVy
c2lvbiByZXBvcnRlZCBieQp0aGUgYXBpVmVyc2lvbiBwcm9wZXJ0eSBvZiB0aGUgVmtQaHlzaWNh
bERldmljZVByb3BlcnRpZXMgc3RydWN0CmRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVy
IGJlaW5nIHVzZWQuCgpTSEEgY2hlY2tzdW1zCi0tLS0tLS0tLS0tLS0KCjo6CgogICAgU0hBMjU2
OiBiY2U1ZjdmYmViYjkzNDM3M2I4NmM5OTlhMDY0ZDUyZmI1MDY1ODc4ZGM1N2YyODdmOTUzNDY2
NDhlYzgzMmU5CiAgICBtZXNhLTI2LjIuNC50YXIueHoKICAgIFNIQTUxMjogNDJlNzkzNTYxNjYx
YTU2N2U3MmM3MzI0ZDA3MWFiOWY4MmQzYTlmMWUwMDA4MjdlZDk4OWI4ZDVmY2MyY2QxNmU1MGMK
ICAgIDAyODA4ZDQzNDY1YjMxMzVjMjVhM2NhZDc3NjQ5YmEwYmY5ZTM1ZDk1Yjg0OGY4ZmM4ZDhi
OWNlMzI3YwogICAgbWVzYS0yNi4yLjQudGFyLnh6CgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0t
CgotIE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0tLS0KCi0gIlRZIHRoZSBUYXNtYW5pYW4gVGlnZXIg
MyIgYWx3YXlzIGNyYXNoZXMgaW4gdGhlIHNhbWUgY3V0c2NlbmUgb24gYW1kIGdwdXMKLSBWS19W
QUxWRV92aWRlb19lbmNvZGVfcmdiX2NvbnZlcnNpb24gYWx3YXlzIG91dHB1dHMgbGltaXRlZCBj
b2xvciByYW5nZQotIFgtUGxhbmUgMTIgKDIwMTQ3ODApIEZsaWNrZXJpbmcgYXJ0aWZhY3RzIG9u
IHRleHR1cmVzIHdpdGggSW50ZWwgQXJjIEI1ODAKLSBbREcyXSBBTlY6IEVuc2hyb3VkZWQgKDEy
MDM2MjApIC0gY2hhcmFjdGVyIGludmlzaWJsZSwgdHJhbnNwYXJlbnQgYmlsbGJvYXJkcwogIHJl
bmRlcmVkIGFzIG9wYXF1ZSBzcGhlcmVzIG9uIGRpc2NyZXRlIEFyYyBHUFUKLSBbUkFEVl0gR0ZY
ODogQmxhY2sgc2NyZWVuIGluIFVFNSBEWDEyIChIYWxmIFN3b3JkKSBhZnRlciBjb21taXQgMTU5
OTBjNzhiOGUKICAoImFsbG93IERDQyBmb3IgY29uY3VycmVudCBpbWFnZXMgd2l0aG91dCBEQ0Mg
c3RvcmVzIikKLSBhbnY6IFZLX0VYVF9jYWxpYnJhdGVkX3RpbWVzdGFtcHMgcmV0dXJucyBhIEdQ
VSB0aW1lc3RhbXAgYWhlYWQgb2YgQ1BVIHRpbWUgb24KICBBcmMgQjM5MCAoUGFudGhlciBMYWtl
KSwgY3Jhc2hpbmcgVW5yZWFsIEVuZ2luZSA1LjgKLSBhc2FoaTogTWFyaW8gS2FydCBXaWlDb21w
aWxlZCBncmFwaGljYWwgZ2xpdGNoZXMKLSBkRVFQLVZLLmltYWdlLnN3YXBjaGFpbl9tdXRhYmxl
LndheWxhbmQuMmQucjhnOGI4YThfc3JnYl9yOGc4YjhhOF91bm9ybV9kcmF3X3QKICBleHR1cmVf
Zm9ybWF0X2xpc3QgY3Jhc2gKLSByYWRlb25zaS92YTogdmFHZXRJbWFnZSB0byBJNDIwL1lVWVYg
ZmFpbHMgd2l0aCBVTlNVUFBPUlRFRF9SVF9GT1JNQVQgc2luY2UKICBNZXNhIDI2LjIgb24gR1BV
cyB3aXRoIFZQRSAoUmFkZW9uIDg5ME0pCi0gcmFkZW9uc2k6IEdQVSBwYWdlIGZhdWx0IChTUUMp
IC8gY29udGV4dCBsb3NzIHdoZW4gdXNpbmcgSXJpcyBzaGFkZXJwYWNrcyBvbgogIFJYIDkwNzAg
WFQgKGdmeDEyMDEpCi0gcmFkdjogTlVMTCBkZXJlZiBpbiByYWR2X2dldF92Z3Rfc2hhZGVyX2tl
eSBhZnRlciBiaW5kaW5nIGEgY29tcHV0ZSBzaGFkZXIKICBvYmplY3QKLSByYWR2OiBQQ0llIDQu
MCB4NCBmYWlscyB0aGUgIlBDSWUgMy4wIHg4IiBiYW5kd2lkdGggY2hlY2sgZm9yIFZSQU0gY29t
bWFuZAogIGJ1ZmZlcnMgYnkgNCBNQi9zIChyb3VuZGVkIHBlci1sYW5lIGNvbnN0YW50cyk7IHVw
IHRvIDEzJSBkZWNvZGUgbG9zcyBpbgogIGxsYW1hLmNwcAotIHJhZHY6IFVOUkVBQ0hBQkxFIGNs
ZWFyaW5nIERFUFRIfFNURU5DSUwgd2hlbiB0aGUgZHluYW1pYyByZW5kZXIgcGFzcyBoYXMgbm8K
ICBzdGVuY2lsIGF0dGFjaG1lbnQKLSByYWR2OiBWa0Rlc2NyaXB0b3JVcGRhdGVUZW1wbGF0ZSB0
YWtlcyBhIHBvaW50ZXIgdG8gdGhlIHNldF9sYXlvdXQgbWVtb3J5CgpDaGFuZ2VzCi0tLS0tLS0K
CkFsbGVuIEJhbGx3YXkgKDEpOgotIGludGVsL2NvbXBpbGVyOiBmaXggYm91bmRzIGNoZWNrIGlu
IFdhXzE4MDM1NjkwNTU1CkJlbmphbWluIENoZW5nICgxKToKLSBhYy92aWRlbzogQWRqdXN0IEhF
VkMgbWluX3FwIGZvciBWQ04xL1ZDTjIKQm9yaXMgQnJlemlsbG9uICgyKToKCi0gcGFuL2ttb2Q6
IE1ha2Ugc3VyZSBhbGwgZXhlY3V0YWJsZXMgbGl2ZSBpbiB0aGUgc2FtZSA0RyBWQSByYW5nZQot
IHBhbnZrOiBEb24ndCBkb3duY2FzdCBDUyBmdW5jIGFkZHJlc3MgdG8gYSAzMi1iaXQgVkEKCkNh
aW8gT2xpdmVpcmEgKDEpOgotIGJydzogUmUtbG93ZXIgaW1tZWRpYXRlIG9mZnNldHMgYWZ0ZXIg
bWVzaCBuaXJfb3B0X29mZnNldHMKQ2hyaXN0aWFuIEdtZWluZXIgKDMpOgoKLSBsYXZhcGlwZTog
R3VhcmQgQkRBIGhhbmRsZSBhcnJheXMgd2l0aCBiZGFfbG9jawotIGV0bmF2aXY6IENhcHR1cmUg
dmFyeWluZ3Mgbm90IHJlYWQgYnkgdGhlIGZyYWdtZW50IHNoYWRlcgotIGV0bmF2aXY6IEtlZXAg
dHJhbnNmb3JtIGZlZWRiYWNrIGFjdGl2ZSBhY3Jvc3MgZmx1c2hlcwoKQ29vcGVyIE1vcmdhbiAo
Myk6CgotIHZ1bGthbi93c2k6IGtlZXAgcHJlc2VudCB0aW1pbmcgcmVjb3JkcyB0aGF0IGRvIG5v
dCBmaXQgdGhlIG91dHB1dCBhcnJheQotIHZ1bGthbi93c2k6IGtlZXAgR09PR0xFIGRpc3BsYXkg
dGltaW5nIHJlY29yZHMgdGhhdCBkbyBub3QgZml0Ci0gYW50aS1sYWc6IGNvbnZlcnQgR1BVIHRp
bWVzdGFtcHMgdG8gbnMgaW4gZG91YmxlIHByZWNpc2lvbgoKRGF2aWQgUm9zY2EgKDgpOgoKLSB2
dWxrYW4vdmlkZW86IERvbid0IHVwZGF0ZSBPQlUgc2l6ZSB3aXRoIE5VTEwgZGF0YV9wdHIKLSB2
bC9iaXRzdHJlYW06IEZpeCBjb2RpbmcgdWUoKSBmb3IgbGFyZ2UgbnVtYmVycwotIHZsL2JpdHN0
cmVhbTogRG9uJ3QgdXNlIGludGVybmFsIGJ1ZmZlciBmb3Igc2l6ZSBvbmx5IHVzZQotIHZsL2Jp
dHN0cmVhbTogTW92ZSBvdmVyZmxvdyBjaGVjayB0byB2bF9iaXRzdHJlYW1fd3JpdGVfYnl0ZV9z
dGFydF9jb2RlCi0gcmFkdi92aWRlbzogRml4IGhhbmRsaW5nIHNpemUgbGltaXQgaW4gR2V0RW5j
b2RlZFZpZGVvU2Vzc2lvblBhcmFtZXRlcnMKLSB2YTogRHJvcCBmb3JtYXQgc3VwcG9ydCBjaGVj
a3MgaW4gdmxWYVBvc3RQcm9jCi0gdmE6IERvbid0IGNoZWNrIGZvcm1hdCBzdXBwb3J0IGluIEVu
ZFBpY3R1cmUgZm9yIHByb2Nlc3NpbmcKLSByYWR2L3ZpZGVvOiBPbmx5IHJlcG9ydCBCVDcwOS9M
aW1pdGVkIHN1cHBvcnQgZm9yIFJHQiBjb252ZXJzaW9uIG9uIFZDTjUKCkRhdmlkIFNhbmRlcnMg
KDEpOgotIHJhZHY6IHJlc2V0IGNvbXB1dGUgcGlwZWxpbmUgYWZ0ZXIgSUVTIGluIHZrQ21kRXhl
Y3V0ZUdlbmVyYXRlZENvbW1hbmRzRVhUCkRtaXRyeSBCYXJ5c2hrb3YgKDMpOgoKLSBmcmVlZHJl
bm8vYTJ4eDogZG9uJ3QgdHlwZS1wdW4gdGhlIGltbWVkaWF0ZSB2YWx1ZXMgdGhyb3VnaCBhIGNh
c3QKLSB0dTogcmVzb2x2ZSB3aWRlIGZvcm1hdHMgd2l0aCBhIHNoYWRlciBvbiBBNzAyCi0gZnJl
ZWRyZW5vL3FyaXNjOiBmaXggaGFuZyBvbiBhNjUwIC8gYTY2MCBmaXJtd2FyZQoKRXJpYyBFbmdl
c3Ryb20gKDIpOgoKLSBkb2NzOiBhZGQgc2hhIHN1bSBmb3IgMjYuMi4zCi0gLnBpY2tfc3RhdHVz
Lmpzb246IFVwZGF0ZSB0byAzMGRhMzkxODdkOGQzY2YwM2M1OGVjZDJiZWJiNDk3Yjg0NTAxZjUx
CgpFcmljIFIuIFNtaXRoICgxKToKLSBwdnI6IG1vdmUgYXNzZXJ0IGZvciBidWZmZXIgdXNhZ2UK
R2VvcmcgTGVobWFubiAoNCk6CgotIGFjby9zY2hlZF92b3BkOiB3b3JrIGFyb3VuZCBHRlgxMSBW
T1BEIGludGVybG9jayBoYXphcmQKLSBhY28vb3B0aW1pemVyOiBkbyBub3QgdHJ1bmNhdGUgY29u
c3RhbnRzIGJlZm9yZSByZXNvbHZpbmcgZXh0cmFjdHMKLSBhY28vb3Bjb2RlczogYWRkIGRlc3Qv
c3JjIHR5cGVzIGZvciBWT1BEIG9wY29kZXMKLSBhY28vaW5zZXJ0X2ZwX21vZGU6IGhhbmRsZSBi
b3RoIHZvcGQgb3Bjb2RlcwoKR2xlbm4gS2VubmFyZCAoMSk6Ci0gbnYzMDogRml4IGZvciBsb29w
cyBpbiBmcmFnbWVudCBzaGFkZXJzIG9uIG52NDAKSGVsZW4gS29pa2UgKDEpOgotIHZ1bGthbi9v
dmVybGF5OiBEcmF3IG9uIHRoZSBwcmVzZW50IHF1ZXVlIHdoZW4gcG9zc2libGUKSWFuIFJvbWFu
aWNrICgxKToKLSBicnc6IE9ubHkgSEFMVCBmb3IgdGVyCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBh
cyBpdCBleGNlZWRzIDUwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBm
b3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uYXZvaWQtYnVp
bHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaCB8ICAyICstCiAuLi5kcmVu
by1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoIHwgIDIgKy0KIC4u
Li8wMDAxLWdhbGxpdm0tYWRhcHQtZm9yLUpJVExpbmstaW4tTExWTS0yMy5wYXRjaCAgfCAxMiAr
KysrLS0tLS0tLS0KIC4uLmNoZWNrLVRMU0RFU0Mtc3VwcG9ydC13aXRoLWEtc2hhcmVkLWxpYnJh
cnkucGF0Y2ggfCAgOCArKysrLS0tLQogLi4uZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mt
b24tbWlwcy1jbGFuZy5wYXRjaCB8ICAyICstCiAuLi4tY29tcGlsZXItamF5LWpheV9pci5oLWRv
LW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoIHwgIDIgKy0KIC4uLnVfbWF0aC5jLWRvLW5vdC11c2Ut
YXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvbWVzYS5pbmMgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIDggZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1hZGRybGliLWF2b2lkLWJ1aWx0aW5f
Y3B1X3N1cHBvcnRzLWZvci1hdngyLWRldGVjdGkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9y
LWF2eDItZGV0ZWN0aS5wYXRjaAppbmRleCAyYjMwYzFiNWM3Li45YjI4ZjZlNTE4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWFkZHJsaWItYXZvaWQt
YnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWFkZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVf
c3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjAw
NDA5OTU2Y2QxYTU4ZjFjNjc2ZGU5Y2JmZDJjNjg4Y2EzZmM5ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYzQwYTljNjJlYTM3ZTc0OTY5ODczOWU2N2ExMjA1MDhkZjAwOGZmNyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNv
bW0uY29tPgogRGF0ZTogVGh1LCAxMyBBdWcgMjAyNiAwMDowMDowMCArMDAwMAogU3ViamVjdDog
W1BBVENIXSBhZGRybGliOiBhdm9pZCBfX2J1aWx0aW5fY3B1X3N1cHBvcnRzIGZvciBhdngyIGRl
dGVjdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVu
Y29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKaW5kZXggZDU4MDI3NzEyNC4uMDY5
OWNhZjI0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24t
dC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBhNjFkYWFmMzU0YmQ4NGRmYTg0OWY4ZGE2MDI4ZGRjNzFmMWFmN2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBmNWZjNTc5ODQyZWIyOGRhNmVmYjlkNjYzMWRlNmUwMzk3YTM0
ZmFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1p
dHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogV2VkLCAxMCBEZWMgMjAyNSAw
MjoyNzoxNiArMDIwMAogU3ViamVjdDogW1BBVENIXSBmcmVlZHJlbm86IGRvbid0IGVuY29kZSBi
dWlsZCBwYXRoIGludG8gYmluYXJpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1hZGFwdC1mb3ItSklUTGluay1pbi1MTFZNLTIzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLWFkYXB0
LWZvci1KSVRMaW5rLWluLUxMVk0tMjMucGF0Y2gKaW5kZXggNzU2YjY4YTg5OC4uMTNlMjhmNmM2
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxs
aXZtLWFkYXB0LWZvci1KSVRMaW5rLWluLUxMVk0tMjMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLWFkYXB0LWZvci1KSVRMaW5rLWluLUxM
Vk0tMjMucGF0Y2gKQEAgLTEsNSArMSw0IEBACi1Gcm9tIGNkYTM4MzYyNWY1ZDFmZDA2NjU3ZmI5
OThiN2QxMzcwYTdmYWJkOGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1NZXNzYWdlLUlEOiA8
Y2RhMzgzNjI1ZjVkMWZkMDY2NTdmYjk5OGI3ZDEzNzBhN2ZhYmQ4Zi4xNzkxMTE0ODUxLmdpdC5t
YXJjZWxAemlzd2lsZXIuY29tPgorRnJvbSBiMmNmNTYwYjE2YjJkOTIxNWZhMDE3MmUxMTU0MjYw
YTM4YzcyZDFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSWNlbm93eSBaaGVuZyA8
emhlbmd4aW5nZGFAaXNjYXMuYWMuY24+CiBEYXRlOiBXZWQsIDMwIFNlcCAyMDI2IDE0OjEwOjE0
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdhbGxpdm06IGFkYXB0IGZvciBKSVRMaW5rIGluIExM
Vk0gMjMKQEAgLTIxLDEwICsyMCwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL3dvcmtfaXRlbQogIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2F1
eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9pbml0X29yYy5jcHAgYi9zcmMvZ2FsbGl1bS9hdXhpbGlh
cnkvZ2FsbGl2bS9scF9ibGRfaW5pdF9vcmMuY3BwCi1pbmRleCAwOWQ1NmU1NDNlZS4uYmM5ZDc4
MzdlY2QgMTAwNjQ0CitpbmRleCA5YTAyZGUzLi44MWE1ZjI3IDEwMDY0NAogLS0tIGEvc3JjL2dh
bGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX2luaXRfb3JjLmNwcAogKysrIGIvc3JjL2dh
bGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX2luaXRfb3JjLmNwcAotQEAgLTM0Niw2ICsz
NDYsMTMgQEAgTFBKaXQ6OkxQSml0KCkgOmppdF9keWxpYl9jb3VudCgwKSB7CitAQCAtMzQxLDYg
KzM0MSwxMyBAQCBMUEppdDo6TFBKaXQoKSA6aml0X2R5bGliX2NvdW50KDApIHsKICAgICAgICAg
ICAuc2V0SklUVGFyZ2V0TWFjaGluZUJ1aWxkZXIoc3RkOjptb3ZlKEpUTUIpKQogICNpZmRlZiBV
U0VfSklUTElOSwogICAgICAgICAgIC5zZXRPYmplY3RMaW5raW5nTGF5ZXJDcmVhdG9yKApAQCAt
MzgsNyArMzcsNyBAQCBpbmRleCAwOWQ1NmU1NDNlZS4uYmM5ZDc4MzdlY2QgMTAwNjQ0CiAgI2lm
IExMVk1fVkVSU0lPTl9NQUpPUiA+PSAyMQogICAgICAgICAgICAgIC8qIExMVk0gMjEgcmVtb3Zl
ZCB0aGUgVHJpcGxlIGFyZ3VtZW50ICovCiAgICAgICAgICAgICAgWyZdKEV4ZWN1dGlvblNlc3Np
b24gJkVTKSB7Ci1AQCAtMzU1LDYgKzM2Miw3IEBAIExQSml0OjpMUEppdCgpIDpqaXRfZHlsaWJf
Y291bnQoMCkgeworQEAgLTM1MCw2ICszNTcsNyBAQCBMUEppdDo6TFBKaXQoKSA6aml0X2R5bGli
X2NvdW50KDApIHsKICAgICAgICAgICAgICAgICByZXR1cm4gc3RkOjptYWtlX3VuaXF1ZTxPYmpl
Y3RMaW5raW5nTGF5ZXI+KAogICAgICAgICAgICAgICAgICAgIEVTLCBFeGl0T25FcnIobGx2bTo6
aml0bGluazo6SW5Qcm9jZXNzTWVtb3J5TWFuYWdlcjo6Q3JlYXRlKCkpKTsKICAgICAgICAgICAg
ICB9KQpAQCAtNDYsNiArNDUsMyBAQCBpbmRleCAwOWQ1NmU1NDNlZS4uYmM5ZDc4MzdlY2QgMTAw
NjQ0CiAgI2Vsc2UKICAjaWYgTExWTV9VU0VfSU5URUxfSklURVZFTlRTCiAgICAgICAgICAgLlJl
Z2lzdGVySklURXZlbnRMaXN0ZW5lcigKLS0tIAotMi41Mi4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tY2hlY2stVExTREVTQy1zdXBw
b3J0LXdpdGgtYS1zaGFyZWQtbGlicmFyeS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtbWVzb24tY2hlY2stVExTREVTQy1zdXBwb3J0LXdpdGgtYS1zaGFyZWQt
bGlicmFyeS5wYXRjaAppbmRleCAzOTdlOTkzNWQ0Li4yNjYwODQ1YjlkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLWNoZWNrLVRMU0RFU0Mt
c3VwcG9ydC13aXRoLWEtc2hhcmVkLWxpYnJhcnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1jaGVjay1UTFNERVNDLXN1cHBvcnQtd2l0aC1h
LXNoYXJlZC1saWJyYXJ5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNWJkZTdhNWJkYTZi
YzEwZWFmZDEzMmUwYThhOGU3Y2U5YTY5Nzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBmNTY3NGFkOGJiOGNlMzQ4ODExZDljNzdlZWJhOTRlZjBhMTFhZWU3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiBE
YXRlOiBTdW4sIDI1IE9jdCAyMDI2IDA5OjA5OjA1IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiBjaGVjayBUTFNERVNDIHN1cHBvcnQgd2l0aCBhIHNoYXJlZCBsaWJyYXJ5CkBAIC0yNyw3
ICsyNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0u
Y29tPgogCiBkaWZmIC0tZ2l0IGEvYnVpbGQtc3VwcG9ydC9jb25mdGVzdC10bHNkZXNjLmMgYi9i
dWlsZC1zdXBwb3J0L2NvbmZ0ZXN0LXRsc2Rlc2MuYwogbmV3IGZpbGUgbW9kZSAxMDA2NDQKLWlu
ZGV4IDAwMDAwMDAwMDAwLi4yMzUxZjZmZWYxMAoraW5kZXggMDAwMDAwMC4uMjM1MWY2ZgogLS0t
IC9kZXYvbnVsbAogKysrIGIvYnVpbGQtc3VwcG9ydC9jb25mdGVzdC10bHNkZXNjLmMKIEBAIC0w
LDAgKzEsMjMgQEAKQEAgLTU1LDEwICs1NSwxMCBAQCBpbmRleCAwMDAwMDAwMDAwMC4uMjM1MWY2
ZmVmMTAKICt9CiArI2VuZGlmCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWls
ZAotaW5kZXggZjcyNWY4MzNhNTIuLjc1NDMwMjgzZWIyIDEwMDY0NAoraW5kZXggMzdmMmZkNC4u
YTdhN2M2YSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAg
LTY1MSwxMCArNjUxLDI1IEBAIGlmIG5vdCBoYXZlX210bHNfZGlhbGVjdAorQEAgLTY0MywxMCAr
NjQzLDI1IEBAIGlmIG5vdCBoYXZlX210bHNfZGlhbGVjdAogICAgICAjIFRoZSB3YXkgdG8gc3Bl
Y2lmeSB0aGUgVExTREVTQyBkaWFsZWN0IGlzIGFyY2hpdGVjdHVyZS1zcGVjaWZpYy4KICAgICAg
IyBXZSBwcm9iZSBib3RoIGJlY2F1c2UgdGhlcmUgaXMgbm90IGEgZmFsbGJhY2sgZ3VhcmFudGVl
ZCB0byB3b3JrIGZvciBhbGwKICAgICAgIyBmdXR1cmUgYXJjaGl0ZWN0dXJlcy4KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0
cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBz
LWNsYW5nLnBhdGNoCmluZGV4IDc3YTBiYTNkOGIuLjZhNGJmNTZkNjEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJp
dC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1j
bGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzNhMzU5ZDM5ZTM4N2U3ODU4ODNjYjc0
MDkzNGEwZGM0ZTYzNzZkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzk3MWQ5YTA1
N2RhNDcxODk3ZjlkYzcwMGJlZThhYWIxOGE5N2NjNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDEzIEphbiAy
MDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uIG1pc2RldGVjdHMgNjRi
aXQgYXRvbWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90
LXVzZWQtdHlwZWQtZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8w
MDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4u
cGF0Y2gKaW5kZXggYjkyM2M0YzFmYi4uYmU5YzFhZmNjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9p
ci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3Qt
dXNlZC10eXBlZC1lbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2NmYTVhNjU1NWY2ZWIw
MzVhY2UxMmNiYTFjZTNlNzg1YTQ3ODk1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MjgxMzUxNjMzZDA1ZGRkY2ZkZTI0ZjczYmYyMzhlZGE5MDk3ZDAxYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBE
YXRlOiBTdW4sIDE0IEp1biAyMDI2IDE3OjQyOjE5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNy
Yy9pbnRlbC9jb21waWxlci9qYXkvamF5X2lyLmg6IGRvIG5vdCB1c2VkIHR5cGVkIGVudW0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwt
dV9tYXRoLmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRoLmMtZG8tbm90
LXVzZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaAppbmRleCAwZDBmZGFjZTJjLi42NWNh
YzMzOTA1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAx
LXNyYy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11
X21hdGguYy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA4OWM0NmRlOTJlOTc0MjAyYzFjYWJjZTI1YmI0ZDk0NDE4MzBiOGI2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMzA0NWVlZmFjMDIzMTEyODVhNDAxNjhhNDlk
NDYyNGI4MzE0NjQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFdlZCwgMSBKdWwgMjAyNiAyMjo0ODox
NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBzcmMvdXRpbC91X21hdGguYzogZG8gbm90IHVzZSBh
cm0gZnB1IGluc3RydWN0aW9ucyBpZiBmcHUgaXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5p
bmMKaW5kZXggNjRmNWRlMTJiNC4uZDgwOTE1ZGEwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYS5pbmMKQEAgLTI0LDggKzI0LDggQEAgU1JDX1VSSSA9ICJodHRwczovL2FyY2hpdmUubWVz
YTNkLm9yZy9tZXNhLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29u
LWNoZWNrLVRMU0RFU0Mtc3VwcG9ydC13aXRoLWEtc2hhcmVkLWxpYnJhcnkucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2U1ZjdmYmViYjkzNDM3M2I4NmM5
OTlhMDY0ZDUyZmI1MDY1ODc4ZGM1N2YyODdmOTUzNDY2NDhlYzgzMmU5IgotUFYgPSAiMjYuMi40
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5NDM2YjNlMWE4YmU3NmZiZDQ4MjNkYzg4NGY5MDU5
NmFiN2M2YWM1ZTE4NjdhMzA1ZTY2ZmZjY2ZiMzFhOTIiCitQViA9ICIyNi4yLjYiCiAKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0t
IAoyLjQ3LjEKCg==

--===============5697684865264202175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.4.so", added "/usr/lib/libgallium-26.2.6.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.4.so moved to /usr/lib/libgallium-26.2.6.so

--===============5697684865264202175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-tools-native-changelog.txt"

TWVzYSAyNi4yLjQgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMTAtMDEKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi40IGlzIGEgYnVnIGZpeCByZWxlYXNlIHdo
aWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMwpyZWxlYXNlLgoKTWVzYSAyNi4y
LjQgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRl
ZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZF
UlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBh
bGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipv
bmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRp
YmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBl
YWNoIGRyaXZlci4KCk1lc2EgMjYuMi40IGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJ
Q0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNs
R2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJl
aW5nIHVzZWQuCgpNZXNhIDI2LjIuNCBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0
IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBW
a1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAg
ICBTSEEyNTY6IGJjZTVmN2ZiZWJiOTM0MzczYjg2Yzk5OWEwNjRkNTJmYjUwNjU4NzhkYzU3ZjI4
N2Y5NTM0NjY0OGVjODMyZTkKICAgIG1lc2EtMjYuMi40LnRhci54egogICAgU0hBNTEyOiA0MmU3
OTM1NjE2NjFhNTY3ZTcyYzczMjRkMDcxYWI5ZjgyZDNhOWYxZTAwMDgyN2VkOTg5YjhkNWZjYzJj
ZDE2ZTUwYwogICAgMDI4MDhkNDM0NjViMzEzNWMyNWEzY2FkNzc2NDliYTBiZjllMzVkOTViODQ4
ZjhmYzhkOGI5Y2UzMjdjCiAgICBtZXNhLTI2LjIuNC50YXIueHoKCk5ldyBmZWF0dXJlcwotLS0t
LS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSAiVFkgdGhlIFRhc21hbmlh
biBUaWdlciAzIiBhbHdheXMgY3Jhc2hlcyBpbiB0aGUgc2FtZSBjdXRzY2VuZSBvbiBhbWQgZ3B1
cwotIFZLX1ZBTFZFX3ZpZGVvX2VuY29kZV9yZ2JfY29udmVyc2lvbiBhbHdheXMgb3V0cHV0cyBs
aW1pdGVkIGNvbG9yIHJhbmdlCi0gWC1QbGFuZSAxMiAoMjAxNDc4MCkgRmxpY2tlcmluZyBhcnRp
ZmFjdHMgb24gdGV4dHVyZXMgd2l0aCBJbnRlbCBBcmMgQjU4MAotIFtERzJdIEFOVjogRW5zaHJv
dWRlZCAoMTIwMzYyMCkgLSBjaGFyYWN0ZXIgaW52aXNpYmxlLCB0cmFuc3BhcmVudCBiaWxsYm9h
cmRzCiAgcmVuZGVyZWQgYXMgb3BhcXVlIHNwaGVyZXMgb24gZGlzY3JldGUgQXJjIEdQVQotIFtS
QURWXSBHRlg4OiBCbGFjayBzY3JlZW4gaW4gVUU1IERYMTIgKEhhbGYgU3dvcmQpIGFmdGVyIGNv
bW1pdCAxNTk5MGM3OGI4ZQogICgiYWxsb3cgRENDIGZvciBjb25jdXJyZW50IGltYWdlcyB3aXRo
b3V0IERDQyBzdG9yZXMiKQotIGFudjogVktfRVhUX2NhbGlicmF0ZWRfdGltZXN0YW1wcyByZXR1
cm5zIGEgR1BVIHRpbWVzdGFtcCBhaGVhZCBvZiBDUFUgdGltZSBvbgogIEFyYyBCMzkwIChQYW50
aGVyIExha2UpLCBjcmFzaGluZyBVbnJlYWwgRW5naW5lIDUuOAotIGFzYWhpOiBNYXJpbyBLYXJ0
IFdpaUNvbXBpbGVkIGdyYXBoaWNhbCBnbGl0Y2hlcwotIGRFUVAtVksuaW1hZ2Uuc3dhcGNoYWlu
X211dGFibGUud2F5bGFuZC4yZC5yOGc4YjhhOF9zcmdiX3I4ZzhiOGE4X3Vub3JtX2RyYXdfdAog
IGV4dHVyZV9mb3JtYXRfbGlzdCBjcmFzaAotIHJhZGVvbnNpL3ZhOiB2YUdldEltYWdlIHRvIEk0
MjAvWVVZViBmYWlscyB3aXRoIFVOU1VQUE9SVEVEX1JUX0ZPUk1BVCBzaW5jZQogIE1lc2EgMjYu
MiBvbiBHUFVzIHdpdGggVlBFIChSYWRlb24gODkwTSkKLSByYWRlb25zaTogR1BVIHBhZ2UgZmF1
bHQgKFNRQykgLyBjb250ZXh0IGxvc3Mgd2hlbiB1c2luZyBJcmlzIHNoYWRlcnBhY2tzIG9uCiAg
UlggOTA3MCBYVCAoZ2Z4MTIwMSkKLSByYWR2OiBOVUxMIGRlcmVmIGluIHJhZHZfZ2V0X3ZndF9z
aGFkZXJfa2V5IGFmdGVyIGJpbmRpbmcgYSBjb21wdXRlIHNoYWRlcgogIG9iamVjdAotIHJhZHY6
IFBDSWUgNC4wIHg0IGZhaWxzIHRoZSAiUENJZSAzLjAgeDgiIGJhbmR3aWR0aCBjaGVjayBmb3Ig
VlJBTSBjb21tYW5kCiAgYnVmZmVycyBieSA0IE1CL3MgKHJvdW5kZWQgcGVyLWxhbmUgY29uc3Rh
bnRzKTsgdXAgdG8gMTMlIGRlY29kZSBsb3NzIGluCiAgbGxhbWEuY3BwCi0gcmFkdjogVU5SRUFD
SEFCTEUgY2xlYXJpbmcgREVQVEh8U1RFTkNJTCB3aGVuIHRoZSBkeW5hbWljIHJlbmRlciBwYXNz
IGhhcyBubwogIHN0ZW5jaWwgYXR0YWNobWVudAotIHJhZHY6IFZrRGVzY3JpcHRvclVwZGF0ZVRl
bXBsYXRlIHRha2VzIGEgcG9pbnRlciB0byB0aGUgc2V0X2xheW91dCBtZW1vcnkKCkNoYW5nZXMK
LS0tLS0tLQoKQWxsZW4gQmFsbHdheSAoMSk6Ci0gaW50ZWwvY29tcGlsZXI6IGZpeCBib3VuZHMg
Y2hlY2sgaW4gV2FfMTgwMzU2OTA1NTUKQmVuamFtaW4gQ2hlbmcgKDEpOgotIGFjL3ZpZGVvOiBB
ZGp1c3QgSEVWQyBtaW5fcXAgZm9yIFZDTjEvVkNOMgpCb3JpcyBCcmV6aWxsb24gKDIpOgoKLSBw
YW4va21vZDogTWFrZSBzdXJlIGFsbCBleGVjdXRhYmxlcyBsaXZlIGluIHRoZSBzYW1lIDRHIFZB
IHJhbmdlCi0gcGFudms6IERvbid0IGRvd25jYXN0IENTIGZ1bmMgYWRkcmVzcyB0byBhIDMyLWJp
dCBWQQoKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gYnJ3OiBSZS1sb3dlciBpbW1lZGlhdGUgb2Zmc2V0
cyBhZnRlciBtZXNoIG5pcl9vcHRfb2Zmc2V0cwpDaHJpc3RpYW4gR21laW5lciAoMyk6CgotIGxh
dmFwaXBlOiBHdWFyZCBCREEgaGFuZGxlIGFycmF5cyB3aXRoIGJkYV9sb2NrCi0gZXRuYXZpdjog
Q2FwdHVyZSB2YXJ5aW5ncyBub3QgcmVhZCBieSB0aGUgZnJhZ21lbnQgc2hhZGVyCi0gZXRuYXZp
djogS2VlcCB0cmFuc2Zvcm0gZmVlZGJhY2sgYWN0aXZlIGFjcm9zcyBmbHVzaGVzCgpDb29wZXIg
TW9yZ2FuICgzKToKCi0gdnVsa2FuL3dzaToga2VlcCBwcmVzZW50IHRpbWluZyByZWNvcmRzIHRo
YXQgZG8gbm90IGZpdCB0aGUgb3V0cHV0IGFycmF5Ci0gdnVsa2FuL3dzaToga2VlcCBHT09HTEUg
ZGlzcGxheSB0aW1pbmcgcmVjb3JkcyB0aGF0IGRvIG5vdCBmaXQKLSBhbnRpLWxhZzogY29udmVy
dCBHUFUgdGltZXN0YW1wcyB0byBucyBpbiBkb3VibGUgcHJlY2lzaW9uCgpEYXZpZCBSb3NjYSAo
OCk6CgotIHZ1bGthbi92aWRlbzogRG9uJ3QgdXBkYXRlIE9CVSBzaXplIHdpdGggTlVMTCBkYXRh
X3B0cgotIHZsL2JpdHN0cmVhbTogRml4IGNvZGluZyB1ZSgpIGZvciBsYXJnZSBudW1iZXJzCi0g
dmwvYml0c3RyZWFtOiBEb24ndCB1c2UgaW50ZXJuYWwgYnVmZmVyIGZvciBzaXplIG9ubHkgdXNl
Ci0gdmwvYml0c3RyZWFtOiBNb3ZlIG92ZXJmbG93IGNoZWNrIHRvIHZsX2JpdHN0cmVhbV93cml0
ZV9ieXRlX3N0YXJ0X2NvZGUKLSByYWR2L3ZpZGVvOiBGaXggaGFuZGxpbmcgc2l6ZSBsaW1pdCBp
biBHZXRFbmNvZGVkVmlkZW9TZXNzaW9uUGFyYW1ldGVycwotIHZhOiBEcm9wIGZvcm1hdCBzdXBw
b3J0IGNoZWNrcyBpbiB2bFZhUG9zdFByb2MKLSB2YTogRG9uJ3QgY2hlY2sgZm9ybWF0IHN1cHBv
cnQgaW4gRW5kUGljdHVyZSBmb3IgcHJvY2Vzc2luZwotIHJhZHYvdmlkZW86IE9ubHkgcmVwb3J0
IEJUNzA5L0xpbWl0ZWQgc3VwcG9ydCBmb3IgUkdCIGNvbnZlcnNpb24gb24gVkNONQoKRGF2aWQg
U2FuZGVycyAoMSk6Ci0gcmFkdjogcmVzZXQgY29tcHV0ZSBwaXBlbGluZSBhZnRlciBJRVMgaW4g
dmtDbWRFeGVjdXRlR2VuZXJhdGVkQ29tbWFuZHNFWFQKRG1pdHJ5IEJhcnlzaGtvdiAoMyk6Cgot
IGZyZWVkcmVuby9hMnh4OiBkb24ndCB0eXBlLXB1biB0aGUgaW1tZWRpYXRlIHZhbHVlcyB0aHJv
dWdoIGEgY2FzdAotIHR1OiByZXNvbHZlIHdpZGUgZm9ybWF0cyB3aXRoIGEgc2hhZGVyIG9uIEE3
MDIKLSBmcmVlZHJlbm8vcXJpc2M6IGZpeCBoYW5nIG9uIGE2NTAgLyBhNjYwIGZpcm13YXJlCgpF
cmljIEVuZ2VzdHJvbSAoMik6CgotIGRvY3M6IGFkZCBzaGEgc3VtIGZvciAyNi4yLjMKLSAucGlj
a19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDMwZGEzOTE4N2Q4ZDNjZjAzYzU4ZWNkMmJlYmI0OTdi
ODQ1MDFmNTEKCkVyaWMgUi4gU21pdGggKDEpOgotIHB2cjogbW92ZSBhc3NlcnQgZm9yIGJ1ZmZl
ciB1c2FnZQpHZW9yZyBMZWhtYW5uICg0KToKCi0gYWNvL3NjaGVkX3ZvcGQ6IHdvcmsgYXJvdW5k
IEdGWDExIFZPUEQgaW50ZXJsb2NrIGhhemFyZAotIGFjby9vcHRpbWl6ZXI6IGRvIG5vdCB0cnVu
Y2F0ZSBjb25zdGFudHMgYmVmb3JlIHJlc29sdmluZyBleHRyYWN0cwotIGFjby9vcGNvZGVzOiBh
ZGQgZGVzdC9zcmMgdHlwZXMgZm9yIFZPUEQgb3Bjb2RlcwotIGFjby9pbnNlcnRfZnBfbW9kZTog
aGFuZGxlIGJvdGggdm9wZCBvcGNvZGVzCgpHbGVubiBLZW5uYXJkICgxKToKLSBudjMwOiBGaXgg
Zm9yIGxvb3BzIGluIGZyYWdtZW50IHNoYWRlcnMgb24gbnY0MApIZWxlbiBLb2lrZSAoMSk6Ci0g
dnVsa2FuL292ZXJsYXk6IERyYXcgb24gdGhlIHByZXNlbnQgcXVldWUgd2hlbiBwb3NzaWJsZQpJ
YW4gUm9tYW5pY2sgKDEpOgotIGJydzogT25seSBIQUxUIGZvciB0ZXJtaW5hdGVfaWYgb2Ygbm9u
LWhlbHBlciBwaXhlbHMKSWNlbm93eSBaaGVuZyAoMyk6CgotIGdhbGxpdm06IGZpeCBlbmFibGVt
ZW50IG9mIFJJU0MtViBaYnMgZXh0ZW5zaW9uCi0gdnVsa2FuL3dzaTogc3VwcG9ydCBhbGxvY2F0
aW5nIG1vcmUgbWVtb3J5IGZvciBidWZmZXJzCi0gbWVzb246IGxpc3QgTUlQUyg2NCkgaW4gbGx2
bV9oYXNfbWNqaXQgbGlzdAoKSm9iIE5vb3JtYW4gKDIpOgoKLSBpcjM6IGludGVycHJldCBjb25z
dCBcQGxvYWQvc3RvcmVfZ2xvYmFsX29mZnNldCBvZmZzZXQgYXMgdW5zaWduZWQKLSBuaXIvbG93
ZXJfdGV4OiBjb3B5IHRleHR1cmUvc2FtcGxlcl9ub25fdW5pZm9ybSBmbGFncwoKSm9zZSBNYXJp
YSBDYXNhbm92YSBDcmVzcG8gKDIpOgoKLSB2YzQ6IGhlbHBlciB2YzRfZ2V0X2NsaXBfd2luZG93
KCkgZm9yIHRoZSBjbGlwIHdpbmRvdyBjb21wdXRhdGlvbgotIHZjNDogc2tpcCBkcmF3cyB3aG9z
ZSBjbGlwIHdpbmRvdyBpcyBlbXB0eQoKSnlvdGlyYW5qYW4gQmh1eWFuICgxKToKLSByYWRlb25z
aTogaW52YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBhdCBJQiBzdGFydCBvbiBnZngxMgpLYWphbCBL
YWphbCAoMik6CgotIGZyZWVkcmVuby9hNnh4OiB1cGxvYWQgYSBkdW1teSBzYW1wbGVyIHdoZW4g
dGV4dHVyZXMgYnV0IG5vIHNhbXBsZXJzIGJvdW5kCi0gcnVzdGljbC9rZXJuZWw6IGVtaXQgaW1h
Z2UvdGV4dHVyZSBiYXJyaWVycyBhZnRlciBhIGtlcm5lbCBsYXVuY2gKCktvbnN0YW50aW4gU2V1
cmVyICgxKToKLSByYWR2L3J0OiBSZXN0b3JlIGhpdCBhdHRyaWJzIGFmdGVyIHJlamVjdGluZyBB
QUJCcwpMaW9uZWwgTGFuZHdlcmxpbiAoNik6CgotIGFudjogcmVzcGVjdCBiaXRfc2l6ZS9udW1f
Y29tcG9uZW50IGZyb20gdGhlIElSIHdpdGggYWNjZWxlcmF0aW9uIHN0cnVjdHVyZXMKLSBibG9y
cDogZml4IHNoYWRlciBrZXJuZWwgcG9pbnRlciB3aXRoIG11bHRpIHNpemUga2VybmVscwotIGFu
djogYWRkIG1pc3NpbmcgY29uc3RhbnQgY2FjaGUgaW52YWxpZGF0aW9uIGluIERHQyBwYXRoCi0g
bmlyL2xvd2VyX2lucHV0X2F0dGFjaG1lbnRzOiBhZGQgc3VwcG9ydCBmb3IgaGVhcCBzdWJwYXNz
IGltYWdlIGxvYWQKLSBhbnY6IGRpc2FibGUgRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVfQ1lD
TEVTIHdpdGggVW5yZWFsRW5naW5lIDUuOAotIHZ1bGthbi93c2k6IGFkZCBtaXNzaW5nIHVzYWdl
MiBmbGFncwoKTG9yZW56byBSb3NzaSAoMik6CgotIHBhbi9iaTogRml4IHNwaWxsIGNvc3Qgb3Zl
cmVzdGltYXRpb24KLSBrcmFpZC9vcHRfY29weV9wcm9wOiBGaXggemVyby1leHRlbnNpb24gb24g
NjQtYml0IHN3aXp6bGVzCgpMdWlnaSBTYW50aXZldHRpICgyKToKCi0gcHZyOiBzcGVjdWxhdGl2
ZSBmaXggZm9yIG91dC1vZi1ib3VuZCBhY2Nlc3Mgb2Ygd2luc3lzX2hlYXBzCi0gcHZyOiBzZXQg
dGhlIFVNIHN0cmlkZSB3aGVuIHF1ZXJ5aW5nIGhlYXAgc3RhdGljIGFyZWFzCgpNYXJlayBPbMWh
w6FrICgxKToKLSByYWR2OiBmaXggY2hlY2tpbmcgd2hldGhlciBhIEZTIGlzIHByZXNlbnQKTWF0
dCBUdXJuZXIgKDExKToKCi0gZHJpOiBhbGxvY2F0ZSBNU0FBIGNvbG9yIGJ1ZmZlcnMgZm9yIGRy
aXN3IGltYWdlIGxvYWRlciBidWZmZXJzCi0gbGx2bXBpcGU6IGRvbid0IHNraXAgZHJhdydzIHZp
ZXdwb3J0IGNsaXBwaW5nIHdpdGhvdXQgdGhlIGxpbmVhciByYXN0ZXJpemVyCi0gbWVzYTogdXNl
IGEgYnl0ZS1hcnJheSBmb3JtYXQgZm9yIEdMX1JHQkE4IHRleHR1cmUgYnVmZmVycwotIG1lc2E6
IHN0b3JlIGJvb2xlYW4gY3VzdG9tIGdsR2V0IHZhbHVlcyBpbiB2YWx1ZV9ib29sCi0gbWVzYTog
cGFjayBHTF9NQVhfQ09NQklORURfRElNRU5TSU9OUyB3aXRob3V0IGRlcGVuZGluZyBvbiBieXRl
IG9yZGVyCi0gZHJpOiBkZXNjcmliZSBHUjE2MTYgYXMgUjE2RzE2X1VOT1JNCi0gdXRpbDogZml4
IHRoZSBaMzJfRkxPQVRfUzhYMjRfVUlOVCBjbGVhciB2YWx1ZSBvbiBiaWctZW5kaWFuCi0gdXRp
bC9mb3JtYXQ6IHN0b3JlIFIxMUcxMUIxMF9GTE9BVCBhbmQgUjlHOUI5RTVfRkxPQVQgaW4gaG9z
dCBieXRlIG9yZGVyCi0gdXRpbC9hc3RjOiByZWFkIHRoZSAxMjgtYml0IGJsb2NrIGFzIGxpdHRs
ZS1lbmRpYW4gd29yZHMKLSB1dGlsL2Zvcm1hdDogbWFrZSB0aGUgRlhUMSBjb2RlYyBpbmRlcGVu
ZGVudCBvZiBob3N0IGJ5dGUgb3JkZXIKLSBnYWxsaXZtOiByZWludGVycHJldCBpbWFnZSB0ZXhl
bHMgdXNpbmcgdGhlIHNoYWRlcidzIGZvcm1hdCBxdWFsaWZpZXIKCk1pa2UgQmx1bWVua3JhbnR6
ICg5KToKCi0gbGF2YXBpcGU6IGluZGVwZW5kZW50bHkgY2FsY3VsYXRlIHNyYy9kc3QgYmxpdCBk
ZXB0aAotIGxhdmFwaXBlOiBhZGQgbW9yZSBsYXlvdXRzIHRvIGx2cF9ob3N0X2NvcHlfaW1hZ2Vf
bGF5b3V0cwotIGxhdmFwaXBlOiBoYW5kbGUgcGxhbmFyIHZpZXdzIGFzIHJlbmRlcmluZyBhdHRh
Y2htZW50cwotIGxsdm1waXBlOiB1c2Ugb3NfZnJlZV9hbGlnbmVkIGZvciBub24tdm1hIGNhc2UK
LSBsYXZhcGlwZTogdXBkYXRlIHJldHVybmVkIHNpemUgaW4gR2V0UGlwZWxpbmVDYWNoZURhdGEK
LSB6aW5rOiBkb24ndCBjbGFpbSBWUkFNIG9uIGNwdSBpbXBsZW1lbnRhdGlvbnMKLSB6aW5rOiBj
aGVjayBzd2FwY2hhaW4gdGltbGluZSB3aGVuIHBydW5pbmcKLSB6aW5rOiBzdG9wIGxlYWtpbmcg
c3dhcGNoYWlucwotIHppbms6IGNsYW1wIHByZXNlbnQgcmVnaW9ucyB0byAweDAgd2hlbiBvdXQg
b2YgYm91bmRzCgpNaWtoYWlsIE1saGNubiAoMik6CgotIHBhbnZrL2NzZjogZmx1c2ggdGhlIEZB
VSBzdG9yZXMgYmVmb3JlIGluZGlyZWN0IGRyYXdzIHJlYWQgdGhlbQotIHBhbnZrL2NzZjogZ2l2
ZSBjb21wdXRlIGpvYnMgdGhlIFRMUyBzaXplIG9mIHRoZSBzaGFyZWQgYWxsb2NhdGlvbgoKT2xp
dmVyIENsYXJrZSAoMSk6Ci0gYXNhaGkvYWd4OiBBZGQgc2hpZnQgbWFzayBmb3IgYml0ZmllbGRf
ZXh0cmFjdCBhbmQgZnVzZWQgc2hpZnQgb3BzClBhdHJpY2sgR2Fza2luICgxKToKLSBlZ2w6IGRv
bid0IGNsb2JiZXIgYW4gaW5pdGlhbGl6ZWQgZGlzcGxheSdzIGRldmljZSBpbiBlZ2xHZXRQbGF0
Zm9ybURpc3BsYXkKUmFuZHkgUGFsYW1hciAoMSk6Ci0gYWNvL2luc2VydF9mcF9tb2RlOiBmaXgg
cm91bmRpbmcgbW9kZSBmb3IgZm1hX21peGhpX2YxNgpSaHlzIFBlcnJ5ICgxKToKLSBhY28vcmE6
IGNoZWNrIG5leHQgcmVnaXN0ZXIgYWdhaW5zdCBib3VuZHMgaW4gc3ViZHdvcmQgZ2V0X3JlZ19z
aW1wbGUgcGF0aApSeWFuIFpoYW5nICgyKToKCi0gcGFudms6IHZhbGlkYXRlIGRlc2NyaXB0b3Ig
Y291bnRzIGluIHNoYWRlciBkZXNlcmlhbGl6YXRpb24KLSBwYW52ay9jc2Y6IGNoZWNrIG1hbGxv
YyByZXR1cm4gdmFsdWVzIGluIHF1ZXVlIHN1Ym1pdCBzdG9yYWdlIGluaXQKClNhbXVlbCBQaXRv
aXNldCAoMTIpOgoKLSByYWR2OiBmaXggaW5pdGlhbGl6aW5nIHRoZSBEQ0MgcHJlZGljYXRpb24g
dmFsdWUgd2hlbiBzdG9yZXMgYXJlbid0IHN1cHBvcnRlZAotIHJhZHY6IGZpeCBpbml0aWFsaXpp
bmcgRENDIHdpdGggbWlwbWFwcyBvbiBHRlg4Ci0gcmFkdjogZGlzYWJsZSBiaW5uaW5nIGNvcnJl
Y3RseSBvbiBHRlg5LTExCi0gcmFkdjogZml4IGEgdHlwbyB3aGVuIGNvbXB1dGluZyB0aGUgYmlu
bmluZyBzaXplIG9uIEdGWDEwLTExLjcKLSByYWR2OiBhZGQgcmFkdl9kaXNhYmxlX2Jpbm5pbmdf
Z2Z4MTEgYW5kIGVuYWJsZSBmb3IgU3Vuc2V0IE92ZXJkcml2ZQotIG5pci9sb3dlcl9hYm9ydDog
Zml4IHBheWxvYWQgYWxpZ25tZW50IHRvIDgtYnl0ZXMKLSByYWR2OiBkbyBub3QgYWJvcnQgd2hl
biB0aGUgYXBwIHNwZWNpZmllcyBhbiBpbnZhbGlkIG1vZGlmaWVyCi0gcmFkdjogZG8gbm90IGFi
b3J0IHdoZW4gYSBHUFUgaGFuZyByZXBvcnQgaXMgY3JlYXRlZCB3aXRoCiAgZGV2aWNlRmF1bHRW
ZW5kb3JCaW5hcnkKLSByYWR2OiBmaXggZGVwdGgvc3RlbmNpbCBhc3BlY3RzIGZvciByZXNvbHZl
cwotIHJhZHY6IGZpeCBpbW11dGFibGUgc2FtcGxlcnMgbGlmZXRpbWUgd2l0aCBkZXNjcmlwdG9y
IHVwZGF0ZSB0ZW1wbGF0ZXMKLSByYWR2OiBmaXggZGlydHlpbmcgZ3JhcGhpY3Mgc2hhZGVycyB3
aGVuIHNoYWRlciBvYmplY3RzIGFyZSBib3VuZAotIHJhZHY6IGlnbm9yZSBhc3BlY3RzIHRoYXQg
aGF2ZSBubyBlZmZlY3RzIGR1cmluZyBjbGVhcnMKClRhcGFuaSBQw6RsbGkgKDEpOgotIGFudjog
YWRkIGFkZGl0aW9uYWwgaGV1cmlzdGljIHRvIHNpbWQzMiBhc3N1bXB0aW9uIHBhc3MKVGltb3Ro
eSBBcmNlcmkgKDEpOgotIG5pcjogdGVtcG9yYXJpbHkgZGlzYWJsZSBmbG9hdGluZyBwb2ludCBl
eGNlcHRpb24gZmxhZ3MKVHVwaWxpIEtyaXNobmEgR293dGhhbSBSZWRkeSAoMSk6Ci0gZnJlZWRy
ZW5vL2E2eHg6IGVuYWJsZSBmMTYgaW5maW5pdGllcyBmb3IgZnJlZWRyZW5vIGRyaXZlcgpWYWxl
bnRpbmUgQnVybGV5ICgyKToKCi0gbmlyL2xvd2VyX3N1Ymdyb3VwczogRml4IHZvdGUgbG93ZXJp
bmcgd2l0aCB2ZWN0b3IgYmFsbG90cwotIGlyMzogTG93ZXIgcXVhZCB2b3RlcwoKVmluc29uIExl
ZSAoMSk6Ci0gcHBzOiBJbml0aWFsaXplIENvdW50ZXIgbWVtYmVyIHZhcmlhYmxlIHVuaXRzClZp
bsOtY2l1cyAoMSk6Ci0gYWMvZ3B1X2luZm86IG1ha2UgUENJZSA0LjAgYW5kIDUuMCBsYW5lIGJh
bmR3aWR0aCBleGFjdCBtdWx0aXBsZXMgb2YgMy4wCllpd2VpIFpoYW5nICgxKToKLSBwYW4va21v
ZDogZHVtbXkgQk8gaXMgcGVyIFZNIGZvciBlbXVsYXRlZCBzcGFyc2UKam9lLndhbmcgKDEpOgot
IHJhZHY6IGFsc28gYXBwbHkgdGhlIERpUlQgNCBIaVogd29ya2Fyb3VuZCBwcm9maWxlIHRvIHRo
ZSBuYXRpdmUgcG9ydAptYXR0aGV3cGVyaXV0ICgxKToKLSB2ZW51czogaG9ub3IgdGhlIHZpcnRp
by1ncHUgYmxvYiBhbGlnbm1lbnQKCk1lc2EgMjYuMi41IFJlbGVhc2UgTm90ZXMgLyAyMDI2LTEw
LTE0Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpNZXNhIDI2LjIuNSBp
cyBhIGJ1ZyBmaXggcmVsZWFzZSB3aGljaCBmaXhlcyBidWdzIGZvdW5kIHNpbmNlIHRoZSAyNi4y
LjQKcmVsZWFzZS4KCk1lc2EgMjYuMi41IGltcGxlbWVudHMgdGhlIE9wZW5HTCA0LjYgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKZ2xHZXRTdHJpbmcoR0xfVkVSU0lPTikgb3IgZ2xH
ZXRJbnRlZ2VydihHTF9NQUpPUl9WRVJTSU9OKSAvCmdsR2V0SW50ZWdlcnYoR0xfTUlOT1JfVkVS
U0lPTikgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KU29tZSBk
cml2ZXJzIGRvbid0IHN1cHBvcnQgYWxsIHRoZSBmZWF0dXJlcyByZXF1aXJlZCBpbiBPcGVuR0wg
NC42LiBPcGVuR0wKNC42IGlzICoqb25seSoqIGF2YWlsYWJsZSBpZiByZXF1ZXN0ZWQgYXQgY29u
dGV4dCBjcmVhdGlvbi4KQ29tcGF0aWJpbGl0eSBjb250ZXh0cyBtYXkgcmVwb3J0IGEgbG93ZXIg
dmVyc2lvbiBkZXBlbmRpbmcgb24gZWFjaCBkcml2ZXIuCgpNZXNhIDI2LjIuNSBpbXBsZW1lbnRz
IHRoZSBPcGVuQ0wgMy4xIEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBDTF9E
RVZJQ0VfVkVSU0lPTiwgQ0xfREVWSUNFX05VTUVSSUNfVkVSU0lPTiBhbmQKQ0xfREVWSUNFX09Q
RU5DTF9DX0FMTF9WRVJTSU9OUwpjbEdldERldmljZUluZm8gcXVlcmllcyBkZXBlbmRzIG9uIHRo
ZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKTWVzYSAyNi4yLjUgaW1wbGVtZW50cyB0
aGUgVnVsa2FuIDEuNCBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgYXBpVmVy
c2lvbiBwcm9wZXJ0eSBvZiB0aGUgVmtQaHlzaWNhbERldmljZVByb3BlcnRpZXMgc3RydWN0CmRl
cGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuCgpTSEEgY2hlY2tzdW1z
Ci0tLS0tLS0tLS0tLS0KCjo6CgogICAgU0hBMjU2OiA3OTRiM2QxNzI5MDc1ZGFlN2ViZDQ3Yzcy
ODNiN2NhMGNkYjVkZWM2NjhmN2YxMWNjMGE1ZDgyZjYxMzhhMGE1CiAgICBtZXNhLTI2LjIuNS50
YXIueHoKICAgIFNIQTUxMjogMDhjN2Q3ZWE0MjZkZGZiMGY3YmM1MWIwNmUxOGMzNjNhNGQzMWNm
MWE4YjIwMzgyOGJiNDU1ZWRhMDE4OWU0MWQyMjEKICAgIDVlYjlmNjI3NTg1ZWQxMWUwZDBmMjMx
YTZhOGM5ZjBjNzE3NjIzODc2MGNkNzZiNjJlMjBjMzVjY2Q2YQogICAgbWVzYS0yNi4yLjUudGFy
Lnh6CgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgotIE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0t
LS0KCi0gTWVzYSAyNi4yLjEgR3JvdW5kIFRydXRoIEFtYmllbnQgT2NjbHVzaW9uIEJyb2tlbiBv
biBObyBNYW4ncyBTa3kKLSBNZXNoIHNoYWRlciB1bmlmb3JtL2NvbnN0YW50IHJlbmRlcmluZyBp
c3N1ZQotIFJBRFYgcmVncmVzc2lvbiBpbiBNZXNhIDI2LjIueCDigJMgTm8gTWFuJ3MgU2t5IGhh
cyBicm9rZW4vZGFyayBzdW5saWdodCBvbiBSWAogIDc5MDAgWFQKLSBSZWdyZXNzaW9uOiBEM0Qx
MiBkcml2ZXIgYW5kIERSSSBicm9rZW4gdW5kZXIgV1NMIGluIDI1LjAuNAotIFNJR0lMTCB3aXRo
IGxsdm1waXBlIG9uIEFSTXY5KD8pIHdpdGhvdXQgU1ZFCi0gWC1QbGFuZSAxMiBlbmNvdW50ZXJp
bmcgYSBHUFUgY3Jhc2ggb24gbG9hZCBhZnRlciByZWNlbnQgdXBkYXRlLgotIFtGb3J0cyBSVFNd
IENvcnJ1cHQgcmVuZGVyaW5nIG9mIGNvbXByZXNzZWQgdGV4dHVyZXMKLSBhY286IGlsbGVnYWwg
Vk9QMyB2X2NuZG1hc2tfYjMyIHdpdGggdHdvIFNHUFIgb3BlcmFuZHMgb24gR0ZYNi05IGluCiAg
ZW1pdF9zY2FsZWRfb3AgKGZwMzIgZGVub3JtIHByZXNlcnZlKSDihpIgd3JvbmcgcmVzdWx0cwot
IHJhZGVvbnNpOiBpbmNvcnJlY3QgcmVuZGVyaW5nIGluIERvb20gMzogQkZHCi0gcmFkdi9hbWRn
cHU6IHBhZGRpbmcgVk0gcGFnZSAoUkFERU9OX0ZMQUdfVk1fUEFEXzFQQUdFKSBpcyBuZXZlciB1
bm1hcHBlZCBvbgogIEJPIGRlc3Ryb3k7IFZBIHJldXNlIHRoZW4gZmFpbHMgd2l0aCAidmEgLi4u
IGNvbmZsaWN0IiBvbiBHRlg5Ci0gcnVzdGljbDogY291bGQgbm90IGluaXRpYWxpemUgU1ZNIHN1
cHBvcnQgd2l0aCByYWRlb25zaSx6aW5rCi0gemluazogd3JvbmcgcGlwZWxpbmUgYWZ0ZXIgYSB2
ZXJ0ZXgtbGF5b3V0LW9ubHkgY2hhbmdlIHdpdGhvdXQKICBWS19FWFRfdmVydGV4X2lucHV0X2R5
bmFtaWNfc3RhdGUKCkNoYW5nZXMKLS0tLS0tLQoKQ2FpbyBPbGl2ZWlyYSAoMSk6Ci0gaXJpczog
RnJlZSBjb21wdXRlIGNvbXBpbGF0aW9uIGNvbnRleHQgb24gZmFpbHVyZQpDaHJpc3RpYW4gR21l
aW5lciAoMik6CgotIGV0bmF2aXY6IFVwZGF0ZSB2YWxpZF9idWZmZXJfcmFuZ2UgZm9yIHN0cmVh
bSBvdXRwdXQgYnVmZmVycwotIGV0bmF2aXY6IFNraXAgcmVuZGVyIGNvbXBhdGliaWxpdHkgZm9y
IGV4dGVybmFsIFRTIHBsYW5lIHJlc291cmNlcwoKQ29ubm9yIEFiYm90dCAoMSk6Ci0gdnVsa2Fu
L2dyYXBoaWNzX3N0YXRlOiBEb24ndCBnZXQgSUFMIHN0YXRlIHdoZW4gbm90IG5lZWRlZApEZXJl
ayBMZXNobyAoMSk6Ci0gemluazogQ2F0Y2ggYWxsIHByaW9yIHVwZGF0ZXMgdG8gc291cmNlIHZh
bGlkX2J1ZmZlcl9yYW5nZS4KRG1pdHJ5IEJhcnlzaGtvdiAoNyk6CgotIGZyZWVkcmVuby9jb21t
b246IGZsYWcgYSB3b3JrYXJvdW5kIGZvciBDUF9EUkFXX0FVVE8gaXNzdWUgaW4gYTYzMF9zcWUK
LSBmcmVlZHJlbm8vcmVnaXN0ZXJzOiBkZWZpbmUgZm9ybWF0IG9mIHRoZSBQQ19BVVRPX1ZFUlRF
WF9TVFJJREUgcmVnaXN0ZXIKLSBmcmVlZHJlbm8vYTZ4eDogd29ya2Fyb3VuZCBhbiBpc3N1ZSBp
biBhNjMwX3NxZS5mdwotIHR1OiB3b3JrYXJvdW5kIGFuIGlzc3VlIGluIGE2MzBfc3FlLmZ3Ci0g
ZnJlZWRyZW5vL2E1eHg6IHNldCB0aGUgc2FtcGxlIGNvdW50IGJlZm9yZSB0aGUgR01FTSByZXN0
b3JlIGJsaXRzCi0gZnJlZWRyZW5vL2E1eHg6IHdyaXRlIHRoZSBsaW5lYXIgY2VudHJvaWQgaW50
ZXJwb2xhdG9yIHJlZ2lkCi0gaXIzOiBrZWVwIHRoZSBtc2FhIGtleSBmb3Igc2hhZGVycyB0aGF0
IGludGVycG9sYXRlIGF0IGdsX1NhbXBsZUlECgpEb21pbmlxdWUgQmVsaGFjaGVtaSAoMSk6Ci0g
cGNvOiBmaXggd29ya2dyb3VwIGJhcnJpZXIgcmFjZSB3aGVuIHJldXNlZCBhY3Jvc3MgbG9vcCBp
dGVyYXRpb25zCkR5bGFuIEJha2VyICgxKToKLSBpbnRlbC9qYXk6IERvbid0IGF0dGVtcHQgdG8g
ZG8gd29yayB3aGVuIHRoZXJlIGlzIG5vbmUKRXJpYyBFbmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBh
ZGQgc2hhIHN1bSBmb3IgMjYuMi40Ci0gLnBpY2tfc3RhdHVzLmpzb246IFVwZGF0ZSB0byA4MWRm
ZjdjNjRmYjBjMWYyMDMxZDA0Y2NmZjk5NzIyMzNlMmUwNTI0Ci0gLnBpY2tfc3RhdHVzLmpzb246
IE1hcmsgYTgyZWQ4NTA4ODk1NDIwNmZiMWMzMGQwMTZmMTgzMTBmYTYxNDI3OSBhcwogIGRlbm9t
aW5hdGVkCgpFcmljIFIuIFNtaXRoICgxKToKLSBwYW5mcm9zdDogZml4IFVCIGluIHBhbl9jc2Yg
cG9pbnRlciBiYXNlZCB0eXBlLXB1bm5pbmcKRmFiaW8gUGlwYXJvICgxKToKLSB2YzQ6IGRvbid0
IHJldXNlIGZsYWdzIGZyb20gYmVmb3JlIGEgdGhyZWFkIHN3aXRjaApGcmFuayBCaW5ucyAoMSk6
Ci0gcHZyOiBmaXggZm9yIGpvYiBzYW1wbGVzIGJlaW5nIGluaXRpYWxpc2VkIHRvIDAKRnJhbmsg
Qm91d2VyICgxKToKLSBwdnI6IGZpeCBmb3IgbXVsdGlzYW1wbGluZyB3aXRoIG5vIGF0dGFjaG1l
bnRzCkdlb3JnIExlaG1hbm4gKDQpOgoKLSB2dG46IGFkZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhh
Y3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGFkZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhhY3QgR0xT
THN0ZDQ1MEZtYQotIHJhZHY6IGZvcmNlIGV4YWN0IEdMU0xzdGQ0NTBGbWEgZm9yIE5vIE1hbiBT
a3kKLSBhY286IGZpeCBjb25zdGFudCBidXMgdmlvbGF0aW9uIGZvciBzY2FsZWQgdHJhbnNjZW5k
ZW50YWwgb3AKCkd1c3Rhdm8gTm9yb25oYSBTaWx2YSAoMSk6Ci0gdmVudXM6IGRvbid0IHJ1biBh
IHRocmVhZCdzIFRMUyB0ZWFyZG93biBmcm9tIGFuIHVubG9hZGVkIGRyaXZlcgpJYW4gUm9tYW5p
Y2sgKDEpOgotIG5pci9hbGdlYnJhaWM6IERvbid0IGdlbmVyYXRlIDY0LWJpdCBpYWRkMyB3aGVu
IG5vdCBzdXBwb3J0ZWQKSWNlbm93eSBaaGVuZyAoMik6CgotIGxsdm1waXBlOiBkbyBub3QgY2Fs
bCBMTFZNTGlua0luTUNKSVQoKSB3aGVuIHVzaW5nIE9yY0pJVAotIG1lc29uOiBsaW5rIGluIG9y
Y2ppdCBpbnN0ZWFkIG9mIG1jaml0IHdoZW4gdXNpbmcgT3JjSklUCgpKYWRlIE1hY2hvICgxKToK
LSBnYWxsaXVtL3N3OiBGaXggbGx2bXBpcGUgYmVpbmcgY2hvc2VuIHdoZW4gbm90IHdhbnRlZApK
ZW9uZ2lrIENoYSAoMSk6Ci0gZ2Z4c3RyZWFtOiBhbGxvdyBWS19FWFRfdmVydGV4X2F0dHJpYnV0
ZV9kaXZpc29yIGFnYWluCkpvcmRhbiBKdXN0ZW4gKDIpOgoKLSBpbnRlbC9nZW4vY29tcGFjdDog
Rml4IHR5cG8gaW4gWGUzUCBjb21wYWN0IHRhYmxlcwotIGludGVsL2dlbi9jb21wYWN0OiBGaXgg
VU5DT01QXzNTUkNfU09VUkNFIGZvciBYZTNQCgpLYXJvbCBIZXJic3QgKDIpOgoKLSBydXN0aWNs
L2NvbnRleHQ6IHNraXAgbm9uIFNWTSBkZXZpY2VzIGluIGNsU1ZNQWxsb2MKLSBydXN0aWNsL3Bs
YXRmb3JtOiBza2lwIG5vbiBTVk0gZGV2aWNlcyB3aGVuIGNyZWF0aW5nIHRoZSBWTSBoZWFwCgpL
b25zdGFudGluIFNldXJlciAoMSk6Ci0gcmFkdjogQWxpZ24gYnZoIHRvIDEyOCBieXRlcyBvbiBH
RlgxMgpMZW9uIFNlZW1hbm4gKDEpOgotIHppbms6IHVwZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiBv
bmx5IHRoZSB2ZXJ0ZXggaW5wdXQgc3RhdGUgY2hhbmdlcwpMaW9uZWwgTGFuZHdlcmxpbiAoNCk6
CgotIGFudjogZml4IGR5bmFtaWMgYnVmZmVyIGJhc2Ugb2Zmc2V0IHVwbG9hZAotIGFudjogc3Rv
cmUgYXZhaWxhYmlsdHkgYmVmb3JlIHdyaXRpbmcgcGFydGlhbCByZXN1bHRzCi0gYW52OiBmZW5j
ZSBNSSBhdmFpbGFiaWx0eSB3cml0ZXMKLSBhbnY6IHRyYWNrIHRoZSBxdWVyeSBwb29sIGNvcGll
cyBmb3IgcmVzZXRzCgpMb2tib25kbyBLdW5nICgxKToKLSBsbHZtcGlwZTogZml4IHVic2FuIHNo
aWZ0IGV4cG9uZW50IHRvbyBsYXJnZSBlcnJvcgpMdWNpZSBIYXJ0bWFubiAoMSk6Ci0gZ2FsbGl2
bTogUXVlcnkgaG9zdCBDUFUgZmVhdHVyZXMgb24gYWFyY2g2NCB0b28KTWFyZWsgT2zFocOhayAo
MSk6CgotIHJhZHY6IGZpeCB0byB1c2UgSFRJTEUgZmlsbHMgaW5zdGVhZCBvZiBSTVcgc2hhZGVy
cyB0byByZXN0b3JlIHByZXZpb3VzCiAgYmVoYXZpb3IKCk1hcnkgR3VpbGxlbWFyZCAoMyk6Cgot
IG52ay9udmttZDogaGFuZGxlIGV4ZWNfY291bnQgPT0gMCBpbiBudmttZF9ub3V2ZWF1X2V4ZWNf
Y3R4X2V4ZWMKLSBub3V2ZWF1L21tZTogQWRkIGRlcGVuZGVuY3kgb24gbXRoZCBmb3IgRFJFQUQv
RFdSSVRFCi0gbm91dmVhdS9tbWU6IEZpeCBzY3JhdGNoX3NoYXJlXzNkX3RvX2NvbXB1dGUgdGVz
dAoKTWF0dCBUdXJuZXIgKDkpOgoKLSBnYWxsaXZtOiBkb24ndCB1c2UgdGhlIHMzdGMgYW5kIHJn
dGMgSklUIGRlY29kZXJzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBwaWNrIHRoZSByaWdodCBs
YW5lIGZvciBpbWFnZSBzdG9yZXMgd2lkZXIgdGhhbiAzMiBiaXRzIG9uIGJpZy1lbmRpYW4KLSBn
YWxsaXZtOiBmaXggZmlyc3RfYWN0aXZlX2ludm9jYXRpb24oKSBvbiBiaWctZW5kaWFuCi0gZ2Fs
bGl2bTogZml4IHVucGFja182NF8yeDMyX3NwbGl0IGZvciBzY2FsYXJzIG9uIGJpZy1lbmRpYW4K
LSBnYWxsaXZtOiBvbmx5IHVzZSB2bWF4ZnAgZm9yIDMyLWJpdCBmbG9hdHMKLSBnYWxsaXZtOiBk
b24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBOYU4gb3BlcmFuZHMgbXVzdCBiZSBpZ25v
cmVkCi0gZ2FsbGl2bTogdXNlIFZTWCBmb3Igcm91bmRpbmcgd2hlbiBhdmFpbGFibGUKLSBnYWxs
aXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBWU1ggaXMgYXZhaWxhYmxlCi0g
bmlyLCBnbHNsLCBnYWxsaXVtOiBrZWVwIHRoZSBoYWx2ZXMgb2YgbG93ZXJlZCA2NC1iaXQgSU8g
aW4gbWVtb3J5IG9yZGVyCgpNYXR0aGlldSBNb2F0dGkgKDEpOgotIHBhbi9iaTogUmVzdG9yZSBW
QV9NRU1PUllfQUNDRVNTX0ZPUkNFIGZvciBzcGlsbHMgYW5kIHJlZmlsbHMKTWlrZSBCbHVtZW5r
cmFudHogKDI3KToKCi0gemluay9rb3BwZXI6IGZpeCBjaGVjayBmb3IgYXN5bmMgcHJlc2VudHMK
LSB6aW5rL2tvcHBlcjogd2FpdCBvbiBhc3luYyBwcmVzZW50cyB3aGVuIHVwZGF0aW5nIHN3YXBj
aGFpbgotIHppbmsva29wcGVyOiBzdG9wIGxlYWtpbmcgc3dhcGNoYWlucyBoYXJkZXIKLSB6aW5r
L2tvcHBlcjogZG8gYSBmdWxsIGdsdGhyZWFkL3RjIHN5bmMgd2hlbiBzZXR0aW5nIHN3YXAgaW50
ZXJ2YWwKLSB6aW5rL2tvcHBlcjogdXNlIHRoZSBhY3R1YWwgY3VycmVudCBpbWFnZSBleHRlbnQg
d2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5rOiByZXR1cm4gb24gZmx1c2hfZnJvbnRi
dWZmZXIgaWYgc3dhcGNoYWluIGlzIGtpbGwKLSB6aW5rL2tvcHBlcjogZml4IHJldHVybiB2YWx1
ZSBpbiBhY3F1aXJlCi0ga29wcGVyOiBtb3ZlIGV2ZW50IHNlbGVjdGlvbiBmb3IgcHJlc2VudCBp
bnRvIGtvcHBlckdldFN5bmNWYWx1ZXMKLSB6aW5rL2tvcHBlcjogYWRkIGxvY2tpbmcgYXJvdW5k
IEFOSSBhbmQgUVAKLSB6aW5rL2tvcHBlcjogZml4IGludmFsaWQgcmVhZCBkdXJpbmcgc3dhcGNo
YWluIHRlYXJkb3duCi0gdXRpbC90ZXhjb21wcmVzc19yZ3RjOiB6ZXJvLWluaXRpYWxpemUgZW5j
b2RlIHZhcmlhYmxlcwotIHppbmsvc3luYzogcGx1ZyBhbiBleHRyZW1lbHkgdHJpY2t5IGhvbGUg
aW4gcmVvcmRlcmluZyBsb2dpYwotIHV0aWwvZGlza19jYWNoZTogb25seSBzdWJ0cmFjdCBhbiBl
dmljdGVkIGl0ZW0gaWYgdW5saW5rIHN1Y2NlZWRlZAotIHV0aWwvZGlza19jYWNoZTogcHV0IGd1
YXJkIHBhZ2VzIGFyb3VuZCB0aGUgaW5kZXggbWFwcGluZwotIHV0aWwvZGlza19jYWNoZTogcmV0
dXJuIHdoZXRoZXIgZXZpY3RfbHJ1X2l0ZW0gcmVtb3ZlZCBhIGZpbGUKLSB1dGlsL2Rpc2tfY2Fj
aGU6IHJlY29tcHV0ZSBhbiBpbXBvc3NpYmxlIHNpemUgY291bnRlciBvbiBvcGVuCi0gdXRpbC9k
aXNrX2NhY2hlOiByZWNvbXB1dGUgdGhlIHNpemUgd2hlbiBldmljdGlvbiBjYW5ub3QgaGVscAot
IHV0aWwvZGlza19jYWNoZTogcmVtb3ZlIHN0YWxlIC50bXAgZmlsZXMgd2hlbiByZWNvbXB1dGlu
ZyB0aGUgc2l6ZQotIHN0L3Bibzogc2tpcCBkZWxldGVfY29tcHV0ZV9zdGF0ZSBmb3Igc2hhZGVy
cyBuZXZlciBjcmVhdGVkCi0gemluazogY2xlYXIgdGhlIGdlbmVyYXRlZCB0Y3MgbmlyIHBvaW50
ZXIgYWZ0ZXIgaXQgaXMgZnJlZWQKLSB6aW5rOiBjaGVjayB1bmZsdXNoZWQgdW5kZXIgdGhlIHVz
YWdlIG11dGV4IGluIHRoZSB1bmZsdXNoZWQgd2FpdAotIHppbms6IHRha2UgcmFsbG9jX2xvY2sg
YXJvdW5kIHNjcmVlbi1wYXJlbnRlZCByYWxsb2NzCi0gemluazogc3RvcCBwYXJlbnRpbmcgdGhl
IHNjcmVlbidzIHNlbWFwaG9yZSBhcnJheXMgdG8gdGhlIHNjcmVlbgotIHppbms6IHNlcmlhbGl6
ZSB1bnRocmVhZGVkIGJhdGNoIHN1Ym1pc3Npb24gcGVyIHNjcmVlbgotIHppbms6IGZvcmNlIHN5
bmMgYWZ0ZXIgdW5iaW5kLCBldmVuIHdpdGggR0VORVJBTCBsYXlvdXRzCi0gemluazogZW5zdXJl
IGRlc2NyaXB0b3IgYnVmZmVycyBzdGF5IG1hcHBhYmxlIHdpdGhvdXQgQkFSIGFsbG9jCi0gemlu
azogYXZvaWQgY29uc3RhbnRseSBmYWlsaW5nIEJBUiBhbGxvY2F0aW9ucyBvbiBzeXN0ZW1zIHdp
dGhvdXQgUmVCQVIKCk1pa2hhaWwgTWxoY25uICgyKToKCi0gdXRpbC90YzogcmVzZXQgZW5kX2Nh
bGwgd2hlbiBycCBpbmZvIGlzIHJldXNlZCBhZnRlciBzeW5jCi0gdXRpbC90YzogZml4IGJ1ZmZl
ciBvdmVyLXJlYWQgYW5kIHRocmVhZCByYWNlIGluIHN0YWdpbmcgdGV4dHVyZV9zdWJkYXRhCgpO
aWtpdGEgS29udG9uICgxKToKLSByYWRlb25zaTogaW52YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBh
dCBJQiBzdGFydCBvbiBhbGwgZ2Z4IGxldmVscwpPbGl2aWEgTGVlICgxKToKLSBwYW52azogZml4
IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBHZXRJbnN0YW5jZVByb2NBZGRyCk9tYXIgUmFz
aHdhbiAoMik6CgotIG5pci9pbnN0cl9zZXQ6IGNvbXBhcmUgdGV4IGRlZiB3aGVuIENTRWluZyB0
ZXh0dXJlIGluc3RydWN0aW9ucwotIG5pci9pbnN0cl9zZXQ6IGNvbXBhcmUgdGV4IGRlc3RfdHlw
ZSBpbnN0ZWFkIG9mIGJpdCBzaXplIHdoZW4gQ1NFaW5nIHRleHR1cmUKICBpbnN0cnVjdGlvbnMK
ClBldGVyIFF1YXlsZSAoMSk6Ci0gcHZyOiBmaXggc3RyZWFtLW91dCBQRFMgZGF0YSBzaXplIHVu
aXRzIGluIENTQiBkdW1wClBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICgzKToKCi0gcmFkZW9u
c2k6IHJlbW92ZSBpbnZhbGlkIGFzc2VydAotIHJhZGVvbnNpL2dmeDEyOiBkb250IHNldCBCTyBt
ZXRhZGF0YSBvbiBpbXBvcnQKLSB3aW5zeXMvYW1kZ3B1OiBmaXggaW1wb3J0L2Rlc3Ryb3kgcmFj
ZSBhZ2FpbgoKUm9iIENsYXJrICgxKToKLSBmcmVlZHJlbm8vY29tbW9uOiBGaXggYTcwMiBjaGlw
LWlkClNhbXVlbCBQaXRvaXNldCAoNCk6CgotIHJhZHYvcnQ6IGZpeCBjaGVja2luZyBlcnJvcnMg
Zm9yIGltcG9ydGVkIGJpbmFyaWVzCi0gcmFkdi9ydDogZml4IGltcG9ydGluZyBwaXBlbGluZSBi
aW5hcmllcwotIHJhZHYvbmlyOiBmaXggZGV0ZXJtaW5pbmcgaWYgYSBWUyBpbnB1dCBsb2NhdGlv
biBpcyBoaWdoIDY0LWJpdAotIHJhZHYvYW1kZ3B1OiB1bm1hcCB0aGUgZmlyc3QgcGFnZSB1c2Vk
IHRvIGltcGxlbWVudCBWTSBwYWRkaW5nCgpTaW1vbiBQZXJyZXR0YSAoMSk6Ci0gcGNvOiB0ZW1w
b3JhcmlseSBkaXNhYmxlIHZ0eGluIGFsbG9jYXRpb24gZHVlIHRvIHZlYyBoYW5kbGluZyBidWcK
VGhvbmcgVGhhaSAoMSk6Ci0gZHJpY29uZjogQWRkIGlnbm9yZV9tYXBfaW52YWxpZGF0ZV9idWZm
ZXIgb3B0aW9uClRpbW90aHkgQXJjZXJpICg1KToKCi0gcmFkZW9uc2k6IGNvcnJlY3RseSBkZXRl
Y3QgYW5kIHNldCBtZXNoIHNoYWRlcnMgYXMgZGlydHkKLSByYWRlb25zaTogd2lkZW4gYmluZF9o
aXN0b3J5IGJpdGZpZWxkCi0gZ2FsbGl1bS90Yy96aW5rOiB3aWRlbiByZWJpbmRfbWFzayB0byBz
dXBwb3J0IHVzZSBieSBtZXNoIHNoYWRlcnMKLSB6aW5rOiBmaXggcmViaW5kaW5nIHN1cHBvcnQg
Zm9yIG1lc2ggc2hhZGVycwotIHV0aWwvZm9ybWF0OiBmaXggdHlwbyBpbiB0aGUgQlBUQyBjb21w
cmVzc29yCgpWaW5zb24gTGVlICgxKToKLSBlZ2w6IEZpeCBpbnQtdG8tdm9pZC1wb2ludGVyLWNh
c3Qgd2FybmluZyBvbiBtYWNPUwptYXR0aGV3cGVyaXV0ICgxKToKLSB2ZW51czogc2tpcCB2aXJ0
aW8tZ3B1IGRldmljZXMgd2l0aG91dCAzRAptaXR1bDcyICgxKToKLSByYWR2OiBDbGVhciBzdGFs
ZSB2ZXJ0ZXggdXNlciBTR1BSIHN0YXRlIHdoZW4gYmluZGluZyBtZXNoIHNoYWRlcnMKc29rYSAo
MSk6Ci0gemluazogY2hlY2sgdGhlIHByaW1pdGl2ZSB0eXBlIGFmdGVyIHppbmtfYmF0Y2hfcnAo
KQoKTWVzYSAyNi4yLjYgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMTAtMjgKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi42IGlzIGEgYnVnIGZpeCByZWxlYXNl
IHdoaWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuNQpyZWxlYXNlLgoKTWVzYSAy
Ni4yLjYgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBv
cnRlZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9S
X1ZFUlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRo
ZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9y
dCBhbGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMg
Kipvbmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21w
YXRpYmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBv
biBlYWNoIGRyaXZlci4KCk1lc2EgMjYuMi42IGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJ
LCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9E
RVZJQ0VfTlVNRVJJQ19WRVJTSU9OIGFuZApDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05T
CmNsR2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVy
IGJlaW5nIHVzZWQuCgpNZXNhIDI2LjIuNiBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwg
YnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRo
ZSBWa1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGlj
dWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoK
ICAgIFRCRC4KCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCi0gTm9uZQoKQnVnIGZpeGVzCi0t
LS0tLS0tLQoKLSBBQ086IHNfYml0c2V0MCByZXRhcmdldGVkIHRvIGV4ZWMgZHJvcHMgdGhlIFZD
QyBjb25kaXRpb24gKDI2LjIgcmVncmVzc2lvbgogIGZyb20gOTg0YWE2ZTA4NTUsIFJBRFYsIFJE
TkEyIHRvIFJETkE0LCBLeXR5UFM1KQotIEFOVjogQXNzZXJ0IG9uIHZrR2V0UGh5c2ljYWxEZXZp
Y2VJbWFnZUZvcm1hdFByb3BlcnRpZXMyCi0gQ29uZmlkZW50aWFsIGlzc3VlICMxNjYzMAotIEdQ
VUxvc3REZXZpY2Ugb24gNjgwMCBYVCAobWVzYS0yNi4wLlgpCi0gSW50ZWwgTWV0ZW9yIExha2U6
IFVuaWdpbmUgSGVhdmVuIGFuZCBWYWxsZXkgdHJpZ2dlciBHUFUgaGFuZ3Mgd2l0aCBNZXNhCiAg
MjYuMi4w4oCTMjYuMi40OyB3b3JrIHdpdGggMjYuMS44Ci0gV2l0Y2hlciAzIFJlbWFzdGVyZWQg
LSBHcmFwaGljYWwvdmlzdWFsIGJ1ZyB0aGF0IGFjdCBsaWtlIGFuIG92ZXJsYXkKLSBbVHVybmlw
L0E2NTBdIEhhbmdzIGluIHNldmVyYWwgc2V2ZXJhbCBnYW1lcyBkdWUgdG8gc29tZSBtaXNzaW5n
IHNoYWRlcig/KQogIHdvcmthcm91bmQKLSBkM2QxMiAoV1NMMiwgTlZJRElBIFJUWCA1MDkwKTog
c2VsZi1kZWFkbG9jayBpbiBkM2QxMl9ib19uZXcoKSwgcmVjbGFpbSB1bmRlcgogIHBiX3NsYWIg
bWFuYWdlciBtdXRleCBoYW5ncyBSUENTMyBvbiBjb21wcmVzc2VkIHRleHR1cmUgdXBsb2FkCi0g
ZnJlZWRyZW5vOiBnYXJibGVkIHRleHQgcmVuZGVyZWQgYnkgcGRmLmpzIG9uIHNuYXBkcmFnb24g
eDEgZWxpdGUKLSBrb3BwZXI6IG5vbi1kbWFidWYgc3cgdGV4dHVyZSB1cGRhdGUgaXMgYnJva2Vu
Ci0gbGF2YXBpcGU6IG1haW50ZW5hbmNlOCBkZXB0aC9zdGVuY2lsIDwtPiBjb2xvciB2a0NtZENv
cHlJbWFnZSBjb3BpZXMgb25seQogIHNhbXBsZSAwIG9mIG11bHRpc2FtcGxlZCBEMzJfU0ZMT0FU
X1M4X1VJTlQgYW5kIEQyNF9VTk9STV9TOF9VSU5UIGltYWdlcwotIGxhdmFwaXBlOiBuZXcgUlQg
ZmFpbHMKLSB2M2R2OiBncHUgaGFuZyB3aGVuIGFuIGlubGluZSB1bmlmb3JtIGJsb2NrIGNvbWVz
IGJlZm9yZSBhIHNhbXBsZWQgaW1hZ2UKCkNoYW5nZXMKLS0tLS0tLQoKM21ybzc3N28gKDEpOgot
IG5pci9vcHRfdmFyeWluZ3M6IHVzZSBuaXJfc3JjX3Jld3JpdGUgd2hlbiBzaHJpbmtpbmcgdmFy
eWluZyBhcnJheXMKQWVyb01vZGVzICgxKToKLSBtZXNvbjogZml4IEdOVSBxc29ydF9yIGRldGVj
dGlvbiBmb3IgR0NDCkNhaW8gT2xpdmVpcmEgKDQpOgoKLSBpbnRlbC9jb21waWxlcjogRml4IGNv
b3BlcmF0aXZlIG1hdHJpeCBjb252ZXJzaW9uIHNpZ25lZG5lc3MKLSBqYXk6IFVwZGF0ZSBQSEkg
dW5pZm9ybSBmaWVsZCB3aGVuIHNwaWxsaW5nIGl0cyBkZXN0aW5hdGlvbgotIGdlbjogRml4IHR5
cG8gaW4gdmFsaWRhdGlvbiBmb3Igc3BlY2lhbCByZXN0cmljdGlvbnMKLSBqYXk6IERvbid0IGxv
d2VyIFUzMiBtb3ZzIHRvIEYzMiB3aGVuIGNtb2QgaXMgYmVpbmcgdXNlZAoKQ2FsbHVtIEZhcmUg
KDEpOgotIGlyMzogRml4IHBvdGVudGlhbCBvdXQtb2YtcmFuZ2UgbG9hZF9jb25zdF9pcjMgYmFz
ZSBvZmZzZXQKQ2hyaXN0aWFuIEdtZWluZXIgKDMpOgoKLSBldG5hdml2OiBibHQ6IFByb2dyYW0g
dGhlIHNvdXJjZSBUUyBmb3IgbWlwbWFwIGdlbmVyYXRpb24KLSBldG5hdml2OiBVcGRhdGUgc2Ft
cGxlciBzb3VyY2VzIGJlZm9yZSBkZXJpdmluZyBzdGF0ZQotIGV0bmF2aXY6IEV4cG9zZSBvbmx5
IHRoZSBsaW5lYXIgbW9kaWZpZXIgZm9yIE5WMTIKCkNvbm5vciBBYmJvdHQgKDMpOgoKLSB0dTog
RG9uJ3QgYmFpbCBhZnRlciB0aGUgZmlyc3QgaW5zdHIgd2hlbiBnYXRoZXJpbmcgcHVzaCBjb25z
dCByYW5nZQotIHR1OiBGaXggYmluZGxlc3MgZGVzY3JpcHRvciBpbnZhbGlkYXRlIHNlcXVlbmNl
Ci0gaXIzOiBPbmx5IGNhbGwgbmlyX29wdF9zaHJpbmtfdmVjdG9ycyBvbmNlCgpEYW5pZWwgU2No
w7xybWFubiAoMik6CgotIG5pci9sb3dlcl9jb250aW51ZV9jb25zdHJ1Y3RzOiBwcmVzZXJ2ZSBw
aGkgc291cmNlcyB3aGVuIHNpbXBsaWZ5aW5nIGxvb3AKICBqdW1wcwotIG5pci9sb3dlcl9jb250
aW51ZV9jb25zdHJ1Y3RzOiBwcmVzZXJ2ZSBTU0EgZG9taW5hbmNlIGFjcm9zcyBuZXN0ZWQgZXhp
dHMKCkRhbnlsbyBQaWxpYWlldiAoMyk6CgotIHR1L2E2eHg6IFNldCBjb3JyZWN0IHZhbHVlIGZv
ciBHUkFTX01PREVfQ05UTAotIHR1L2E2eHg6IEludmFsaWRhdGUgc2hhcmVkIGNvbnN0cyBiZWZv
cmUgZGlzYWJsaW5nIHRoZW0KLSBmcmVlZHJlbm86IEZpeHVwIGluY29ycmVjdGx5IGNvcGllZCBB
NlhYX1RQTDFfREJHX0VDT19DTlRMIGZvciBBNjUwCgpEYXZlIEFpcmxpZSAoNSk6CgotIGxsdm1w
aXBlOiBoYW5kbGUgaW5kaXJlY3QgZ2VvbWV0cnkgc2hhZGVyIGlucHV0cwotIGxsdm1waXBlOiBh
ZGQgdmVjdG9yIHdpZHRoIHRvIHRoZSBkaXNrIGNhY2hlLgotIGxhdmFwaXBlOiBmaXggbXVsdGlz
YW1wbGUgZGVwdGg8LT5jb2xvciBjb3BpZXMuCi0gZWdsL3N1cmZhY2VsZXNzOiBkb24ndCBwcm9i
ZSBkZXZpY2UgbmFtZSBpZiBmZCBpcyBpbnZhbGlkLgotIGxsdm1waXBlOiBhZHZhbmNlIDFEIGZy
YW1lYnVmZmVyIGZldGNoZXMgYXQgZm91ciBsYW5lcwoKRGF2aWQgUm9zY2EgKDUpOgoKLSByYWRl
b25zaS9tbTogU2V0IGVycm9yIHdoZW4gZmFpbGluZyB0byBtYXAgYml0c3RyZWFtIGJ1ZmZlcgot
IHJhZGVvbnNpL21tOiBEb24ndCByZXR1cm4gZmVlZGJhY2sgd2hlbiBhbGxvY2F0aW5nIGJ1ZmZl
ciBmYWlscwotIHJhZGVvbnNpL21tOiBGaXggcGlwZV9jb250ZXh0IGxlYWsgd2hlbiBjc19jcmVh
dGUgZmFpbHMKLSByYWRlb25zaS9tbTogQ2hlY2sgZW1iZWRkZWQgYnVmZmVyIG1hcCBmYWlscwot
IHJhZGVvbnNpL21tOiBJbmNyZWFzZSBvYnVfc2l6ZSBsZW5ndGggdG8gMiBieXRlcyBpbiBBVjEg
c2VxdWVuY2UgaGVhZGVyCgpEbWl0cnkgQmFyeXNoa292ICgzKToKCi0gaXIzOiBkbyBub3QgbGV0
IGZ1bGwtcmVnaXN0ZXIgd3JpdGVzIHJlc2V0IGhhbGYtcmVnaXN0ZXIgZGVsYXlzIGJlZm9yZSBh
Nnh4Ci0gaXIzOiByZXNlcnZlIGltYWdlIGRpbWVuc2lvbnMgZm9yIHJlYWQtd3JpdGUgaW1hZ2Vz
IG9uIGE1eHgKLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGVhciBQSVBFX0JJTkRfT1BFTkNMIGJl
Zm9yZSBjaGVja2luZyBmb3JtYXQgc3VwcG9ydAoKRG9taW5pcXVlIEJlbGhhY2hlbWkgKDEpOgot
IHB2cjogYW1lbmQgc2hhcmVkIG1lbW9yeSBjb2VmZiByZWcgY291bnQgdG8gdXNlIERXT1JEIGdy
YW51bGFyaXR5CkR5bGFuIEJha2VyICgxKToKLSBtZXNvbjogaW1ndWktc2RsMy12dWxrYW4gbmVl
ZHMgdGhlIHZ1bGthbiBsb2FkZXIgaGVhZGVycwpFbW1hIEFuaG9sdCAoMyk6CgotIGZyZWVkcmVu
bzogRW5zdXJlIHRoYXQgdGhlIGdlbmVyYXRlZCBwYWNrIGhlYWRlcnMgYXJlIHN0YWJsZSBiZXR3
ZWVuIGJ1aWxkcy4KLSBpc2FzcGVjOiBGaXggZW5jb2RlciBvdXRwdXQgc3RhYmlsaXR5LgotIG5p
ci9vcHRfYWxnZWJyYWljX3Rlc3Q6IEZpeCB1bml0IHRlc3QgY29kZWdlbiBvdXRwdXQgc3RhYmls
aXR5LgoKRXJpYyBFbmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBhZGQgc2hhIHN1bSBmb3IgMjYuMi41
Ci0gLnBpY2tfc3RhdHVzLmpzb246IFVwZGF0ZSB0byBhMGFlYTBkMmQ5MzIwNjRkZDZkZTdmODU2
ZDQ5YmY2OWY3OWVlMWRlCi0gLnBpY2tfc3RhdHVzLmpzb246IE1hcmsgNGJmM2U3NTM3ODNmYWM2
NmZiNzA1OWU0MjNlZjA0OTMzNGUxODZkNSBhcwogIGRlbm9taW5hdGVkCgpFcmlrIEZheWUtTHVu
ZCAoMTMpOgoKLSBwYW5mcm9zdDogcGx1ZyBwcmVjb21wLXNoYWRlciBsZWFrCi0gcGFudms6IGZp
eCBhbGxvd19tZXJnaW5nX3dvcmtncm91cHMgbG9naWMKLSBwYW52azogZHJvcCByZWR1bmRhbnQg
ZGVzY3JpcHRvci1jb3B5Ci0gcGFuL2xpYjogZml4IHJlcGVhdGVkIHdpZHRoX3B4IGNoZWNrCi0g
cGFuL2xpYjogZml4IGNvcHktcGFzdGEgYnVnCi0gcGFuL2xpYjogZG8gbm90IGZvbGQgaW50byB0
aGUgc2FtZSBvcCB0d2ljZQotIHBhbmZyb3N0OiBmcmVlIGNvcnJlY3QgaGFuZGxlCi0gcGFuL2Jp
OiBoYW5kbGUgdGxzLXN0b3JlcyBpbiBoZWxwZXIgYW5hbHlzaXMKLSB2dWxrYW4vbWV0YTogY29y
cmVjdCBpbWFnZS1yZXNvbHZlIGZvciAzRCBpbWFnZQotIHBhbnZrOiBwcm9wZXJseSBpZ25vcmUg
ZGVwdGgtc3RlbmNpbCBhc3BlY3RNYXNrCi0gdnVsa2FuL21ldGE6IGZpeHVwIHR5cG8KLSBwYW52
azogdHJhY2sgaGVhcCBidWRnZXQgYWNyb3NzIGluc3RhbmNlcwotIHBhbnZrOiB3cml0ZV9pbWFn
ZV92aWV3X2Rlc2MgZGVhbHMgd2l0aCBpbWFnZXMsIG5vdCBzYW1wbGVycwoKRmFicmljaW8gQWtp
byAoMSk6Ci0gZnJlZWRyZW5vL2E1eHg6IFJlbG9hZCB0ZXh0dXJlcywgU1NCT3MgYW5kIGltYWdl
cyBhZnRlciB0aGUgcHJvZ3JhbQpGYWl0aCBFa3N0cmFuZCAoMik6CgotIHBhbi9uaXI6IERvbid0
IHVzZSBuYXJyb3dfYXJyYXlfaW5kZXggd2l0aCB3aWRlX2luZGljZXMKLSBrb3BwZXI6IERvbid0
IGNhbGwgc3dyYXN0X3VwZGF0ZV90ZXhfYnVmZmVyKCkgaWYgd2UgZG9uJ3QgaGF2ZSBzd3Jhc3QK
Ckdlb3JnIExlaG1hbm4gKDQpOgoKLSB2YzQ6IHNldCBsb3dlcl9pbnQ2NF9vcHRpb25zIHRvIG5v
dCBzdXBwb3J0IGFueSA2NGJpdCBhbHUKLSB2M2R2OiBzZXQgbG93ZXJfaW50NjRfb3B0aW9ucyB0
byBub3Qgc3VwcG9ydCBhbnkgNjRiaXQgYWx1Ci0gcmFkdjogZXhwb3NlIGZwMTYgb24gZ2Z4OCBm
b3IgdmtkM2QtcHJvdG9uCi0gYWNvL2lzZWw6IGZpeCBzZ3ByIHN1YiBkd29yZCBuaXJfb3BfdmVj
IHdpdGggdW5kZWZzCgpIVFJNQyAoMSk6Ci0gdjNkdjoga2VlcCBkZXNjcmlwdG9ycyBhbGlnbmVk
IGFmdGVyIGlubGluZSB1bmlmb3JtIGJsb2NrcwpIZXJtYW4gU2VtZW5vZmYgKDEpOgoKLSBpbnRl
bC9pOTE1OiBmaXggSTkxNV9QQVJBTV9IQVNfQ09OVEVYVF9GUkVRX0hJTlQgY2hlY2sgYW5kIGxv
dyBsYXRlbmN5IHBhcmFtCiAgdmFsdWUKCklhZ28gVG9yYWwgUXVpcm9nYSAoMSk6Ci0gdjNkdjog
Rml4IGVhcmx5LWV6IG9uIHY3MQpJYW4gUm9tYW5pY2sgKDQpOgoKLSBicnc6IEZpeCByZWdpb25z
X292ZXJsYXAgZm9yIGFjY3VtdWxhdG9ycwotIGJydzogQ1NFTCBjYW5ub3QgbWl4IHR5cGUgc2l6
ZXMgZXZlbiBmb3IgaW1tZWRpYXRlcwotIGJydzogQ1NFTCBjYW5ub3QgaGF2ZSBpbW1lZGlhdGUg
c3JjMQotIGJydzogRml4IDE2LWJpdCB0eXBlIGhhbmRsaW5nIGluIGNvbnN0YW50IGNvbWJpbmlu
ZwoKSmFjayBCb3lraW4gKDEpOgotIHJhZHYvdmlkZW86IHJlbW92ZSBkZWNvZGUgdGllcjMKSmVz
c2UgTmF0YWxpZSAoMik6CgotIGQzZDEyOiBTdG9wIHJlY2xhaW0gcmV0cmllcyB3aGVuIHRoZSBm
ZW5jZSB3YWl0IGZhaWxzCi0gZDNkMTI6IFJlY2xhaW0gYnVmZmVyIG1lbW9yeSBvdXRzaWRlIG1h
bmFnZXIgbG9ja3MKCkpvYiBOb29ybWFuICgxKToKLSB0dTogZml4IHRleGVsIGJ1ZmZlciBlbXVs
YXRpb24gYm91bmRzIGNoZWNrCkpvc2UgTWFyaWEgQ2FzYW5vdmEgQ3Jlc3BvICgxKToKLSBicm9h
ZGNvbS9jb21waWxlcjoga2VlcCByb2J1c3QgU1NCTyBzdG9yZXMgc2NhbGFyIGZvciBib3VuZHMg
Y2hlY2tpbmcKSnVhbiBBLiBTdWFyZXogUm9tZXJvICgxKToKLSBlZ2wvZ2JtOiBJZ25vcmUgY3Vy
cmVudCBmcm9tIGJ1ZmZlciBpbiBoYXNfZnJlZV9idWZmZXJzCkthcm9sIEhlcmJzdCAoNik6Cgot
IHV0aWwvcXVldWU6IHJlbW92ZSBsb2NrZWQgYXJndW1lbnQgZnJvbSB1dGlsX3F1ZXVlX2tpbGxf
dGhyZWFkcwotIHV0aWwvcXVldWU6IHJlbW92ZSBsb2NrZWQgYXJndW1lbnQgZnJvbSB1dGlsX3F1
ZXVlX2FkanVzdF9udW1fdGhyZWFkcwotIHV0aWwvcXVldWU6IEZpeCBkZWFkLWxvY2sgYmV0d2Vl
biBxdWV1ZV9maW5pc2ggYW5kIHF1ZXVlX2tpbGxfdGhyZWFkcwotIHJ1c3RpY2wvcHJvZ3JhbTog
aW1wbGVtZW50IENMX0lOVkFMSURfU1BFQ19JRCBlcnJvciBmb3IKICBjbFNldFByb2dyYW1TcGVj
aWFsaXphdGlvbkNvbnN0YW50Ci0gcnVzdGljbC9zcGlydjogYWRkIFNQSVJWQmluOjpzcGVjaWFs
aXplCi0gcnVzdGljbC9wcm9ncmFtOiBmaXggc3BlYyBjb25zdGFudHMKCktvbnN0YW50aW4gU2V1
cmVyICgxKToKLSBsYXZhcGlwZTogRml4IERHQyArIGNvbmRpdGlvbmFsIHJlbmRlcmluZwpLcnp5
c3p0b2YgU29rb8WCb3dza2kgKDEpOgotIGxpbWE6IGNsb3NlIHRoZSBzY3JlZW4gZmQgb24gZGVz
dHJveSBhbmQgb24gZmFpbGVkIGNyZWF0aW9uCkxlb24gU2VlbWFubiAoMSk6Ci0gdmJvOiBGaXgg
ZXh0cmEgdmVydGV4IGRyYXduIG9uIGxpbmUgbG9vcCBlbmQgYWZ0ZXIgYnVmZmVyIHdyYXAKTGlv
bmVsIExhbmR3ZXJsaW4gKDYpOgoKLSBicnc6IGZpeCBvb2Igc291cmNlIGFjY2VzcwotIHZ1bGth
bi93c2k6IGZpeCBhIGJ1bmNoIG9mIGluY29ycmVjdCBlcnJvciBjb2RlIGNoZWNrcwotIGFudjog
YXZvaWQgbGVhayBvbiBpbnRlcm5hbCBrZXJuZWxzCi0gYW52OiBmaXggcG90ZW50aWFsIHNldF9s
YXlvdXQgbnVsbCBwb2ludGVyIGFjY2VzcwotIGludGVsL2NvbXBpbGVyOiBhbHdheXMgcnVuIHF1
ZXJ5IG9wdGltaXphdGlvbiBwYXNzZXMgb24gc3VwcG9ydGluZyBIVwotIGFudjogYmFpbCBlYXJs
eSBvbiB1bnN1cHBvcnRlZCBpbWFnZSBmb3JtYXQKCkxva2JvbmRvIEt1bmcgKDEpOgotIHV0aWw6
IEZpeCBtaXNhbGlnbmVkIGFkZHJlc3MgZm9yICdnY19zbGFiJwpNYXJ0aW4gUm91a2FsYSAobsOp
IFBlcmVzKSAoMSk6Ci0gUmV2ZXJ0ICJjaS10cm9uOiBieXBhc3MgY2FjaGluZyBwcm94eSBmb3Ig
ZG9ja2VyIGltYWdlcyIKTWFyeSBHdWlsbGVtYXJkICgxKToKLSBudms6IERvIG5vdCBvdmVyd3Jp
dGUgcHJldl9zdWJjIGlmIG5vIG1ldGhvZCB3ZXJlIGVtaXR0ZWQKTWF0dCBUdXJuZXIgKDQpOgoK
LSBnYWxsaXZtOiBkb24ndCBlbWl0IGEgc2NhbGFyIGxsdm0ubmVhcmJ5aW50IG9uIFBvd2VyUEMK
LSBnYWxsaXZtOiB0cnVuY2F0ZSBpbnRlZ2VyIGNvbnN0YW50cyB0byB0aGUgdHlwZSB3aWR0aAot
IG1lc2E6IHplcm8gcGlwZV9tZW1vcnlfaW5mbyBiZWZvcmUgcXVlcnlpbmcgaXQKLSBtZXNhOiBk
b24ndCByZWFkIHBhc3QgdGhlIG5hbWUgd2hlbiBtYXRjaGluZyBhIHJlc291cmNlIHdpdGhvdXQg
aXRzIFswXQoKTWHDrXJhIENhbmFsICgxKToKLSB2M2R2OiBkcm9wIHRoZSAiYWNjdW1fZmQiIGFz
c2VydGlvbiBpbiBtZXJnZV9zeW5jb2JqcygpCk1pa2UgQmx1bWVua3JhbnR6ICg0MCk6CgotIHpp
bms6IHVwZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiB0aGUgZHJhdyBtb2RlIG5lZWRzIGEgZGlmZmVy
ZW50IG9uZQotIHppbms6IHVwZGF0ZSB0aGUgbGFzdCB2ZXJ0ZXggc3RhZ2UgdmFyaWFudCB3aGVu
IGl0cyBrZXkgY2hhbmdlcwotIHppbms6IGVtaXQgZ2xvYmFsIGJpbmRpbmcgYmFycmllcnMgYmVm
b3JlIHNldHRpbmcgYmF0Y2ggdXNhZ2UKLSB6aW5rOiBjb3VudCBldmVyeSBoZWxkIHN3YXBjaGFp
biBpbWFnZSBhZ2FpbnN0IHRoZSBhY3F1aXJlIGxpbWl0Ci0gemluazogc3RvcCByZXRyeWluZyBz
d2FwY2hhaW4gYWNxdWlyZXMgdGhhdCBjYW5ub3Qgc3VjY2VlZAotIHppbms6IHN0b3Agc3Bpbm5p
bmcgb24gc3dhcGNoYWluIHJlYWRiYWNrcyB0aGF0IGNhbid0IGFjcXVpcmUgYW4gaW1hZ2UKLSB6
aW5rOiBkb24ndCBhY3F1aXJlIGEgbmV3IHN3YXBjaGFpbiBpbWFnZSB0byByZWFkIHByZXNlbnRl
ZCBjb250ZW50Ci0gemluazogbWFyayBzd2FwY2hhaW4gcmVhZGJhY2sgY29waWVzIHN0YWxlIG9u
IEdFTkVSQUwgbGF5b3V0IGJhcnJpZXJzCi0gemluazogY3JlYXRlIHN3YXBjaGFpbiByZWFkYmFj
ayBjb3BpZXMgYXMgc3RhbGUKLSB6aW5rOiB1c2UgcmVhZGJhY2sgY29waWVzIHdoZW4gYSBwcmVz
ZW50ZWQgaW1hZ2UgY2Fubm90IGJlIHJlYWNxdWlyZWQKLSB6aW5rOiB3YWl0IGZvciB0aGUgYWNx
dWlyZSBiZWZvcmUgcHJlc2VudGluZyBhbiBpbWFnZSBmb3IgcmVhZGJhY2sKLSB6aW5rOiByZWN5
Y2xlIHByZXNlbnQgc2VtYXBob3JlcyB3aGVuIHRoZWlyIGltYWdlIGlzIGFjcXVpcmVkIGFnYWlu
Ci0gemluazogcmVzb2x2ZSBzd2FwY2hhaW4gYmxpdCBzb3VyY2VzIGJlZm9yZSBhbnkgYmxpdCBw
YXRoIHJlYWRzIHRoZW0KLSB6aW5rOiBvbmx5IHRyeSBESVNKT0lOVCBmb3IgbXVsdGktcGxhbmFy
IGZvcm1hdHMgaW4gZmluZF9nb29kX21vZAotIHdnbDoga2VlcCB0aGUgR0FMTElVTV9EUklWRVIg
bmFtZSB2YWxpZCBmb3IgZHJpY29uZgotIHdnbDogZG9uJ3Qgd2FpdCBmb3IgdGhlIGdwdSBvbiB6
aW5rIHN3YXBzCi0gd2dsOiBkb24ndCBjaG9vc2UgcGJ1ZmZlci1vbmx5IHBpeGVsIGZvcm1hdHMg
Zm9yIHdpbmRvd3MKLSBhbnYraGFzdms6IGtlZXAgc2hhZGVySW50OCB3aXRoIG5vXzE2Yml0Ci0g
bGF2YXBpcGU6IG9ubHkgYWR2ZXJ0aXNlIFZLX0VYVF9oZWFkbGVzc19zdXJmYWNlIHdpdGggV1NJ
Ci0gemluazogb25seSBlbmFibGUgVktfRVhUX2hlYWRsZXNzX3N1cmZhY2Ugd2l0aCBWS19LSFJf
c3VyZmFjZQotIG1lc2E6IHJhaXNlIElOVkFMSURfVkFMVUUgZm9yIGJhZCBtc3J0dCB0ZXh0dXJl
IHNhbXBsZSBjb3VudHMKLSBtZXNhOiByYWlzZSBJTlZBTElEX0VOVU0gZm9yIG1zcnR0IHRleHRh
cmdldHMgdGhhdCBhcmUgbm90IDJkIG9yIGEgZmFjZQotIG1lc2E6IHJhaXNlIHRoZSBPVlJfbXVs
dGl2aWV3IGRyYXcgZXJyb3JzIGZvciB4ZmIgYW5kIGV4dHJhIHN0YWdlcwotIG1lc2E6IGFsbG93
IG11bHRpdmlldyBhdHRhY2htZW50cyBvZiBhbnkgdGV4dHVyZSBsZXZlbAotIG1lc2E6IGdpdmUg
UmVuZGVyYnVmZmVyU3RvcmFnZU11bHRpc2FtcGxlRVhUIHRoZSBJTlZBTElEX1ZBTFVFIHNhbXBs
ZSBsaW1pdAotIG1lc2E6IGFsbG93IHJlYWRpbmcgZnJvbSBFWFRfbXVsdGlzYW1wbGVkX3JlbmRl
cl90b190ZXh0dXJlIHJlbmRlcmJ1ZmZlcnMKLSBtZXNhOiBkb24ndCBtaXggaW1wbGljaXQgYW5k
IGV4cGxpY2l0IG11bHRpc2FtcGxlIGF0dGFjaG1lbnRzCi0gemluazogY3JlYXRlIG1zcnRzcyB0
cmFuc2llbnRzIHdpdGggb25seSB0aGUgYXR0YWNoZWQgbGV2ZWwKLSB6aW5rOiByZWxvYWQgbXNy
dHNzIHRyYW5zaWVudHMgYWZ0ZXIgdHJhbnNmZXIgd3JpdGVzIHRvIHRoZSBpbWFnZQotIHJhZGVv
bnNpOiByZS1lbWl0IHRoZSBzcXR0IHBpcGVsaW5lIHdoZW4gc2hhZGVyIHN0YXRlcyBhcmUgZW1p
dHRlZAotIG1lc2Evc3Q6IHBhc3MgUElQRV9JTUFHRV9BQ0NFU1MgYml0cyB0byBtYWtlX2ltYWdl
X2hhbmRsZV9yZXNpZGVudAotIHppbms6IHNoYXJlIGJpbmRsZXNzIGhhbmRsZXMgYmV0d2VlbiBj
b250ZXh0cwotIHppbms6IHRyYWNrIGJpbmRsZXNzIGltYWdlIGFjY2VzcyBwZXIgY29udGV4dAot
IHppbms6IGRyb3AgYmluZGxlc3MgcmVzaWRlbmN5IG9uIGNvbnRleHQgZGVzdHJveQotIHppbms6
IGZpeCBiaW5kbGVzcyBpbWFnZSBidWZmZXIgZGVzY3JpcHRvcnMKLSB6aW5rOiBpbmRleCBiaW5k
bGVzcyBidWZmZXIgYXJyYXlzIHdpdGhvdXQgdGhlIGhhbmRsZSBvZmZzZXQKLSB6aW5rOiBjb25z
aXN0ZW50bHkgdXNlIGF0b21pY3MgZm9yIGN0eC0+cm9idXN0X2N0eF9jb3VudCBhY2Nlc3MKLSB6
aW5rOiB1bmxvY2sgdGhlIGNvcHkgY29udGV4dCB3aGVuIHRpbWVzdGFtcCBxdWVyeSBjcmVhdGlv
biBmYWlscwotIHppbms6IGRvbid0IHVwZGF0ZSB1bm9yZGVyZWQgc3RhdGUgaW4gZ2V0X2NtZGJ1
ZigpIGluIHRoZSBwcmVzZW5jZSBvZiBjdXJyZW50CiAgdXNhZ2UKLSB6aW5rOiBjcmVhdGUgbWVz
aCBmdWxsIHByb2dyYW1zIHdoZW4gcmVwbGFjaW5nIG1lc2ggc2VwYXJhYmxlIHByb2dyYW1zCgpP
bGl2ZXIgQ2xhcmtlICgxKToKLSByYWR2OiBkaXNhYmxlIDh4IE1TQUEgZm9yIFZSUyBpbiBkZXZp
Y2UgcHJvcGVydGllcwpQZXl0b24gTGVlICgyKToKCi0gcmFkZW9uc2kvdnBlOiBmaXggWVVWNDIy
IG91dHB1dCB3aWR0aCBpc3N1ZQotIHJhZGVvbnNpL3ZwZTogZml4IDNEIExVVCBjaGFubmVsIG9y
ZGVyIGFuZCBQUSB0b25lIG1hcHBpbmcKClJoeXMgUGVycnkgKDMpOgoKLSByYWR2OiBzdG9wIGNo
ZWNraW5nIGRpcnR5IGJpdCBpbiBDbWRFeGVjdXRlQ29tbWFuZHMgSGlaIHdvcmthcm91bmQKLSBh
Y286IGFkZCBhIGNvdXBsZSBhY29fYWx1X29wY29kZV9pbmZvIG1ldGhvZHMKLSBhY28vb3B0X3Bv
c3RSQTogY2hlY2sgZm9yIHRpZWQgZGVmcyBpbiB0cnlfb3B0aW1pemVfYnJhbmNoaW5nX3NlcXVl
bmNlCgpSb2IgQ2xhcmsgKDEpOgotIGZyZWVkcmVuby9hNnh4OiBGaXggZmJmZXRjaCB3aXRoIG1z
cnR0ClNhbXVlbCBQaXRvaXNldCAoNik6CgotIHJhZHY6IGZpeCB0aGUgVk1BIGhlYXAgc2l6ZSBm
b3IgdGhlIGRlc2NyaXB0b3Igc2V0cyBhbGxvY2F0b3IKLSByYWR2OiBmaXggYSBtZW1vcnkgbGVh
ayB3aGVuIGFsbG9jYXRpbmcgYSBwb29sIGVudHJ5IGZhaWxlZAotIHJhZHY6IGZpeCB0aGUgZXJy
b3IgY29kZSB3aGVuIGFsbG9jYXRpbmcgYSBwb29sIGVudHJ5IGZhaWxlZAotIHJhZHY6IGFsbG93
IG11bHRpc2FtcGxpbmcgd2l0aCAyRCBDVUJFX0NPTVBBVElCTEUgaW1hZ2VzIHdpdGggTVNSVFNT
Ci0gcmFkdjogZml4IGVtaXR0aW5nIFJTUkMyIGZvciB2ZXJ0ZXggcHJvbG9ncwotIHJhZHYvcnQ6
IGZpeCBvdmVyd3JpdGluZyBzdGFjayBzaXplIG9uIHBhcnRpYWwgY2FjaGUgaGl0cwoKU2tpcGlu
IEFuZHJleSAoMyk6CgotIGRyaTM6IGlnbm9yZSBJZGxlTm90aWZ5IGZvciBhIHJldXNlZCBwaXht
YXAgWElECi0gd3NpL3gxMTogaWdub3JlIElkbGVOb3RpZnkgZm9yIGEgcmV1c2VkIHBpeG1hcCBY
SUQKLSB2bC9kcmkzOiBpZ25vcmUgSWRsZU5vdGlmeSBmb3IgYSByZXVzZWQgcGl4bWFwIFhJRAoK
VGFwYW5pIFDDpGxsaSAoMSk6Ci0gaXJpczogdXBkYXRlIG5pciBpbmZvcm1hdGlvbiB3aXRoaW4g
aXJpc19mb3JjZV9kdWFsX2NvbG9yX2JsZW5kClRpbW90aHkgQXJjZXJpICgxKToKLSBzdC9tZXNh
OiBwYXNzIHRoZSBlZGdlIGZsYWcgdmVydGV4IGVsZW1lbnQgdG8gdGhlIGRyYXcgbW9kdWxlClZh
bGVudGluZSBCdXJsZXkgKDIpOgoKLSBsYXZhcGlwZTogR3VhcmQgVktfRVhUX211bHRpc2FtcGxl
ZF9yZW5kZXJfdG9fc3dhcGNoYWluIHdpdGgKICBMVlBfVVNFX1dTSV9QTEFURk9STQotIHppbmsv
Y2k6IE1vdmUgZ2x4XEBnbHgtbWFrZS1jdXJyZW50IHRvIGZsYWtlcwoKWWl3ZWkgWmhhbmcgKDIz
KToKCi0gdmVudXM6IGZpeCBETVIgb24gaW1wb3J0IGZhaWx1cmUKLSB2ZW51czogYW1lbmQgVExT
IHJpbmcgZXJyb3IgY2hlY2sgaW4gcGlwZWxpbmUgY2FjaGUgcmV0cmlldmFsCi0gdmVudXM6IGZp
eCBhIHJhY2UgY29uZGl0aW9uIGZvciBUTFMgcmluZyBjcmVhdGlvbnMKLSB2ZW51czogcmV0dXJu
IFRJTUVPVVQgaW5zdGVhZCBvZiBOT1RfUkVBRFkgb24gZmVuY2Ugd2FpdCB0aW1lb3V0Ci0gdmVu
dXM6IGZpeCBsZWdhY3kgc2VtYXBob3JlIHdhaXQgdmFsdWVzIHRvIGFsaWduIHdpdGggc2VtYXBo
b3JlcwotIHZlbnVzOiBmaXggbG9ja2xlc3MgcXVlcnkgb2YgZGVzY3JpcHRvciBzaXplIGNhY2hl
Ci0gdmVudXM6IGZpeCB2a19jb21tYW5kX3Bvb2wgYWRvcHRpb24KLSB2ZW51czogcmVjeWNsZSBz
ZmIgY21kcyB3aGVuIHdhaXQgaXMgZG9uZSBlbHNld2hlcmUKLSB2ZW51czogYXZvaWQgbmV3IHNm
YiBjbWRzIGJlaW5nIHByZW1hdHVyZWx5IHJlY3ljbGVkCi0gdmVudXMvc2ltX3N5bmNvYmo6IGFt
ZW5kIHRvIHNldCBlcnJubyBvbiB3YWl0IHRpbWVvdXQKLSB2ZW51cy92aXJ0Z3B1OiBhdm9pZCBw
b3RlbnRpYWwgZG91YmxlIEJPIGRlc3Ryb3kKLSB2ZW51czogZml4IG1haW50NyB6ZXJvIGxheWVy
ZWRBcGlDb3VudCB3aXRoIG5vbi1OVUxMIHBMYXllcmVkQXBpcwotIHZlbnVzOiBhdm9pZCBVQiBp
biB2bl9nZXRfYWhiX2ltYWdlX3Byb3BzCi0gdmVudXM6IGF2b2lkIG51bGwgcHRyIGRlcmVmZXJl
bmNlIGZvciB6ZXJvIGV4dGVybmFsIGltYWdlIGhhbmRsZVR5cGUKLSB2ZW51czogcHJvcGVybHkg
c2NydWIgVmtHcmFwaGljc1BpcGVsaW5lQ3JlYXRlSW5mbzo6cmVuZGVyUGFzcwotIHZ1bGthbi9y
dW50aW1lL21lc29uOiBhdm9pZCBkdXBsaWNhdGUgaGVhZGVyIGdlbiBkZXBzIGxpc3QKLSB2ZW51
czogZml4IHBXYWl0RHN0U3RhZ2VNYXNrIHdoZW4gZHJvcHBpbmcgaW1wb3J0ZWQgc2VtYXBob3Jl
cwotIHZlbnVzL3NpbV9zeW5jb2JqOiBjb252ZXJ0IGFic29sdXRlIHRpbWVvdXQgYmFjayB0byBy
ZWxhdGl2ZQotIHZlbnVzOiBhdm9pZCBkZWFkbG9jayBpbiBjcyB1cGxvYWQgZm9yIGd1ZXN0IHZy
YW0KLSB2ZW51czogaWdub3JlIFZrSW1wb3J0TWVtb3J5RmRJbmZvS0hSIGlmIGhhbmRsZVR5cGUg
aXMgMAotIHZlbnVzOiBmaXggcGxhbmFyIGZvcm1hdCBob3N0IGNvcHkgc2l6ZSBjYWxjCi0gdmVu
dXM6IGNvbnNpZGVyIGJ1ZmZlciB1c2FnZSAyIHdoZW4gZml4aW5nIGV4dGVybmFsIGJ1ZmZlciBw
TmV4dAotIHZlbnVzOiBvbmx5IGNhbGwgdm5fd3NpX3N5bmNfd2FpdCB3aXRoIHZhbGlkIHN5bmMg
ZmQKCmJzbGV0dGUgKDEpOgotIG5hazogbmV2ZXIgZW5jb2RlIElEUC40QSB3aXRoIGFuIGltbWVk
aWF0ZSBzb3VyY2UKbGx5eXIgKDEpOgotIHJhZHYvYW1kZ3B1OiBmaXggQk8gbGlzdCBsZWFrIG9u
IGNvbW1hbmQgc3VibWl0IGZhaWx1cmUKb3NtYW4ueWFnY2kgKDEpOgotIGVnbC9kcmkyOiBkZXN0
cm95IHRoZSBkaXNwbGF5IGxvY2sgd2hlbiB0aGUgZGlzcGxheSBpcyBkZXN0cm95ZWQKc29rYSAo
Myk6CgotIHppbms6IHdhaXQgZm9yIGRtYS1idWYgZmVuY2VzIHdoZW4gdGhlIGJhdGNoIGVuZHMK
LSB6aW5rOiB0cmFjayBiYXRjaCBkbWFidWYgZXhwb3J0cyBpbiBhIGhhc2hfdGFibGUgaW5zdGVh
ZCBvZiBhIHNldAotIHppbms6IHdhaXQgZm9yIGRtYS1idWYgcmVhZGVycyBvbmx5IHdoZW4gd3Jp
dGluZwo=

--===============5697684865264202175==--
