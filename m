Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E987CD4F29
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2351.1762384574631610807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=O003RZjA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=S8CWOtHw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564edc7d-81047105-8620-4231-82ac-64aa6931880b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ILuIUuY7nVrFHbF/oJqB0wT53Lrl1jmQUDoZKCTVVs0=;
	b=O003RZjAGX8W46JpZ3cxIJzCcuRrUuL3ORCOlvVPq0WVmaJiyyOQOwqaMPts/ed+
	99xABPECU6XNGq1cOa89u0KgbvuoEUy0gEFjgEtLiUqZY/rd7ccRTtV2suV2I9dPOTn
	OdifdfQmeNCOLFQtdOgEC/P6i6fiwcCNc2sVU1Mk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ILuIUuY7nVrFHbF/oJqB0wT53Lrl1jmQUDoZKCTVVs0=;
	b=S8CWOtHwnL0BAHJmHGJr07BriN1NzleUwzTuKbCDWTWyKUf47Nd8OTvDLMThFjFu
	WwVqFRYnNnAawGD6gjzSPeK5NPPFS1McLvYQO32+5ydl7WzcLiBZhTZtwNCVxQmsjA1
	WE7Iwoj21tZzKRqYNK5RjhHHgaGPI1VYEdYvZvtg=
Content-Type: multipart/mixed; boundary="===============5100370778396345808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 5309e3401d6b03e8a0bb7bfdc1e0f5bc1ad754af
 SUCCEEDED
Message-ID: <0101019a564edc7d-81047105-8620-4231-82ac-64aa6931880b-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225890

--===============5100370778396345808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *5309e3401d6b03e8a0bb7bfdc1e0f5bc1ad754af* has Succeeded.

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
From 6961b53385ca02227ffe6deeee511c3193bab0ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:55:51 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...MakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch    | 2 +-
 ...ests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 ...1-tests-no_error.py-modify-_command-and-not-command.patch | 5 +----
 ...0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...ests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                   | 2 +-
 7 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 6ce2348a71..d1381ebc89 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From 8d7a88c72f3e18d481c9cfc92053952200dec35b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 99ae07a4a..d5ee9cc22 100644
