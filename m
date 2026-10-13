Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ED7CC6B10
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 07:08:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1674.1791875292089667049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 00:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mC5jbyAR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UMC7JniS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1341717e8-f8fc3eca-698a-4c65-a743-023e61e1ed69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791875291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ICg7d4HNAik9tnLpZ6oZ5z4YQbgbxlv9QtLnUltCx/g=;
	b=mC5jbyARuWj9TZWKPj/2tSVcZQuhiS9XLB6RxAezQLsZYcn5HIxozz38feLqJCku
	G9GSTfQcsGiFjyeBXOzv5EGjAplb+gyNoe9Pq1ZtCBCyMTAtN/SyU2OgKyUGcclCRBr
	llk5yhFQz/jrgnJjrms89ycROmzozZLVt99ViFfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791875291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ICg7d4HNAik9tnLpZ6oZ5z4YQbgbxlv9QtLnUltCx/g=;
	b=UMC7JniS+VMj1b/JEwzh2s8G5GQGcxVOhVi3Q1I7FMRBfvDdJFZ8CWVlWT+5QMF4
	M/uOho1tJjhD1BBm8LsPXCWh27FBRDtl/nNW1zy/LhST431wpS5BGvw8PJ9sokczsOt
	TR08aoDSxrCiORPdAsJU8B0dq9aTwHF+EorL0MfY=
Content-Type: multipart/mixed; boundary="===============1819867742014853149=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to f73c2b554e565d6ee3fa2a331c60236141a73768
 SUCCEEDED
Message-ID: <010101a1341717e8-f8fc3eca-698a-4c65-a743-023e61e1ed69-000000@us-west-2.amazonses.com>
Date: Tue, 13 Oct 2026 07:08:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247701

--===============1819867742014853149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *f73c2b554e565d6ee3fa2a331c60236141a73768* has Succeeded.

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
From 2fc53ca080e67f0b0653ebfa0d896642397a68ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 13 Oct 2026 07:05:03 +0000
Subject: [PATCH] piglit: upgrade to latest revision

