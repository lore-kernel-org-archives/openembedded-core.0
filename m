Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBCFCC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33248.1792043046707658672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WsNyxCC1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AdV+z2Qx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a13e16d3b8-61d45647-da25-423e-ba6c-9c7728197cf6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043045;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9j18jJh68Od57gHUW+GkjT0Uh6jcwnHbjLwlDJxCKiA=;
	b=WsNyxCC1WqHOAq5ezbQwCbBTcv2LZubfgXbjeGT3myZNhUyYBoQaMcE1DRqOXI9P
	fRAhA891ainc4zBkATu4oxxg1qCHa7K4Xsjws8LrWG4Lkfs1/GRys7nUBGp6ZIif4wk
	qndBrXbCEDM3av9j7Zc2Pzp5Rk1tlZ3FqClsCf+g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043045;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9j18jJh68Od57gHUW+GkjT0Uh6jcwnHbjLwlDJxCKiA=;
	b=AdV+z2QxXvOWsA+jv1AqO+ZYk2jI4jvmTJTTObsl3mfWLzCTfSH9S0AekMEw40T4
	ftYcmD9RflUEHEak+yQ07Q1r7kL3xNsHZ+4jgksSJRyg2jsSg0QfQHzqAgwSs/n05bQ
	RsQQlI+/P8ccKQs85KP4sSuCDTOZz6qqsU87NNhY=
Content-Type: multipart/mixed; boundary="===============1783431194578310765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.2.5 SUCCEEDED
Message-ID: <010101a13e16d3b8-61d45647-da25-423e-ba6c-9c7728197cf6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247857

--===============1783431194578310765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa,mesa-tools-native* to *26.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-mesa-tools-native-upgrade-26.2.4-26.2.5.patch
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
From a9357cc0169ccd965a9f4d9203c1b2498f3cb809 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:19:14 +0000
Subject: [PATCH] mesa,mesa-tools-native: upgrade 26.2.4 -> 26.2.5

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
 ...eson-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...-compiler-jay-jay_ir.h-do-not-used-typed-en.patch |  2 +-
 ...u_math.c-do-not-use-arm-fpu-instructions-if.patch |  2 +-
 meta/recipes-graphics/mesa/mesa.inc                  |  4 ++--
 7 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index 2b30c1b5c7..24eecdc355 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From b00409956cd1a58f1c676de9cbfd2c688ca3fc9f Mon Sep 17 00:00:00 2001
+From 1a2a312feb006f73cf1e843a2466d683a0a2593b Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index d580277124..6772434f81 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From a61daaf354bd84dfa849f8da6028ddc71f1af7dc Mon Sep 17 00:00:00 2001
+From 75eb5c2fc64d081792fc5c646a9bf786491a801e Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
index 756b68a898..dedb005ef8 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
@@ -1,5 +1,4 @@
-From cda383625f5d1fd06657fb998b7d1370a7fabd8f Mon Sep 17 00:00:00 2001
-Message-ID: <cda383625f5d1fd06657fb998b7d1370a7fabd8f.1791114851.git.marcel@ziswiler.com>
+From 22399c002047ff9bd36d1fe54ef30b05bde0ddce Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 77a0ba3d8b..ce610fa24d 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From c3a359d39e387e785883cb740934a0dc4e6376db Mon Sep 17 00:00:00 2001
+From e0efffe7fee31df1882ca882df670576ceff71dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index b923c4c1fb..22cc02f203 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From ccfa5a6555f6eb035ace12cba1ce3e785a47895f Mon Sep 17 00:00:00 2001
+From 7ea20a7a804ac168c1ed9d51114cadab22cdb52d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index 0d0fdace2c..0ac04889a8 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 89c46de92e974202c1cabce25bb4d9441830b8b6 Mon Sep 17 00:00:00 2001
+From acbdff7fcb2cb3a5329c7aa4744baa82c0c652d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index da71a0bdb0..dbdc02d6da 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch \
            "
 
-SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
-PV = "26.2.4"
+SRC_URI[sha256sum] = "794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5"
+PV = "26.2.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============1783431194578310765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.4.so", added "/usr/lib/libgallium-26.2.5.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.4.so moved to /usr/lib/libgallium-26.2.5.so

