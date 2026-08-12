Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17FDC5DF61
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:00:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1783.1786514407900377535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D2KoPwSh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=acdr16QJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ff48e8ec7-4f926c15-1867-4bbb-9a82-bf35855d4a66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786514411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PjC4UMjvhU1R3XUkuqMbtxQ55OGttmlgNheKgE7YcQI=;
	b=D2KoPwSh0BnVlVoLQFaRtMi8GnjVbz+EtKezfQaHkuwOz3zTawSPN08npOmTL2WM
	Y3X0vymwi1411KtJhjPWERv33Z3cSQ+gIuTKN0BTw9v7Wlc1tKisiO7yCryWRMxz4nm
	lQvY1/sHYUtf5BimlbpHtW7+zcsayzYRi4TuCSsg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786514411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PjC4UMjvhU1R3XUkuqMbtxQ55OGttmlgNheKgE7YcQI=;
	b=acdr16QJmxtX9Jdc0YyF40YTpufy/JweHbhsL5YGSJr3TEyOPsYm2TYlguhus53j
	FPyW0JauqpwOarxaIi1DV4b9fd0cDRqael1+ozsKY3mQ+FDfsCrh3wruIO8fVayMk6Z
	3CZJtH8pMaot3kMl6toskxFWoPRWwje5FFL9sWek=
Content-Type: multipart/mixed; boundary="===============8127422949386350014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 107825905508141a0ab8232129abba6489560f02
 FAILED
Message-ID: <0101019ff48e8ec7-4f926c15-1867-4bbb-9a82-bf35855d4a66-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 06:00:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243241

--===============8127422949386350014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *107825905508141a0ab8232129abba6489560f02* has Failed(do_compile).

Detailed error information:

do_compile failed



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
From 29abc8ab75847d5e69ae8b36a66601eb3f959765 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 12 Aug 2026 05:48:00 +0000
Subject: [PATCH] piglit: upgrade to latest revision

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
4048186f9 arb_vertex_attrib_64bit: fix a meml

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  4 +--
 ...sts-use-unsigned-int-instead-of-uint.patch | 27 -------------------
 ...ake-egl_ext_surface_compression-cond.patch |  2 +-
 ...r.py-modify-_command-and-not-command.patch |  2 +-
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  2 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +--
 7 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 46e5a6d83f..96d6139cab 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From abccc17819ad208c0df3edbc8bbcd134e45864f9 Mon Sep 17 00:00:00 2001
+From 8ab86725532705cc78b55744618fd5c9e2564f35 Mon Sep 17 00:00:00 2001
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
index c71bf4c8bc..8e923b8352 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 3e7ec165c718234e1afcdf730bdf20942976e25c Mon Sep 17 00:00:00 2001
+From 7fe67df8aa752fb3fa97c89de96da754c2399ea1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index 035e7a4d5a..379c07f349 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 14e56a6336f36d1112964ce1ff0900ea4b37b483 Mon Sep 17 00:00:00 2001
+From 4de8588dd96b498cc01f87e7eaa964aea4e12726 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 329fd75975..3c97353870 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 4444dd748b9324508e3168f64cf0b5adc31b5ebd Mon Sep 17 00:00:00 2001
+From 76b67beb9f00f5ae4cc12995d73f761faccea1aa Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 9c05e639b3..1d67f1533a 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From f9bfdb8d32c2113c39c3be1bd6fd0934f693ab03 Mon Sep 17 00:00:00 2001
+From e45b3d8d06263900f25b040760d0afd1f480acd3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a3203464d1..6bc959fc8a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -12,11 +12,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
-           file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "56f237be32ed66820eb05ea3cb04cb8b957ccd8d"
+SRCREV = "107825905508141a0ab8232129abba6489560f02"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============8127422949386350014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/compare-fail.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call-2-shaders.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/depth-write-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-unop-fail.frag /usr/lib/piglit/tests/vulkan/shaders/gs-divergent-cut-bits.vk_shader_test /usr/lib/piglit/tests/vulkan/shaders/cmat-uniform-ctor.shader_test /usr/lib/piglit/bin/framebuffer-blit-oblong /usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/execution/yuv_2_rgb.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/execution/rgb_2_yuv.shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-sample-y2y /usr/lib/piglit/bin/ext_yuv_target-nv12-ren
 der-yuv /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/output-layout-fail.frag /usr/lib/piglit/bin/ext_yuv_target-simple /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/ctor-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/input-layout-fail.frag /usr/lib/piglit/bin/gl-1.0-fog-linear-floor /usr/lib/piglit/bin/gl-2.1-point_smooth /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-binop-fail.frag /usr/lib/piglit/tests/spec/glsl-1.50/execution/primitive-id-no-gs-varying.shader_test"