egl-configless-context: check result of releasing the context
arb_separate_shader_objects: check link status in compat-builtins test
cl/api/enqueue-read_write-buffer: initialize host_buffer_write
ext_image_dma_buf_import/sample_yuv: catch byte-swapped 16-bit samples
ext_image_dma_buf_import/sample_yuv: match 4:4:4 chroma to expected colors
ext_image_dma_buf_import: pack Y410 test data with htole32
ext_image_dma_buf_import/sample_rgb: test more formats
ext_image_dma_buf_import/export-tex: test more formats
gles-3.0: add a reproducer for mesa!43541
arb_copy_image: add rp-sync test for threaded context renderpass desync
arb_gpu_shader_fp64: test varyings read by both XFB and the FS
texturing: add a test for BPTC alpha compression
ext_image_dma_buf_import: Use glFramebufferTexture2D(..)
ext_image_dma_buf_import: Use different color in export-tex
ext_mesh_shader: add some mesh shader tests
ovr_multiview: fix negative base layer check in fb_blit_first_view
arb_separate_shader_objects: check link status in 3-stages test
README: Fix the reference to the CONTRIBUTING file
arb_clear_texture: accept NaN initial texels in float comparison
arb_clear_texture: fix GL_UNSIGNED_INT depth comparison on big-endian
glsl: require GLSL 4.10 for FS underflow tests
glsl: fix values used for floating point underflow test
arb_texture_view-rendering-formats: handle big-endian hosts
arb_query_buffer_object-qbo: handle 64-bit results on big-endian hosts
arb_query_buffer_object-qbo: read 32-bit CPU results into 32-bit variables
util: add piglit_is_big_endian()
khr_texture_compression_astc: Drop the sRGB precision variants.
khr_texture_compression_astc: Regenerate ldrs golden images.
ext_transform_feedback: warns when XFB mode differs from draw mode
glx: use piglit_egl_get_display over eglGetDisplay
egl_khr_create_context: use piglit_egl_get_display over eglGetDisplay
egl-configless-context: use piglit_egl_get_display over eglGetDisplay
arb_sample_locations: bind piglit_winsys_fbo, not 0
arb_texture_view-blit-from-tex-view: bind piglit_winsys_fbo, not 0
fbo-pbo-readpixels-small: decode packed depth/stencil in host byte order
framebuffer-blit-levels: pack depth/stencil test data as host-endian words
arb_framebuffer_srgb-srgb_pbo: decode the packed texels it reads back
util: read KTX files with the opposite byte order
streaming-texture-leak: upload the texture from a byte array
push-pop-color-material: use byte arrays for glColor4ubv()
cmake: make incompatible pointer types a hard error
gl-1.0/fog-linear-floor: use a per-component tolerance array
---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 ...01-tests-no_error.py-modify-_command-and-not-command.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 5ae8d4a499..333e5a28c3 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 1b3d0741044c782731d22d7fed7e92ef409bb966 Mon Sep 17 00:00:00 2001
+From 45bd75328057b19286e21066a69a046cccb6af2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1a38c21f9..45c181e85 100644
+index 9115d3c79..93c6fd44c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index ee39d6df5a..51f9d89d53 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From f4de80be6ed99bbade73281c0cac99bac7f5e2eb Mon Sep 17 00:00:00 2001
+From d6584a39cf47759007dfd58235bc488871104946 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 701c7076ae..9a25185651 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From e02e95a4c3103a8223dc89b6dbad3747e641f203 Mon Sep 17 00:00:00 2001
+From 1a65f18c336ca13fcbf8e7a179375a9447a95285 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 2f53abf419..e469a09a3d 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From d10663b34ce8606b82bc153638a2f89bda32d4c0 Mon Sep 17 00:00:00 2001
+From ebca1b952f830dcd7cb57a3f90a9cb1ccd65a63e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index cd1ae5d6d2..8f02496b4f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "4950babfd2cd4408e4bfd103d935c6e5cff53d20"
+SRCREV = "f73c2b554e565d6ee3fa2a331c60236141a73768"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============1819867742014853149==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAyZmM1M2NhMDgwZTY3ZjBiMDY1M2ViZmEwZDg5NjY0MjM5N2E2OGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTMgT2N0IDIwMjYgMDc6MDU6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgplZ2wtY29uZmlnbGVzcy1jb250ZXh0
OiBjaGVjayByZXN1bHQgb2YgcmVsZWFzaW5nIHRoZSBjb250ZXh0CmFyYl9zZXBhcmF0ZV9zaGFk
ZXJfb2JqZWN0czogY2hlY2sgbGluayBzdGF0dXMgaW4gY29tcGF0LWJ1aWx0aW5zIHRlc3QKY2wv
YXBpL2VucXVldWUtcmVhZF93cml0ZS1idWZmZXI6IGluaXRpYWxpemUgaG9zdF9idWZmZXJfd3Jp
dGUKZXh0X2ltYWdlX2RtYV9idWZfaW1wb3J0L3NhbXBsZV95dXY6IGNhdGNoIGJ5dGUtc3dhcHBl
ZCAxNi1iaXQgc2FtcGxlcwpleHRfaW1hZ2VfZG1hX2J1Zl9pbXBvcnQvc2FtcGxlX3l1djogbWF0
Y2ggNDo0OjQgY2hyb21hIHRvIGV4cGVjdGVkIGNvbG9ycwpleHRfaW1hZ2VfZG1hX2J1Zl9pbXBv
cnQ6IHBhY2sgWTQxMCB0ZXN0IGRhdGEgd2l0aCBodG9sZTMyCmV4dF9pbWFnZV9kbWFfYnVmX2lt
cG9ydC9zYW1wbGVfcmdiOiB0ZXN0IG1vcmUgZm9ybWF0cwpleHRfaW1hZ2VfZG1hX2J1Zl9pbXBv
cnQvZXhwb3J0LXRleDogdGVzdCBtb3JlIGZvcm1hdHMKZ2xlcy0zLjA6IGFkZCBhIHJlcHJvZHVj
ZXIgZm9yIG1lc2EhNDM1NDEKYXJiX2NvcHlfaW1hZ2U6IGFkZCBycC1zeW5jIHRlc3QgZm9yIHRo
cmVhZGVkIGNvbnRleHQgcmVuZGVycGFzcyBkZXN5bmMKYXJiX2dwdV9zaGFkZXJfZnA2NDogdGVz
dCB2YXJ5aW5ncyByZWFkIGJ5IGJvdGggWEZCIGFuZCB0aGUgRlMKdGV4dHVyaW5nOiBhZGQgYSB0
ZXN0IGZvciBCUFRDIGFscGhhIGNvbXByZXNzaW9uCmV4dF9pbWFnZV9kbWFfYnVmX2ltcG9ydDog
VXNlIGdsRnJhbWVidWZmZXJUZXh0dXJlMkQoLi4pCmV4dF9pbWFnZV9kbWFfYnVmX2ltcG9ydDog
VXNlIGRpZmZlcmVudCBjb2xvciBpbiBleHBvcnQtdGV4CmV4dF9tZXNoX3NoYWRlcjogYWRkIHNv
bWUgbWVzaCBzaGFkZXIgdGVzdHMKb3ZyX211bHRpdmlldzogZml4IG5lZ2F0aXZlIGJhc2UgbGF5
ZXIgY2hlY2sgaW4gZmJfYmxpdF9maXJzdF92aWV3CmFyYl9zZXBhcmF0ZV9zaGFkZXJfb2JqZWN0
czogY2hlY2sgbGluayBzdGF0dXMgaW4gMy1zdGFnZXMgdGVzdApSRUFETUU6IEZpeCB0aGUgcmVm
ZXJlbmNlIHRvIHRoZSBDT05UUklCVVRJTkcgZmlsZQphcmJfY2xlYXJfdGV4dHVyZTogYWNjZXB0
IE5hTiBpbml0aWFsIHRleGVscyBpbiBmbG9hdCBjb21wYXJpc29uCmFyYl9jbGVhcl90ZXh0dXJl
OiBmaXggR0xfVU5TSUdORURfSU5UIGRlcHRoIGNvbXBhcmlzb24gb24gYmlnLWVuZGlhbgpnbHNs
OiByZXF1aXJlIEdMU0wgNC4xMCBmb3IgRlMgdW5kZXJmbG93IHRlc3RzCmdsc2w6IGZpeCB2YWx1
ZXMgdXNlZCBmb3IgZmxvYXRpbmcgcG9pbnQgdW5kZXJmbG93IHRlc3QKYXJiX3RleHR1cmVfdmll
dy1yZW5kZXJpbmctZm9ybWF0czogaGFuZGxlIGJpZy1lbmRpYW4gaG9zdHMKYXJiX3F1ZXJ5X2J1
ZmZlcl9vYmplY3QtcWJvOiBoYW5kbGUgNjQtYml0IHJlc3VsdHMgb24gYmlnLWVuZGlhbiBob3N0
cwphcmJfcXVlcnlfYnVmZmVyX29iamVjdC1xYm86IHJlYWQgMzItYml0IENQVSByZXN1bHRzIGlu
dG8gMzItYml0IHZhcmlhYmxlcwp1dGlsOiBhZGQgcGlnbGl0X2lzX2JpZ19lbmRpYW4oKQpraHJf
dGV4dHVyZV9jb21wcmVzc2lvbl9hc3RjOiBEcm9wIHRoZSBzUkdCIHByZWNpc2lvbiB2YXJpYW50
cy4Ka2hyX3RleHR1cmVfY29tcHJlc3Npb25fYXN0YzogUmVnZW5lcmF0ZSBsZHJzIGdvbGRlbiBp
bWFnZXMuCmV4dF90cmFuc2Zvcm1fZmVlZGJhY2s6IHdhcm5zIHdoZW4gWEZCIG1vZGUgZGlmZmVy
cyBmcm9tIGRyYXcgbW9kZQpnbHg6IHVzZSBwaWdsaXRfZWdsX2dldF9kaXNwbGF5IG92ZXIgZWds
R2V0RGlzcGxheQplZ2xfa2hyX2NyZWF0ZV9jb250ZXh0OiB1c2UgcGlnbGl0X2VnbF9nZXRfZGlz
cGxheSBvdmVyIGVnbEdldERpc3BsYXkKZWdsLWNvbmZpZ2xlc3MtY29udGV4dDogdXNlIHBpZ2xp
dF9lZ2xfZ2V0X2Rpc3BsYXkgb3ZlciBlZ2xHZXREaXNwbGF5CmFyYl9zYW1wbGVfbG9jYXRpb25z
OiBiaW5kIHBpZ2xpdF93aW5zeXNfZmJvLCBub3QgMAphcmJfdGV4dHVyZV92aWV3LWJsaXQtZnJv
bS10ZXgtdmlldzogYmluZCBwaWdsaXRfd2luc3lzX2Zibywgbm90IDAKZmJvLXBiby1yZWFkcGl4
ZWxzLXNtYWxsOiBkZWNvZGUgcGFja2VkIGRlcHRoL3N0ZW5jaWwgaW4gaG9zdCBieXRlIG9yZGVy
CmZyYW1lYnVmZmVyLWJsaXQtbGV2ZWxzOiBwYWNrIGRlcHRoL3N0ZW5jaWwgdGVzdCBkYXRhIGFz
IGhvc3QtZW5kaWFuIHdvcmRzCmFyYl9mcmFtZWJ1ZmZlcl9zcmdiLXNyZ2JfcGJvOiBkZWNvZGUg
dGhlIHBhY2tlZCB0ZXhlbHMgaXQgcmVhZHMgYmFjawp1dGlsOiByZWFkIEtUWCBmaWxlcyB3aXRo
IHRoZSBvcHBvc2l0ZSBieXRlIG9yZGVyCnN0cmVhbWluZy10ZXh0dXJlLWxlYWs6IHVwbG9hZCB0
aGUgdGV4dHVyZSBmcm9tIGEgYnl0ZSBhcnJheQpwdXNoLXBvcC1jb2xvci1tYXRlcmlhbDogdXNl
IGJ5dGUgYXJyYXlzIGZvciBnbENvbG9yNHVidigpCmNtYWtlOiBtYWtlIGluY29tcGF0aWJsZSBw
b2ludGVyIHR5cGVzIGEgaGFyZCBlcnJvcgpnbC0xLjAvZm9nLWxpbmVhci1mbG9vcjogdXNlIGEg
cGVyLWNvbXBvbmVudCB0b2xlcmFuY2UgYXJyYXkKLS0tCiAuLi5DTWFrZUxpc3RzLnR4dC1kby1u
b3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgNCArKy0tCiAuLi4wMS10
ZXN0cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoIHwg
MiArLQogLi4uLzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJp
YWJsZS5wYXRjaCB8IDIgKy0KIC4uLnRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1o
YXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAgICAgICAgIHwgMiArLQogNSBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qt
b2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxh
bmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IDVhZThkNGE0OTkuLjMzM2U1YTI4YzMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VM
aXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0
LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDFiM2QwNzQxMDQ0Yzc4MjczMWQyMmQ3ZmVkN2U5MmVmNDA5YmI5NjYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ1YmQ3NTMyODA1N2IxOTI4NmUyMTA2NmE2OWEwNDZj
Y2NiNmFmMmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXls
YW5kLXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50
eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggMWEzOGMyMWY5Li40NWMxODFlODUgMTAwNjQ0Citp
bmRleCA5MTE1ZDNjNzkuLjkzYzZmZDQ0YyAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiAr
KysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwxMSArMjExLDcgQEAgaWYoUElHTElUX1VTRV9X
QVlMQU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMS10ZXN0cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1ub19l
cnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCmluZGV4IGVlMzlk
NmRmNWEuLjUxZjlkODlkNTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3Qt
Y29tbWFuZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY0ZGU4MGJlNmVkOTliYmFkZTczMjgxYzBjYWM5OWJh
YzdmNWUyZWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ2NTg0YTM5Y2Y0Nzc1OTAw
N2RmZDU4MjM1YmM0ODg4NzExMDQ5NDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVGh1LCAyMiBNYXkg
MjAyNSAxNzozNDoxNSArMDIwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9ub19lcnJvci5weTog
bW9kaWZ5IF9jb21tYW5kIGFuZCBub3QgY29tbWFuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5D
TFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxl
LnBhdGNoCmluZGV4IDcwMWM3MDc2YWUuLjlhMjUxODU2NTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5E
X0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMt
dmFyaWFibGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUwMmU5NWE0YzMxMDNhODIyM2Rj
ODliNmRiYWQzNzQ3ZTY0MWYyMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFhNjVm
MThjMzM2Y2ExM2ZjYmY4ZTdhMTc5Mzc1YTk0NDdhOTUyODUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBU
aHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVz
ZSBwcm9wZXIgV0FZTEFORF9JTkNMVURFX0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hh
ZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90
LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAppbmRleCAyZjUzYWJmNDE5Li5lNDY5YTA5YTNkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3Rz
LXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBp
Z2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBkMTA2NjNiMzRjZTg2MDZiODJiYzE1MzYzOGEyZjg5YmRhMzJkNGMwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYmNhMWI5NTJmODMwZGNkN2NiNTdhM2Y5MGE5Y2Ix
Y2NkNjVhNjNlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEz
OjUwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBk
byBub3QgaGFyZGNvZGUgYnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdF9naXQuYmIKaW5kZXggY2QxYWU1ZDZkMi4uOGYwMjQ5NmI0ZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgpAQCAtMTQsNyArMTQsNyBAQCBT
UkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01N
SVRTID0gIjEiCiAKLVNSQ1JFViA9ICI0OTUwYmFiZmQyY2Q0NDA4ZTRiZmQxMDNkOTM1YzZlNWNm
ZjUzZDIwIgorU1JDUkVWID0gImY3M2MyYjU1NGU1NjVkNmVlM2ZhMmEzMzFjNjAyMzYxNDFhNzM3
NjgiCiAjICh3aGVuIFBWIGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBW
ID0gIjEuMCtnaXRyIgogCi0tIAoyLjQ3LjEKCg==