+index 147bd8e17..ffc910354 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 9751b20673..728db66148 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
+From 5bfb35c1a532d62d6052296461639ae2a821d885 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..c54537fe6b 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From f6a4c8152d1a39470d9de91771670869a16f5724 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index f8600556e5..bde9b8282e 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 846efe923932d66810305b228fa09f83a172296d Mon Sep 17 00:00:00 2001
+From 267bd456fe58e7b298b0c1acf8bd76d9e03909d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
@@ -27,6 +27,3 @@ index 4ecaa9a01..c64eec0a1 100644
          profile.test_list['{} khr_no_error'.format(name)] = test
 -        test.command += ['-khr_no_error']
 +        test._command += ['-khr_no_error']
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..fda386cc88 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From 3041ecd9b659224cfb3545b0347006c76ae91870 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..56a97467aa 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From 3ed2bdc3c59f9013e4b6c33433f367c46625aa95 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 060e287f26..bfa69b1414 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
+SRCREV = "5309e3401d6b03e8a0bb7bfdc1e0f5bc1ad754af"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============5100370778396345808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit (['= 1.0+gitr0+5309e3401d-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit-dev (['= 1.0+gitr0+5309e3401d-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/shaders/ssa/fs-if-def-else-break.shader_test", added "/usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/shared-uint-atomic-mem-functions.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec2-i64vec2-bvec2.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec4-i64vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/tests/spec/glsl-1.50/linker/instance-matching-uniform-blocks-member-name-mismatch-varying-opt.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-03.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat3x2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/basic-fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader
 _trinary_minmax/execution/built-in-functions/fs-min3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec2-vec2-vec2.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-basic /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-eq-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec4.shader_test /us
 r/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-function
 s/fs-op-mult-mat2-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec4-vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec2-vec2-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/
 built-in-functions/fs-mix-int64_t-int64_t-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/unsized-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in
 -functions/fs-op-bitxor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_
 spirv/execution/component-layout-vs-gs-fs-double.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-float-float.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-sample-shading /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat3x4.shader_test /usr/lib/piglit/bin/arb_gl_spirv-sample-position /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/bui
 lt-in-functions/fs-op-sub-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-upper-left.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-drawid.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-large-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-uint.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-05.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-06.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-
 in-functions/fs-clamp-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec4.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-07.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-02.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-04.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-or-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions
 /fs-clamp-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built
 -in-functions/fs-op-rshift-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-half.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/array.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-render-rgb24 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-simple-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-not-bool.shader_test /usr/lib/pig
 lit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_
 spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-matrices-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_t
 est /usr/lib/piglit/tests/spec/arb_gl_spirv/linker/simple-function-call.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_in
 t64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec3-uvec3.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-int64_t-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-vertex-id.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/sso-block-member-layout-location.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exec
 ution/built-in-functions/fs-exp2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec3-vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec3.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/executi
 on/built-in-functions/fs-op-add-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec4.shader_test /usr/lib/piglit/generated_tests
 /spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec4.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-geometry.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec3.shader_test /usr/
 lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-lower-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv
 /glsl-1.10/execution/built-in-functions/fs-greaterThan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec3-vec3.shader_test /usr/lib/piglit/generated_test
 s/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cross-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_sp
 irv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/a
 rb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec2-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec3-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec4-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/
 built-in-functions/fs-equal-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat4.shader_test /usr/lib/piglit/generated_tests/spec/ar
 b_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-queries.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-array-types.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec4.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/bin/glx-multithread-buffer-busy-tracking-bug /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-xor-bool-bool.shader_test /usr/lib/pigli
 t/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-mat3.shader_test /usr/lib/piglit/generated_tests/sp
 ec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/function-call-glslang-issue-1285.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat4.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-multisampling /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uint-uint.shader_test /
 usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-04.shader_test /usr
 /lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-05.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-1.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-2.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-3.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-float-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-data-types.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_
 minmax/execution/built-in-functions/fs-mid3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ge-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-le-uint-uin
 t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ne-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-indirect.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/two-ssbo-different-layouts.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-
 in-functions/fs-op-mult-mat2x4-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec2.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-02.shader_test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-float.shader_test /usr/lib/piglit/ge
 nerated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-
 in-functions/fs-not-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec4-ivec4.shader_test /us
 r/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-float.shader_test /usr/lib/piglit/gener
 ated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/ex
 ecution/built-in-functions/fs-op-and-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec4.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i6
 4vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec4-u64vec4.shader_test /usr/lib/piglit/bin/arb_fragment_program-recompile /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-float-float-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/atomic-image.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-int-int.shader_
 test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-of-arrays-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/tes
 ts/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec2-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec3-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec4-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-uvec2.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/block.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/gs_two_invocations.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-xfb-query.shader_test /usr/lib/pig
 lit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/other-queries.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/aoa-2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/f
 s-op-ne-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/ge
 nerated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec2-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-sso-vs-gs-fs-array-interleave.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_d
 raw_parameters/vs-basevertex.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.
 10/execution/built-in-functions/fs-greaterThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/tcs-patch-vertices-in.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_s
 pirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uint-uint.shader_test /usr/lib/piglit/gene
 rated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat2x3.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat4x3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/fs.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/vs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec2-u64vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/array_of_input_output_block.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-float-float.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int
 64/execution/built-in-functions/fs-abs-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-int-int.shad
 er_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in
 -functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-gt-uint-uint.shade
 r_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/cs-basic-ssbo.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/unordered-comparison.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions
 /fs-max3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-baseinstance.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec4-i64vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-instance-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-vec2.shader_test /usr/lib/piglit/generated_
 tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat4x2.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec2-u64vec2.shader_test /usr/lib/piglit/bin/depth_clamp_quirks /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl
 -1.10/execution/built-in-functions/fs-lessThan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.sha
 der_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec2-uvec2.shader_test /usr/lib/pigli
 t/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/e
 xecution/built-in-functions/fs-inversesqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec3-i64vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat-arb.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/ar
 b_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-integer.shader_test /usr/lib/piglit/bin/glx-multi-context-ib-2 /usr/lib/piglit/generated_tests/
 spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-bool-bool.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/atomic-counter-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/ar
 b_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_sp
 irv/glsl-1.10/execution/built-in-functions/fs-reflect-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat4x2.shader_test /usr/lib/piglit/bin/egl_ext_device_persistent_id /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat2x3.shader_test /usr/lib/p
 iglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-ivec3.shader_test /usr/lib/piglit/
 generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec3.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/
 built-in-functions/fs-lessThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-
 i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv
 /arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execut
 ion/built-in-functions/fs-op-mod-int-int.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/sample-shading-fs.shader_source /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/uniform/atomic-uint-fs.shader_test /usr/lib/piglit/bin/egl_ext_device_query_name /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-nested-structs-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/ar
 b_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-scalar.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec4-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-inter
 face/xfb-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/b
 uilt-in-functions/fs-min3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/vs_two_sets_mixing_order.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3.sha
 der_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-function.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-f
 unctions/fs-asinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-float-float-float.shader_test /usr/l
 ib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-float-float.shader_test /usr/lib/pigli
 t/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec3-i64vec3.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-stages-test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu
 _shader_int64/execution/built-in-functions/fs-op-mod-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-i
 n-functions/fs-op-add-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat3.shader_test"

--===============5100370778396345808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit (['= 1.0+gitr0+5309e3401d-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22455 to 22527 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit-dev (['= 1.0+gitr0+5309e3401d-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+5309e3401d
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2054165834 to 2058886327 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/shaders/ssa/fs-if-def-else-break.shader_test", added "/usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/gs_two_invocations.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-geometry.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/vs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-
 in-functions/fs-op-ge-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec3.shader_test /usr/lib/piglit/generated_tests/spec/
 arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec4-ivec4.shader_t
 est /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec3.shader_test /usr/lib/piglit/ge
 nerated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec4.shader_test /usr/lib/piglit/bin/glx-multi-context-ib-2 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-int64_t-int64_t-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec2-vec2.shader_test /u
 sr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-simple-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-uint.shader_test /usr/lib/piglit/tests/spec/glsl-1.50/linker/instance-matching-uniform-blocks-member-name-mismatch-varying-opt.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-i
 n-functions/fs-op-rshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-matrices-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec4-vec4.
 shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec4.shader_test /usr/lib/piglit/generated_
 tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-and-bool-bool.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sm
 oothstep-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec2.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/function-call-glslang-issue-1285.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-fun
 ctions/fs-op-bitand-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-int64_t-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/cs-basic-ssbo.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-02.shader_test /usr/lib/piglit/tests/spe
 c/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-04.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-05.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-06.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-07.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec3-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_
 gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec4-i64vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec2-i64vec2-bvec2.shader_test /usr/lib/piglit/bin/arb_fragment_program-recompile /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-float.shade
 r_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/uniform/atomic-uint-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.sha
 der_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-mat2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-name-queries.shader_test /usr/lib/piglit/bin/egl_ext_device_query_name /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-fun
 ctions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-fun
 ctions/fs-fract-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-vertex-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/ex
 ecution/built-in-functions/fs-op-div-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-
 rshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat3x2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/block.shader_test /usr/lib
 /piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/unordered-comparison.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/s
 pec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ge-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-le-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ne-uint-uint.shader_test /usr/lib/piglit/bin/arb_sp
 irv_extensions-post_depth_coverage-basic /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-or-bool-bool.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/atomic-counter-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec4-vec4.shader_test /
 usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/tcs-patch-vertices-in.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec4-vec4-float.shader_test /usr/lib/piglit/generated_tests/s
 pec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec2-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec3-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/two-ssbo-different-layouts.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec4.shader_test /usr/lib/piglit/gene
 rated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-integer.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/b
 uilt-in-functions/fs-op-mult-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div
 -u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_
 spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-float-float-float.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-sample-shading /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat-arb.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/g
 lsl-1.30/execution/built-in-functions/fs-op-mod-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-of-arrays-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-v
 ec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-nested-structs-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec3-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/sample-shading-fs.shader_source /usr/lib/piglit/generated_t
 ests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec2-vec2.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec2-ivec2.shader_test /usr/lib/p
 iglit/tests/spec/arb_gl_spirv/execution/varying/all-stages-test.shader_test /usr/lib/piglit/bin/glx-multithread-buffer-busy-tracking-bug /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec3-i64vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-
 max-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec2-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-other-queries.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-02.shader_test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec2-u64vec2.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/
 built-in-functions/fs-op-lt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec2-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec3-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec4-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec3-vec3.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-drawid.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-ivec3.shader_t
 est /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3-vec3.shader_test /usr/lib/piglit/tests
 /spec/arb_gl_spirv/execution/origin-lower-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-xor-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec2.
 shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-not-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr
 /lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-multisampling /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i
 nt64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec4-ivec4-
 ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-float-float-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib
 /piglit/tests/spec/arb_gl_spirv/execution/varying/all-array-types.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec4-uvec4.shader_test 
 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec3.shader_test /usr/lib/piglit/bin/depth_clamp_quirks /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_
 gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/
 fs-op-sub-u64vec4-u64vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-basevertex.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-3.shader_source /us
 r/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-int-int.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-1.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-2.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-gt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/pigl
 it/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uint-u
 int-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/other-queries.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-half.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-upper-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/linker/simple-function-call.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/qu
 eries/program-interface/xfb-name-queries.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/basic-fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat4
 x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec2.
 shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec4-vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec2-vec2-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-
 rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec3-vec3-bvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/ex
 ecution/built-in-functions/fs-greaterThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-uint64_t-uint64_t.shader_test /usr/lib/piglit/bin/arb_gl_spirv-sample-position /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec4.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-04.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-0
 5.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/vs_two_sets_mixing_order.shader_test /usr/lib/piglit/g
 enerated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shade
 r_int64/execution/built-in-functions/fs-op-ne-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat2.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv
 /glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-sso-vs-gs-fs-array-interleave.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/executio
 n/built-in-functions/fs-op-add-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gp
 u_shader_int64/execution/built-in-functions/fs-op-mod-i64vec3-i64vec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-indirect.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-render-rgb24 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-uint64_t-uint64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-uint64_t-uint64_t.sh
 ader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb
 _gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-function.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-xfb-query.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec4-uvec4.sh
 ader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec2.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat3x4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-instance-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-f
 unctions/fs-cross-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec3-vec3.shader_test
  /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-
 in-functions/fs-op-add-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-baseinstance.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-data-types.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec4-vec4.shader_test /usr/lib/piglit/bin/egl_ext_device_persistent_id /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-large-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/atomic-image.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-int-int-int.shader_test /usr/lib/p
 iglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec3.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/gl
 sl-1.20/execution/built-in-functions/fs-transpose-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-eq-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-bool-bool.shader_test /usr/lib/piglit/g
 enerated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/gl
 sl-1.30/execution/built-in-functions/fs-op-mult-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/aoa-2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec4.shader_
 test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/sso-block-member-layout-location.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-uint64_t-uint64_t.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-
 functions/fs-equal-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/unsized-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-function
 s/fs-atanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/array_of_input_output_block.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-func
 tions/fs-max-u64vec4-u64vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat3x2.shader_test /usr/lib/
 piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec4-uvec4.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built
 -in-functions/fs-exp2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-float-float.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/ex
 ecution/built-in-functions/fs-exp2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complemen
 t-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs-double.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/shared-uint-atomic-mem-functions.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uv
 ec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spir
 v/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_g
 pu_shader_int64/execution/built-in-functions/fs-min-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/
 execution/built-in-functions/fs-min-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-vec2.shader_test /usr/lib/piglit/generated_tests
 /spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-scalar.shader_test"

--===============5100370778396345808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA2OTYxYjUzMzg1Y2EwMjIyN2ZmZTZkZWVlZTUxMWMzMTkzYmFiMGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDo1NTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uTWFrZUxpc3RzLnR4dC1k
by1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgNCArKy0tCiAuLi4v
MDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggICAg
fCAyICstCiAuLi5lc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9u
LWNvbmQucGF0Y2ggfCAyICstCiAuLi4xLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFu
ZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggfCA1ICstLS0tCiAuLi4wMDAyLWNtYWtlLXVzZS1wcm9w
ZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggfCAyICstCiAuLi5lc3RzLXV0
aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAyICst
CiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAg
ICAgICAgfCAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxp
c3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4
IDZjZTIzNDhhNzEuLmQxMzgxZWJjODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5k
LXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZmQyNGFkZDMyNjNlMjQ5NzUz
MThlNjkzMzA5ODgxZWFkZDk5YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhkN2E4
OGM3MmYzZTE4ZDQ4MWM5Y2ZjOTIwNTM5NTIyMDBkZWMzNWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
RnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxp
c3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOTlh
ZTA3YTRhLi5kNWVlOWNjMjIgMTAwNjQ0CitpbmRleCAxNDdiZDhlMTcuLmZmYzkxMDM1NCAxMDA2
NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwx
MSArMjExLDcgQEAgaWYoUElHTElUX1VTRV9XQVlMQU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9y
cy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRj
aAppbmRleCA5NzUxYjIwNjczLi43MjhkYjY2MTQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNl
ZW4td2l0aC1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGJhMmY5MDhmMmEyYTg5N2U4ZTA2ZTM0Zjk5ODkzZDEx
ZWU0NzM0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWJmYjM1YzFhNTMyZDYyZDYw
NTIyOTY0NjE2MzlhZTJhODIxZDg4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgTWF5IDIwMjMgMjE6NTk6
NDMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IEZpeCBuYXJyb3dpbmcgZXJyb3JzIHNl
ZW4gd2l0aCBjbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lv
bi1jb25kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10
ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNo
CmluZGV4IGM2YzA3MmM3ZTAuLmM1NDUzN2ZlNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1
cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2Nv
bXByZXNzaW9uLWNvbmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2ZWQ0YzQ3N2YyMjMw
OWMwOWFjY2Q0ZmVlNjg0ODZkNzcxNGYyMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGY2YTRjODE1MmQxYTM5NDcwZDlkZTkxNzcxNjcwODY5YTE2ZjU3MjQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
RGF0ZTogRnJpLCAyMiBOb3YgMjAyNCAyMjo1MjozMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0
ZXN0cy9lZ2wvc3BlYzogbWFrZSBlZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24gY29uZGl0aW9u
YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3Iu
cHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaAppbmRleCBmODYwMDU1NmU1
Li5iZGU5YjgyODJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1h
bmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10
ZXN0cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA4NDZlZmU5MjM5MzJkNjY4MTAzMDViMjI4ZmEwOWY4M2ExNzIy
OTZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNjdiZDQ1NmZlNThlN2IyOThiMGMx
YWNmOGJkNzZkOWUwMzkwOWQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMjIgTWF5IDIwMjUg
MTc6MzQ6MTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbm9fZXJyb3IucHk6IG1vZGlm
eSBfY29tbWFuZCBhbmQgbm90IGNvbW1hbmQKQEAgLTI3LDYgKzI3LDMgQEAgaW5kZXggNGVjYWE5
YTAxLi5jNjRlZWMwYTEgMTAwNjQ0CiAgICAgICAgICBwcm9maWxlLnRlc3RfbGlzdFsne30ga2hy
X25vX2Vycm9yJy5mb3JtYXQobmFtZSldID0gdGVzdAogLSAgICAgICAgdGVzdC5jb21tYW5kICs9
IFsnLWtocl9ub19lcnJvciddCiArICAgICAgICB0ZXN0Ll9jb21tYW5kICs9IFsnLWtocl9ub19l
cnJvciddCi0tLSAKLTIuMzkuNQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMt
dmFyaWFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAy
LWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5k
ZXggNmNiNTYxYzNmMi4uZmRhMzg2Y2M4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9E
SVJTLXZhcmlhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGViMGMxNTg5MGZiOWQwZjRmYzcwNzRkZGUyYTUx
Yzg5Y2I1YmY2ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzA0MWVjZDliNjU5MjI0
Y2ZiMzU0NWIwMzQ3MDA2Yzc2YWU5MTg3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFBhc2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3Qg
MjAxOCAxNDo0MzoxNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBX
QVlMQU5EX0lOQ0xVREVfRElSUyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1u
b3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUt
YnVpbGQtcGF0LnBhdGNoCmluZGV4IDc3MDZkODgwODYuLjU2YTk3NDY3YWEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWds
aXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRl
ci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDY2ZDFkODZmZjhiZTMzZGYyNjVkMGRkYTcxN2JlMzg1ZmU4NjM3Y2QgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDNlZDJiZGMzYzU5ZjkwMTNlNGI2YzMzNDMzZjM2N2M0NjYyNWFhOTUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTc6MTM6NTAgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJk
Y29kZSBidWlsZCBwYXRoIGludG8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
X2dpdC5iYgppbmRleCAwNjBlMjg3ZjI2Li5iZmE2OWIxNDE0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
IAotU1JDUkVWID0gImEwYTI3ZTUyOGY2NDNkZmViNzg1MzUwYTEyMTNiZmZmMDk2ODE5NTAiCitT
UkNSRVYgPSAiNTMwOWUzNDAxZDZiMDNlOGEwYmI3YmZkYzFlMGY1YmMxYWQ3NTRhZiIKICMgKHdo
ZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4wK2dp
dHIiCiAKLS0gCjIuNDcuMQoK

--===============5100370778396345808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-85cd084ee9d417491e7dd47abb783edb435dae9d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:85cd084ee9d417491e7dd47abb783edb435dae9d"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 442 Local 430 Mirrors 0 Missed 12 Current 711 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2545 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 3167 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 3168 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 3169 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 3170 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 3171 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3172 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 3173 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to c86dc228a2cb2263183996ffb57181e4bde9247f6766f9ba1d74ec58e604fe57
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3174 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 3175 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3176 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3178 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to c297e0afcc8b3409e51b301f80308423f19fc6f69b71e3e10c7e700900d6b9c0
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3179 of 3186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3179 tasks of which 3165 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105204258.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105204258.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.3414537
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+5309e3401d-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.3414537
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5100370778396345808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 98 recipes from the qemux86_64 sysroot...done.
Removing 78 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-85cd084ee9d417491e7dd47abb783edb435dae9d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:85cd084ee9d417491e7dd47abb783edb435dae9d"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 779 Local 750 Mirrors 0 Missed 29 Current 393 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 394 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 402 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 432 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 442 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 444 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 447 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 456 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 476 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 477 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 494 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 500 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 504 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 505 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 506 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 507 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 509 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_spdx_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 535 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 543 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 557 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 563 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 564 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 567 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 568 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 571 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 574 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 586 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 617 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 641 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/mesa/25.2.5/temp/log.do_packagedata_setscene.3416872
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 745 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 1324 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: Running task 1382 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1392 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1418 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_fetch)
NOTE: Running task 1419 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1538 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_write_config)
NOTE: recipe mesa-2_25.2.5-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 781 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1579 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1580 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Started
NOTE: Running task 1661 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 785 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1683 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1686 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1688 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_patch)
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 1696 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 793 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 811 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 838 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 859 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 876 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 887 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 889 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 896 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 907 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 914 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 916 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 917 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 924 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 927 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 940 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 944 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 948 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 953 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 954 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 960 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 968 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 974 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 980 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 995 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 997 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1001 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1983 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1028 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1030 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 1035 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1036 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1050 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1067 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1074 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1083 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1095 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1097 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1104 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1106 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1110 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1121 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1124 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1133 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1139 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1146 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1148 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2171 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1151 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1171 of 1172 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2865 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: Running task 2908 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2996 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata: Started
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3187 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_collect_spdx_deps)
NOTE: Running task 3188 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_collect_spdx_deps)
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3189 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_configure)
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3190 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_configure)
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Started
NOTE: recipe waffle-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3191 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_compile)
NOTE: recipe waffle-1.8.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_compile)
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Started
NOTE: recipe waffle-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3193 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_install)
NOTE: recipe waffle-1.8.1-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 3194 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package)
NOTE: Running task 3195 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3196 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 3197 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_install)
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3198 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package)
NOTE: Running task 3200 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_sysroot)
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_package: Succeeded
NOTE: Running task 3201 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata)
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata unihash changed to 784383a84adccedcea11420c1f305be213b20e1728f02e3074fde4d9092eea6c
NOTE: Setscene tasks completed
NOTE: Running task 3202 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_create_spdx)
NOTE: Running task 3203 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk)
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3204 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb)
NOTE: Running task 3205 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 3206 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa)
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Started
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3207 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk unihash changed to 12346a3b658141a8bdd258919c22e967f75bc4b08537592769c8c248c9bbda37
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa unihash changed to be5726525f73cda0aed4266e247633d986f19437300762c83879e7193a63da09
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm unihash changed to a9e0e2ec82fafe68341725f3605ba10aef7baa128d0f48af740ef35cdcded16c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb unihash changed to 6c79358324504c25f6f410f22841afa8c63154313ea714127dd105f958512fbc
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Succeeded
NOTE: Running task 3208 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata)
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata unihash changed to 7c12db0744acf69ce3f3c6d4b7e5992139254528b39aed855218df0b95337258
NOTE: Setscene tasks completed
NOTE: Running task 3209 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_create_spdx)
NOTE: Running task 3210 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk)
NOTE: Running task 3211 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb)
NOTE: Running task 3212 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm)
NOTE: Running task 3213 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa)
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk unihash changed to d1d3d9128004cc0605cf131859caa7cd6a368eebda49be1c0f834ed77fcac947
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa unihash changed to 0c9c2a54688fce56695fc155b050de23dacfd21f7f76dacb5012ac154e9f93a6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm unihash changed to 86353df66727da6be3c10b17144e7bb4c5edbc33675533d43f6c3af53ef65c30
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb unihash changed to e7481756db1491bf54c176832a89effa947e000db994eae9b100e6b9418de19e
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3214 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3215 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3216 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3217 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3218 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Succeeded
NOTE: Running task 3219 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_create_spdx)
NOTE: Running task 3220 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_ipk)
NOTE: Running task 3221 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_deb)
NOTE: Running task 3222 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Started
NOTE: Running task 3223 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Succeeded
NOTE: Running task 3224 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_create_package_spdx)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa unihash changed to bb0af23f3c16319b17172443ab8d45fd120d41bb52065e8a04b707402d723757
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3225 of 3225 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3225 tasks of which 3161 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgallium went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package libteflon went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:25.2.6-r0 to 2:25.2.5-r0) [version-going-backwards]
ERROR: mesa-2_25.2.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5100370778396345808==--