--===============8127422949386350014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="piglit-changelog.txt"

Changelog for piglit: 1.0+gitr -> 1.0+gitr

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

--===============8127422949386350014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAyOWFiYzhhYjc1ODQ3ZDVlNjlhZThiMzZhNjY2MDFlYjNmOTU5NzY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTIgQXVnIDIwMjYgMDU6NDg6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgoxMDc4MjU5MDUgdnVsa2FuOiBBZGQg
dGVzdCBmb3IgZGl2ZXJnZW50IEdTIGN1dCBiaXRzCjA2MTY5MDIxZiBleHRfeXV2X3RhcmdldDog
cmVxdWlyZSBHTF9FWFRfWVVWX3RhcmdldCBmb3Igc2hhZGVyX3J1bm5lciB0ZXN0cwo2NWY0NDk0
OGIgZnMtdWludC10by1mbG9hdC1vZi1leHRyYWN0LWludCo6IEFsc28gc3VwcG9ydCB0aGUgYWx0
ZXJuYXRpdmUgcm91bmRpbmcuCjJiYTIxZGY0YiAqLXBhY2tIYWxmMngxNi5zaGFkZXJfdGVzdDog
QWxsb3cgdmFsdWVzIHRvIHJvdW5kIHRvIHplcm8uCjI1MGNiMGNlNiAqLXBhY2tIYWxmMngxNi5z
aGFkZXJfdGVzdDogQWxsb3cgc3Vibm9ybWFscyB0byBmbHVzaCB0byB6ZXJvLgo2Y2Y0OGNmOGUg
Z2x4OiBmaXggdmlzdWFsIHRlc3QgcmVzb3VyY2UgdGVhcmRvd24gb3JkZXIKYWIxMTNjNGYxIGds
eC1tdWx0aXRocmVhZC1jbGVhcmJ1ZmZlcjogc3luY2hyb25pemUgdmVyc2lvbiBjaGVjawo3Y2Qy
YWEyMTMgZ2wtMS4wOiB0ZXN0IGZpeGVkLWZ1bmN0aW9uIGZvZyBvbiBhIGZsb29yIHN0cmFkZGxp
bmcgdGhlIGV5ZQpmZWU4Yjg0YWEgYXJiX2ZyYW1lYnVmZmVyX29iamVjdDogYWRkIHRlc3QgZm9y
IG9ibG9uZyBibGl0cwpjYWUzNGIxNTEgZXh0X3l1dl90YXJnZXQ6IGFkZCBOVjEyIHNhbXBsaW5n
IGFuZCByZW5kZXJpbmcgZXhlY3V0aW9uIHRlc3RzCjJmNDgwMjQwZCBUZXN0cyBmb3IgR0xfRVhU
X1lVVl90YXJnZXQgYW5kIEVHTF9FWFRfWVVWX3N1cmZhY2UKY2JiYjhmMTgzIGV4dF90ZXh0dXJl
X3N0b3JhZ2U6IHRlc3QgR0xFUzIgTlBPVCBsZXZlbCByZXN0cmljdGlvbnMKMTEwMTAyNzAxIGV4
dF90ZXh0dXJlX3N0b3JhZ2U6IGZhY3RvciBzdG9yYWdlIGNoZWNrcyBpbnRvIGEgaGVscGVyCjdi
MTMzNTczOCBleHRfdGV4dHVyZV9zdG9yYWdlOiByZWdpc3RlciBmb3JtYXRzIHRlc3QgaW4gdGhl
IEdQVSBwcm9maWxlCmU0MWY1NzYzMyBzM3RjLWVycm9yczogdGVzdCBsZXZlbC16ZXJvIE5QT1Qg
aW1hZ2VzIG9uIEdMRVMyCmJmNWQxY2JkYyBnZW5lcmF0ZWRfdGVzdHM6IGZpeCBpbmNvbXBhdGli
bGUgcG9pbnRlciB0eXBlcyBpbiBnbG9iYWwgYWRkcmVzcyBzcGFjZSBDTCBrZXJuZWxzCmZhMTk1
MzU0NiBnbHNsLTEuNTA6IHRlc3QgZ2xfUHJpbWl0aXZlSUQgdG9nZXRoZXIgd2l0aCBhIHVzZXIg
dmFyeWluZyBhbmQgbm8gR1MKOTc3MWYzZTkyIGNsL2FwaTogYWRhcHQgc2V0LWtlcm5lbC1hcmcg
dGVzdCBmb3IgT3BlbkNMIDMuMSBwbGF0Zm9ybQpjNjU5NzIyODEgY2wvYXBpOiBza2lwIENMX1FV
RVVFX1NJWkUgcXVlcnkgb24gaG9zdCBjb21tYW5kLXF1ZXVlcwpkNjkwYTYxYTAgY2wvYXBpOiBm
aXggQ0xfREVWSUNFX01BWF9NRU1fQUxMT0NfU0laRSBtaW5pbXVtIHZhbHVlIGNoZWNrCmU1Yzg3
MzgwYSBjbC9hcGk6IGRvd25ncmFkZSBDTF9LRVJORUxfQVJHX0lORk9fTk9UX0FWQUlMQUJMRSBj
aGVjayBmcm9tIGZhaWwgdG8gd2FybgowOGFjNDllY2MgZ2xzbC0xLjEwOiB0ZXN0IGZ1bmN0aW9u
cyBjYWxsZWQgb25seSBmcm9tIGdsb2JhbCB2YXJpYWJsZSBpbml0aWFsaXplcnMKNzRmYTZmYjQ0
IHZ1bGthbjogQWRkIHRlc3QgZm9yIGNtYXQgd2l0aCBub24tY29uc3RhbnQgdW5pZm9ybSBpbml0
aWFsaXplcgpmNWQ5NWRiZmUgQWRkIHRlc3QgZm9yIEdMX1BPSU5UX1NNT09USAplZTFiMWU2ZmEg
Z2wtMi4xL3BibzogQWxsb3cgc3VidGVzdCBzZWxlY3Rpb24uCjRmYzU5YjUwMCBnbC0yLjEvcGJv
OiBBZGQgbWlzc2luZyBwcmVzZW50X3Jlc3VsdHMuCjdhYmUwYTIyZCBnbC0yLjEvcGJvOiBDb3Jy
ZWN0IHRoZSBsb2NhdGlvbiBvZiBiaXRtYXAvZHJhd3BpeGVscydzIHByZXNlbnRfcmVzdWx0cygp
LgpiNjEzZmY2NjYgcGlnbGl0OiBVc2UgdGhlIHN1YnRlc3QgbmFtZSB3aGVuIHRoZSBzdWJ0ZXN0
IG9wdGlvbiBpcyBOVUxMLgpjOTJmMWE2ZTggZXh0X2ZyYW1lYnVmZmVyX211bHRpc2FtcGxlL2Fj
Y3VyYWN5OiB3aWRlbiBmdWxsLXBpeGVsIGVycm9yIHRocmVzaG9sZAphODUzYWUwYTggZXh0X2Zy
YW1lYnVmZmVyX211bHRpc2FtcGxlL2FjY3VyYWN5OiBhY2NlcHQgc1JHQi1zcGFjZSBNU0FBIHJl
c29sdmUKOWEwZWFiNWUxIHBpeGVsLWxvY2FsLXRlc3RzOiB1c2UgdW5zaWduZWQgaW50IGluc3Rl
YWQgb2YgdWludAo2YWU1M2ZjMTIgZ2xzbC1mcy1sb29wLXVucm9sbC1tdWwtZnA2NC5zaGFkZXJf
dGVzdDogUmVtb3ZlIGludmFsaWQgZXF1YWxpdHkgdGVzdHMuCjdhZDBmOTJjMyB1dGlsL3BpZ2xp
dF9rdHg6IGZpeCBmb3JtYXQgc3BlY2lmaWVyIG1pc21hdGNoIGluIGVycm9yIG1lc3NhZ2UKZjUw
NTI4MGEzIGVnbF9raHJfZ2xfaW1hZ2U6IGZpeCBtZW1sZWFrIGJ5IHRlcm1pbmF0aW5nIHRoZSBj
b250ZXh0IHByb3Blcmx5CjI5YWYxZTE2ZCB3YWZmbGU6IGZpeCBsZWFraW5nIHRoZSBFR0wvRFJJ
MiBkaXNwbGF5IHdoZW4gdGVzdHMgYXJlIHNraXBwZWQKNDhlYjdjNzgyIGNsL3Byb2dyYW0vYnVp
bGQ6IGZpeCBkb3VibGUgdHlwZXMgdG8gcmVxdWlyZSBjbF9raHJfZnA2NCBvciBfX29wZW5jbF9j
X2ZwNjQKZDYyMzRmM2U0IGV4dF9pbWFnZV9kbWFfYnVmX2ltcG9ydDogZml4IG1lbWxlYWtzIGlu
IGNhc2Ugb2YgZmFpbHVyZXMKYjA3OWIyYTU4IGdseDogZGVzdHJveSByZXNvdXJjZXMgcHJvcGVy
bHkgdG8gZml4IG1lbWxlYWtzCjU0NzQyMjk2OCBEaXNhYmxlIHN0cmljdC1hbGlhc2luZyBhbmFs
eXNpcy4KNWU2MDhkODBjIGdsLTMuMi9sYXllcmVkLXJlbmRlcmluZzogZml4IGEgbWVtbGVhawo4
MjI3YzI3OTUgYXJiX2NvbXB1dGVfc2hhZGVyOiBmaXggYSBtZW1sZWFrCjk3YWI1ZWFmMCBhcmJf
cGlwZWxpbmVfc3RhdGlzdGljc19xdWVyeTogZml4IGEgbWVtbGVhawo2NDE3NmU3YmMgZXh0X2Rp
cmVjdF9zdGF0ZV9hY2Nlc3M6IGZpeCBtZW1sZWFrcwo2ZDk5YTM3ZmEgYXJiX3NoYWRlcl9zdG9y
YWdlX2J1ZmZlcjogZml4IGEgbWVtbGVhawo0MDQ4MTg2ZjkgYXJiX3ZlcnRleF9hdHRyaWJfNjRi
aXQ6IGZpeCBhIG1lbWwKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBj
aGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1l
bnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5vLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2ggfCAgNCArLS0KIC4uLnN0cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQt
b2YtdWludC5wYXRjaCB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmFrZS1lZ2xfZXh0X3N1
cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaCB8ICAyICstCiAuLi5yLnB5LW1vZGlmeS1fY29t
bWFuZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggfCAgMiArLQogLi4ucHJvcGVyLVdBWUxBTkRfSU5D
TFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIHwgIDIgKy0KIC4uLnQtc2hhZGVyLmMtZG8tbm90LWhh
cmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCB8ICAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdF9naXQuYmIgICAgfCAgMyArLS0KIDcgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAzNSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXBpeGVsLWxvY2FsLXRlc3RzLXVzZS11bnNpZ25l
ZC1pbnQtaW5zdGVhZC1vZi11aW50LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdh
eWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5l
ci1wYXRoLWZyLnBhdGNoCmluZGV4IDQ2ZTVhNmQ4M2YuLjk2ZDYxMzljYWIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQt
ZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1v
YnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGFiY2NjMTc4MTlhZDIwOGMwZGYzZWRiYzhiYmNkMTM0ZTQ1ODY0ZjkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDhhYjg2NzI1NTMyNzA1Y2M3OGI1NTc0NDYxOGZkNWM5ZTI1NjRmMzUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5u
ZXIgcGF0aCBmcm9tCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFr
ZUxpc3RzLnR4dAotaW5kZXggOTVmNDBlYmZlLi40YzdkYTA3YjQgMTAwNjQ0CitpbmRleCAxYTM4
YzIxZjkuLjQ1YzE4MWU4NSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFr
ZUxpc3RzLnR4dAogQEAgLTIxMSwxMSArMjExLDcgQEAgaWYoUElHTElUX1VTRV9XQVlMQU5EKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1waXhl
bC1sb2NhbC10ZXN0cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWludC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtcGl4ZWwtbG9jYWwtdGVzdHMt
dXNlLXVuc2lnbmVkLWludC1pbnN0ZWFkLW9mLXVpbnQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDJjMDFmZTcwMjkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1waXhlbC1sb2NhbC10ZXN0cy11c2UtdW5zaWduZWQt
aW50LWluc3RlYWQtb2YtdWludC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDI3ICswLDAgQEAK
LUZyb20gOGI5ODY3NGZlZGMwYWMzMWU3NjhjY2QxNjE2NWJjYjU4NWU0MTNlMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXgu
ZGU+Ci1EYXRlOiBUaHUsIDIgSnVsIDIwMjYgMTM6NTY6MTcgKzAyMDAKLVN1YmplY3Q6IFtQQVRD
SF0gcGl4ZWwtbG9jYWwtdGVzdHM6IHVzZSB1bnNpZ25lZCBpbnQgaW5zdGVhZCBvZiB1aW50Ci0K
LXVpbnQgaXMgbm90IGEgdmFsaWQgaW50ZWdlciB0eXBlIGluIEMsIGFuZCB0aGlzIGZhaWxzCi10
byBjb21waWxlIHVuZGVyIG11c2wgbGliYyBsaWJyYXJ5LgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0Ly0vbWVy
Z2VfcmVxdWVzdHMvMTE3MF0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSB0ZXN0cy9zcGVjL2V4dF9zaGFkZXJfcGl4ZWxfbG9jYWxf
c3RvcmFnZS9waXhlbC1sb2NhbC10ZXN0cy5jIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvc3BlYy9leHRf
c2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9jYWwtdGVzdHMuYyBiL3Rlc3RzL3Nw
ZWMvZXh0X3NoYWRlcl9waXhlbF9sb2NhbF9zdG9yYWdlL3BpeGVsLWxvY2FsLXRlc3RzLmMKLWlu
ZGV4IDQ3NzYxOTNmMi4uMWFjNjY5ZDExIDEwMDY0NAotLS0tIGEvdGVzdHMvc3BlYy9leHRfc2hh
ZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9jYWwtdGVzdHMuYwotKysrIGIvdGVzdHMv
c3BlYy9leHRfc2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9jYWwtdGVzdHMuYwot
QEAgLTg1MSw3ICs4NTEsNyBAQCBtYWtlX3Rlc3RfbWFpbl9zdHIoY2hhciAqZHN0LCBzdHJ1Y3Qg
cGxzX2Zvcm1hdF9kYXRhICpmb3JtYXRfZGF0YSwKLSAJCWNhc2UgR0xfUkdCQThVSToKLSAJCWNh
c2UgR0xfUkcxNlVJOgotIAkJY2FzZSBHTF9SMzJVSTogewotLQkJCXVpbnQgZXhwZWN0ZWRbNF07
Ci0rCQkJdW5zaWduZWQgaW50IGV4cGVjdGVkWzRdOwotIAkJCWZvciAoaW50IGNvbXAgPSAwOyBj
b21wIDwgNDsgY29tcCsrKSB7Ci0gCQkJCWlmIChjb21wIDwgZm9ybWF0X2RhdGFbbWVtYmVyXS5u
dW1fY29tcG9uZW50cykKLSAJCQkJCWV4cGVjdGVkW2NvbXBdID0gZm9ybWF0X2RhdGFbbWVtYmVy
XS51W2NvbXBdOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1j
b25kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0
cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCmlu
ZGV4IGM3MWJmNGM4YmMuLjhlOTIzYjgzNTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZh
Y2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXBy
ZXNzaW9uLWNvbmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNlN2VjMTY1YzcxODIzNGUx
YWZjZGY3MzBiZGYyMDk0Mjk3NmUyNWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdm
ZTY3ZGY4YWE3NTJmYjNmYTk3Yzg5ZGU5NmRhNzU0YzIzOTllYTEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0
ZTogRnJpLCAyMiBOb3YgMjAyNCAyMjo1MjozMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
cy9lZ2wvc3BlYzogbWFrZSBlZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24gY29uZGl0aW9uYWwK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVz
dHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3IucHkt
bW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaAppbmRleCAwMzVlN2E0ZDVhLi4z
NzljMDdmMzQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xp
dC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0
cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAxNGU1NmE2MzM2ZjM2ZDExMTI5NjRjZTFmZjA5MDBlYTRiMzdiNDgz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZGU4NTg4ZGQ5NmI0OThjYzAxZjg3ZTdl
YWE5NjRhZWE0ZTEyNzI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMjIgTWF5IDIwMjUgMTc6
MzQ6MTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbm9fZXJyb3IucHk6IG1vZGlmeSBf
Y29tbWFuZCBhbmQgbm90IGNvbW1hbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElS
Uy12YXJpYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAw
MDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaApp
bmRleCAzMjlmZDc1OTc1Li4zYzk3MzUzODcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURF
X0RJUlMtdmFyaWFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NDQ0ZGQ3NDhiOTMyNDUwOGUzMTY4ZjY0Y2Yw
YjVhZGMzMWI1ZWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NmI2N2JlYjlmMDBm
NWFlNGNjMTI5OTVkNzNmNzYxZmFjY2VhMWFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPgogRGF0ZTogVGh1LCA0IE9j
dCAyMDE4IDE0OjQzOjE3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiB1c2UgcHJvcGVy
IFdBWUxBTkRfSU5DTFVERV9ESVJTIHZhcmlhYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRv
LW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29k
ZS1idWlsZC1wYXQucGF0Y2gKaW5kZXggOWMwNWU2MzliMy4uMWQ2N2YxNTMzYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBp
Z2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hh
ZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZjliZmRiOGQzMmMyMTEzYzM5YzNiZTFiZDZmZDA5MzRmNjkzYWIwMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTQ1YjNkOGQwNjI2MzkwMGYyNWIwNDA3NjBkMGFmZDFmNDgwYWNk
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAxMCBOb3YgMjAyMCAxNzoxMzo1MCArMDAw
MAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYzogZG8gbm90IGhh
cmRjb2RlIGJ1aWxkIHBhdGggaW50bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IGEzMjAzNDY0ZDEuLjZiYzk1OWZjOGEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEyLDExICsxMiwxMCBAQCBTUkNfVVJJ
ID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICBmaWxlOi8vMDAwMS1DTWFrZUxpc3RzLnR4dC1k
by1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Np
b24tY29uZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5
LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggXAotICAgICAgICAgICBmaWxl
Oi8vMDAwMS1waXhlbC1sb2NhbC10ZXN0cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWlu
dC5wYXRjaCBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAot
U1JDUkVWID0gIjU2ZjIzN2JlMzJlZDY2ODIwZWIwNWVhM2NiMDRjYjhiOTU3Y2NkOGQiCitTUkNS
RVYgPSAiMTA3ODI1OTA1NTA4MTQxYTBhYjgyMzIxMjlhYmJhNjQ4OTU2MGYwMiIKICMgKHdoZW4g
UFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4wK2dpdHIi
CiAKLS0gCjIuNDcuMQoK

