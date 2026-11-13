Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5984.1794551761222893478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XX9OuruJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nv+cM4AO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1d39ec621-ed32c027-fbc5-4aa1-8e55-10233a06e8c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551760;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RsChgRi4xJAsmtKlpmoxylySbX1Z0n3wsyPHypPADSQ=;
	b=XX9OuruJOQ02qbvtHecYxdISExL45Aqi2DRcbrFpzsLh1+GYVRWD0CT7928YfmN0
	VVnMJnLIj257MsXr7Uin46cyfg6v+/no18HHS7hBUqXcllN/zALqDU8k9fSUxNMr+zT
	7NDID+JEvnlA6UZMPPLDYLUMTAPgmn3R9wGAygJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551760;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RsChgRi4xJAsmtKlpmoxylySbX1Z0n3wsyPHypPADSQ=;
	b=nv+cM4AOXeSrxtzgkP9Vht382KCGe9bTBi6+gM4b93p6C2aoIyFsJnE2KOaJsoz+
	fCA9s5jYQTPJCv+Qc1PCEPPBbx6B2ZIYvmJsOUVpcoBYZdWUAYhy50ef6iHzH3yUXgy
	4SIG/dePfJeUN/RkRFPcL/ywE2Yl0gAivGAL1bfg=
Content-Type: multipart/mixed; boundary="===============6471760707639311097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to edf773823120c32f84c667e9610d21b1d0aa8d42
 SUCCEEDED
Message-ID: <010101a1d39ec621-ed32c027-fbc5-4aa1-8e55-10233a06e8c6-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250148

--===============6471760707639311097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *edf773823120c32f84c667e9610d21b1d0aa8d42* has Succeeded.

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
From cc505b1c8f0cffeed2c08fb5cc7b279b3e89df50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 13 Nov 2026 06:19:31 +0000
Subject: [PATCH] piglit: upgrade to latest revision