--===============1783431194578310765==
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
Ci0tLS0tLS0tLS0tLS0KCjo6CiAgICBUQkQuCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgot
IE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0tLS0KCi0gTWVzYSAyNi4yLjEgR3JvdW5kIFRydXRoIEFt
YmllbnQgT2NjbHVzaW9uIEJyb2tlbiBvbiBObyBNYW4ncyBTa3kKLSBNZXNoIHNoYWRlciB1bmlm
b3JtL2NvbnN0YW50IHJlbmRlcmluZyBpc3N1ZQotIFJBRFYgcmVncmVzc2lvbiBpbiBNZXNhIDI2
LjIueCDigJMgTm8gTWFuJ3MgU2t5IGhhcyBicm9rZW4vZGFyayBzdW5saWdodCBvbiBSWAogIDc5
MDAgWFQKLSBSZWdyZXNzaW9uOiBEM0QxMiBkcml2ZXIgYW5kIERSSSBicm9rZW4gdW5kZXIgV1NM
IGluIDI1LjAuNAotIFNJR0lMTCB3aXRoIGxsdm1waXBlIG9uIEFSTXY5KD8pIHdpdGhvdXQgU1ZF
Ci0gWC1QbGFuZSAxMiBlbmNvdW50ZXJpbmcgYSBHUFUgY3Jhc2ggb24gbG9hZCBhZnRlciByZWNl
bnQgdXBkYXRlLgotIFtGb3J0cyBSVFNdIENvcnJ1cHQgcmVuZGVyaW5nIG9mIGNvbXByZXNzZWQg
dGV4dHVyZXMKLSBhY286IGlsbGVnYWwgVk9QMyB2X2NuZG1hc2tfYjMyIHdpdGggdHdvIFNHUFIg
b3BlcmFuZHMgb24gR0ZYNi05IGluCiAgZW1pdF9zY2FsZWRfb3AgKGZwMzIgZGVub3JtIHByZXNl
cnZlKSDihpIgd3JvbmcgcmVzdWx0cwotIHJhZGVvbnNpOiBpbmNvcnJlY3QgcmVuZGVyaW5nIGlu
IERvb20gMzogQkZHCi0gcmFkdi9hbWRncHU6IHBhZGRpbmcgVk0gcGFnZSAoUkFERU9OX0ZMQUdf
Vk1fUEFEXzFQQUdFKSBpcyBuZXZlciB1bm1hcHBlZCBvbgogIEJPIGRlc3Ryb3k7IFZBIHJldXNl
IHRoZW4gZmFpbHMgd2l0aCAidmEgLi4uIGNvbmZsaWN0IiBvbiBHRlg5Ci0gcnVzdGljbDogY291
bGQgbm90IGluaXRpYWxpemUgU1ZNIHN1cHBvcnQgd2l0aCByYWRlb25zaSx6aW5rCi0gemluazog
d3JvbmcgcGlwZWxpbmUgYWZ0ZXIgYSB2ZXJ0ZXgtbGF5b3V0LW9ubHkgY2hhbmdlIHdpdGhvdXQK
ICBWS19FWFRfdmVydGV4X2lucHV0X2R5bmFtaWNfc3RhdGUKCkNoYW5nZXMKLS0tLS0tLQoKQ2Fp
byBPbGl2ZWlyYSAoMSk6Ci0gaXJpczogRnJlZSBjb21wdXRlIGNvbXBpbGF0aW9uIGNvbnRleHQg
b24gZmFpbHVyZQpDaHJpc3RpYW4gR21laW5lciAoMik6CgotIGV0bmF2aXY6IFVwZGF0ZSB2YWxp
ZF9idWZmZXJfcmFuZ2UgZm9yIHN0cmVhbSBvdXRwdXQgYnVmZmVycwotIGV0bmF2aXY6IFNraXAg
cmVuZGVyIGNvbXBhdGliaWxpdHkgZm9yIGV4dGVybmFsIFRTIHBsYW5lIHJlc291cmNlcwoKQ29u
bm9yIEFiYm90dCAoMSk6Ci0gdnVsa2FuL2dyYXBoaWNzX3N0YXRlOiBEb24ndCBnZXQgSUFMIHN0
YXRlIHdoZW4gbm90IG5lZWRlZApEZXJlayBMZXNobyAoMSk6Ci0gemluazogQ2F0Y2ggYWxsIHBy
aW9yIHVwZGF0ZXMgdG8gc291cmNlIHZhbGlkX2J1ZmZlcl9yYW5nZS4KRG1pdHJ5IEJhcnlzaGtv
diAoNyk6CgotIGZyZWVkcmVuby9jb21tb246IGZsYWcgYSB3b3JrYXJvdW5kIGZvciBDUF9EUkFX
X0FVVE8gaXNzdWUgaW4gYTYzMF9zcWUKLSBmcmVlZHJlbm8vcmVnaXN0ZXJzOiBkZWZpbmUgZm9y
bWF0IG9mIHRoZSBQQ19BVVRPX1ZFUlRFWF9TVFJJREUgcmVnaXN0ZXIKLSBmcmVlZHJlbm8vYTZ4
eDogd29ya2Fyb3VuZCBhbiBpc3N1ZSBpbiBhNjMwX3NxZS5mdwotIHR1OiB3b3JrYXJvdW5kIGFu
IGlzc3VlIGluIGE2MzBfc3FlLmZ3Ci0gZnJlZWRyZW5vL2E1eHg6IHNldCB0aGUgc2FtcGxlIGNv
dW50IGJlZm9yZSB0aGUgR01FTSByZXN0b3JlIGJsaXRzCi0gZnJlZWRyZW5vL2E1eHg6IHdyaXRl
IHRoZSBsaW5lYXIgY2VudHJvaWQgaW50ZXJwb2xhdG9yIHJlZ2lkCi0gaXIzOiBrZWVwIHRoZSBt
c2FhIGtleSBmb3Igc2hhZGVycyB0aGF0IGludGVycG9sYXRlIGF0IGdsX1NhbXBsZUlECgpEb21p
bmlxdWUgQmVsaGFjaGVtaSAoMSk6Ci0gcGNvOiBmaXggd29ya2dyb3VwIGJhcnJpZXIgcmFjZSB3
aGVuIHJldXNlZCBhY3Jvc3MgbG9vcCBpdGVyYXRpb25zCkR5bGFuIEJha2VyICgxKToKLSBpbnRl
bC9qYXk6IERvbid0IGF0dGVtcHQgdG8gZG8gd29yayB3aGVuIHRoZXJlIGlzIG5vbmUKRXJpYyBF
bmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBhZGQgc2hhIHN1bSBmb3IgMjYuMi40Ci0gLnBpY2tfc3Rh
dHVzLmpzb246IFVwZGF0ZSB0byA4MWRmZjdjNjRmYjBjMWYyMDMxZDA0Y2NmZjk5NzIyMzNlMmUw
NTI0Ci0gLnBpY2tfc3RhdHVzLmpzb246IE1hcmsgYTgyZWQ4NTA4ODk1NDIwNmZiMWMzMGQwMTZm
MTgzMTBmYTYxNDI3OSBhcwogIGRlbm9taW5hdGVkCgpFcmljIFIuIFNtaXRoICgxKToKLSBwYW5m
cm9zdDogZml4IFVCIGluIHBhbl9jc2YgcG9pbnRlciBiYXNlZCB0eXBlLXB1bm5pbmcKRmFiaW8g
UGlwYXJvICgxKToKLSB2YzQ6IGRvbid0IHJldXNlIGZsYWdzIGZyb20gYmVmb3JlIGEgdGhyZWFk
IHN3aXRjaApGcmFuayBCaW5ucyAoMSk6Ci0gcHZyOiBmaXggZm9yIGpvYiBzYW1wbGVzIGJlaW5n
IGluaXRpYWxpc2VkIHRvIDAKRnJhbmsgQm91d2VyICgxKToKLSBwdnI6IGZpeCBmb3IgbXVsdGlz
YW1wbGluZyB3aXRoIG5vIGF0dGFjaG1lbnRzCkdlb3JnIExlaG1hbm4gKDQpOgoKLSB2dG46IGFk
ZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhhY3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGFkZCBhbiBv
cHRpb24gdG8gZm9yY2UgZXhhY3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGZvcmNlIGV4YWN0IEdM
U0xzdGQ0NTBGbWEgZm9yIE5vIE1hbiBTa3kKLSBhY286IGZpeCBjb25zdGFudCBidXMgdmlvbGF0
aW9uIGZvciBzY2FsZWQgdHJhbnNjZW5kZW50YWwgb3AKCkd1c3Rhdm8gTm9yb25oYSBTaWx2YSAo
MSk6Ci0gdmVudXM6IGRvbid0IHJ1biBhIHRocmVhZCdzIFRMUyB0ZWFyZG93biBmcm9tIGFuIHVu
bG9hZGVkIGRyaXZlcgpJYW4gUm9tYW5pY2sgKDEpOgotIG5pci9hbGdlYnJhaWM6IERvbid0IGdl
bmVyYXRlIDY0LWJpdCBpYWRkMyB3aGVuIG5vdCBzdXBwb3J0ZWQKSWNlbm93eSBaaGVuZyAoMik6
CgotIGxsdm1waXBlOiBkbyBub3QgY2FsbCBMTFZNTGlua0luTUNKSVQoKSB3aGVuIHVzaW5nIE9y
Y0pJVAotIG1lc29uOiBsaW5rIGluIG9yY2ppdCBpbnN0ZWFkIG9mIG1jaml0IHdoZW4gdXNpbmcg
T3JjSklUCgpKYWRlIE1hY2hvICgxKToKLSBnYWxsaXVtL3N3OiBGaXggbGx2bXBpcGUgYmVpbmcg
Y2hvc2VuIHdoZW4gbm90IHdhbnRlZApKZW9uZ2lrIENoYSAoMSk6Ci0gZ2Z4c3RyZWFtOiBhbGxv
dyBWS19FWFRfdmVydGV4X2F0dHJpYnV0ZV9kaXZpc29yIGFnYWluCkpvcmRhbiBKdXN0ZW4gKDIp
OgoKLSBpbnRlbC9nZW4vY29tcGFjdDogRml4IHR5cG8gaW4gWGUzUCBjb21wYWN0IHRhYmxlcwot
IGludGVsL2dlbi9jb21wYWN0OiBGaXggVU5DT01QXzNTUkNfU09VUkNFIGZvciBYZTNQCgpLYXJv
bCBIZXJic3QgKDIpOgoKLSBydXN0aWNsL2NvbnRleHQ6IHNraXAgbm9uIFNWTSBkZXZpY2VzIGlu
IGNsU1ZNQWxsb2MKLSBydXN0aWNsL3BsYXRmb3JtOiBza2lwIG5vbiBTVk0gZGV2aWNlcyB3aGVu
IGNyZWF0aW5nIHRoZSBWTSBoZWFwCgpLb25zdGFudGluIFNldXJlciAoMSk6Ci0gcmFkdjogQWxp
Z24gYnZoIHRvIDEyOCBieXRlcyBvbiBHRlgxMgpMZW9uIFNlZW1hbm4gKDEpOgotIHppbms6IHVw
ZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiBvbmx5IHRoZSB2ZXJ0ZXggaW5wdXQgc3RhdGUgY2hhbmdl
cwpMaW9uZWwgTGFuZHdlcmxpbiAoNCk6CgotIGFudjogZml4IGR5bmFtaWMgYnVmZmVyIGJhc2Ug
b2Zmc2V0IHVwbG9hZAotIGFudjogc3RvcmUgYXZhaWxhYmlsdHkgYmVmb3JlIHdyaXRpbmcgcGFy
dGlhbCByZXN1bHRzCi0gYW52OiBmZW5jZSBNSSBhdmFpbGFiaWx0eSB3cml0ZXMKLSBhbnY6IHRy
YWNrIHRoZSBxdWVyeSBwb29sIGNvcGllcyBmb3IgcmVzZXRzCgpMb2tib25kbyBLdW5nICgxKToK
LSBsbHZtcGlwZTogZml4IHVic2FuIHNoaWZ0IGV4cG9uZW50IHRvbyBsYXJnZSBlcnJvcgpMdWNp
ZSBIYXJ0bWFubiAoMSk6Ci0gZ2FsbGl2bTogUXVlcnkgaG9zdCBDUFUgZmVhdHVyZXMgb24gYWFy
Y2g2NCB0b28KTWFyZWsgT2zFocOhayAoMSk6CgotIHJhZHY6IGZpeCB0byB1c2UgSFRJTEUgZmls
bHMgaW5zdGVhZCBvZiBSTVcgc2hhZGVycyB0byByZXN0b3JlIHByZXZpb3VzCiAgYmVoYXZpb3IK
Ck1hcnkgR3VpbGxlbWFyZCAoMyk6CgotIG52ay9udmttZDogaGFuZGxlIGV4ZWNfY291bnQgPT0g
MCBpbiBudmttZF9ub3V2ZWF1X2V4ZWNfY3R4X2V4ZWMKLSBub3V2ZWF1L21tZTogQWRkIGRlcGVu
ZGVuY3kgb24gbXRoZCBmb3IgRFJFQUQvRFdSSVRFCi0gbm91dmVhdS9tbWU6IEZpeCBzY3JhdGNo
X3NoYXJlXzNkX3RvX2NvbXB1dGUgdGVzdAoKTWF0dCBUdXJuZXIgKDkpOgoKLSBnYWxsaXZtOiBk
b24ndCB1c2UgdGhlIHMzdGMgYW5kIHJndGMgSklUIGRlY29kZXJzIG9uIGJpZy1lbmRpYW4KLSBn
YWxsaXZtOiBwaWNrIHRoZSByaWdodCBsYW5lIGZvciBpbWFnZSBzdG9yZXMgd2lkZXIgdGhhbiAz
MiBiaXRzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBmaXggZmlyc3RfYWN0aXZlX2ludm9jYXRp
b24oKSBvbiBiaWctZW5kaWFuCi0gZ2FsbGl2bTogZml4IHVucGFja182NF8yeDMyX3NwbGl0IGZv
ciBzY2FsYXJzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBvbmx5IHVzZSB2bWF4ZnAgZm9yIDMy
LWJpdCBmbG9hdHMKLSBnYWxsaXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBO
YU4gb3BlcmFuZHMgbXVzdCBiZSBpZ25vcmVkCi0gZ2FsbGl2bTogdXNlIFZTWCBmb3Igcm91bmRp
bmcgd2hlbiBhdmFpbGFibGUKLSBnYWxsaXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAg
d2hlbiBWU1ggaXMgYXZhaWxhYmxlCi0gbmlyLCBnbHNsLCBnYWxsaXVtOiBrZWVwIHRoZSBoYWx2
ZXMgb2YgbG93ZXJlZCA2NC1iaXQgSU8gaW4gbWVtb3J5IG9yZGVyCgpNYXR0aGlldSBNb2F0dGkg
KDEpOgotIHBhbi9iaTogUmVzdG9yZSBWQV9NRU1PUllfQUNDRVNTX0ZPUkNFIGZvciBzcGlsbHMg
YW5kIHJlZmlsbHMKTWlrZSBCbHVtZW5rcmFudHogKDI3KToKCi0gemluay9rb3BwZXI6IGZpeCBj
aGVjayBmb3IgYXN5bmMgcHJlc2VudHMKLSB6aW5rL2tvcHBlcjogd2FpdCBvbiBhc3luYyBwcmVz
ZW50cyB3aGVuIHVwZGF0aW5nIHN3YXBjaGFpbgotIHppbmsva29wcGVyOiBzdG9wIGxlYWtpbmcg
c3dhcGNoYWlucyBoYXJkZXIKLSB6aW5rL2tvcHBlcjogZG8gYSBmdWxsIGdsdGhyZWFkL3RjIHN5
bmMgd2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5rL2tvcHBlcjogdXNlIHRoZSBhY3R1
YWwgY3VycmVudCBpbWFnZSBleHRlbnQgd2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5r
OiByZXR1cm4gb24gZmx1c2hfZnJvbnRidWZmZXIgaWYgc3dhcGNoYWluIGlzIGtpbGwKLSB6aW5r
L2tvcHBlcjogZml4IHJldHVybiB2YWx1ZSBpbiBhY3F1aXJlCi0ga29wcGVyOiBtb3ZlIGV2ZW50
IHNlbGVjdGlvbiBmb3IgcHJlc2VudCBpbnRvIGtvcHBlckdldFN5bmNWYWx1ZXMKLSB6aW5rL2tv
cHBlcjogYWRkIGxvY2tpbmcgYXJvdW5kIEFOSSBhbmQgUVAKLSB6aW5rL2tvcHBlcjogZml4IGlu
dmFsaWQgcmVhZCBkdXJpbmcgc3dhcGNoYWluIHRlYXJkb3duCi0gdXRpbC90ZXhjb21wcmVzc19y
Z3RjOiB6ZXJvLWluaXRpYWxpemUgZW5jb2RlIHZhcmlhYmxlcwotIHppbmsvc3luYzogcGx1ZyBh
biBleHRyZW1lbHkgdHJpY2t5IGhvbGUgaW4gcmVvcmRlcmluZyBsb2dpYwotIHV0aWwvZGlza19j
YWNoZTogb25seSBzdWJ0cmFjdCBhbiBldmljdGVkIGl0ZW0gaWYgdW5saW5rIHN1Y2NlZWRlZAot
IHV0aWwvZGlza19jYWNoZTogcHV0IGd1YXJkIHBhZ2VzIGFyb3VuZCB0aGUgaW5kZXggbWFwcGlu
ZwotIHV0aWwvZGlza19jYWNoZTogcmV0dXJuIHdoZXRoZXIgZXZpY3RfbHJ1X2l0ZW0gcmVtb3Zl
ZCBhIGZpbGUKLSB1dGlsL2Rpc2tfY2FjaGU6IHJlY29tcHV0ZSBhbiBpbXBvc3NpYmxlIHNpemUg
Y291bnRlciBvbiBvcGVuCi0gdXRpbC9kaXNrX2NhY2hlOiByZWNvbXB1dGUgdGhlIHNpemUgd2hl
biBldmljdGlvbiBjYW5ub3QgaGVscAotIHV0aWwvZGlza19jYWNoZTogcmVtb3ZlIHN0YWxlIC50
bXAgZmlsZXMgd2hlbiByZWNvbXB1dGluZyB0aGUgc2l6ZQotIHN0L3Bibzogc2tpcCBkZWxldGVf
Y29tcHV0ZV9zdGF0ZSBmb3Igc2hhZGVycyBuZXZlciBjcmVhdGVkCi0gemluazogY2xlYXIgdGhl
IGdlbmVyYXRlZCB0Y3MgbmlyIHBvaW50ZXIgYWZ0ZXIgaXQgaXMgZnJlZWQKLSB6aW5rOiBjaGVj
ayB1bmZsdXNoZWQgdW5kZXIgdGhlIHVzYWdlIG11dGV4IGluIHRoZSB1bmZsdXNoZWQgd2FpdAot
IHppbms6IHRha2UgcmFsbG9jX2xvY2sgYXJvdW5kIHNjcmVlbi1wYXJlbnRlZCByYWxsb2NzCi0g
emluazogc3RvcCBwYXJlbnRpbmcgdGhlIHNjcmVlbidzIHNlbWFwaG9yZSBhcnJheXMgdG8gdGhl
IHNjcmVlbgotIHppbms6IHNlcmlhbGl6ZSB1bnRocmVhZGVkIGJhdGNoIHN1Ym1pc3Npb24gcGVy
IHNjcmVlbgotIHppbms6IGZvcmNlIHN5bmMgYWZ0ZXIgdW5iaW5kLCBldmVuIHdpdGggR0VORVJB
TCBsYXlvdXRzCi0gemluazogZW5zdXJlIGRlc2NyaXB0b3IgYnVmZmVycyBzdGF5IG1hcHBhYmxl
IHdpdGhvdXQgQkFSIGFsbG9jCi0gemluazogYXZvaWQgY29uc3RhbnRseSBmYWlsaW5nIEJBUiBh
bGxvY2F0aW9ucyBvbiBzeXN0ZW1zIHdpdGhvdXQgUmVCQVIKCk1pa2hhaWwgTWxoY25uICgyKToK
Ci0gdXRpbC90YzogcmVzZXQgZW5kX2NhbGwgd2hlbiBycCBpbmZvIGlzIHJldXNlZCBhZnRlciBz
eW5jCi0gdXRpbC90YzogZml4IGJ1ZmZlciBvdmVyLXJlYWQgYW5kIHRocmVhZCByYWNlIGluIHN0
YWdpbmcgdGV4dHVyZV9zdWJkYXRhCgpOaWtpdGEgS29udG9uICgxKToKLSByYWRlb25zaTogaW52
YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBhdCBJQiBzdGFydCBvbiBhbGwgZ2Z4IGxldmVscwpPbGl2
aWEgTGVlICgxKToKLSBwYW52azogZml4IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBHZXRJ
bnN0YW5jZVByb2NBZGRyCk9tYXIgUmFzaHdhbiAoMik6CgotIG5pci9pbnN0cl9zZXQ6IGNvbXBh
cmUgdGV4IGRlZiB3aGVuIENTRWluZyB0ZXh0dXJlIGluc3RydWN0aW9ucwotIG5pci9pbnN0cl9z
ZXQ6IGNvbXBhcmUgdGV4IGRlc3RfdHlwZSBpbnN0ZWFkIG9mIGJpdCBzaXplIHdoZW4gQ1NFaW5n
IHRleHR1cmUKICBpbnN0cnVjdGlvbnMKClBldGVyIFF1YXlsZSAoMSk6Ci0gcHZyOiBmaXggc3Ry
ZWFtLW91dCBQRFMgZGF0YSBzaXplIHVuaXRzIGluIENTQiBkdW1wClBpZXJyZS1FcmljIFBlbGxv
dXgtUHJheWVyICgzKToKCi0gcmFkZW9uc2k6IHJlbW92ZSBpbnZhbGlkIGFzc2VydAotIHJhZGVv
bnNpL2dmeDEyOiBkb250IHNldCBCTyBtZXRhZGF0YSBvbiBpbXBvcnQKLSB3aW5zeXMvYW1kZ3B1
OiBmaXggaW1wb3J0L2Rlc3Ryb3kgcmFjZSBhZ2FpbgoKUm9iIENsYXJrICgxKToKLSBmcmVlZHJl
bm8vY29tbW9uOiBGaXggYTcwMiBjaGlwLWlkClNhbXVlbCBQaXRvaXNldCAoNCk6CgotIHJhZHYv
cnQ6IGZpeCBjaGVja2luZyBlcnJvcnMgZm9yIGltcG9ydGVkIGJpbmFyaWVzCi0gcmFkdi9ydDog
Zml4IGltcG9ydGluZyBwaXBlbGluZSBiaW5hcmllcwotIHJhZHYvbmlyOiBmaXggZGV0ZXJtaW5p
bmcgaWYgYSBWUyBpbnB1dCBsb2NhdGlvbiBpcyBoaWdoIDY0LWJpdAotIHJhZHYvYW1kZ3B1OiB1
bm1hcCB0aGUgZmlyc3QgcGFnZSB1c2VkIHRvIGltcGxlbWVudCBWTSBwYWRkaW5nCgpTaW1vbiBQ
ZXJyZXR0YSAoMSk6Ci0gcGNvOiB0ZW1wb3JhcmlseSBkaXNhYmxlIHZ0eGluIGFsbG9jYXRpb24g
ZHVlIHRvIHZlYyBoYW5kbGluZyBidWcKVGhvbmcgVGhhaSAoMSk6Ci0gZHJpY29uZjogQWRkIGln
bm9yZV9tYXBfaW52YWxpZGF0ZV9idWZmZXIgb3B0aW9uClRpbW90aHkgQXJjZXJpICg1KToKCi0g
cmFkZW9uc2k6IGNvcnJlY3RseSBkZXRlY3QgYW5kIHNldCBtZXNoIHNoYWRlcnMgYXMgZGlydHkK
LSByYWRlb25zaTogd2lkZW4gYmluZF9oaXN0b3J5IGJpdGZpZWxkCi0gZ2FsbGl1bS90Yy96aW5r
OiB3aWRlbiByZWJpbmRfbWFzayB0byBzdXBwb3J0IHVzZSBieSBtZXNoIHNoYWRlcnMKLSB6aW5r
OiBmaXggcmViaW5kaW5nIHN1cHBvcnQgZm9yIG1lc2ggc2hhZGVycwotIHV0aWwvZm9ybWF0OiBm
aXggdHlwbyBpbiB0aGUgQlBUQyBjb21wcmVzc29yCgpWaW5zb24gTGVlICgxKToKLSBlZ2w6IEZp
eCBpbnQtdG8tdm9pZC1wb2ludGVyLWNhc3Qgd2FybmluZyBvbiBtYWNPUwptYXR0aGV3cGVyaXV0
ICgxKToKLSB2ZW51czogc2tpcCB2aXJ0aW8tZ3B1IGRldmljZXMgd2l0aG91dCAzRAptaXR1bDcy
ICgxKToKLSByYWR2OiBDbGVhciBzdGFsZSB2ZXJ0ZXggdXNlciBTR1BSIHN0YXRlIHdoZW4gYmlu
ZGluZyBtZXNoIHNoYWRlcnMKc29rYSAoMSk6Ci0gemluazogY2hlY2sgdGhlIHByaW1pdGl2ZSB0
eXBlIGFmdGVyIHppbmtfYmF0Y2hfcnAoKQo=