--===============1819867742014853149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="piglit-changelog.txt"

egl-configless-context: check result of releasing the context
arb_separate_shader_objects: check link status in compat-builtins test
cl/api/enqueue-read_write-buffer: initialize host_buffer_write
ext_image_dma_buf_import/sample_yuv: catch byte-swapped 16-bit samples
ext_image_dma_buf_import/sample_yuv: match 4:4:4 chroma to expected colors
ext_image_dma_buf_import: pack Y410 test data with htole32
ext_image_dma_buf_import/sample_rgb: test more formats
ext_image_dma_buf_import/export-tex: test more formats
gles-3.0: add a reproducer for mesa!43541
arb_copy_image: add rp-sync test for threaded context renderpass desync
arb_gpu_shader_fp64: test varyings read by both XFB and the FS
texturing: add a test for BPTC alpha compression
ext_image_dma_buf_import: Use glFramebufferTexture2D(..)
ext_image_dma_buf_import: Use different color in export-tex
ext_mesh_shader: add some mesh shader tests
ovr_multiview: fix negative base layer check in fb_blit_first_view
arb_separate_shader_objects: check link status in 3-stages test
README: Fix the reference to the CONTRIBUTING file
arb_clear_texture: accept NaN initial texels in float comparison
arb_clear_texture: fix GL_UNSIGNED_INT depth comparison on big-endian
glsl: require GLSL 4.10 for FS underflow tests
glsl: fix values used for floating point underflow test
arb_texture_view-rendering-formats: handle big-endian hosts
arb_query_buffer_object-qbo: handle 64-bit results on big-endian hosts
arb_query_buffer_object-qbo: read 32-bit CPU results into 32-bit variables
util: add piglit_is_big_endian()
khr_texture_compression_astc: Drop the sRGB precision variants.
khr_texture_compression_astc: Regenerate ldrs golden images.
ext_transform_feedback: warns when XFB mode differs from draw mode
glx: use piglit_egl_get_display over eglGetDisplay
egl_khr_create_context: use piglit_egl_get_display over eglGetDisplay
egl-configless-context: use piglit_egl_get_display over eglGetDisplay
arb_sample_locations: bind piglit_winsys_fbo, not 0
arb_texture_view-blit-from-tex-view: bind piglit_winsys_fbo, not 0
fbo-pbo-readpixels-small: decode packed depth/stencil in host byte order
framebuffer-blit-levels: pack depth/stencil test data as host-endian words
arb_framebuffer_srgb-srgb_pbo: decode the packed texels it reads back
util: read KTX files with the opposite byte order
streaming-texture-leak: upload the texture from a byte array
push-pop-color-material: use byte arrays for glColor4ubv()
cmake: make incompatible pointer types a hard error
gl-1.0/fog-linear-floor: use a per-component tolerance array