--===============8127422949386350014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch"
packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+1078259055
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-binop-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/output-layout-fail.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/bin/gl-1.0-fog-linear-floor /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/input-layout-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/execution/yuv_2_rgb.shader_test /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/ctor-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/execution/rgb_2_yuv.shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-sample-y2y /usr/lib/piglit/tests/vulkan/shaders/gs-divergent-cut-bits.vk_shader_test /usr/lib/piglit/bin/ext_yuv_target-nv12-render-yuv /usr/lib/piglit/bin/gl-2.1-point_smooth /usr/lib/piglit/tests/vulkan/shaders/cmat-unifo
 rm-ctor.shader_test /usr/lib/piglit/bin/ext_yuv_target-simple /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/compare-fail.frag /usr/lib/piglit/tests/spec/glsl-1.50/execution/primitive-id-no-gs-varying.shader_test /usr/lib/piglit/bin/framebuffer-blit-oblong /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/alu-unop-fail.frag /usr/lib/piglit/tests/spec/ext_yuv_target/compiler/depth-write-fail.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/global-initializer-function-call-2-shaders.shader_test"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2059162120 to 2060192634 (+0%)

--===============8127422949386350014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-657c60a335ef3394cf1021659de59f74b7260069"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:657c60a335ef3394cf1021659de59f74b7260069"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 836 Local 734 Mirrors 0 Missed 102 Current 299 (87% match, 91% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 378 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 407 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 426 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 443 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 500 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 503 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 520 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 525 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 531 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 534 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 553 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 555 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 565 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 571 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 574 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 579 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 585 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 592 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 593 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe chrpath-native-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 602 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-mako-1.3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 612 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_package_setscene)
NOTE: recipe chrpath-native-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 621 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 624 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: Running setscene task 637 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 675 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 681 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 684 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 696 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Started
NOTE: Running setscene task 704 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 719 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe chrpath-native-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe chrpath-native-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 733 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 735 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 745 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 748 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 749 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 759 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 768 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_package_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 773 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 775 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-native-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 796 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 798 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libyaml-native-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 800 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 808 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 811 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 812 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 813 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe chrpath-native-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 817 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe chrpath-native-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 825 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 829 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 832 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 841 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 848 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-native-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-native-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 874 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 880 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 885 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 892 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 899 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 900 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 904 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 906 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 907 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 912 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 920 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 925 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 940 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 941 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 942 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 950 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 953 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 956 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 957 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 963 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 968 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 969 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 978 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 984 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 993 of 1135 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1015 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1021 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 982 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: Running task 984 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: Running task 991 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_fetch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1017 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1018 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: Running task 1020 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1135 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Started
NOTE: Running task 1171 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1174 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1208 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1226 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: Running task 1229 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1026 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: Running task 1373 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe mesa-2_26.2.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: Running task 1396 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: Running task 1399 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_fetch)
NOTE: Running task 1403 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1412 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_fetch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: Running task 1414 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_write_config: Started
NOTE: Running task 1415 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1421 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Started
NOTE: Running task 1429 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe python3-mako-1.3.12-r0: task do_fetch: Succeeded
NOTE: Running task 1430 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1431 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_unpack: Started
NOTE: Running task 1436 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: Running task 1437 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe python3-mako-1.3.12-r0: task do_unpack: Succeeded
NOTE: Running task 1438 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_patch)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_patch: Started
NOTE: Running task 1452 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1461 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe python3-mako-1.3.12-r0: task do_patch: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_fetch: Started
NOTE: Running task 1472 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1480 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: Running task 1481 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: Running task 1485 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe waffle-1.8.3-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1030 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1031 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 1032 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_deploy_source_date_epoch unihash changed to a41fedbd39f89a333ea7371132bfe8048106b6d1dc82d85cb674b0065d77e39e
NOTE: Running setscene task 1020 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 1025 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1032 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1037 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1040 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1055 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1063 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1067 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1071 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1074 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1078 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1082 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1086 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1087 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1088 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1089 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1090 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1092 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1094 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1537 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1538 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: Running task 1541 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 1542 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1096 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1548 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1562 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 1578 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: Running setscene task 1100 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_patch: Started
NOTE: Running setscene task 1101 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_patch)
NOTE: Running task 1580 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1581 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1595 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe waffle-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 1607 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1609 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1629 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1633 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1641 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1645 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 1687 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1688 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe waffle-1.8.3-r0: task do_write_config: Started
NOTE: Running setscene task 1105 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: Running task 1689 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.8.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1107 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1702 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_write_config)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1746 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1755 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1757 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: Running setscene task 1110 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: Running setscene task 1111 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1112 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 1114 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1760 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_deploy_source_date_epoch unihash changed to 0c5c9259dc71a422a39606c00bb93e7c6835fdf8e54bdaff8277e80d25d6db91
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1761 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1765 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1791 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1808 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx)
NOTE: Running task 1826 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1827 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: Running setscene task 1122 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1125 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe waffle-1.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1126 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1129 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1845 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_unpack)
NOTE: Running task 1846 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1133 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1847 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1848 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Started
NOTE: Running task 1849 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1850 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running task 1869 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1871 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: Running noexec task 1880 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: Running task 1908 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_create_recipe_spdx)
NOTE: Running task 1909 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2230 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2279 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2333 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2439 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2467 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2498 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2499 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2500 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Started
NOTE: Running task 2502 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: Running task 2503 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: Running task 2504 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2505 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2518 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: Running task 2519 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_patch)
NOTE: recipe python3-mako-1.3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2520 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_configure)
NOTE: Running task 2521 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2555 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2556 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: Running task 2557 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2558 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe python3-mako-1.3.12-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2560 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2562 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2563 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_configure: Succeeded
NOTE: Running task 2585 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2586 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2587 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_configure_ptest_base: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 2609 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_create_recipe_spdx)
NOTE: recipe python3-mako-1.3.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2610 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2611 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: recipe python3-mako-1.3.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_compile: Started
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Started
NOTE: Running task 2612 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_configure)
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2613 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_configure)
NOTE: recipe gcc-16.1.0-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2614 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_configure)
NOTE: recipe python3-mako-1.3.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2615 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2616 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2617 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_compile)
NOTE: recipe python3-pygments-2.20.0-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2618 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_compile)
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2619 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Succeeded
NOTE: Running task 2620 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2622 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: recipe libpsl-0.23.1-r0: task do_configure: Succeeded
NOTE: Running task 2625 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_compile)
NOTE: recipe libpsl-0.23.1-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2626 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_install)
NOTE: recipe python3-mako-1.3.12-r0: task do_compile: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Started
NOTE: Running task 2627 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.20.0-r0: task do_compile: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_compile_ptest_base: Started
NOTE: Running task 2628 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_install)
NOTE: recipe python3-mako-1.3.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2629 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_install)
NOTE: recipe python3-pygments-2.20.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_install: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Succeeded
NOTE: Running task 2630 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile_ptest_base)
NOTE: Running task 2631 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: Running task 2632 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install)
NOTE: Running task 2633 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_install: Succeeded
NOTE: Running task 2634 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2635 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_install)
NOTE: recipe python3-mako-1.3.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2636 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe python3-mako-1.3.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Succeeded
NOTE: Running task 2637 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install_ptest_base)
NOTE: Running task 2638 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package)
NOTE: Running task 2639 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_populate_sysroot)
NOTE: recipe gcc-16.1.0-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_unpack: Started
NOTE: Running task 2640 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_package: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_populate_sysroot: Started
NOTE: recipe gcc-16.1.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2641 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Succeeded
NOTE: Running task 2643 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata)
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 2644 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_unpack)
NOTE: Running task 2646 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.23.1-r0: task do_compile: Succeeded
NOTE: Running task 2647 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_install)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Started
NOTE: Running task 2648 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_package)
NOTE: recipe libpsl-0.23.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata unihash changed to 698ccd0259f3cab19e6e68c8563ebe9431f41df5981133cd02967ff9e8a396b1
NOTE: Setscene tasks completed
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 2649 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_patch)
NOTE: recipe libpsl-0.23.1-r0: task do_install: Succeeded
NOTE: Running task 2650 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_populate_sysroot)
NOTE: Running task 2651 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_package)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.23.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 2658 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2661 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_spdx)
NOTE: recipe python3-mako-1.3.12-r0: task do_package: Succeeded
NOTE: Running task 2662 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Succeeded
NOTE: Running task 2663 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.3.12-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_populate_sysroot unihash changed to 42208deb7963b9baed7d2ab5a76161d0e1f879a7600c5c37a084c9b793755bec
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot became valid
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1133 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-mako-1.3.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_packagedata unihash changed to e0bc143fdef90e8c4b3067be7b8582f97505013eb9871350326eaf2cebd572ae
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2664 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2665 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_26.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Succeeded
NOTE: Running task 2666 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.3.12-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2667 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_configure)
NOTE: recipe libpsl-0.23.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_package unihash changed to 8ff7fe0ba9bcdad3871e740843a6f8fd7e4571a66d2836047c0591f003d90110
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_packagedata became valid
NOTE: recipe curl-8.21.0-r0: task do_configure: Started
NOTE: Running setscene task 1127 of 1135 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata unihash changed to 17f11925c2cc6fad125cfdd2af73a6f856cad26b104161dc5954cf85ed8011dc
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.20.0-r0: task do_package: Succeeded
NOTE: Running task 2669 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata unihash changed to 1fd19018947214e37679545b3f09dd5ba30007844b1c5d650232c9f9bdcce330
NOTE: Setscene tasks completed
NOTE: Running task 2670 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package_write_ipk)
NOTE: Running task 2671 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package_write_deb)
NOTE: Running task 2672 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package_write_rpm)
NOTE: Running task 2673 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package_qa)
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_ipk: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_deb: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_package_qa: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2674 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe mesa-2_26.2.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.3.12-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2676 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_package_qa unihash changed to 22cb1070ae23d3c7784f6a63d7d194956129e09eef173249d2d9c9252cf40d8a
NOTE: Running task 2677 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_deb: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2678 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe python3-mako-1.3.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Running task 2679 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2680 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2681 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_26.2.0-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 2682 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2683 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 2684 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2687 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot)
NOTE: Running task 2688 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 2689 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 2690 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 2691 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: Running task 2694 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm)
NOTE: recipe bash-5.3-r0: task do_populate_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2696 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx)
NOTE: recipe bash-5.3-r0: task do_create_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2697 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2698 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_compile)
NOTE: recipe curl-8.21.0-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm unihash changed to 33ae4703797824439c8d0e16e0904a4ffdf0a3a43abb7a48892561025f4eaf60
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to ceb8b56484cbb8efbdc7f8dbee15895823a46f9475a31ca7e679d8b85dbf4315
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2806 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_compile_ptest_base)
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe curl-8.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe curl-8.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_compile: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2699 tasks of which 2520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812054400.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812054400.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.2464362
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.2464362
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============8127422949386350014==--

