Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F024C88E5D
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:46:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1968.1789195560434152859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HIl29g8b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GJvcBbwj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0945da225-bf69128f-a598-4704-83a4-75e4d49f0244-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uZNB8kQc94gI7RM0VYEZOQJz4h8glrI0HyYNfd4WtU0=;
	b=HIl29g8bdCM0AJyPu1vtAbS/52nG1Y2Jyr5PWEUy0OyYYFGou6DYAjN4ZN/oFiX0
	hMt5/sCle/uaHgvtkVy2W1BQDbaeY0tw7G31ze0NAbI00HYStWIz/4of1nV93+EA836
	NFSBzvINBq1dlUzhFWXqccwAs02fnXcpf/bTxT64=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uZNB8kQc94gI7RM0VYEZOQJz4h8glrI0HyYNfd4WtU0=;
	b=GJvcBbwjP4KH6QbpP674yJLSQbss2bbNPDG6cZkEC++Px4VB6e3TmVlO19UCqORM
	IDyLKE0nwpyeQ0ZEVCgqzn+39+e3aJatIHIDw1V59FeVJlbfsm9JCZCBKesD2xAMfz9
	ygkkqeFLs93fjxdv42kwCdc+81QIFBe0MbgNDoj4=
Content-Type: multipart/mixed; boundary="===============3531055209321891870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 4950babfd2cd4408e4bfd103d935c6e5cff53d20
 SUCCEEDED
Message-ID: <010101a0945da225-bf69128f-a598-4704-83a4-75e4d49f0244-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:45:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245689

--===============3531055209321891870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *4950babfd2cd4408e4bfd103d935c6e5cff53d20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From f1480d149f8a3527c57067e7b853f76a4c0af326 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 06:23:29 +0000
Subject: [PATCH] piglit: upgrade to latest revision

4950babfd khr_texture_compression_astc: check for full NPOT support
81f9eac8c cl/api: initialize 'vec3' and 's_arg' in clSetKernelArg test
fa4992cbe tests/egl_ext_surface_compression: make create test wayland-only
4d23b8c62 tests/egl_ext_surface_compression: stop using egl_utils
ac0863746 egl_khr_surfaceless_context: request proper surface
007ef311b glsl: only check line interior for clipvertex/clipdistance tests
23a87ff87 gl-3.2-compat: fix loop for GS gl_ClipVertex test
04da05647 ext_yuv_target: add BlitFramebuffer YUV-restriction tests
136db767d arb_texture_barrier: skip blending-in-shader if too few color attachments
0b1ebdeb7 arb_transform_feedback2/draw-auto: test a non-zero buffer offset
6cd2a7617 vulkan: Rename cmat-uniform-ctor test to .vk_shader_test
a84614b9c egl-terminate-then-unbind-context: allow config with any surface
e7c693381 arb_shader_storage_buffer_object: convert atomicMin-swizzle
8e28eb429 cmake: serialize vulkan.xml after generating Vulkan tests
021d398d7 arb_texture_barrier: pass real vertex index bounds to glDrawRangeElements
a8b696b24 opengl.py: register ext_yuv_target compiled tests
1521e9a5b tests/ext_frame_buffer_multisample: add message when tests is skipped due samples > max_samples
372590d39 gs-output-array-vec4-index-wr: Avoid exceeding GS output limits.
48597869c ext_external_objects: skip Vulkan timeline wait without GL timeline support
c12502949 general: test rendering with a maximum-sized viewport
a705d674d ext_image_dma_buf_import: add NV12 dual-fd vs single-fd sample test
6f4d25e3b glsl: enable PROGRAM_TWO_SIDE in glsl-packed-back-color
2216e438f arb_texture_view: use GL 3.0 functions
107825905 vulkan: Add test for divergent GS cut bits
06169021f ext_yuv_target: require GL_EXT_YUV_target for shader_runner tests
65f44948b fs-uint-to-float-of-extract-int*: Also support the alternative rounding.
2ba21df4b *-packHalf2x16.shader_test: Allow values to round to zero.
250cb0ce6 *-packHalf2x16.shader_test: Allow subnormals to flush to zero.
6cf48cf8e glx: fix visual test resource teardown order
ab113c4f1 glx-multithread-clearbuffer: synchronize version check
7cd2aa213 gl-1.0: test fixed-function fog on a floor straddling the eye
fee8b84aa arb_framebuffer_object: add test for oblong blits
cae34b151 ext_yuv_target: add NV12 sampling and rendering execution tests
2f480240d Tests for GL_EXT_YUV_target and EGL_EXT_YUV_surface
cbbb8f183 ext_texture_storage: test GLES2 NPOT level restrictions
110102701 ext_texture_storage: factor storage checks into a helper
7b1335738 ext_texture_storage: register formats test in the GPU profile
e41f57633 s3tc-errors: test level-zero NPOT images on GLES2
bf5d1cbdc generated_tests: fix incompatible pointer types in global address space CL kernels
fa1953546 glsl-1.50: test gl_PrimitiveID together with a user varying and no GS
9771f3e92 cl/api: adapt set-kernel-arg test for OpenCL 3.1 platform
c65972281 cl/api: skip CL_QUEUE_SIZE query on host command-queues
d690a61a0 cl/api: fix CL_DEVICE_MA

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  4 +-
 ...sts-use-unsigned-int-instead-of-uint.patch | 27 ----------
 ...ake-egl_ext_surface_compression-cond.patch | 52 -------------------
 ...r.py-modify-_command-and-not-command.patch |  2 +-
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  2 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  4 +-
 7 files changed, 6 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 46e5a6d83f..5ae8d4a499 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From abccc17819ad208c0df3edbc8bbcd134e45864f9 Mon Sep 17 00:00:00 2001