--===============1819867742014853149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22454 to 22467 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-mul-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-pow-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-exp2-compare-zero.shader_test", added "/usr/lib/piglit/bin/bptc-compress-alpha /usr/lib/piglit/bin/arb_copy_image-rp-sync /usr/lib/piglit/tests/spec/khr_texture_compression_astc/generate-decompressed.py /usr/lib/piglit/tests/spec/glsl-4.10/execution/fs-underflow-exp2-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-4.10/execution/fs-underflow-mul-compare-zero.shader_test /usr/lib/piglit/bin/ext_mesh_shader-ubo-invalidate-between-draws /usr/lib/piglit/tests/spec/glsl-4.10/execution/fs-underflow-pow-compare-zero.shader_test /usr/lib/piglit/bin/gles-3.0-subdata-after-orphan /usr/lib/piglit/bin/ext_mesh_shader-ssbo-rebind-between-draws /usr/lib/piglit/bin/ext_mesh_shader-ubo-rebind-b
 etween-draws /usr/lib/piglit/bin/arb_gpu_shader_fp64-tf-fs-varyings"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2060269340 to 2060394300 (+0%)

--===============1819867742014853149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+4950babfd2 to 1.0+gitr0+f73c2b554e
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-exp2-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-mul-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-1.20/execution/fs-underflow-pow-compare-zero.shader_test", added "/usr/lib/piglit/tests/spec/khr_texture_compression_astc/generate-decompressed.py /usr/lib/piglit/bin/arb_copy_image-rp-sync /usr/lib/piglit/bin/ext_mesh_shader-ssbo-rebind-between-draws /usr/lib/piglit/bin/ext_mesh_shader-ubo-invalidate-between-draws /usr/lib/piglit/bin/bptc-compress-alpha /usr/lib/piglit/bin/ext_mesh_shader-ubo-rebind-between-draws /usr/lib/piglit/tests/spec/glsl-4.10/execution/fs-underflow-mul-compare-zero.shader_test /usr/lib/piglit/tests/spec/glsl-4.10/execution/fs-underflow-pow-compare-zero.shader_test /usr/lib/piglit/bin/arb_gpu_shader_fp64-tf-fs-varyings /usr/lib/piglit/bin/gles-3.0-subdata-after-orphan /usr/lib/piglit/tests/
 spec/glsl-4.10/execution/fs-underflow-exp2-compare-zero.shader_test"

--===============1819867742014853149==--

