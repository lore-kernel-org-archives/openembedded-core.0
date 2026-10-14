Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318F6CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:57:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15851.1791989870582397499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=siTert93;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE7A31576
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A77D23F673
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791989870; bh=Y3CDmRuzX96G9qpI6+K4brXS7tZe3KGE6hXi1TwGVWc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=siTert93mTvzQbhBKLAWgyEG0vdgIXFK2pB90eH4dksNc6mS9IfRyKuT6PVl/dFpD
	 yJoDFqoIXzJTfZF5zFFBK7SeRv7XcGanF+XzWWFfqpXjDMIJl7GtF3WznfTsf95olg
	 zGPHsFONzKVYaVqgb3ge6A+0Fdmp8qtM6mciA2BM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] piglit: upgrade to latest revision
Date: Wed, 14 Oct 2026 15:57:42 +0100
Message-ID: <20261014145744.1818933-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014145744.1818933-1-ross.burton@arm.com>
References: <20261014145744.1818933-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247776

Upstream changes:

- egl-configless-context: check result of releasing the context
- arb_separate_shader_objects: check link status in compat-builtins test
- cl/api/enqueue-read_write-buffer: initialize host_buffer_write
- ext_image_dma_buf_import/sample_yuv: catch byte-swapped 16-bit samples
- ext_image_dma_buf_import/sample_yuv: match 4:4:4 chroma to expected col=
ors
- ext_image_dma_buf_import: pack Y410 test data with htole32
- ext_image_dma_buf_import/sample_rgb: test more formats
- ext_image_dma_buf_import/export-tex: test more formats
- gles-3.0: add a reproducer for mesa 43541
- arb_copy_image: add rp-sync test for threaded context renderpass desync
- arb_gpu_shader_fp64: test varyings read by both XFB and the FS
- texturing: add a test for BPTC alpha compression
- ext_image_dma_buf_import: Use glFramebufferTexture2D(..)
- ext_image_dma_buf_import: Use different color in export-tex
- ext_mesh_shader: add some mesh shader tests
- ovr_multiview: fix negative base layer check in fb_blit_first_view
- arb_separate_shader_objects: check link status in 3-stages test
- README: Fix the reference to the CONTRIBUTING file
- arb_clear_texture: accept NaN initial texels in float comparison
- arb_clear_texture: fix GL_UNSIGNED_INT depth comparison on big-endian
- glsl: require GLSL 4.10 for FS underflow tests
- glsl: fix values used for floating point underflow test
- arb_texture_view-rendering-formats: handle big-endian hosts
- arb_query_buffer_object-qbo: handle 64-bit results on big-endian hosts
- arb_query_buffer_object-qbo: read 32-bit CPU results into 32-bit variab=
les
- util: add piglit_is_big_endian()
- khr_texture_compression_astc: Drop the sRGB precision variants.
- khr_texture_compression_astc: Regenerate ldrs golden images.
- ext_transform_feedback: warns when XFB mode differs from draw mode
- glx: use piglit_egl_get_display over eglGetDisplay
- egl_khr_create_context: use piglit_egl_get_display over eglGetDisplay
- egl-configless-context: use piglit_egl_get_display over eglGetDisplay
- arb_sample_locations: bind piglit_winsys_fbo, not 0
- arb_texture_view-blit-from-tex-view: bind piglit_winsys_fbo, not 0
- fbo-pbo-readpixels-small: decode packed depth/stencil in host byte orde=
r
- framebuffer-blit-levels: pack depth/stencil test data as host-endian wo=
rds
- arb_framebuffer_srgb-srgb_pbo: decode the packed texels it reads back
- util: read KTX files with the opposite byte order
- streaming-texture-leak: upload the texture from a byte array
- push-pop-color-material: use byte arrays for glColor4ubv()
- cmake: make incompatible pointer types a hard error
- gl-1.0/fog-linear-floor: use a per-component tolerance array

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 ...01-tests-no_error.py-modify-_command-and-not-command.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-n=
ot-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/pi=
glit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 5ae8d4a4998..333e5a28c37 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obta=
in-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obta=
in-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 1b3d0741044c782731d22d7fed7e92ef409bb966 Mon Sep 17 00:00:00 2001
+From 45bd75328057b19286e21066a69a046cccb6af2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1a38c21f9..45c181e85 100644
+index 9115d3c79..93c6fd44c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-m=
odify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/pigli=
t/0001-tests-no_error.py-modify-_command-and-not-command.patch
index ee39d6df5a2..51f9d89d531 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_=
command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_=
command-and-not-command.patch
@@ -1,4 +1,4 @@
-From f4de80be6ed99bbade73281c0cac99bac7f5e2eb Mon Sep 17 00:00:00 2001
+From d6584a39cf47759007dfd58235bc488871104946 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WA=
YLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0=
002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 701c7076aec..9a251856513 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_I=
NCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_I=
NCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From e02e95a4c3103a8223dc89b6dbad3747e641f203 Mon Sep 17 00:00:00 2001
+From 1a65f18c336ca13fcbf8e7a179375a9447a95285 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-s=
hader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/pi=
glit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 2f53abf4190..e469a09a3d6 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c=
-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c=
-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From d10663b34ce8606b82bc153638a2f89bda32d4c0 Mon Sep 17 00:00:00 2001
+From ebca1b952f830dcd7cb57a3f90a9cb1ccd65a63e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path =
into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index cd1ae5d6d28..8f02496b4fd 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "4950babfd2cd4408e4bfd103d935c6e5cff53d20"
+SRCREV =3D "f73c2b554e565d6ee3fa2a331c60236141a73768"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr"
=20
--=20
2.43.0