--===============1783431194578310765==
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
Ci0tLS0tLS0tLS0tLS0KCjo6CiAgICBUQkQuCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgot
IE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0tLS0KCi0gTWVzYSAyNi4yLjEgR3JvdW5kIFRydXRoIEFt
YmllbnQgT2NjbHVzaW9uIEJyb2tlbiBvbiBObyBNYW4ncyBTa3kKLSBNZXNoIHNoYWRlciB1bmlm
b3JtL2NvbnN0YW50IHJlbmRlcmluZyBpc3N1ZQotIFJBRFYgcmVncmVzc2lvbiBpbiBNZXNhIDI2
LjIueCDigJMgTm8gTWFuJ3MgU2t5IGhhcyBicm9rZW4vZGFyayBzdW5saWdodCBvbiBSWAogIDc5
MDAgWFQKLSBSZWdyZXNzaW9uOiBEM0QxMiBkcml2ZXIgYW5kIERSSSBicm9rZW4gdW5kZXIgV1NM
IGluIDI1LjAuNAotIFNJR0lMTCB3aXRoIGxsdm1waXBlIG9uIEFSTXY5KD8pIHdpdGhvdXQgU1ZF
Ci0gWC1QbGFuZSAxMiBlbmNvdW50ZXJpbmcgYSBHUFUgY3Jhc2ggb24gbG9hZCBhZnRlciByZWNl
bnQgdXBkYXRlLgotIFtGb3J0cyBSVFNdIENvcnJ1cHQgcmVuZGVyaW5nIG9mIGNvbXByZXNzZWQg
dGV4dHVyZXMKLSBhY286IGlsbGVnYWwgVk9QMyB2X2NuZG1hc2tfYjMyIHdpdGggdHdvIFNHUFIg
b3BlcmFuZHMgb24gR0ZYNi05IGluCiAgZW1pdF9zY2FsZWRfb3AgKGZwMzIgZGVub3JtIHByZXNl
cnZlKSDihpIgd3JvbmcgcmVzdWx0cwotIHJhZGVvbnNpOiBpbmNvcnJlY3QgcmVuZGVyaW5nIGlu
IERvb20gMzogQkZHCi0gcmFkdi9hbWRncHU6IHBhZGRpbmcgVk0gcGFnZSAoUkFERU9OX0ZMQUdf
Vk1fUEFEXzFQQUdFKSBpcyBuZXZlciB1bm1hcHBlZCBvbgogIEJPIGRlc3Ryb3k7IFZBIHJldXNl
IHRoZW4gZmFpbHMgd2l0aCAidmEgLi4uIGNvbmZsaWN0IiBvbiBHRlg5Ci0gcnVzdGljbDogY291
bGQgbm90IGluaXRpYWxpemUgU1ZNIHN1cHBvcnQgd2l0aCByYWRlb25zaSx6aW5rCi0gemluazog
d3JvbmcgcGlwZWxpbmUgYWZ0ZXIgYSB2ZXJ0ZXgtbGF5b3V0LW9ubHkgY2hhbmdlIHdpdGhvdXQK
ICBWS19FWFRfdmVydGV4X2lucHV0X2R5bmFtaWNfc3RhdGUKCkNoYW5nZXMKLS0tLS0tLQoKQ2Fp
byBPbGl2ZWlyYSAoMSk6Ci0gaXJpczogRnJlZSBjb21wdXRlIGNvbXBpbGF0aW9uIGNvbnRleHQg
b24gZmFpbHVyZQpDaHJpc3RpYW4gR21laW5lciAoMik6CgotIGV0bmF2aXY6IFVwZGF0ZSB2YWxp
ZF9idWZmZXJfcmFuZ2UgZm9yIHN0cmVhbSBvdXRwdXQgYnVmZmVycwotIGV0bmF2aXY6IFNraXAg
cmVuZGVyIGNvbXBhdGliaWxpdHkgZm9yIGV4dGVybmFsIFRTIHBsYW5lIHJlc291cmNlcwoKQ29u
bm9yIEFiYm90dCAoMSk6Ci0gdnVsa2FuL2dyYXBoaWNzX3N0YXRlOiBEb24ndCBnZXQgSUFMIHN0
YXRlIHdoZW4gbm90IG5lZWRlZApEZXJlayBMZXNobyAoMSk6Ci0gemluazogQ2F0Y2ggYWxsIHBy
aW9yIHVwZGF0ZXMgdG8gc291cmNlIHZhbGlkX2J1ZmZlcl9yYW5nZS4KRG1pdHJ5IEJhcnlzaGtv
diAoNyk6CgotIGZyZWVkcmVuby9jb21tb246IGZsYWcgYSB3b3JrYXJvdW5kIGZvciBDUF9EUkFX
X0FVVE8gaXNzdWUgaW4gYTYzMF9zcWUKLSBmcmVlZHJlbm8vcmVnaXN0ZXJzOiBkZWZpbmUgZm9y
bWF0IG9mIHRoZSBQQ19BVVRPX1ZFUlRFWF9TVFJJREUgcmVnaXN0ZXIKLSBmcmVlZHJlbm8vYTZ4
eDogd29ya2Fyb3VuZCBhbiBpc3N1ZSBpbiBhNjMwX3NxZS5mdwotIHR1OiB3b3JrYXJvdW5kIGFu
IGlzc3VlIGluIGE2MzBfc3FlLmZ3Ci0gZnJlZWRyZW5vL2E1eHg6IHNldCB0aGUgc2FtcGxlIGNv
dW50IGJlZm9yZSB0aGUgR01FTSByZXN0b3JlIGJsaXRzCi0gZnJlZWRyZW5vL2E1eHg6IHdyaXRl
IHRoZSBsaW5lYXIgY2VudHJvaWQgaW50ZXJwb2xhdG9yIHJlZ2lkCi0gaXIzOiBrZWVwIHRoZSBt
c2FhIGtleSBmb3Igc2hhZGVycyB0aGF0IGludGVycG9sYXRlIGF0IGdsX1NhbXBsZUlECgpEb21p
bmlxdWUgQmVsaGFjaGVtaSAoMSk6Ci0gcGNvOiBmaXggd29ya2dyb3VwIGJhcnJpZXIgcmFjZSB3
aGVuIHJldXNlZCBhY3Jvc3MgbG9vcCBpdGVyYXRpb25zCkR5bGFuIEJha2VyICgxKToKLSBpbnRl
bC9qYXk6IERvbid0IGF0dGVtcHQgdG8gZG8gd29yayB3aGVuIHRoZXJlIGlzIG5vbmUKRXJpYyBF
bmdlc3Ryb20gKDMpOgoKLSBkb2NzOiBhZGQgc2hhIHN1bSBmb3IgMjYuMi40Ci0gLnBpY2tfc3Rh
dHVzLmpzb246IFVwZGF0ZSB0byA4MWRmZjdjNjRmYjBjMWYyMDMxZDA0Y2NmZjk5NzIyMzNlMmUw
NTI0Ci0gLnBpY2tfc3RhdHVzLmpzb246IE1hcmsgYTgyZWQ4NTA4ODk1NDIwNmZiMWMzMGQwMTZm
MTgzMTBmYTYxNDI3OSBhcwogIGRlbm9taW5hdGVkCgpFcmljIFIuIFNtaXRoICgxKToKLSBwYW5m
cm9zdDogZml4IFVCIGluIHBhbl9jc2YgcG9pbnRlciBiYXNlZCB0eXBlLXB1bm5pbmcKRmFiaW8g
UGlwYXJvICgxKToKLSB2YzQ6IGRvbid0IHJldXNlIGZsYWdzIGZyb20gYmVmb3JlIGEgdGhyZWFk
IHN3aXRjaApGcmFuayBCaW5ucyAoMSk6Ci0gcHZyOiBmaXggZm9yIGpvYiBzYW1wbGVzIGJlaW5n
IGluaXRpYWxpc2VkIHRvIDAKRnJhbmsgQm91d2VyICgxKToKLSBwdnI6IGZpeCBmb3IgbXVsdGlz
YW1wbGluZyB3aXRoIG5vIGF0dGFjaG1lbnRzCkdlb3JnIExlaG1hbm4gKDQpOgoKLSB2dG46IGFk
ZCBhbiBvcHRpb24gdG8gZm9yY2UgZXhhY3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGFkZCBhbiBv
cHRpb24gdG8gZm9yY2UgZXhhY3QgR0xTTHN0ZDQ1MEZtYQotIHJhZHY6IGZvcmNlIGV4YWN0IEdM
U0xzdGQ0NTBGbWEgZm9yIE5vIE1hbiBTa3kKLSBhY286IGZpeCBjb25zdGFudCBidXMgdmlvbGF0
aW9uIGZvciBzY2FsZWQgdHJhbnNjZW5kZW50YWwgb3AKCkd1c3Rhdm8gTm9yb25oYSBTaWx2YSAo
MSk6Ci0gdmVudXM6IGRvbid0IHJ1biBhIHRocmVhZCdzIFRMUyB0ZWFyZG93biBmcm9tIGFuIHVu
bG9hZGVkIGRyaXZlcgpJYW4gUm9tYW5pY2sgKDEpOgotIG5pci9hbGdlYnJhaWM6IERvbid0IGdl
bmVyYXRlIDY0LWJpdCBpYWRkMyB3aGVuIG5vdCBzdXBwb3J0ZWQKSWNlbm93eSBaaGVuZyAoMik6
CgotIGxsdm1waXBlOiBkbyBub3QgY2FsbCBMTFZNTGlua0luTUNKSVQoKSB3aGVuIHVzaW5nIE9y
Y0pJVAotIG1lc29uOiBsaW5rIGluIG9yY2ppdCBpbnN0ZWFkIG9mIG1jaml0IHdoZW4gdXNpbmcg
T3JjSklUCgpKYWRlIE1hY2hvICgxKToKLSBnYWxsaXVtL3N3OiBGaXggbGx2bXBpcGUgYmVpbmcg
Y2hvc2VuIHdoZW4gbm90IHdhbnRlZApKZW9uZ2lrIENoYSAoMSk6Ci0gZ2Z4c3RyZWFtOiBhbGxv
dyBWS19FWFRfdmVydGV4X2F0dHJpYnV0ZV9kaXZpc29yIGFnYWluCkpvcmRhbiBKdXN0ZW4gKDIp
OgoKLSBpbnRlbC9nZW4vY29tcGFjdDogRml4IHR5cG8gaW4gWGUzUCBjb21wYWN0IHRhYmxlcwot
IGludGVsL2dlbi9jb21wYWN0OiBGaXggVU5DT01QXzNTUkNfU09VUkNFIGZvciBYZTNQCgpLYXJv
bCBIZXJic3QgKDIpOgoKLSBydXN0aWNsL2NvbnRleHQ6IHNraXAgbm9uIFNWTSBkZXZpY2VzIGlu
IGNsU1ZNQWxsb2MKLSBydXN0aWNsL3BsYXRmb3JtOiBza2lwIG5vbiBTVk0gZGV2aWNlcyB3aGVu
IGNyZWF0aW5nIHRoZSBWTSBoZWFwCgpLb25zdGFudGluIFNldXJlciAoMSk6Ci0gcmFkdjogQWxp
Z24gYnZoIHRvIDEyOCBieXRlcyBvbiBHRlgxMgpMZW9uIFNlZW1hbm4gKDEpOgotIHppbms6IHVw
ZGF0ZSB0aGUgcGlwZWxpbmUgd2hlbiBvbmx5IHRoZSB2ZXJ0ZXggaW5wdXQgc3RhdGUgY2hhbmdl
cwpMaW9uZWwgTGFuZHdlcmxpbiAoNCk6CgotIGFudjogZml4IGR5bmFtaWMgYnVmZmVyIGJhc2Ug
b2Zmc2V0IHVwbG9hZAotIGFudjogc3RvcmUgYXZhaWxhYmlsdHkgYmVmb3JlIHdyaXRpbmcgcGFy
dGlhbCByZXN1bHRzCi0gYW52OiBmZW5jZSBNSSBhdmFpbGFiaWx0eSB3cml0ZXMKLSBhbnY6IHRy
YWNrIHRoZSBxdWVyeSBwb29sIGNvcGllcyBmb3IgcmVzZXRzCgpMb2tib25kbyBLdW5nICgxKToK
LSBsbHZtcGlwZTogZml4IHVic2FuIHNoaWZ0IGV4cG9uZW50IHRvbyBsYXJnZSBlcnJvcgpMdWNp
ZSBIYXJ0bWFubiAoMSk6Ci0gZ2FsbGl2bTogUXVlcnkgaG9zdCBDUFUgZmVhdHVyZXMgb24gYWFy
Y2g2NCB0b28KTWFyZWsgT2zFocOhayAoMSk6CgotIHJhZHY6IGZpeCB0byB1c2UgSFRJTEUgZmls
bHMgaW5zdGVhZCBvZiBSTVcgc2hhZGVycyB0byByZXN0b3JlIHByZXZpb3VzCiAgYmVoYXZpb3IK
Ck1hcnkgR3VpbGxlbWFyZCAoMyk6CgotIG52ay9udmttZDogaGFuZGxlIGV4ZWNfY291bnQgPT0g
MCBpbiBudmttZF9ub3V2ZWF1X2V4ZWNfY3R4X2V4ZWMKLSBub3V2ZWF1L21tZTogQWRkIGRlcGVu
ZGVuY3kgb24gbXRoZCBmb3IgRFJFQUQvRFdSSVRFCi0gbm91dmVhdS9tbWU6IEZpeCBzY3JhdGNo
X3NoYXJlXzNkX3RvX2NvbXB1dGUgdGVzdAoKTWF0dCBUdXJuZXIgKDkpOgoKLSBnYWxsaXZtOiBk
b24ndCB1c2UgdGhlIHMzdGMgYW5kIHJndGMgSklUIGRlY29kZXJzIG9uIGJpZy1lbmRpYW4KLSBn
YWxsaXZtOiBwaWNrIHRoZSByaWdodCBsYW5lIGZvciBpbWFnZSBzdG9yZXMgd2lkZXIgdGhhbiAz
MiBiaXRzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBmaXggZmlyc3RfYWN0aXZlX2ludm9jYXRp
b24oKSBvbiBiaWctZW5kaWFuCi0gZ2FsbGl2bTogZml4IHVucGFja182NF8yeDMyX3NwbGl0IGZv
ciBzY2FsYXJzIG9uIGJpZy1lbmRpYW4KLSBnYWxsaXZtOiBvbmx5IHVzZSB2bWF4ZnAgZm9yIDMy
LWJpdCBmbG9hdHMKLSBnYWxsaXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAgd2hlbiBO
YU4gb3BlcmFuZHMgbXVzdCBiZSBpZ25vcmVkCi0gZ2FsbGl2bTogdXNlIFZTWCBmb3Igcm91bmRp
bmcgd2hlbiBhdmFpbGFibGUKLSBnYWxsaXZtOiBkb24ndCB1c2Ugdm1pbmZwIGFuZCB2bWF4ZnAg
d2hlbiBWU1ggaXMgYXZhaWxhYmxlCi0gbmlyLCBnbHNsLCBnYWxsaXVtOiBrZWVwIHRoZSBoYWx2
ZXMgb2YgbG93ZXJlZCA2NC1iaXQgSU8gaW4gbWVtb3J5IG9yZGVyCgpNYXR0aGlldSBNb2F0dGkg
KDEpOgotIHBhbi9iaTogUmVzdG9yZSBWQV9NRU1PUllfQUNDRVNTX0ZPUkNFIGZvciBzcGlsbHMg
YW5kIHJlZmlsbHMKTWlrZSBCbHVtZW5rcmFudHogKDI3KToKCi0gemluay9rb3BwZXI6IGZpeCBj
aGVjayBmb3IgYXN5bmMgcHJlc2VudHMKLSB6aW5rL2tvcHBlcjogd2FpdCBvbiBhc3luYyBwcmVz
ZW50cyB3aGVuIHVwZGF0aW5nIHN3YXBjaGFpbgotIHppbmsva29wcGVyOiBzdG9wIGxlYWtpbmcg
c3dhcGNoYWlucyBoYXJkZXIKLSB6aW5rL2tvcHBlcjogZG8gYSBmdWxsIGdsdGhyZWFkL3RjIHN5
bmMgd2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5rL2tvcHBlcjogdXNlIHRoZSBhY3R1
YWwgY3VycmVudCBpbWFnZSBleHRlbnQgd2hlbiBzZXR0aW5nIHN3YXAgaW50ZXJ2YWwKLSB6aW5r
OiByZXR1cm4gb24gZmx1c2hfZnJvbnRidWZmZXIgaWYgc3dhcGNoYWluIGlzIGtpbGwKLSB6aW5r
L2tvcHBlcjogZml4IHJldHVybiB2YWx1ZSBpbiBhY3F1aXJlCi0ga29wcGVyOiBtb3ZlIGV2ZW50
IHNlbGVjdGlvbiBmb3IgcHJlc2VudCBpbnRvIGtvcHBlckdldFN5bmNWYWx1ZXMKLSB6aW5rL2tv
cHBlcjogYWRkIGxvY2tpbmcgYXJvdW5kIEFOSSBhbmQgUVAKLSB6aW5rL2tvcHBlcjogZml4IGlu
dmFsaWQgcmVhZCBkdXJpbmcgc3dhcGNoYWluIHRlYXJkb3duCi0gdXRpbC90ZXhjb21wcmVzc19y
Z3RjOiB6ZXJvLWluaXRpYWxpemUgZW5jb2RlIHZhcmlhYmxlcwotIHppbmsvc3luYzogcGx1ZyBh
biBleHRyZW1lbHkgdHJpY2t5IGhvbGUgaW4gcmVvcmRlcmluZyBsb2dpYwotIHV0aWwvZGlza19j
YWNoZTogb25seSBzdWJ0cmFjdCBhbiBldmljdGVkIGl0ZW0gaWYgdW5saW5rIHN1Y2NlZWRlZAot
IHV0aWwvZGlza19jYWNoZTogcHV0IGd1YXJkIHBhZ2VzIGFyb3VuZCB0aGUgaW5kZXggbWFwcGlu
ZwotIHV0aWwvZGlza19jYWNoZTogcmV0dXJuIHdoZXRoZXIgZXZpY3RfbHJ1X2l0ZW0gcmVtb3Zl
ZCBhIGZpbGUKLSB1dGlsL2Rpc2tfY2FjaGU6IHJlY29tcHV0ZSBhbiBpbXBvc3NpYmxlIHNpemUg
Y291bnRlciBvbiBvcGVuCi0gdXRpbC9kaXNrX2NhY2hlOiByZWNvbXB1dGUgdGhlIHNpemUgd2hl
biBldmljdGlvbiBjYW5ub3QgaGVscAotIHV0aWwvZGlza19jYWNoZTogcmVtb3ZlIHN0YWxlIC50
bXAgZmlsZXMgd2hlbiByZWNvbXB1dGluZyB0aGUgc2l6ZQotIHN0L3Bibzogc2tpcCBkZWxldGVf
Y29tcHV0ZV9zdGF0ZSBmb3Igc2hhZGVycyBuZXZlciBjcmVhdGVkCi0gemluazogY2xlYXIgdGhl
IGdlbmVyYXRlZCB0Y3MgbmlyIHBvaW50ZXIgYWZ0ZXIgaXQgaXMgZnJlZWQKLSB6aW5rOiBjaGVj
ayB1bmZsdXNoZWQgdW5kZXIgdGhlIHVzYWdlIG11dGV4IGluIHRoZSB1bmZsdXNoZWQgd2FpdAot
IHppbms6IHRha2UgcmFsbG9jX2xvY2sgYXJvdW5kIHNjcmVlbi1wYXJlbnRlZCByYWxsb2NzCi0g
emluazogc3RvcCBwYXJlbnRpbmcgdGhlIHNjcmVlbidzIHNlbWFwaG9yZSBhcnJheXMgdG8gdGhl
IHNjcmVlbgotIHppbms6IHNlcmlhbGl6ZSB1bnRocmVhZGVkIGJhdGNoIHN1Ym1pc3Npb24gcGVy
IHNjcmVlbgotIHppbms6IGZvcmNlIHN5bmMgYWZ0ZXIgdW5iaW5kLCBldmVuIHdpdGggR0VORVJB
TCBsYXlvdXRzCi0gemluazogZW5zdXJlIGRlc2NyaXB0b3IgYnVmZmVycyBzdGF5IG1hcHBhYmxl
IHdpdGhvdXQgQkFSIGFsbG9jCi0gemluazogYXZvaWQgY29uc3RhbnRseSBmYWlsaW5nIEJBUiBh
bGxvY2F0aW9ucyBvbiBzeXN0ZW1zIHdpdGhvdXQgUmVCQVIKCk1pa2hhaWwgTWxoY25uICgyKToK
Ci0gdXRpbC90YzogcmVzZXQgZW5kX2NhbGwgd2hlbiBycCBpbmZvIGlzIHJldXNlZCBhZnRlciBz
eW5jCi0gdXRpbC90YzogZml4IGJ1ZmZlciBvdmVyLXJlYWQgYW5kIHRocmVhZCByYWNlIGluIHN0
YWdpbmcgdGV4dHVyZV9zdWJkYXRhCgpOaWtpdGEgS29udG9uICgxKToKLSByYWRlb25zaTogaW52
YWxpZGF0ZSBJJC9TTUVNJC9WTUVNJCBhdCBJQiBzdGFydCBvbiBhbGwgZ2Z4IGxldmVscwpPbGl2
aWEgTGVlICgxKToKLSBwYW52azogZml4IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBHZXRJ
bnN0YW5jZVByb2NBZGRyCk9tYXIgUmFzaHdhbiAoMik6CgotIG5pci9pbnN0cl9zZXQ6IGNvbXBh
cmUgdGV4IGRlZiB3aGVuIENTRWluZyB0ZXh0dXJlIGluc3RydWN0aW9ucwotIG5pci9pbnN0cl9z
ZXQ6IGNvbXBhcmUgdGV4IGRlc3RfdHlwZSBpbnN0ZWFkIG9mIGJpdCBzaXplIHdoZW4gQ1NFaW5n
IHRleHR1cmUKICBpbnN0cnVjdGlvbnMKClBldGVyIFF1YXlsZSAoMSk6Ci0gcHZyOiBmaXggc3Ry
ZWFtLW91dCBQRFMgZGF0YSBzaXplIHVuaXRzIGluIENTQiBkdW1wClBpZXJyZS1FcmljIFBlbGxv
dXgtUHJheWVyICgzKToKCi0gcmFkZW9uc2k6IHJlbW92ZSBpbnZhbGlkIGFzc2VydAotIHJhZGVv
bnNpL2dmeDEyOiBkb250IHNldCBCTyBtZXRhZGF0YSBvbiBpbXBvcnQKLSB3aW5zeXMvYW1kZ3B1
OiBmaXggaW1wb3J0L2Rlc3Ryb3kgcmFjZSBhZ2FpbgoKUm9iIENsYXJrICgxKToKLSBmcmVlZHJl
bm8vY29tbW9uOiBGaXggYTcwMiBjaGlwLWlkClNhbXVlbCBQaXRvaXNldCAoNCk6CgotIHJhZHYv
cnQ6IGZpeCBjaGVja2luZyBlcnJvcnMgZm9yIGltcG9ydGVkIGJpbmFyaWVzCi0gcmFkdi9ydDog
Zml4IGltcG9ydGluZyBwaXBlbGluZSBiaW5hcmllcwotIHJhZHYvbmlyOiBmaXggZGV0ZXJtaW5p
bmcgaWYgYSBWUyBpbnB1dCBsb2NhdGlvbiBpcyBoaWdoIDY0LWJpdAotIHJhZHYvYW1kZ3B1OiB1
bm1hcCB0aGUgZmlyc3QgcGFnZSB1c2VkIHRvIGltcGxlbWVudCBWTSBwYWRkaW5nCgpTaW1vbiBQ
ZXJyZXR0YSAoMSk6Ci0gcGNvOiB0ZW1wb3JhcmlseSBkaXNhYmxlIHZ0eGluIGFsbG9jYXRpb24g
ZHVlIHRvIHZlYyBoYW5kbGluZyBidWcKVGhvbmcgVGhhaSAoMSk6Ci0gZHJpY29uZjogQWRkIGln
bm9yZV9tYXBfaW52YWxpZGF0ZV9idWZmZXIgb3B0aW9uClRpbW90aHkgQXJjZXJpICg1KToKCi0g
cmFkZW9uc2k6IGNvcnJlY3RseSBkZXRlY3QgYW5kIHNldCBtZXNoIHNoYWRlcnMgYXMgZGlydHkK
LSByYWRlb25zaTogd2lkZW4gYmluZF9oaXN0b3J5IGJpdGZpZWxkCi0gZ2FsbGl1bS90Yy96aW5r
OiB3aWRlbiByZWJpbmRfbWFzayB0byBzdXBwb3J0IHVzZSBieSBtZXNoIHNoYWRlcnMKLSB6aW5r
OiBmaXggcmViaW5kaW5nIHN1cHBvcnQgZm9yIG1lc2ggc2hhZGVycwotIHV0aWwvZm9ybWF0OiBm
aXggdHlwbyBpbiB0aGUgQlBUQyBjb21wcmVzc29yCgpWaW5zb24gTGVlICgxKToKLSBlZ2w6IEZp
eCBpbnQtdG8tdm9pZC1wb2ludGVyLWNhc3Qgd2FybmluZyBvbiBtYWNPUwptYXR0aGV3cGVyaXV0
ICgxKToKLSB2ZW51czogc2tpcCB2aXJ0aW8tZ3B1IGRldmljZXMgd2l0aG91dCAzRAptaXR1bDcy
ICgxKToKLSByYWR2OiBDbGVhciBzdGFsZSB2ZXJ0ZXggdXNlciBTR1BSIHN0YXRlIHdoZW4gYmlu
ZGluZyBtZXNoIHNoYWRlcnMKc29rYSAoMSk6Ci0gemluazogY2hlY2sgdGhlIHByaW1pdGl2ZSB0
eXBlIGFmdGVyIHppbmtfYmF0Y2hfcnAoKQo=