Convert other arb_shader_image_load_store tests to support GL3.1.
arb_shader_image_load_store/semantics.c: Drop hard req on cube_map_array.
arb_shader_image_size: Add support for desktop GL3.1.
arb_texture_buffer_object: skip image subtests without compute program
rasterpos: test a vertex shader linked with a fragment shader
Add an AGENTS.md file of piglit norms for agents writing tests.
ci: add macOS build job
pixel-local-storage: modify blend_or_dither to not write first PLS variable
pixel-local-tests: add a sanity check to verify color with blend/dither
pixel-local-tests: fix return from blend_or_dither tests
arb_framebuffer_object: accept GL 3.0 in negative-readpixels-no-rb
arb_copy_buffer: accept GL 3.1 without the extension
arb_texture_buffer_object: accept GL 3.1 in more tests
texelFetch/textureSize: don't require extensions promoted to core
shader_runner: Keep strchr() result const
ext_mesh_shader: add continue-after-resolve
general: add tc-renderpass-info
blit-scaled-linear: increase tolerance error
texturing: fix unused shader sources in texsubimage-row-length-bounds
arb_texture_multisample: accept GL 3.2 in minmax
arb_vertex_program: test an arl-indexed constant between state vars
gl-3.0: test that built-in uniforms follow state changes
gl-1.0: test that lighting follows state changes between draws
egl: add egl-shared-genbuffers-churn
gl-1.5: add gen-buffers-unique
arb_vertex_attrib_64bit: use GLSL 1.40 in overlapping-locations
depth-clear-precision-check: don't shift a 32-bit long by 32
fbo-geneatemipmap-formats: return warn if results don't match
wgl: test that work in a shared context is visible after wglMakeCurrent
ext_transform_feedback: Add primgen clear query test
ext_msrtt2: test drawing after a scissored depth clear
gl-1.0: test line loops that span an immediate mode buffer flush
arb_gpu_shader_fp64: use GLSL 1.40 in non-uniform-control-flow tests
textureGather: accept GL_ARB_texture_swizzle and GL 3.3
textureGather: use GLSL 1.40 in core profile contexts
shader_runner: skip deprecated varying limit query in FC contexts
texturing: test a 3d texture over 1 gb on a gpu with plenty of memory
wgl: test that ChoosePixelFormat for a window picks a window format
glx: test that reading the back buffer after a swap keeps the window
ovr_multiview_multisampled_render_to_texture: add tests
ovr_multiview2: add render and gles compiler tests
ovr_multiview: add api, render, and draw error tests for gl and gles
ext_msrtt2: add conformance tests
ext_msrtt: check clear_color_and_depth's depth by drawing
ext_msrtt: call RenderbufferStorageMultisampleEXT in clear_color_and_depth
ext_msrtt: add conformance tests
ext_msrtt: run clear_color_and_depth
util: add piglit_dispatch_resolve_extension_function
util: look up gles functions in opengl32 on windows
cmake: allow gles tests on windows
glx: test that the main fbconfig types exist
cl: add a test that reads a kernel result back through a map
glx: test flushing the front buffer again after a swap
gl-1.0: test reading the front buffer while drawing the next frame
gl-1.0: test drawing to the front, the back, and both without swapping
arb_framebuffer_object: test reads after a sampled texture is redrawn
ext_msrtt: add a reproducer for mesa#16550
arb_vertex_buffer_object: add a reproducer for mesa#16547
drawoverhead: Add unaligned VBO offset and stride subtests
egl-arb-sync-shared-context: add a write-unflushed mode
arb_sync: add a flush-readback stress test
arb_sync: add a pending-sync mode to old-sync and a sync churn test
arb_sync: add tests that waits do not return before the GPU is done
texturing: add texsubimage-row-length-bounds test
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  4 +--
 ...ader_runner-Keep-strchr-result-const.patch | 31 -------------------
 ...r.py-modify-_command-and-not-command.patch |  2 +-
 ...-reproducible_mtime-should-be-an-int.patch |  6 +---
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  4 +--
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 7 files changed, 8 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 333e5a28c3..84a5a587e6 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 45bd75328057b19286e21066a69a046cccb6af2a Mon Sep 17 00:00:00 2001
+From aec064810e1659ab3d01fe3ff33cea67a108fa8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9115d3c79..93c6fd44c 100644
+index ee5498105..5229e00e1 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch b/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
deleted file mode 100644
index 3e1a579691..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sat, 24 Oct 2026 10:00:00 -0700
-Subject: [PATCH] shader_runner: Keep strchr() result const
-
-The include path parsing walks a const char cursor and stores the
-result of strchr() in a plain char pointer. Since glibc 2.43, strchr()
-preserves the const qualifier of its argument when C23 features are
-enabled, which _GNU_SOURCE does, so clang fails the build:
-
-  tests/shaders/shader_runner.c:1665:10: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
-
-line_end is only read, so declare it const.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1281]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- tests/shaders/shader_runner.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/shaders/shader_runner.c b/tests/shaders/shader_runner.c
---- a/tests/shaders/shader_runner.c
-+++ b/tests/shaders/shader_runner.c
-@@ -1662,7 +1662,7 @@ leave_state(enum states state, const char *line, const char *script_name)
- 
- 		cursor = shader_string;
- 		for (unsigned i = 0; i < num_shader_include_paths; i++) {
--			char *line_end = strchr(cursor, '\n');
-+			const char *line_end = strchr(cursor, '\n');
- 			unsigned path_len = line_end - cursor - 1;
- 			char *path = malloc(path_len + 1);
- 			path[path_len] = '\0';
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index 51f9d89d53..1a50719ed1 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From d6584a39cf47759007dfd58235bc488871104946 Mon Sep 17 00:00:00 2001
+From 2b2c2064a3a5519df314785926179022b64904be Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
index 4578c296b0..e2c8f5f7b2 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
@@ -1,8 +1,7 @@
-From 58a5bea55a5f7972462124e7a8f1b1971ad5483d Mon Sep 17 00:00:00 2001
+From 8794da96acdbc98801cc911541d7b2d42379fe24 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 22 Oct 2026 14:09:08 +0100
 Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
-X-ARM-No-Footer: NoDisclaimer
 
 The mtime argument is an integer not a string, so parse it with int().
 
@@ -28,6 +27,3 @@ index 5ee9a1578..f7fdadf43 100644
      with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
          tree.write(f, encoding='utf-8', xml_declaration=True)
  
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 9a25185651..d1074d37c2 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 1a65f18c336ca13fcbf8e7a179375a9447a95285 Mon Sep 17 00:00:00 2001
+From 6631fcfd11e4a852f46c3d0200d8399550848374 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [piglit@lists.freedesktop.org]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index f9bfec555..07b821375 100644
+index 31b16978c..a5549140b 100644
 --- a/tests/util/CMakeLists.txt
 +++ b/tests/util/CMakeLists.txt
 @@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index e469a09a3d..c64d5dd994 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From ebca1b952f830dcd7cb57a3f90a9cb1ccd65a63e Mon Sep 17 00:00:00 2001
+From d49517c9fe7b3ec822e797e54f4cae3f0bdb0a3a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7c6a0b4d45..71a10ff8f6 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -12,11 +12,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch \
-           file://0001-shader_runner-Keep-strchr-result-const.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f73c2b554e565d6ee3fa2a331c60236141a73768"
+SRCREV = "edf773823120c32f84c667e9610d21b1d0aa8d42"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============6471760707639311097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBjYzUwNWIxYzhmMGNmZmVlZDJjMDhmYjVjYzdiMjc5YjNlODlkZjUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTMgTm92IDIwMjYgMDY6MTk6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgpDb252ZXJ0IG90aGVyIGFyYl9zaGFk
ZXJfaW1hZ2VfbG9hZF9zdG9yZSB0ZXN0cyB0byBzdXBwb3J0IEdMMy4xLgphcmJfc2hhZGVyX2lt
YWdlX2xvYWRfc3RvcmUvc2VtYW50aWNzLmM6IERyb3AgaGFyZCByZXEgb24gY3ViZV9tYXBfYXJy
YXkuCmFyYl9zaGFkZXJfaW1hZ2Vfc2l6ZTogQWRkIHN1cHBvcnQgZm9yIGRlc2t0b3AgR0wzLjEu
CmFyYl90ZXh0dXJlX2J1ZmZlcl9vYmplY3Q6IHNraXAgaW1hZ2Ugc3VidGVzdHMgd2l0aG91dCBj
b21wdXRlIHByb2dyYW0KcmFzdGVycG9zOiB0ZXN0IGEgdmVydGV4IHNoYWRlciBsaW5rZWQgd2l0
aCBhIGZyYWdtZW50IHNoYWRlcgpBZGQgYW4gQUdFTlRTLm1kIGZpbGUgb2YgcGlnbGl0IG5vcm1z
IGZvciBhZ2VudHMgd3JpdGluZyB0ZXN0cy4KY2k6IGFkZCBtYWNPUyBidWlsZCBqb2IKcGl4ZWwt
bG9jYWwtc3RvcmFnZTogbW9kaWZ5IGJsZW5kX29yX2RpdGhlciB0byBub3Qgd3JpdGUgZmlyc3Qg
UExTIHZhcmlhYmxlCnBpeGVsLWxvY2FsLXRlc3RzOiBhZGQgYSBzYW5pdHkgY2hlY2sgdG8gdmVy
aWZ5IGNvbG9yIHdpdGggYmxlbmQvZGl0aGVyCnBpeGVsLWxvY2FsLXRlc3RzOiBmaXggcmV0dXJu
IGZyb20gYmxlbmRfb3JfZGl0aGVyIHRlc3RzCmFyYl9mcmFtZWJ1ZmZlcl9vYmplY3Q6IGFjY2Vw
dCBHTCAzLjAgaW4gbmVnYXRpdmUtcmVhZHBpeGVscy1uby1yYgphcmJfY29weV9idWZmZXI6IGFj
Y2VwdCBHTCAzLjEgd2l0aG91dCB0aGUgZXh0ZW5zaW9uCmFyYl90ZXh0dXJlX2J1ZmZlcl9vYmpl
Y3Q6IGFjY2VwdCBHTCAzLjEgaW4gbW9yZSB0ZXN0cwp0ZXhlbEZldGNoL3RleHR1cmVTaXplOiBk
b24ndCByZXF1aXJlIGV4dGVuc2lvbnMgcHJvbW90ZWQgdG8gY29yZQpzaGFkZXJfcnVubmVyOiBL
ZWVwIHN0cmNocigpIHJlc3VsdCBjb25zdApleHRfbWVzaF9zaGFkZXI6IGFkZCBjb250aW51ZS1h
ZnRlci1yZXNvbHZlCmdlbmVyYWw6IGFkZCB0Yy1yZW5kZXJwYXNzLWluZm8KYmxpdC1zY2FsZWQt
bGluZWFyOiBpbmNyZWFzZSB0b2xlcmFuY2UgZXJyb3IKdGV4dHVyaW5nOiBmaXggdW51c2VkIHNo
YWRlciBzb3VyY2VzIGluIHRleHN1YmltYWdlLXJvdy1sZW5ndGgtYm91bmRzCmFyYl90ZXh0dXJl
X211bHRpc2FtcGxlOiBhY2NlcHQgR0wgMy4yIGluIG1pbm1heAphcmJfdmVydGV4X3Byb2dyYW06
IHRlc3QgYW4gYXJsLWluZGV4ZWQgY29uc3RhbnQgYmV0d2VlbiBzdGF0ZSB2YXJzCmdsLTMuMDog
dGVzdCB0aGF0IGJ1aWx0LWluIHVuaWZvcm1zIGZvbGxvdyBzdGF0ZSBjaGFuZ2VzCmdsLTEuMDog
dGVzdCB0aGF0IGxpZ2h0aW5nIGZvbGxvd3Mgc3RhdGUgY2hhbmdlcyBiZXR3ZWVuIGRyYXdzCmVn
bDogYWRkIGVnbC1zaGFyZWQtZ2VuYnVmZmVycy1jaHVybgpnbC0xLjU6IGFkZCBnZW4tYnVmZmVy
cy11bmlxdWUKYXJiX3ZlcnRleF9hdHRyaWJfNjRiaXQ6IHVzZSBHTFNMIDEuNDAgaW4gb3Zlcmxh
cHBpbmctbG9jYXRpb25zCmRlcHRoLWNsZWFyLXByZWNpc2lvbi1jaGVjazogZG9uJ3Qgc2hpZnQg
YSAzMi1iaXQgbG9uZyBieSAzMgpmYm8tZ2VuZWF0ZW1pcG1hcC1mb3JtYXRzOiByZXR1cm4gd2Fy
biBpZiByZXN1bHRzIGRvbid0IG1hdGNoCndnbDogdGVzdCB0aGF0IHdvcmsgaW4gYSBzaGFyZWQg
Y29udGV4dCBpcyB2aXNpYmxlIGFmdGVyIHdnbE1ha2VDdXJyZW50CmV4dF90cmFuc2Zvcm1fZmVl
ZGJhY2s6IEFkZCBwcmltZ2VuIGNsZWFyIHF1ZXJ5IHRlc3QKZXh0X21zcnR0MjogdGVzdCBkcmF3
aW5nIGFmdGVyIGEgc2Npc3NvcmVkIGRlcHRoIGNsZWFyCmdsLTEuMDogdGVzdCBsaW5lIGxvb3Bz
IHRoYXQgc3BhbiBhbiBpbW1lZGlhdGUgbW9kZSBidWZmZXIgZmx1c2gKYXJiX2dwdV9zaGFkZXJf
ZnA2NDogdXNlIEdMU0wgMS40MCBpbiBub24tdW5pZm9ybS1jb250cm9sLWZsb3cgdGVzdHMKdGV4
dHVyZUdhdGhlcjogYWNjZXB0IEdMX0FSQl90ZXh0dXJlX3N3aXp6bGUgYW5kIEdMIDMuMwp0ZXh0
dXJlR2F0aGVyOiB1c2UgR0xTTCAxLjQwIGluIGNvcmUgcHJvZmlsZSBjb250ZXh0cwpzaGFkZXJf
cnVubmVyOiBza2lwIGRlcHJlY2F0ZWQgdmFyeWluZyBsaW1pdCBxdWVyeSBpbiBGQyBjb250ZXh0
cwp0ZXh0dXJpbmc6IHRlc3QgYSAzZCB0ZXh0dXJlIG92ZXIgMSBnYiBvbiBhIGdwdSB3aXRoIHBs
ZW50eSBvZiBtZW1vcnkKd2dsOiB0ZXN0IHRoYXQgQ2hvb3NlUGl4ZWxGb3JtYXQgZm9yIGEgd2lu
ZG93IHBpY2tzIGEgd2luZG93IGZvcm1hdApnbHg6IHRlc3QgdGhhdCByZWFkaW5nIHRoZSBiYWNr
IGJ1ZmZlciBhZnRlciBhIHN3YXAga2VlcHMgdGhlIHdpbmRvdwpvdnJfbXVsdGl2aWV3X211bHRp
c2FtcGxlZF9yZW5kZXJfdG9fdGV4dHVyZTogYWRkIHRlc3RzCm92cl9tdWx0aXZpZXcyOiBhZGQg
cmVuZGVyIGFuZCBnbGVzIGNvbXBpbGVyIHRlc3RzCm92cl9tdWx0aXZpZXc6IGFkZCBhcGksIHJl
bmRlciwgYW5kIGRyYXcgZXJyb3IgdGVzdHMgZm9yIGdsIGFuZCBnbGVzCmV4dF9tc3J0dDI6IGFk
ZCBjb25mb3JtYW5jZSB0ZXN0cwpleHRfbXNydHQ6IGNoZWNrIGNsZWFyX2NvbG9yX2FuZF9kZXB0
aCdzIGRlcHRoIGJ5IGRyYXdpbmcKZXh0X21zcnR0OiBjYWxsIFJlbmRlcmJ1ZmZlclN0b3JhZ2VN
dWx0aXNhbXBsZUVYVCBpbiBjbGVhcl9jb2xvcl9hbmRfZGVwdGgKZXh0X21zcnR0OiBhZGQgY29u
Zm9ybWFuY2UgdGVzdHMKZXh0X21zcnR0OiBydW4gY2xlYXJfY29sb3JfYW5kX2RlcHRoCnV0aWw6
IGFkZCBwaWdsaXRfZGlzcGF0Y2hfcmVzb2x2ZV9leHRlbnNpb25fZnVuY3Rpb24KdXRpbDogbG9v
ayB1cCBnbGVzIGZ1bmN0aW9ucyBpbiBvcGVuZ2wzMiBvbiB3aW5kb3dzCmNtYWtlOiBhbGxvdyBn
bGVzIHRlc3RzIG9uIHdpbmRvd3MKZ2x4OiB0ZXN0IHRoYXQgdGhlIG1haW4gZmJjb25maWcgdHlw
ZXMgZXhpc3QKY2w6IGFkZCBhIHRlc3QgdGhhdCByZWFkcyBhIGtlcm5lbCByZXN1bHQgYmFjayB0
aHJvdWdoIGEgbWFwCmdseDogdGVzdCBmbHVzaGluZyB0aGUgZnJvbnQgYnVmZmVyIGFnYWluIGFm
dGVyIGEgc3dhcApnbC0xLjA6IHRlc3QgcmVhZGluZyB0aGUgZnJvbnQgYnVmZmVyIHdoaWxlIGRy
YXdpbmcgdGhlIG5leHQgZnJhbWUKZ2wtMS4wOiB0ZXN0IGRyYXdpbmcgdG8gdGhlIGZyb250LCB0
aGUgYmFjaywgYW5kIGJvdGggd2l0aG91dCBzd2FwcGluZwphcmJfZnJhbWVidWZmZXJfb2JqZWN0
OiB0ZXN0IHJlYWRzIGFmdGVyIGEgc2FtcGxlZCB0ZXh0dXJlIGlzIHJlZHJhd24KZXh0X21zcnR0
OiBhZGQgYSByZXByb2R1Y2VyIGZvciBtZXNhIzE2NTUwCmFyYl92ZXJ0ZXhfYnVmZmVyX29iamVj
dDogYWRkIGEgcmVwcm9kdWNlciBmb3IgbWVzYSMxNjU0NwpkcmF3b3ZlcmhlYWQ6IEFkZCB1bmFs
aWduZWQgVkJPIG9mZnNldCBhbmQgc3RyaWRlIHN1YnRlc3RzCmVnbC1hcmItc3luYy1zaGFyZWQt
Y29udGV4dDogYWRkIGEgd3JpdGUtdW5mbHVzaGVkIG1vZGUKYXJiX3N5bmM6IGFkZCBhIGZsdXNo
LXJlYWRiYWNrIHN0cmVzcyB0ZXN0CmFyYl9zeW5jOiBhZGQgYSBwZW5kaW5nLXN5bmMgbW9kZSB0
byBvbGQtc3luYyBhbmQgYSBzeW5jIGNodXJuIHRlc3QKYXJiX3N5bmM6IGFkZCB0ZXN0cyB0aGF0
IHdhaXRzIGRvIG5vdCByZXR1cm4gYmVmb3JlIHRoZSBHUFUgaXMgZG9uZQp0ZXh0dXJpbmc6IGFk
ZCB0ZXhzdWJpbWFnZS1yb3ctbGVuZ3RoLWJvdW5kcyB0ZXN0Ci0tLQogLi4uby1ub3Qtb2J0YWlu
LXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgIDQgKy0tCiAuLi5hZGVyX3J1bm5lci1L
ZWVwLXN0cmNoci1yZXN1bHQtY29uc3QucGF0Y2ggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggfCAgMiArLQogLi4u
LXJlcHJvZHVjaWJsZV9tdGltZS1zaG91bGQtYmUtYW4taW50LnBhdGNoIHwgIDYgKy0tLQogLi4u
cHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIHwgIDQgKy0tCiAuLi50
LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAgMiArLQogbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiICAgIHwgIDMgKy0KIDcgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXNoYWRlcl9ydW5u
ZXItS2VlcC1zdHJjaHItcmVzdWx0LWNvbnN0LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0
YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQt
c2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IDMzM2U1YTI4YzMuLjg0YTVhNTg3ZTYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0
cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRv
LW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQ1YmQ3NTMyODA1N2IxOTI4NmUyMTA2NmE2OWEwNDZjY2NiNmFmMmEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGFlYzA2NDgxMGUxNjU5YWIzZDAxZmUzZmYzM2NlYTY3YTEw
OGZhOGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIw
MAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5k
LXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQg
Yi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOTExNWQzYzc5Li45M2M2ZmQ0NGMgMTAwNjQ0CitpbmRl
eCBlZTU0OTgxMDUuLjUyMjllMDBlMSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysg
Yi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwxMSArMjExLDcgQEAgaWYoUElHTElUX1VTRV9XQVlM
QU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS1zaGFkZXJfcnVubmVyLUtlZXAtc3RyY2hyLXJlc3VsdC1jb25zdC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtc2hhZGVyX3J1bm5lci1LZWVwLXN0cmNo
ci1yZXN1bHQtY29uc3QucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDNlMWE1
Nzk2OTEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS1zaGFkZXJfcnVubmVyLUtlZXAtc3RyY2hyLXJlc3VsdC1jb25zdC5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDMxICswLDAgQEAKLUZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3Mu
cXVhbGNvbW0uY29tPgotRGF0ZTogU2F0LCAyNCBPY3QgMjAyNiAxMDowMDowMCAtMDcwMAotU3Vi
amVjdDogW1BBVENIXSBzaGFkZXJfcnVubmVyOiBLZWVwIHN0cmNocigpIHJlc3VsdCBjb25zdAot
Ci1UaGUgaW5jbHVkZSBwYXRoIHBhcnNpbmcgd2Fsa3MgYSBjb25zdCBjaGFyIGN1cnNvciBhbmQg
c3RvcmVzIHRoZQotcmVzdWx0IG9mIHN0cmNocigpIGluIGEgcGxhaW4gY2hhciBwb2ludGVyLiBT
aW5jZSBnbGliYyAyLjQzLCBzdHJjaHIoKQotcHJlc2VydmVzIHRoZSBjb25zdCBxdWFsaWZpZXIg
b2YgaXRzIGFyZ3VtZW50IHdoZW4gQzIzIGZlYXR1cmVzIGFyZQotZW5hYmxlZCwgd2hpY2ggX0dO
VV9TT1VSQ0UgZG9lcywgc28gY2xhbmcgZmFpbHMgdGhlIGJ1aWxkOgotCi0gIHRlc3RzL3NoYWRl
cnMvc2hhZGVyX3J1bm5lci5jOjE2NjU6MTA6IGVycm9yOiBpbml0aWFsaXppbmcgJ2NoYXIgKicg
d2l0aCBhbiBleHByZXNzaW9uIG9mIHR5cGUgJ2NvbnN0IGNoYXIgKicgZGlzY2FyZHMgcXVhbGlm
aWVycyBbLVdlcnJvciwtV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzLWRpc2NhcmRzLXF1YWxp
ZmllcnNdCi0KLWxpbmVfZW5kIGlzIG9ubHkgcmVhZCwgc28gZGVjbGFyZSBpdCBjb25zdC4KLQot
VXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL3BpZ2xpdC8tL21lcmdlX3JlcXVlc3RzLzEyODFdCi1TaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KLS0tLQotIHRlc3RzL3NoYWRlcnMvc2hh
ZGVyX3J1bm5lci5jIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvc2hhZGVycy9zaGFkZXJfcnVubmVyLmMg
Yi90ZXN0cy9zaGFkZXJzL3NoYWRlcl9ydW5uZXIuYwotLS0tIGEvdGVzdHMvc2hhZGVycy9zaGFk
ZXJfcnVubmVyLmMKLSsrKyBiL3Rlc3RzL3NoYWRlcnMvc2hhZGVyX3J1bm5lci5jCi1AQCAtMTY2
Miw3ICsxNjYyLDcgQEAgbGVhdmVfc3RhdGUoZW51bSBzdGF0ZXMgc3RhdGUsIGNvbnN0IGNoYXIg
KmxpbmUsIGNvbnN0IGNoYXIgKnNjcmlwdF9uYW1lKQotIAotIAkJY3Vyc29yID0gc2hhZGVyX3N0
cmluZzsKLSAJCWZvciAodW5zaWduZWQgaSA9IDA7IGkgPCBudW1fc2hhZGVyX2luY2x1ZGVfcGF0
aHM7IGkrKykgewotLQkJCWNoYXIgKmxpbmVfZW5kID0gc3RyY2hyKGN1cnNvciwgJ1xuJyk7Ci0r
CQkJY29uc3QgY2hhciAqbGluZV9lbmQgPSBzdHJjaHIoY3Vyc29yLCAnXG4nKTsKLSAJCQl1bnNp
Z25lZCBwYXRoX2xlbiA9IGxpbmVfZW5kIC0gY3Vyc29yIC0gMTsKLSAJCQljaGFyICpwYXRoID0g
bWFsbG9jKHBhdGhfbGVuICsgMSk7Ci0gCQkJcGF0aFtwYXRoX2xlbl0gPSAnXDAnOwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1ub19l
cnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1ub19lcnJvci5weS1tb2RpZnkt
X2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCmluZGV4IDUxZjlkODlkNTMuLjFhNTA3MTll
ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLW5vX2Vy
cm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1hbmQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGQ2NTg0YTM5Y2Y0Nzc1OTAwN2RmZDU4MjM1YmM0ODg4NzExMDQ5NDYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJiMmMyMDY0YTNhNTUxOWRmMzE0Nzg1OTI2MTc5MDIy
YjY0OTA0YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVGh1LCAyMiBNYXkgMjAyNSAxNzozNDoxNSAr
MDIwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9ub19lcnJvci5weTogbW9kaWZ5IF9jb21tYW5k
IGFuZCBub3QgY29tbWFuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMS10ZXN0cy1zZXJpYWxpemVyLXJlcHJvZHVjaWJsZV9tdGltZS1zaG91bGQt
YmUtYW4taW50LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1zZXJpYWxpemVyLXJlcHJvZHVjaWJsZV9tdGltZS1zaG91bGQtYmUtYW4taW50LnBh
dGNoCmluZGV4IDQ1NzhjMjk2YjAuLmUyYzhmNWY3YjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtc2VyaWFsaXplci1yZXByb2R1Y2li
bGVfbXRpbWUtc2hvdWxkLWJlLWFuLWludC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLXNlcmlhbGl6ZXItcmVwcm9kdWNpYmxlX210aW1l
LXNob3VsZC1iZS1hbi1pbnQucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDU4YTViZWE1NWE1
Zjc5NzI0NjIxMjRlN2E4ZjFiMTk3MWFkNTQ4M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDg3OTRkYTk2YWNkYmM5ODgwMWNjOTExNTQxZDdiMmQ0MjM3OWZlMjQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERh
dGU6IFRodSwgMjIgT2N0IDIwMjYgMTQ6MDk6MDggKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHMvc2VyaWFsaXplcjogcmVwcm9kdWNpYmxlX210aW1lIHNob3VsZCBiZSBhbiBpbnQKLVgtQVJN
LU5vLUZvb3RlcjogTm9EaXNjbGFpbWVyCiAKIFRoZSBtdGltZSBhcmd1bWVudCBpcyBhbiBpbnRl
Z2VyIG5vdCBhIHN0cmluZywgc28gcGFyc2UgaXQgd2l0aCBpbnQoKS4KIApAQCAtMjgsNiArMjcs
MyBAQCBpbmRleCA1ZWU5YTE1NzguLmY3ZmRhZGY0MyAxMDA2NDQKICAgICAgd2l0aCBnemlwLkd6
aXBGaWxlKG91dGZpbGUsICd3YicsIG10aW1lPXJlcHJvZHVjaWJsZV9tdGltZSkgYXMgZjoKICAg
ICAgICAgIHRyZWUud3JpdGUoZiwgZW5jb2Rpbmc9J3V0Zi04JywgeG1sX2RlY2xhcmF0aW9uPVRy
dWUpCiAgCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMt
dmFyaWFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAy
LWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5k
ZXggOWEyNTE4NTY1MS4uZDEwNzRkMzdjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9E
SVJTLXZhcmlhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWE2NWYxOGMzMzZjYTEzZmNiZjhlN2ExNzkzNzVh
OTQ0N2E5NTI4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjYzMWZjZmQxMWU0YTg1
MmY0NmMzZDAyMDBkODM5OTU1MDg0ODM3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFBhc2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3Qg
MjAxOCAxNDo0MzoxNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBX
QVlMQU5EX0lOQ0xVREVfRElSUyB2YXJpYWJsZQpAQCAtMTUsNyArMTUsNyBAQCBVcHN0cmVhbS1T
dGF0dXM6IFN1Ym1pdHRlZCBbcGlnbGl0QGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rl
c3RzL3V0aWwvQ01ha2VMaXN0cy50eHQgYi90ZXN0cy91dGlsL0NNYWtlTGlzdHMudHh0Ci1pbmRl
eCBmOWJmZWM1NTUuLjA3YjgyMTM3NSAxMDA2NDQKK2luZGV4IDMxYjE2OTc4Yy4uYTU1NDkxNDBi
IDEwMDY0NAogLS0tIGEvdGVzdHMvdXRpbC9DTWFrZUxpc3RzLnR4dAogKysrIGIvdGVzdHMvdXRp
bC9DTWFrZUxpc3RzLnR4dAogQEAgLTk3LDcgKzk3LDcgQEAgaWYoUElHTElUX1VTRV9XQUZGTEUp
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRl
c3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGln
bGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKaW5kZXggZTQ2OWEw
OWEzZC4uYzY0ZDVkZDk5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUt
YnVpbGQtcGF0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBh
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWJjYTFiOTUyZjgzMGRjZDdjYjU3YTNmOTBh
OWNiMWNjZDY1YTYzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDQ5NTE3YzlmZTdi
M2VjODIyZTc5N2U1NGY0Y2FlM2YwYmRiMGEzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVl
LCAxMCBOb3YgMjAyMCAxNzoxMzo1MCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy91dGls
L3BpZ2xpdC1zaGFkZXIuYzogZG8gbm90IGhhcmRjb2RlIGJ1aWxkIHBhdGggaW50bwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCmluZGV4IDdjNmEwYjRkNDUuLjcx
YTEwZmY4ZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIK
QEAgLTEyLDExICsxMiwxMCBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICBm
aWxlOi8vMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1w
YXRoLWZyLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtbm9fZXJyb3IucHkt
bW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXRlc3RzLXNlcmlhbGl6ZXItcmVwcm9kdWNpYmxlX210aW1lLXNob3VsZC1iZS1hbi1p
bnQucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1zaGFkZXJfcnVubmVyLUtlZXAtc3Ry
Y2hyLXJlc3VsdC1jb25zdC5wYXRjaCBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NP
TU1JVFMgPSAiMSIKIAotU1JDUkVWID0gImY3M2MyYjU1NGU1NjVkNmVlM2ZhMmEzMzFjNjAyMzYx
NDFhNzM3NjgiCitTUkNSRVYgPSAiZWRmNzczODIzMTIwYzMyZjg0YzY2N2U5NjEwZDIxYjFkMGFh
OGQ0MiIKICMgKHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQog
UFYgPSAiMS4wK2dpdHIiCiAKLS0gCjIuNDcuMQoK

--===============6471760707639311097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch file://0001-shader_runner-Keep-strchr-result-const.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch"
packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+f73c2b554e-r0'])", added "piglit (['= 1.0+gitr0+edf7738231-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+f73c2b554e-r0'])", added "piglit-dev (['= 1.0+gitr0+edf7738231-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2060394300 to 2061376776 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/tc-renderpass-info /usr/lib/piglit/bin/arb_framebuffer_object-read-after-sampled-redraw /usr/lib/piglit/bin/gl-1.5-gen-buffers-unique /usr/lib/piglit/bin/egl-shared-genbuffers-churn /usr/lib/piglit/bin/ovr_multiview-render-gles /usr/lib/piglit/bin/ext_multisampled_render_to_texture-valid-usage /usr/lib/piglit/bin/arb_vertex_buffer_object-subdata-after-format-change /usr/lib/piglit/bin/arb_sync-sync-churn /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-api /usr/lib/piglit/bin/ext_multisampled_render_to_texture-queries /usr/lib/piglit/bin/ext_multisampled_render_to_texture-draw-after-other-framebuffer /usr/lib/piglit/bin/arb_sync-flush-readback /usr/lib/piglit/bin/glx-fbconfig-main-types /usr/lib/piglit/bin/ovr_multiview-draw-errors-gles /usr/lib/piglit/bin/arb_sync-wait-completes /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-valid-usage /usr/lib/piglit/bin/texsubimage-row-length-bounds 
 /usr/lib/piglit/bin/gl-1.0-lighting-state-updates /usr/lib/piglit/bin/ext_multisampled_render_to_texture-completeness /usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-view-id.vert /usr/lib/piglit/bin/glx-front-flush-after-swap /usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-other-static-dependence.vert /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/es-300-view-id.frag /usr/lib/piglit/bin/arb_sync-old-sync /usr/lib/piglit/bin/ovr_multiview-render /usr/lib/piglit/bin/ext_transform_feedback-primgen-clear /usr/lib/piglit/bin/glx-read-back-after-swap /usr/lib/piglit/bin/egl-arb-sync-shared-context /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-texture-partial-clear /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-renderbuffer-preserved /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/es-300-other-static-dependence.vert /usr/lib/piglit/bin/ext_multisampled_render_to_texture-framebuffer-targets /usr/lib/piglit/bin/ext_multisampled_render_t
 o_texture2-mrt /usr/lib/piglit/bin/tex3d-over-1gb /usr/lib/piglit/bin/ovr_multiview-draw-errors /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-stencil-texture /usr/lib/piglit/bin/gl-3.0-builtin-uniform-updates /usr/lib/piglit/bin/ovr_multiview-api-gles /usr/lib/piglit/bin/ext_multisampled_render_to_texture-implicit-resolve /usr/lib/piglit/bin/ovr_multiview2-render-gles /usr/lib/piglit/tests/spec/arb_vertex_program/vp-arl-state-const-array.shader_test /usr/lib/piglit/bin/ext_multisampled_render_to_texture-api-errors /usr/lib/piglit/bin/gl-1.0-begin-end-line-loop /usr/lib/piglit/bin/ext_multisampled_render_to_texture-render /usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-view-id-without-extension.vert /usr/lib/piglit/bin/ovr_multiview2-render /usr/lib/piglit/bin/ovr_multiview_multisampled_render_to_texture-api /usr/lib/piglit/bin/ext_multisampled_render_to_texture-depth-stencil /usr/lib/piglit/bin/ovr_multiview_multisampled_render_to_texture-render /usr/lib/pig
 lit/bin/gl-1.0-read-front-after-swap /usr/lib/piglit/bin/gl-1.0-front-back-interleave /usr/lib/piglit/bin/ext_mesh_shader-continue-after-resolve /usr/lib/piglit/bin/ovr_multiview-api"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231

--===============6471760707639311097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="piglit-changelog.txt"

Convert other arb_shader_image_load_store tests to support GL3.1.
arb_shader_image_load_store/semantics.c: Drop hard req on cube_map_array.
arb_shader_image_size: Add support for desktop GL3.1.
arb_texture_buffer_object: skip image subtests without compute program
rasterpos: test a vertex shader linked with a fragment shader
Add an AGENTS.md file of piglit norms for agents writing tests.
ci: add macOS build job
pixel-local-storage: modify blend_or_dither to not write first PLS variable
pixel-local-tests: add a sanity check to verify color with blend/dither
pixel-local-tests: fix return from blend_or_dither tests
arb_framebuffer_object: accept GL 3.0 in negative-readpixels-no-rb
arb_copy_buffer: accept GL 3.1 without the extension
arb_texture_buffer_object: accept GL 3.1 in more tests
texelFetch/textureSize: don't require extensions promoted to core
shader_runner: Keep strchr() result const
ext_mesh_shader: add continue-after-resolve
general: add tc-renderpass-info
blit-scaled-linear: increase tolerance error
texturing: fix unused shader sources in texsubimage-row-length-bounds
arb_texture_multisample: accept GL 3.2 in minmax
arb_vertex_program: test an arl-indexed constant between state vars
gl-3.0: test that built-in uniforms follow state changes
gl-1.0: test that lighting follows state changes between draws
egl: add egl-shared-genbuffers-churn
gl-1.5: add gen-buffers-unique
arb_vertex_attrib_64bit: use GLSL 1.40 in overlapping-locations
depth-clear-precision-check: don't shift a 32-bit long by 32
fbo-geneatemipmap-formats: return warn if results don't match
wgl: test that work in a shared context is visible after wglMakeCurrent
ext_transform_feedback: Add primgen clear query test
ext_msrtt2: test drawing after a scissored depth clear
gl-1.0: test line loops that span an immediate mode buffer flush
arb_gpu_shader_fp64: use GLSL 1.40 in non-uniform-control-flow tests
textureGather: accept GL_ARB_texture_swizzle and GL 3.3
textureGather: use GLSL 1.40 in core profile contexts
shader_runner: skip deprecated varying limit query in FC contexts
texturing: test a 3d texture over 1 gb on a gpu with plenty of memory
wgl: test that ChoosePixelFormat for a window picks a window format
glx: test that reading the back buffer after a swap keeps the window
ovr_multiview_multisampled_render_to_texture: add tests
ovr_multiview2: add render and gles compiler tests
ovr_multiview: add api, render, and draw error tests for gl and gles
ext_msrtt2: add conformance tests
ext_msrtt: check clear_color_and_depth's depth by drawing
ext_msrtt: call RenderbufferStorageMultisampleEXT in clear_color_and_depth
ext_msrtt: add conformance tests
ext_msrtt: run clear_color_and_depth
util: add piglit_dispatch_resolve_extension_function
util: look up gles functions in opengl32 on windows
cmake: allow gles tests on windows
glx: test that the main fbconfig types exist
cl: add a test that reads a kernel result back through a map
glx: test flushing the front buffer again after a swap
gl-1.0: test reading the front buffer while drawing the next frame
gl-1.0: test drawing to the front, the back, and both without swapping
arb_framebuffer_object: test reads after a sampled texture is redrawn
ext_msrtt: add a reproducer for mesa#16550
arb_vertex_buffer_object: add a reproducer for mesa#16547
drawoverhead: Add unaligned VBO offset and stride subtests
egl-arb-sync-shared-context: add a write-unflushed mode
arb_sync: add a flush-readback stress test
arb_sync: add a pending-sync mode to old-sync and a sync churn test
arb_sync: add tests that waits do not return before the GPU is done
texturing: add texsubimage-row-length-bounds test

--===============6471760707639311097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+f73c2b554e-r0'])", added "piglit (['= 1.0+gitr0+edf7738231-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+f73c2b554e-r0'])", added "piglit-dev (['= 1.0+gitr0+edf7738231-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-view-id.vert /usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-view-id-without-extension.vert /usr/lib/piglit/bin/gl-1.0-front-back-interleave /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-valid-usage /usr/lib/piglit/bin/tc-renderpass-info /usr/lib/piglit/bin/ext_multisampled_render_to_texture-framebuffer-targets /usr/lib/piglit/bin/ovr_multiview-draw-errors-gles /usr/lib/piglit/bin/ovr_multiview_multisampled_render_to_texture-api /usr/lib/piglit/bin/egl-shared-genbuffers-churn /usr/lib/piglit/bin/ext_multisampled_render_to_texture-api-errors /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-renderbuffer-preserved /usr/lib/piglit/bin/arb_sync-flush-readback /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-stencil-texture /usr/lib/piglit/bin/ext_mesh_shader-continue-after-resolve /usr/lib/piglit/bin/ext_multisampled_render_to_
 texture-valid-usage /usr/lib/piglit/bin/arb_sync-wait-completes /usr/lib/piglit/bin/arb_vertex_buffer_object-subdata-after-format-change /usr/lib/piglit/bin/gl-3.0-builtin-uniform-updates /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-depth-texture-partial-clear /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/es-300-view-id.frag /usr/lib/piglit/bin/texsubimage-row-length-bounds /usr/lib/piglit/bin/ext_multisampled_render_to_texture-completeness /usr/lib/piglit/bin/arb_sync-old-sync /usr/lib/piglit/bin/ovr_multiview-render-gles /usr/lib/piglit/bin/glx-fbconfig-main-types /usr/lib/piglit/bin/glx-front-flush-after-swap /usr/lib/piglit/bin/arb_sync-sync-churn /usr/lib/piglit/bin/gl-1.0-lighting-state-updates /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/es-300-other-static-dependence.vert /usr/lib/piglit/bin/ovr_multiview-api /usr/lib/piglit/bin/gl-1.0-begin-end-line-loop /usr/lib/piglit/bin/ext_multisampled_render_to_texture-depth-stencil /usr/lib/piglit/bin/ovr_multiv
 iew-draw-errors /usr/lib/piglit/bin/egl-arb-sync-shared-context /usr/lib/piglit/tests/spec/arb_vertex_program/vp-arl-state-const-array.shader_test /usr/lib/piglit/bin/ovr_multiview-render /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-mrt /usr/lib/piglit/bin/gl-1.0-read-front-after-swap /usr/lib/piglit/bin/ovr_multiview_multisampled_render_to_texture-render /usr/lib/piglit/bin/ext_multisampled_render_to_texture-queries /usr/lib/piglit/bin/ext_transform_feedback-primgen-clear /usr/lib/piglit/bin/arb_framebuffer_object-read-after-sampled-redraw /usr/lib/piglit/bin/glx-read-back-after-swap /usr/lib/piglit/bin/ext_multisampled_render_to_texture-implicit-resolve /usr/lib/piglit/bin/gl-1.5-gen-buffers-unique /usr/lib/piglit/bin/ext_multisampled_render_to_texture-render /usr/lib/piglit/bin/tex3d-over-1gb /usr/lib/piglit/bin/ext_multisampled_render_to_texture-draw-after-other-framebuffer /usr/lib/piglit/tests/spec/ovr_multiview/compiler/es-300-other-static-dependence.vert /usr/lib/
 piglit/bin/ovr_multiview2-render /usr/lib/piglit/bin/ext_multisampled_render_to_texture2-api /usr/lib/piglit/bin/ovr_multiview-api-gles /usr/lib/piglit/bin/ovr_multiview2-render-gles"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+f73c2b554e to 1.0+gitr0+edf7738231

--===============6471760707639311097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-eaf63b5480deb99ae7f19e2c1ccf01403333d81e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:eaf63b5480deb99ae7f19e2c1ccf01403333d81e"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 313 Local 300 Mirrors 0 Missed 13 Current 980 (95% match, 98% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 11 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2519 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: Running task 3055 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_create_recipe_spdx)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_recipe_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 3089 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 3090 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 3091 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 3092 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3093 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 3094 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f69651fb7b6a8b0f354cb0f4b252c99239c32a6fb84498a8a51ce367653b8d73
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3095 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 3096 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3097 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3098 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3099 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 33e9213e3a14d1baf53d98c2a958ceab3e0943c40f2de19ffcd76b19d2c46ca2
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3100 of 3107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3100 tasks of which 3086 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113060516.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113060516.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2028554
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+f73c2b554e-r0 to 0:1.0+gitr0+edf7738231-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2028554
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============6471760707639311097==--