+From 1b3d0741044c782731d22d7fed7e92ef409bb966 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 95f40ebfe..4c7da07b4 100644
+index 1a38c21f9..45c181e85 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch b/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
deleted file mode 100644
index 2c01fe7029..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8b98674fedc0ac31e768ccd16165bcb585e413e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 2 Jul 2026 13:56:17 +0200
-Subject: [PATCH] pixel-local-tests: use unsigned int instead of uint
-
-uint is not a valid integer type in C, and this fails
-to compile under musl libc library.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1170]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-index 4776193f2..1ac669d11 100644
---- a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-+++ b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-@@ -851,7 +851,7 @@ make_test_main_str(char *dst, struct pls_format_data *format_data,
- 		case GL_RGBA8UI:
- 		case GL_RG16UI:
- 		case GL_R32UI: {
--			uint expected[4];
-+			unsigned int expected[4];
- 			for (int comp = 0; comp < 4; comp++) {
- 				if (comp < format_data[member].num_components)
- 					expected[comp] = format_data[member].u[comp];
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
deleted file mode 100644
index c71bf4c8bc..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3e7ec165c718234e1afcdf730bdf20942976e25c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 22 Nov 2024 22:52:31 +0100
-Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
- to X11
-
-Otherwise, this error occurs:
-| In file included from /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/create_surface.c:28:
-| /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/../../egl-util.h:12:10: fatal error: X11/Xlib.h: No such file or directory
-|    12 | #include <X11/Xlib.h>
-|       |          ^~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
-Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- .../spec/egl_ext_surface_compression/CMakeLists.gles3.txt   | 6 ++++--
- tests/egl/spec/egl_ext_surface_compression/create_surface.c | 1 -
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-index d9540bcfd..01a70164f 100644
---- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-+++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-@@ -2,10 +2,12 @@ link_libraries(
- 	piglitutil_${piglit_target_api}
- )
- 
--piglit_add_executable(egl_ext_surface_compression-create ../../egl-util.c
-+if (PIGLIT_HAS_WAYLAND)
-+piglit_add_executable(egl_ext_surface_compression-create
- 	../../egl-wayland.c create_surface.c)
-+endif (PIGLIT_HAS_WAYLAND)
- 
--piglit_add_executable(egl_ext_surface_compression-image ../../egl-util.c
-+piglit_add_executable(egl_ext_surface_compression-image
- 	image_storage.c)
- 
- # vim: ft=cmake:
-diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index 71b043b54..09e87dee4 100644
---- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-+++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-@@ -25,7 +25,6 @@
- #include "piglit-util.h"
- #include "piglit-util-egl.h"
- #include "piglit-util-gl.h"
--#include "../../egl-util.h"
- #include "../../egl-wayland.h"
- 
- static enum piglit_result
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index 035e7a4d5a..ee39d6df5a 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 14e56a6336f36d1112964ce1ff0900ea4b37b483 Mon Sep 17 00:00:00 2001
+From f4de80be6ed99bbade73281c0cac99bac7f5e2eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 329fd75975..701c7076ae 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 4444dd748b9324508e3168f64cf0b5adc31b5ebd Mon Sep 17 00:00:00 2001
+From e02e95a4c3103a8223dc89b6dbad3747e641f203 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 9c05e639b3..2f53abf419 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From f9bfdb8d32c2113c39c3be1bd6fd0934f693ab03 Mon Sep 17 00:00:00 2001
+From d10663b34ce8606b82bc153638a2f89bda32d4c0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a3203464d1..cd1ae5d6d2 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,13 +10,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
-           file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
-           file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "56f237be32ed66820eb05ea3cb04cb8b957ccd8d"
+SRCREV = "4950babfd2cd4408e4bfd103d935c6e5cff53d20"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============3531055209321891870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/spec/arb_shader_storage_buffer_object/compiler/atomicMin-swizzle.vert", added "/usr/lib/piglit/bin/ext_yuv_target-nv12-blit-yuv-to-yuv /usr/lib/piglit/bin/ext_yuv_target-nv12-render-yuv /usr/lib/piglit/bin/ext_yuv_target-nv12-sample-y2y /usr/lib/piglit/bin/framebuffer-blit-oblong /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-binop-fail.frag /usr/lib/piglit/tests/spec/arb_shader_storage_buffer_object/linker/atomicMin-swizzle.shader_test /usr/lib/piglit/tests/vulkan/shaders/gs-divergent-cut-bits.vk_shader_test /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x8x16-acc-0.0.vk_shader_test /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x8x16-acc-0.5.vk_shader_test /usr/lib/piglit/bin/gl-1.0-fog-linear-floor /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-unop-fail.fr
 ag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/compare-fail.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call-2-shaders.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/depth-write-fail.frag /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x16x16-acc-0.0.vk_shader_test /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x16x16-acc-0.5.vk_shader_test /usr/lib/piglit/bin/ext_yuv_target-simple /usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/execution/yuv_2_rgb.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/execution/rgb_2_yuv.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-nv12-single-fd /usr/lib/piglit/tests/vul
 kan/shaders/cmat-uniform-ctor.vk_shader_test /usr/lib/piglit/tests/spec/glsl-1.50/execution/primitive-id-no-gs-varying.shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-blit-roundtrip /usr/lib/piglit/bin/max-viewport-render /usr/lib/piglit/bin/gl-2.1-point_smooth /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/input-layout-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/ctor-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/output-layout-fail.frag"

--===============3531055209321891870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch"
packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+4950babfd2
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/spec/arb_shader_storage_buffer_object/compiler/atomicMin-swizzle.vert", added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/ctor-fail.frag /usr/lib/piglit/bin/ext_yuv_target-nv12-blit-roundtrip /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x16x16-acc-0.5.vk_shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-unop-fail.frag /usr/lib/piglit/bin/ext_image_dma_buf_import-nv12-single-fd /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/depth-write-fail.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x8x16-acc-0.0.vk_shader_test /usr/lib/piglit/generated_tests/vul
 kan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x8x16-acc-0.5.vk_shader_test /usr/lib/piglit/bin/max-viewport-render /usr/lib/piglit/bin/ext_yuv_target-simple /usr/lib/piglit/tests/vulkan/shaders/cmat-uniform-ctor.vk_shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/input-layout-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/execution/rgb_2_yuv.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-binop-fail.frag /usr/lib/piglit/tests/spec/arb_shader_storage_buffer_object/linker/atomicMin-swizzle.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/execution/yuv_2_rgb.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/compare-fail.frag /usr/lib/piglit/bin/gl-1.0-fog-linear-floor /usr/lib/piglit/bin/framebuffer-blit-oblong /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call-2-shaders.shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-sample-y2y /usr/lib/piglit/bin/gl-2.1-point_smooth /
 usr/lib/piglit/tests/spec/glsl-1.50/execution/primitive-id-no-gs-varying.shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-blit-yuv-to-yuv /usr/lib/piglit/tests/vulkan/shaders/gs-divergent-cut-bits.vk_shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-render-yuv /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/output-layout-fail.frag /usr/lib/piglit/generated_tests/vulkan/shaders/vulkan-cmat-muladd-with-acc-constant/float16-float32-constant-8x16x16-acc-0.0.vk_shader_test"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2059161624 to 2060269340 (+0%)

--===============3531055209321891870==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBmMTQ4MGQxNDlmOGEzNTI3YzU3MDY3ZTdiODUzZjc2YTRjMGFmMzI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDY6MjM6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgo0OTUwYmFiZmQga2hyX3RleHR1cmVf
Y29tcHJlc3Npb25fYXN0YzogY2hlY2sgZm9yIGZ1bGwgTlBPVCBzdXBwb3J0CjgxZjllYWM4YyBj
bC9hcGk6IGluaXRpYWxpemUgJ3ZlYzMnIGFuZCAnc19hcmcnIGluIGNsU2V0S2VybmVsQXJnIHRl
c3QKZmE0OTkyY2JlIHRlc3RzL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbjogbWFrZSBjcmVh
dGUgdGVzdCB3YXlsYW5kLW9ubHkKNGQyM2I4YzYyIHRlc3RzL2VnbF9leHRfc3VyZmFjZV9jb21w
cmVzc2lvbjogc3RvcCB1c2luZyBlZ2xfdXRpbHMKYWMwODYzNzQ2IGVnbF9raHJfc3VyZmFjZWxl
c3NfY29udGV4dDogcmVxdWVzdCBwcm9wZXIgc3VyZmFjZQowMDdlZjMxMWIgZ2xzbDogb25seSBj
aGVjayBsaW5lIGludGVyaW9yIGZvciBjbGlwdmVydGV4L2NsaXBkaXN0YW5jZSB0ZXN0cwoyM2E4
N2ZmODcgZ2wtMy4yLWNvbXBhdDogZml4IGxvb3AgZm9yIEdTIGdsX0NsaXBWZXJ0ZXggdGVzdAow
NGRhMDU2NDcgZXh0X3l1dl90YXJnZXQ6IGFkZCBCbGl0RnJhbWVidWZmZXIgWVVWLXJlc3RyaWN0
aW9uIHRlc3RzCjEzNmRiNzY3ZCBhcmJfdGV4dHVyZV9iYXJyaWVyOiBza2lwIGJsZW5kaW5nLWlu
LXNoYWRlciBpZiB0b28gZmV3IGNvbG9yIGF0dGFjaG1lbnRzCjBiMWViZGViNyBhcmJfdHJhbnNm
b3JtX2ZlZWRiYWNrMi9kcmF3LWF1dG86IHRlc3QgYSBub24temVybyBidWZmZXIgb2Zmc2V0CjZj
ZDJhNzYxNyB2dWxrYW46IFJlbmFtZSBjbWF0LXVuaWZvcm0tY3RvciB0ZXN0IHRvIC52a19zaGFk
ZXJfdGVzdAphODQ2MTRiOWMgZWdsLXRlcm1pbmF0ZS10aGVuLXVuYmluZC1jb250ZXh0OiBhbGxv
dyBjb25maWcgd2l0aCBhbnkgc3VyZmFjZQplN2M2OTMzODEgYXJiX3NoYWRlcl9zdG9yYWdlX2J1
ZmZlcl9vYmplY3Q6IGNvbnZlcnQgYXRvbWljTWluLXN3aXp6bGUKOGUyOGViNDI5IGNtYWtlOiBz
ZXJpYWxpemUgdnVsa2FuLnhtbCBhZnRlciBnZW5lcmF0aW5nIFZ1bGthbiB0ZXN0cwowMjFkMzk4
ZDcgYXJiX3RleHR1cmVfYmFycmllcjogcGFzcyByZWFsIHZlcnRleCBpbmRleCBib3VuZHMgdG8g
Z2xEcmF3UmFuZ2VFbGVtZW50cwphOGI2OTZiMjQgb3BlbmdsLnB5OiByZWdpc3RlciBleHRfeXV2
X3RhcmdldCBjb21waWxlZCB0ZXN0cwoxNTIxZTlhNWIgdGVzdHMvZXh0X2ZyYW1lX2J1ZmZlcl9t
dWx0aXNhbXBsZTogYWRkIG1lc3NhZ2Ugd2hlbiB0ZXN0cyBpcyBza2lwcGVkIGR1ZSBzYW1wbGVz
ID4gbWF4X3NhbXBsZXMKMzcyNTkwZDM5IGdzLW91dHB1dC1hcnJheS12ZWM0LWluZGV4LXdyOiBB
dm9pZCBleGNlZWRpbmcgR1Mgb3V0cHV0IGxpbWl0cy4KNDg1OTc4NjljIGV4dF9leHRlcm5hbF9v
YmplY3RzOiBza2lwIFZ1bGthbiB0aW1lbGluZSB3YWl0IHdpdGhvdXQgR0wgdGltZWxpbmUgc3Vw
cG9ydApjMTI1MDI5NDkgZ2VuZXJhbDogdGVzdCByZW5kZXJpbmcgd2l0aCBhIG1heGltdW0tc2l6
ZWQgdmlld3BvcnQKYTcwNWQ2NzRkIGV4dF9pbWFnZV9kbWFfYnVmX2ltcG9ydDogYWRkIE5WMTIg
ZHVhbC1mZCB2cyBzaW5nbGUtZmQgc2FtcGxlIHRlc3QKNmY0ZDI1ZTNiIGdsc2w6IGVuYWJsZSBQ
Uk9HUkFNX1RXT19TSURFIGluIGdsc2wtcGFja2VkLWJhY2stY29sb3IKMjIxNmU0MzhmIGFyYl90
ZXh0dXJlX3ZpZXc6IHVzZSBHTCAzLjAgZnVuY3Rpb25zCjEwNzgyNTkwNSB2dWxrYW46IEFkZCB0
ZXN0IGZvciBkaXZlcmdlbnQgR1MgY3V0IGJpdHMKMDYxNjkwMjFmIGV4dF95dXZfdGFyZ2V0OiBy
ZXF1aXJlIEdMX0VYVF9ZVVZfdGFyZ2V0IGZvciBzaGFkZXJfcnVubmVyIHRlc3RzCjY1ZjQ0OTQ4
YiBmcy11aW50LXRvLWZsb2F0LW9mLWV4dHJhY3QtaW50KjogQWxzbyBzdXBwb3J0IHRoZSBhbHRl
cm5hdGl2ZSByb3VuZGluZy4KMmJhMjFkZjRiICotcGFja0hhbGYyeDE2LnNoYWRlcl90ZXN0OiBB
bGxvdyB2YWx1ZXMgdG8gcm91bmQgdG8gemVyby4KMjUwY2IwY2U2ICotcGFja0hhbGYyeDE2LnNo
YWRlcl90ZXN0OiBBbGxvdyBzdWJub3JtYWxzIHRvIGZsdXNoIHRvIHplcm8uCjZjZjQ4Y2Y4ZSBn
bHg6IGZpeCB2aXN1YWwgdGVzdCByZXNvdXJjZSB0ZWFyZG93biBvcmRlcgphYjExM2M0ZjEgZ2x4
LW11bHRpdGhyZWFkLWNsZWFyYnVmZmVyOiBzeW5jaHJvbml6ZSB2ZXJzaW9uIGNoZWNrCjdjZDJh
YTIxMyBnbC0xLjA6IHRlc3QgZml4ZWQtZnVuY3Rpb24gZm9nIG9uIGEgZmxvb3Igc3RyYWRkbGlu
ZyB0aGUgZXllCmZlZThiODRhYSBhcmJfZnJhbWVidWZmZXJfb2JqZWN0OiBhZGQgdGVzdCBmb3Ig
b2Jsb25nIGJsaXRzCmNhZTM0YjE1MSBleHRfeXV2X3RhcmdldDogYWRkIE5WMTIgc2FtcGxpbmcg
YW5kIHJlbmRlcmluZyBleGVjdXRpb24gdGVzdHMKMmY0ODAyNDBkIFRlc3RzIGZvciBHTF9FWFRf
WVVWX3RhcmdldCBhbmQgRUdMX0VYVF9ZVVZfc3VyZmFjZQpjYmJiOGYxODMgZXh0X3RleHR1cmVf
c3RvcmFnZTogdGVzdCBHTEVTMiBOUE9UIGxldmVsIHJlc3RyaWN0aW9ucwoxMTAxMDI3MDEgZXh0
X3RleHR1cmVfc3RvcmFnZTogZmFjdG9yIHN0b3JhZ2UgY2hlY2tzIGludG8gYSBoZWxwZXIKN2Ix
MzM1NzM4IGV4dF90ZXh0dXJlX3N0b3JhZ2U6IHJlZ2lzdGVyIGZvcm1hdHMgdGVzdCBpbiB0aGUg
R1BVIHByb2ZpbGUKZTQxZjU3NjMzIHMzdGMtZXJyb3JzOiB0ZXN0IGxldmVsLXplcm8gTlBPVCBp
bWFnZXMgb24gR0xFUzIKYmY1ZDFjYmRjIGdlbmVyYXRlZF90ZXN0czogZml4IGluY29tcGF0aWJs
ZSBwb2ludGVyIHR5cGVzIGluIGdsb2JhbCBhZGRyZXNzIHNwYWNlIENMIGtlcm5lbHMKZmExOTUz
NTQ2IGdsc2wtMS41MDogdGVzdCBnbF9QcmltaXRpdmVJRCB0b2dldGhlciB3aXRoIGEgdXNlciB2
YXJ5aW5nIGFuZCBubyBHUwo5NzcxZjNlOTIgY2wvYXBpOiBhZGFwdCBzZXQta2VybmVsLWFyZyB0
ZXN0IGZvciBPcGVuQ0wgMy4xIHBsYXRmb3JtCmM2NTk3MjI4MSBjbC9hcGk6IHNraXAgQ0xfUVVF
VUVfU0laRSBxdWVyeSBvbiBob3N0IGNvbW1hbmQtcXVldWVzCmQ2OTBhNjFhMCBjbC9hcGk6IGZp
eCBDTF9ERVZJQ0VfTUEKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBj
aGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1l
bnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5vLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2ggfCAgNCArLQogLi4uc3RzLXVzZS11bnNpZ25lZC1pbnQtaW5zdGVhZC1v
Zi11aW50LnBhdGNoIHwgMjcgLS0tLS0tLS0tLQogLi4uYWtlLWVnbF9leHRfc3VyZmFjZV9jb21w
cmVzc2lvbi1jb25kLnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uci5weS1tb2Rp
ZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoIHwgIDIgKy0KIC4uLnByb3Blci1XQVlM
QU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaCB8ICAyICstCiAuLi50LXNoYWRlci5jLWRv
LW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiICAgIHwgIDQgKy0KIDcgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA4NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXBpeGVsLWxvY2FsLXRlc3RzLXVzZS11
bnNpZ25lZC1pbnQtaW5zdGVhZC1vZi11aW50LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtl
LWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1u
b3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdh
eWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IDQ2ZTVhNmQ4M2YuLjVhZThkNGE0OTkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01h
a2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMu
dHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGFiY2NjMTc4MTlhZDIwOGMwZGYzZWRiYzhiYmNkMTM0ZTQ1ODY0ZjkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFiM2QwNzQxMDQ0Yzc4MjczMWQyMmQ3ZmVkN2U5
MmVmNDA5YmI5NjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0
NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZG8gbm90IG9idGFpbiB3
YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0
cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOTVmNDBlYmZlLi40YzdkYTA3YjQgMTAwNjQ0
CitpbmRleCAxYTM4YzIxZjkuLjQ1YzE4MWU4NSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0
CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwxMSArMjExLDcgQEAgaWYoUElHTElUX1VT
RV9XQVlMQU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS1waXhlbC1sb2NhbC10ZXN0cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWlu
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtcGl4ZWwt
bG9jYWwtdGVzdHMtdXNlLXVuc2lnbmVkLWludC1pbnN0ZWFkLW9mLXVpbnQucGF0Y2gKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDJjMDFmZTcwMjkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1waXhlbC1sb2NhbC10ZXN0cy11
c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWludC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDI3ICswLDAgQEAKLUZyb20gOGI5ODY3NGZlZGMwYWMzMWU3NjhjY2QxNjE2NWJjYjU4NWU0MTNl
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBUaHUsIDIgSnVsIDIwMjYgMTM6NTY6MTcgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSF0gcGl4ZWwtbG9jYWwtdGVzdHM6IHVzZSB1bnNpZ25lZCBpbnQgaW5zdGVh
ZCBvZiB1aW50Ci0KLXVpbnQgaXMgbm90IGEgdmFsaWQgaW50ZWdlciB0eXBlIGluIEMsIGFuZCB0
aGlzIGZhaWxzCi10byBjb21waWxlIHVuZGVyIG11c2wgbGliYyBsaWJyYXJ5LgotCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
cGlnbGl0Ly0vbWVyZ2VfcmVxdWVzdHMvMTE3MF0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSB0ZXN0cy9zcGVjL2V4dF9zaGFkZXJf
cGl4ZWxfbG9jYWxfc3RvcmFnZS9waXhlbC1sb2NhbC10ZXN0cy5jIHwgMiArLQotIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvdGVz
dHMvc3BlYy9leHRfc2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9jYWwtdGVzdHMu
YyBiL3Rlc3RzL3NwZWMvZXh0X3NoYWRlcl9waXhlbF9sb2NhbF9zdG9yYWdlL3BpeGVsLWxvY2Fs
LXRlc3RzLmMKLWluZGV4IDQ3NzYxOTNmMi4uMWFjNjY5ZDExIDEwMDY0NAotLS0tIGEvdGVzdHMv
c3BlYy9leHRfc2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9jYWwtdGVzdHMuYwot
KysrIGIvdGVzdHMvc3BlYy9leHRfc2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9j
YWwtdGVzdHMuYwotQEAgLTg1MSw3ICs4NTEsNyBAQCBtYWtlX3Rlc3RfbWFpbl9zdHIoY2hhciAq
ZHN0LCBzdHJ1Y3QgcGxzX2Zvcm1hdF9kYXRhICpmb3JtYXRfZGF0YSwKLSAJCWNhc2UgR0xfUkdC
QThVSToKLSAJCWNhc2UgR0xfUkcxNlVJOgotIAkJY2FzZSBHTF9SMzJVSTogewotLQkJCXVpbnQg
ZXhwZWN0ZWRbNF07Ci0rCQkJdW5zaWduZWQgaW50IGV4cGVjdGVkWzRdOwotIAkJCWZvciAoaW50
IGNvbXAgPSAwOyBjb21wIDwgNDsgY29tcCsrKSB7Ci0gCQkJCWlmIChjb21wIDwgZm9ybWF0X2Rh
dGFbbWVtYmVyXS5udW1fY29tcG9uZW50cykKLSAJCQkJCWV4cGVjdGVkW2NvbXBdID0gZm9ybWF0
X2RhdGFbbWVtYmVyXS51W2NvbXBdOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9j
b21wcmVzc2lvbi1jb25kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1j
b25kLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjNzFiZjRjOGJjLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVz
dHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDUyICswLDAgQEAKLUZyb20gM2U3ZWMxNjVjNzE4MjM0ZTFhZmNk
ZjczMGJkZjIwOTQyOTc2ZTI1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBGcmksIDIyIE5vdiAyMDI0
IDIyOjUyOjMxICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtlIGVn
bF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbiBjb25kaXRpb25hbAotIHRvIFgxMQotCi1PdGhlcndp
c2UsIHRoaXMgZXJyb3Igb2NjdXJzOgotfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Nydi9zdG9y
YWdlL2FsZXgveW9jdG8vYnVpbGQtNjQvd29ya3NwYWNlL3NvdXJjZXMvcGlnbGl0L3Rlc3RzL2Vn
bC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9jcmVhdGVfc3VyZmFjZS5jOjI4Ogot
fCAvc3J2L3N0b3JhZ2UvYWxleC95b2N0by9idWlsZC02NC93b3Jrc3BhY2Uvc291cmNlcy9waWds
aXQvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLy4uLy4uL2VnbC11
dGlsLmg6MTI6MTA6IGZhdGFsIGVycm9yOiBYMTEvWGxpYi5oOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Ci18ICAgIDEyIHwgI2luY2x1ZGUgPFgxMS9YbGliLmg+Ci18ICAgICAgIHwgICAgICAg
ICAgXn5+fn5+fn5+fn5+Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQvLS9tZXJnZV9yZXF1ZXN0cy85NzRdCi1D
by1kZXZlbG9wZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJv
Lm9yZz4KLVNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZA
bGluYXJvLm9yZz4KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+Ci0tLS0KLSAuLi4vc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24vQ01h
a2VMaXN0cy5nbGVzMy50eHQgICB8IDYgKysrKy0tCi0gdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9z
dXJmYWNlX2NvbXByZXNzaW9uL2NyZWF0ZV9zdXJmYWNlLmMgfCAxIC0KLSAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3Rlc3Rz
L2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9DTWFrZUxpc3RzLmdsZXMzLnR4
dCBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9DTWFrZUxpc3Rz
LmdsZXMzLnR4dAotaW5kZXggZDk1NDBiY2ZkLi4wMWE3MDE2NGYgMTAwNjQ0Ci0tLS0gYS90ZXN0
cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24vQ01ha2VMaXN0cy5nbGVzMy50
eHQKLSsrKyBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9DTWFr
ZUxpc3RzLmdsZXMzLnR4dAotQEAgLTIsMTAgKzIsMTIgQEAgbGlua19saWJyYXJpZXMoCi0gCXBp
Z2xpdHV0aWxfJHtwaWdsaXRfdGFyZ2V0X2FwaX0KLSApCi0gCi0tcGlnbGl0X2FkZF9leGVjdXRh
YmxlKGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jcmVhdGUgLi4vLi4vZWdsLXV0aWwuYwot
K2lmIChQSUdMSVRfSEFTX1dBWUxBTkQpCi0rcGlnbGl0X2FkZF9leGVjdXRhYmxlKGVnbF9leHRf
c3VyZmFjZV9jb21wcmVzc2lvbi1jcmVhdGUKLSAJLi4vLi4vZWdsLXdheWxhbmQuYyBjcmVhdGVf
c3VyZmFjZS5jKQotK2VuZGlmIChQSUdMSVRfSEFTX1dBWUxBTkQpCi0gCi0tcGlnbGl0X2FkZF9l
eGVjdXRhYmxlKGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1pbWFnZSAuLi8uLi9lZ2wtdXRp
bC5jCi0rcGlnbGl0X2FkZF9leGVjdXRhYmxlKGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1p
bWFnZQotIAlpbWFnZV9zdG9yYWdlLmMpCi0gCi0gIyB2aW06IGZ0PWNtYWtlOgotZGlmZiAtLWdp
dCBhL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9jcmVhdGVfc3Vy
ZmFjZS5jIGIvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uL2NyZWF0
ZV9zdXJmYWNlLmMKLWluZGV4IDcxYjA0M2I1NC4uMDllODdkZWU0IDEwMDY0NAotLS0tIGEvdGVz
dHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uL2NyZWF0ZV9zdXJmYWNlLmMK
LSsrKyBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9jcmVhdGVf
c3VyZmFjZS5jCi1AQCAtMjUsNyArMjUsNiBAQAotICNpbmNsdWRlICJwaWdsaXQtdXRpbC5oIgot
ICNpbmNsdWRlICJwaWdsaXQtdXRpbC1lZ2wuaCIKLSAjaW5jbHVkZSAicGlnbGl0LXV0aWwtZ2wu
aCIKLS0jaW5jbHVkZSAiLi4vLi4vZWdsLXV0aWwuaCIKLSAjaW5jbHVkZSAiLi4vLi4vZWdsLXdh
eWxhbmQuaCIKLSAKLSBzdGF0aWMgZW51bSBwaWdsaXRfcmVzdWx0CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1v
ZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1h
bmQtbm90LWNvbW1hbmQucGF0Y2gKaW5kZXggMDM1ZTdhNGQ1YS4uZWUzOWQ2ZGY1YSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1ub19l
cnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3IucHktbW9k
aWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MTRlNTZhNjMzNmYzNmQxMTEyOTY0Y2UxZmYwOTAwZWE0YjM3YjQ4MyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZjRkZTgwYmU2ZWQ5OWJiYWRlNzMyODFjMGNhYzk5YmFjN2Y1ZTJlYiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiBEYXRlOiBUaHUsIDIyIE1heSAyMDI1IDE3OjM0OjE1ICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL25vX2Vycm9yLnB5OiBtb2RpZnkgX2NvbW1hbmQgYW5kIG5vdCBj
b21tYW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9w
ZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5kZXggMzI5ZmQ3NTk3NS4u
NzAxYzcwNzZhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2Ut
dXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNDQ0NGRkNzQ4YjkzMjQ1MDhlMzE2OGY2NGNmMGI1YWRjMzFiNWViZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTAyZTk1YTRjMzEwM2E4MjIzZGM4OWI2ZGJhZDM3
NDdlNjQxZjIwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhc2NhbCBCYWNoIDxw
YXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3QgMjAxOCAxNDo0MzoxNyAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBXQVlMQU5EX0lOQ0xVREVf
RElSUyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVp
bGQtcGF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10
ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNo
CmluZGV4IDljMDVlNjM5YjMuLjJmNTNhYmY0MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8t
bm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJk
Y29kZS1idWlsZC1wYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5YmZkYjhkMzJjMjEx
M2MzOWMzYmUxYmQ2ZmQwOTM0ZjY5M2FiMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGQxMDY2M2IzNGNlODYwNmI4MmJjMTUzNjM4YTJmODliZGEzMmQ0YzAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTc6MTM6NTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJkY29kZSBidWlsZCBwYXRo
IGludG8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dp
dC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgppbmRleCBh
MzIwMzQ2NGQxLi5jZDFhZTVkNmQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXRfZ2l0LmJiCkBAIC0xMCwxMyArMTAsMTEgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWEK
ICAgICAgICAgICAgZmlsZTovLzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVf
RElSUy12YXJpYWJsZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXRlc3RzLXV0aWwt
cGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nh
bm5lci1wYXRoLWZyLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtZWdsLXNw
ZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90
LWNvbW1hbmQucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1waXhlbC1sb2NhbC10ZXN0
cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWludC5wYXRjaCBcCiAgICAgICAgICAgICIK
IFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAotU1JDUkVWID0gIjU2ZjIzN2JlMzJlZDY2
ODIwZWIwNWVhM2NiMDRjYjhiOTU3Y2NkOGQiCitTUkNSRVYgPSAiNDk1MGJhYmZkMmNkNDQwOGU0
YmZkMTAzZDkzNWM2ZTVjZmY1M2QyMCIKICMgKHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3Zl
IHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4wK2dpdHIiCiAKLS0gCjIuNDcuMQoK

--===============3531055209321891870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="piglit-changelog.txt"

Changelog for piglit: 1.0+gitr -> 1.0+gitr

4950babfd khr_texture_compression_astc: check for full NPOT support
81f9eac8c cl/api: initialize 'vec3' and 's_arg' in clSetKernelArg test
fa4992cbe tests/egl_ext_surface_compression: make create test wayland-only
4d23b8c62 tests/egl_ext_surface_compression: stop using egl_utils
ac0863746 egl_khr_surfaceless_context: request proper surface
007ef311b glsl: only check line interior for clipvertex/clipdistance tests
23a87ff87 gl-3.2-compat: fix loop for GS gl_ClipVertex test
04da05647 ext_yuv_target: add BlitFramebuffer YUV-restriction tests
136db767d arb_texture_barrier: skip blending-in-shader if too few color attachments
0b1ebdeb7 arb_transform_feedback2/draw-auto: test a non-zero buffer offset
6cd2a7617 vulkan: Rename cmat-uniform-ctor test to .vk_shader_test
a84614b9c egl-terminate-then-unbind-context: allow config with any surface
e7c693381 arb_shader_storage_buffer_object: convert atomicMin-swizzle
8e28eb429 cmake: serialize vulkan.xml after generating Vulkan tests
021d398d7 arb_texture_barrier: pass real vertex index bounds to glDrawRangeElements
a8b696b24 opengl.py: register ext_yuv_target compiled tests
1521e9a5b tests/ext_frame_buffer_multisample: add message when tests is skipped due samples > max_samples
372590d39 gs-output-array-vec4-index-wr: Avoid exceeding GS output limits.
48597869c ext_external_objects: skip Vulkan timeline wait without GL timeline support
c12502949 general: test rendering with a maximum-sized viewport
a705d674d ext_image_dma_buf_import: add NV12 dual-fd vs single-fd sample test
6f4d25e3b glsl: enable PROGRAM_TWO_SIDE in glsl-packed-back-color
2216e438f arb_texture_view: use GL 3.0 functions
107825905 vulkan: Add test for divergent GS cut bits
06169021f ext_yuv_target: require GL_EXT_YUV_target for shader_runner tests
65f44948b fs-uint-to-float-of-extract-int*: Also support the alternative rounding.
2ba21df4b *-packHalf2x16.shader_test: Allow values to round to zero.
250cb0ce6 *-packHalf2x16.shader_test: Allow subnormals to flush to zero.
6cf48cf8e glx: fix visual test resource teardown order
ab113c4f1 glx-multithread-clearbuffer: synchronize version check
7cd2aa213 gl-1.0: test fixed-function fog on a floor straddling the eye
fee8b84aa arb_framebuffer_object: add test for oblong blits
cae34b151 ext_yuv_target: add NV12 sampling and rendering execution tests
2f480240d Tests for GL_EXT_YUV_target and EGL_EXT_YUV_surface
cbbb8f183 ext_texture_storage: test GLES2 NPOT level restrictions
110102701 ext_texture_storage: factor storage checks into a helper
7b1335738 ext_texture_storage: register formats test in the GPU profile
e41f57633 s3tc-errors: test level-zero NPOT images on GLES2
bf5d1cbdc generated_tests: fix incompatible pointer types in global address space CL kernels
fa1953546 glsl-1.50: test gl_PrimitiveID together with a user varying and no GS
9771f3e92 cl/api: adapt set-kernel-arg test for OpenCL 3.1 platform
c65972281 cl/api: skip CL_QUEUE_SIZE query on host command-queues
d690a61a0 cl/api: fix CL_DEVICE_MAX_MEM_ALLOC_SIZE minimum value check
e5c87380a cl/api: downgrade CL_KERNEL_ARG_INFO_NOT_AVAILABLE check from fail to warn
08ac49ecc glsl-1.10: test functions called only from global variable initializers
74fa6fb44 vulkan: Add test for cmat with non-constant uniform initializer
f5d95dbfe Add test for GL_POINT_SMOOTH
ee1b1e6fa gl-2.1/pbo: Allow subtest selection.
4fc59b500 gl-2.1/pbo: Add missing present_results.
7abe0a22d gl-2.1/pbo: Correct the location of bitmap/drawpixels's present_results().
b613ff666 piglit: Use the subtest name when the subtest option is NULL.
c92f1a6e8 ext_framebuffer_multisample/accuracy: widen full-pixel error threshold
a853ae0a8 ext_framebuffer_multisample/accuracy: accept sRGB-space MSAA resolve
9a0eab5e1 pixel-local-tests: use unsigned int instead of uint
6ae53fc12 glsl-fs-loop-unroll-mul-fp64.shader_test: Remove invalid equality tests.
7ad0f92c3 util/piglit_ktx: fix format specifier mismatch in error message
f505280a3 egl_khr_gl_image: fix memleak by terminating the context properly
29af1e16d waffle: fix leaking the EGL/DRI2 display when tests are skipped
48eb7c782 cl/program/build: fix double types to require cl_khr_fp64 or __opencl_c_fp64
d6234f3e4 ext_image_dma_buf_import: fix memleaks in case of failures
b079b2a58 glx: destroy resources properly to fix memleaks
547422968 Disable strict-aliasing analysis.
5e608d80c gl-3.2/layered-rendering: fix a memleak
8227c2795 arb_compute_shader: fix a memleak
97ab5eaf0 arb_pipeline_statistics_query: fix a memleak
64176e7bc ext_direct_state_access: fix memleaks
6d99a37fa arb_shader_storage_buffer: fix a memleak
4048186f9 arb_vertex_attrib_64bit: fix a memleak
2e61de997 shaders: fix a memleak in glsl-fs-fogscale.c
17351332f arb_gpu_shader5: fix a memleak
5f20df614 arb_viewport_array: fix a memleak
05b036f98 ext_transform_feedback: fix a memleak
0e21e79cb arb_compute_variable_group_size: fix a memleak
ddd7a9537 AMD_pinned_memory: fix a memleak
f02981b3e gl-2.0: fix a memleak with GS shaders in vertex-program-two-side
c4da96345 shader_draw_parameters: fix memleaks with shaders
a2624e664 tests/cl: add required optional int64 feature
25e68c2a7 cl: check for optional features required by tests
14d18f6a8 ext_image_dma_buf_import/transcode-nv12-as-r8-gr88: fix null checks in create_textures
e8ec6eaff llvmpipe/randomshader: use std::unique_ptr for mProgram
d3863e949 glsl-1.10: test shadow2D() across two consecutive draws
e06969f81 egl-configless-context: zero-init 'state' in main

--===============3531055209321891870==--