--===============1783431194578310765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.2.4-26.2.5.patch"

RnJvbSBhOTM1N2NjMDE2OWNjZDk2NWE5ZjRkOTIwM2MxYjI0OThmM2NiODA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6MTk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLG1lc2EtdG9vbHMtbmF0aXZlOiB1cGdyYWRlIDI2LjIuNCAtPiAyNi4yLjUKCk1lc2EgMjYu
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
KysrLS0tLS0tLS0KIC4uLmVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xh
bmcucGF0Y2ggfCAgMiArLQogLi4uLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10
eXBlZC1lbi5wYXRjaCB8ICAyICstCiAuLi51X21hdGguYy1kby1ub3QtdXNlLWFybS1mcHUtaW5z
dHJ1Y3Rpb25zLWlmLnBhdGNoIHwgIDIgKy0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0
cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1hZGRybGliLWF2b2lkLWJ1aWx0aW5fY3B1X3N1cHBvcnRzLWZvci1hdngyLWRldGVj
dGkucGF0Y2gKaW5kZXggMmIzMGMxYjVjNy4uMjRlZWNkYzM1NSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1hZGRybGliLWF2b2lkLWJ1aWx0aW5fY3B1
X3N1cHBvcnRzLWZvci1hdngyLWRldGVjdGkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvZmlsZXMvMDAwMS1hZGRybGliLWF2b2lkLWJ1aWx0aW5fY3B1X3N1cHBvcnRzLWZv
ci1hdngyLWRldGVjdGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGIwMDQwOTk1NmNkMWE1
OGYxYzY3NmRlOWNiZmQyYzY4OGNhM2ZjOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDFhMmEzMTJmZWIwMDZmNzNjZjFlODQzYTI0NjZkNjgzYTBhMjU5M2IgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KIERh
dGU6IFRodSwgMTMgQXVnIDIwMjYgMDA6MDA6MDAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYWRk
cmxpYjogYXZvaWQgX19idWlsdGluX2NwdV9zdXBwb3J0cyBmb3IgYXZ4MiBkZXRlY3Rpb24KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5v
LWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQt
cGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCmluZGV4IGQ1ODAyNzcxMjQuLjY3NzI0MzRmODEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5v
LWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1
aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTYxZGFh
ZjM1NGJkODRkZmE4NDlmOGRhNjAyOGRkYzcxZjFhZjdkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzVlYjVjMmZjNjRkMDgxNzkyZmM1YzY0NmE5YmY3ODY0OTFhODAxZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hr
b3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTAgRGVjIDIwMjUgMDI6Mjc6MTYgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gZnJlZWRyZW5vOiBkb24ndCBlbmNvZGUgYnVpbGQgcGF0aCBp
bnRvIGJpbmFyaWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxl
cy8wMDAxLWdhbGxpdm0tYWRhcHQtZm9yLUpJVExpbmstaW4tTExWTS0yMy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1hZGFwdC1mb3ItSklUTGlu
ay1pbi1MTFZNLTIzLnBhdGNoCmluZGV4IDc1NmI2OGE4OTguLmRlZGIwMDVlZjggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1hZGFwdC1m
b3ItSklUTGluay1pbi1MTFZNLTIzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1hZGFwdC1mb3ItSklUTGluay1pbi1MTFZNLTIzLnBhdGNo
CkBAIC0xLDUgKzEsNCBAQAotRnJvbSBjZGEzODM2MjVmNWQxZmQwNjY1N2ZiOTk4YjdkMTM3MGE3
ZmFiZDhmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotTWVzc2FnZS1JRDogPGNkYTM4MzYyNWY1
ZDFmZDA2NjU3ZmI5OThiN2QxMzcwYTdmYWJkOGYuMTc5MTExNDg1MS5naXQubWFyY2VsQHppc3dp
bGVyLmNvbT4KK0Zyb20gMjIzOTljMDAyMDQ3ZmY5YmQzNmQxZmU1NGVmMzBiMDViZGUwZGRjZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2Rh
QGlzY2FzLmFjLmNuPgogRGF0ZTogV2VkLCAzMCBTZXAgMjAyNiAxNDoxMDoxNCArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBnYWxsaXZtOiBhZGFwdCBmb3IgSklUTGluayBpbiBMTFZNIDIzCkBAIC0y
MSwxMCArMjAsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS93b3JrX2l0ZW0KICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9hdXhpbGlhcnkvZ2Fs
bGl2bS9scF9ibGRfaW5pdF9vcmMuY3BwIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0v
bHBfYmxkX2luaXRfb3JjLmNwcAotaW5kZXggMDlkNTZlNTQzZWUuLmJjOWQ3ODM3ZWNkIDEwMDY0
NAoraW5kZXggOWEwMmRlMy4uODFhNWYyNyAxMDA2NDQKIC0tLSBhL3NyYy9nYWxsaXVtL2F1eGls
aWFyeS9nYWxsaXZtL2xwX2JsZF9pbml0X29yYy5jcHAKICsrKyBiL3NyYy9nYWxsaXVtL2F1eGls
aWFyeS9nYWxsaXZtL2xwX2JsZF9pbml0X29yYy5jcHAKLUBAIC0zNDYsNiArMzQ2LDEzIEBAIExQ
Sml0OjpMUEppdCgpIDpqaXRfZHlsaWJfY291bnQoMCkgeworQEAgLTM0MSw2ICszNDEsMTMgQEAg
TFBKaXQ6OkxQSml0KCkgOmppdF9keWxpYl9jb3VudCgwKSB7CiAgICAgICAgICAgLnNldEpJVFRh
cmdldE1hY2hpbmVCdWlsZGVyKHN0ZDo6bW92ZShKVE1CKSkKICAjaWZkZWYgVVNFX0pJVExJTksK
ICAgICAgICAgICAuc2V0T2JqZWN0TGlua2luZ0xheWVyQ3JlYXRvcigKQEAgLTM4LDcgKzM3LDcg
QEAgaW5kZXggMDlkNTZlNTQzZWUuLmJjOWQ3ODM3ZWNkIDEwMDY0NAogICNpZiBMTFZNX1ZFUlNJ
T05fTUFKT1IgPj0gMjEKICAgICAgICAgICAgICAvKiBMTFZNIDIxIHJlbW92ZWQgdGhlIFRyaXBs
ZSBhcmd1bWVudCAqLwogICAgICAgICAgICAgIFsmXShFeGVjdXRpb25TZXNzaW9uICZFUykgewot
QEAgLTM1NSw2ICszNjIsNyBAQCBMUEppdDo6TFBKaXQoKSA6aml0X2R5bGliX2NvdW50KDApIHsK
K0BAIC0zNTAsNiArMzU3LDcgQEAgTFBKaXQ6OkxQSml0KCkgOmppdF9keWxpYl9jb3VudCgwKSB7
CiAgICAgICAgICAgICAgICAgcmV0dXJuIHN0ZDo6bWFrZV91bmlxdWU8T2JqZWN0TGlua2luZ0xh
eWVyPigKICAgICAgICAgICAgICAgICAgICBFUywgRXhpdE9uRXJyKGxsdm06OmppdGxpbms6Oklu
UHJvY2Vzc01lbW9yeU1hbmFnZXI6OkNyZWF0ZSgpKSk7CiAgICAgICAgICAgICAgfSkKQEAgLTQ2
LDYgKzQ1LDMgQEAgaW5kZXggMDlkNTZlNTQzZWUuLmJjOWQ3ODM3ZWNkIDEwMDY0NAogICNlbHNl
CiAgI2lmIExMVk1fVVNFX0lOVEVMX0pJVEVWRU5UUwogICAgICAgICAgIC5SZWdpc3RlckpJVEV2
ZW50TGlzdGVuZXIoCi0tLSAKLTIuNTIuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1t
aXBzLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1t
ZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAppbmRleCA3
N2EwYmEzZDhiLi5jZTYxMGZhMjRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNs
YW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVz
b24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGMzYTM1OWQzOWUzODdlNzg1ODgzY2I3NDA5MzRhMGRjNGU2Mzc2ZGIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUwZWZmZmU3ZmVlMzFkZjE4ODJjYTg4MmRmNjcw
NTc2Y2VmZjcxZGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxMyBKYW4gMjAyMCAxNToyMzo0NyAtMDgwMAog
U3ViamVjdDogW1BBVENIXSBtZXNvbiBtaXNkZXRlY3RzIDY0Yml0IGF0b21pY3Mgb24gbWlwcy9j
bGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1z
cmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGls
ZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCmluZGV4IGI5MjNjNGMx
ZmIuLjIyY2MwMmYyMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBl
ZC1lbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNy
Yy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGNjZmE1YTY1NTVmNmViMDM1YWNlMTJjYmExY2UzZTc4NWE0
Nzg5NWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdlYTIwYTdhODA0YWMxNjhjMWVk
OWQ1MTExNGNhZGFiMjJjZGI1MmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU3VuLCAxNCBKdW4gMjAy
NiAxNzo0MjoxOSArMDIwMAogU3ViamVjdDogW1BBVENIXSBzcmMvaW50ZWwvY29tcGlsZXIvamF5
L2pheV9pci5oOiBkbyBub3QgdXNlZCB0eXBlZCBlbnVtCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2Ut
YXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9maWxlcy8wMDAxLXNyYy11dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVj
dGlvbnMtaWYucGF0Y2gKaW5kZXggMGQwZmRhY2UyYy4uMGFjMDQ4ODlhOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21hdGguYy1k
by1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRoLmMtZG8tbm90LXVzZS1h
cm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODljNDZk
ZTkyZTk3NDIwMmMxY2FiY2UyNWJiNGQ5NDQxODMwYjhiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYWNiZGZmN2ZjYjJjYjNhNTMyOWM3YWE0NzQ0YmFhODJjMGM2NTJkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiBEYXRlOiBXZWQsIDEgSnVsIDIwMjYgMjI6NDg6MTUgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc3JjL3V0aWwvdV9tYXRoLmM6IGRvIG5vdCB1c2UgYXJtIGZwdSBpbnN0cnVjdGlvbnMg
aWYgZnB1IGlzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmlu
YyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCmluZGV4IGRhNzFhMGJkYjAu
LmRiZGMwMmQ2ZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2Eu
aW5jCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCkBAIC0yMyw4ICsy
Myw4IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcvbWVzYS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nYWxsaXZtLWFkYXB0LWZvci1KSVRMaW5r
LWluLUxMVk0tMjMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJiY2U1ZjdmYmViYjkzNDM3M2I4NmM5OTlhMDY0ZDUyZmI1MDY1ODc4ZGM1N2YyODdmOTUzNDY2
NDhlYzgzMmU5IgotUFYgPSAiMjYuMi40IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc5NGIzZDE3
MjkwNzVkYWU3ZWJkNDdjNzI4M2I3Y2EwY2RiNWRlYzY2OGY3ZjExY2MwYTVkODJmNjEzOGEwYTUi
CitQViA9ICIyNi4yLjUiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9Q
PHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============1783431194578310765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.2.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch" to "https://archive.mesa3d.org/mesa-26.2.5.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 45517568 to 45529856 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.4.so", added "/usr/lib/libgallium-26.2.5.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 773266456 to 773379120 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.2.4.so", added "/usr/lib/.debug/libgallium-26.2.5.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 202252 to 202393 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 250567753 to 250575320 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.2.4/src/intel/perf -> /usr/src/debug/mesa/26.2.5/src/intel/perf, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/shaders -> /usr/src/debug/mesa/26.2.5/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.2.4/src/virtio/vulkan -> /usr/src/debug/mesa/26.2.5/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/util -> /usr/src/debug/mesa/26.2.5/src/util, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/runtime -> /usr/src/debug/mesa/26.2.5/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/isl -> /usr/src/debug/mesa/26.2.5/src/intel/isl, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa -> /usr/src/debug/mesa/26.2.5/src/mesa, directory renamed /usr/src/debug/mesa/26.2.4/src/util/format -> /usr/src/debug/mesa/26.2.5/src/util/format, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.2.5
 /src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/gen -> /usr/src/debug/mesa/26.2.5/src/intel/compiler/gen, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/blorp -> /usr/src/debug/mesa/26.2.5/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.2.5/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/elk -> /usr/src/debug/mesa/26.2.5/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/genxml -> /usr/src/debug/mesa/26.2.5/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/compiler -> /usr/src/debug/mesa/26.2.5/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.2.5/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler -> /usr/src/debug/mesa/26.2.5/src/compiler, directory renamed /usr/src/debug/mes
 a/26.2.4/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.2.5/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/jay -> /usr/src/debug/mesa/26.2.5/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/glsl -> /usr/src/debug/mesa/26.2.5/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler/brw -> /usr/src/debug/mesa/26.2.5/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.2.5/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/common -> /usr/src/debug/mesa/26.2.5/src/amd/common, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/vulkan -> /usr/src/debug/mesa/26.2.5/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/compiler -> /usr/src/debug/mesa/26.2.5/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.2
 .5/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.2.4/src/loader -> /usr/src/debug/mesa/26.2.5/src/loader, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.2.5/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.2.5/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/nir -> /usr/src/debug/mesa/26.2.5/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/wsi -> /usr/src/debug/mesa/26.2.5/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.2.4/src/gallium/auxiliary -> /usr/src/debug/mesa/26.2.5/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/dev -> /usr/src/debug/mesa/26.2.5/src/intel/dev, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/program -> /usr/src/debug/mesa/26.2.5/src/mesa/program, directory renamed /usr/src/debug/mesa/26.2.4/src/vulkan/ut
 il -> /usr/src/debug/mesa/26.2.5/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.2.4/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.2.5/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/ds -> /usr/src/debug/mesa/26.2.5/src/intel/ds, directory renamed /usr/src/debug/mesa/26.2.4/src/intel/vulkan -> /usr/src/debug/mesa/26.2.5/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.2.4/src/compiler/spirv -> /usr/src/debug/mesa/26.2.5/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.2.4/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.2.5/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.2.4/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.2.5/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.2.4/src/nouveau/headers -> /usr/src/debug/mesa/26.2.5/src/nouveau/headers
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 84457192 to 84477672 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.2.4" to "26.2.5"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.2.4 [default] to 26.2.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.2.4" to "26.2.5"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.4.so moved to /usr/lib/libgallium-26.2.5.so

--===============1783431194578310765==--

