Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B064EEE250
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103062.1767267479534402592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vbW2/Oms;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SuyWENc4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b7959ac95-10fff089-415e-4846-8aab-2abe8ed20654-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8og9dz8JjMBvO4ByKt2v9kVP2vwaGJK8DrIFbTISLMQ=;
	b=vbW2/Omsf0KMmyzTsTFNTHklgidT6oi4ntN+nOIKs9Tt9WMfHUnfUXgj92zhe0ZJ
	kQyHDjJelW6n4WCmZFSey+ycZ3bPBsMOFSk7iSx3uStv3hIf4soepJDr8Xu00YSNYXg
	FueC312L9g4oBflOrz8mNnA+xXrV1M1fB6zEMwI8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8og9dz8JjMBvO4ByKt2v9kVP2vwaGJK8DrIFbTISLMQ=;
	b=SuyWENc41Zb1FKQOTkD9oCzETP6RvHK8LfsAWqt5RZcI5wpXjnh6fe+VKWOWP+pU
	Ca23IRfXgly22rSKh5sUn8eGSDhm+0lmHiLFPaURaaYNd0rds36OnXRt+hlD/HDambB
	dwQ6+yiPiShDhaqkXOj0iav3aMzxaIz3PGGqzgJc=
Content-Type: multipart/mixed; boundary="===============1317354693264641892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa: upgrading to 25.3.2 SUCCEEDED
Message-ID: <0101019b7959ac95-10fff089-415e-4846-8aab-2abe8ed20654-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228794

--===============1317354693264641892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *25.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-25.3.1-25.3.2.patch
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
From def1d483df54d591f46132de7b45c30a56297460 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:20:15 +0000
Subject: [PATCH] mesa: upgrade 25.3.1 -> 25.3.2

---
 ...su-drop-file-names-from-the-generated-file.patch |  9 +++------
 ...reno-don-t-encode-build-path-into-binaries.patch | 13 +++++--------
 ...don-t-dump-genvk.py-args-to-generated-file.patch |  6 +++---
 ...son-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...et-drop-file-names-from-the-generated-file.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                 |  4 ++--
 6 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
index aab17384d2..e3eed473c8 100644
--- a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
@@ -1,7 +1,7 @@
-From 4c3fad710c5bc702e28ae2bcc3c73b0547c4954d Mon Sep 17 00:00:00 2001
+From 25b8086f86b9c4a45ff22415f1a539b33fc66e44 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 19 Nov 2025 14:19:36 +0200
-Subject: [PATCH 1/2] ethosu: drop file names from the generated file
+Subject: [PATCH] ethosu: drop file names from the generated file
 
 Having file names and dates in the generated file affects
 reproducibility. Build systems (like OE) error out on the gen_header.py
@@ -15,7 +15,7 @@ Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/cdb
  1 file changed, 12 deletions(-)
 
 diff --git a/src/gallium/drivers/ethosu/gen_header.py b/src/gallium/drivers/ethosu/gen_header.py
-index b54516a812c7..44471893594b 100644
+index b54516a..4447189 100644
 --- a/src/gallium/drivers/ethosu/gen_header.py
 +++ b/src/gallium/drivers/ethosu/gen_header.py
 @@ -29,21 +29,9 @@ def dump_c(args, guard, func):
@@ -40,6 +40,3 @@ index b54516a812c7..44471893594b 100644
  		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
  		for author in p.authors:
  			print("- " + author)
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 6948abe439..8897b3f8af 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From 194a64f26565c495424ee992312d537c66cb8997 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Date: Tue, 16 Jul 2024 12:32:47 +0300
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -19,7 +19,7 @@ Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  3 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
-index bb7cebf5a748..351cc31ef2de 100644
+index 5dddc9a..1932410 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
 @@ -56,10 +56,12 @@ if with_tests
@@ -50,7 +50,7 @@ index bb7cebf5a748..351cc31ef2de 100644
      )
      test('afuc-disasm',
 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
+index cf5c1e7..96dcb0a 100644
 --- a/src/freedreno/decode/meson.build
 +++ b/src/freedreno/decode/meson.build
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
@@ -61,7 +61,7 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
          capture: true,
        )
        test('cffdump-' + name,
-@@ -247,7 +248,8 @@ if with_tests
+@@ -283,7 +284,8 @@ if with_tests
        output: name + '.log',
        command: [crashdec, args, files('../tests/traces/' + name + '.devcore')],
        capture: true,
@@ -72,7 +72,7 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
  
      test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index 29e1bc4..afb7426 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
@@ -84,6 +84,3 @@ index 98e49b8fcf0e..145e72597eb9 100644
  
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
----
-2.39.2
-
diff --git a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
index 097ca84e3b..43bc7cdde8 100644
--- a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
@@ -1,4 +1,4 @@
-From c0f067e86bc9f7fbc60c2539dc612a050ee2569f Mon Sep 17 00:00:00 2001
+From dbdd4fe934fa7ce526cf06337944ea1ddbcd4367 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 19 Nov 2025 11:36:42 +0200
 Subject: [PATCH] gfxstream: don't dump genvk.py args to generated files
@@ -14,10 +14,10 @@ Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  1 file changed, 1 insertion(+), 7 deletions(-)
 
 diff --git a/src/gfxstream/codegen/scripts/cerealgenerator.py b/src/gfxstream/codegen/scripts/cerealgenerator.py
-index 077571e9eda5..217c3e1d0e94 100644
+index 2b6a3c7..6b11209 100644
 --- a/src/gfxstream/codegen/scripts/cerealgenerator.py
 +++ b/src/gfxstream/codegen/scripts/cerealgenerator.py
-@@ -254,13 +254,7 @@ def banner_command(argv):
+@@ -256,13 +256,7 @@ def banner_command(argv):
         Return a string corresponding to the command, with platform-specific
         paths removed."""
  
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..c0f511e303 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From c634bc14ed17974fb959f2763e8fce8cedcfc8fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
index 3e9edc411f..54ba31a1fe 100644
--- a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
@@ -1,7 +1,7 @@
-From d5462c852d30fc41a223730848550db4f9675517 Mon Sep 17 00:00:00 2001
+From b20b4808c6138657f6f96dc605e62db5c940478c Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 19 Nov 2025 14:19:36 +0200
-Subject: [PATCH 2/2] rocket: drop file names from the generated file
+Subject: [PATCH] rocket: drop file names from the generated file
 
 Having file names and dates in the generated file affects
 reproducibility. Build systems (like OE) error out on the gen_header.py
@@ -15,7 +15,7 @@ Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/7a3
  1 file changed, 12 deletions(-)
 
 diff --git a/src/gallium/drivers/rocket/gen_header.py b/src/gallium/drivers/rocket/gen_header.py
-index f3c6615dcb42..5457ef71d595 100644
+index f3c6615..5457ef7 100644
 --- a/src/gallium/drivers/rocket/gen_header.py
 +++ b/src/gallium/drivers/rocket/gen_header.py
 @@ -29,21 +29,9 @@ def dump_c(args, guard, func):
@@ -40,6 +40,3 @@ index f3c6615dcb42..5457ef71d595 100644
  		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
  		for author in p.authors:
  			print("- " + author)
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 835e4d46ea..66c49ea68a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da"
-PV = "25.3.1"
+SRC_URI[sha256sum] = "e69dab0d0ea03e3e8cb141b032f58ea9fcf3b9c1f61b31f6592cb4bbd8d0185d"
+PV = "25.3.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============1317354693264641892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-25.3.1.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch file://0001-ethosu-drop-file-names-from-the-generated-file.patch file://0002-rocket-drop-file-names-from-the-generated-file.patch" to "https://archive.mesa3d.org/mesa-25.3.2.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch file://0001-ethosu-drop-file-names-from-the-generated-file.patch file://0002-rocket-drop-file-names-from-the-generated-file.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-25.3.1.so", added "/usr/lib/libgallium-25.3.2.so"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-25.3.1.so", added "/usr/lib/.debug/libgallium-25.3.2.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 633968512 to 633997472 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 201969 to 204615 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/25.3.1/src/intel/genxml -> /usr/src/debug/mesa/25.3.2/src/intel/genxml, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/compiler -> /usr/src/debug/mesa/25.3.2/src/amd/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/compiler/elk -> /usr/src/debug/mesa/25.3.2/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/r300 -> /usr/src/debug/mesa/25.3.2/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/isl -> /usr/src/debug/mesa/25.3.2/src/intel/isl, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/25.3.2/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/25.3.1/src/vulkan/runtime -> /usr/src/debug/mesa/25.3.2/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/25.3.1/src/loader -> /usr/src/debug/mesa/25.3.2/src/loader, directory renamed /usr/src/
 debug/mesa/25.3.1/src/intel/compiler/brw -> /usr/src/debug/mesa/25.3.2/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/25.3.2/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/25.3.2/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/glsl -> /usr/src/debug/mesa/25.3.2/src/compiler/glsl, directory renamed /usr/src/debug/mesa/25.3.1/src/vulkan/wsi -> /usr/src/debug/mesa/25.3.2/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/perf -> /usr/src/debug/mesa/25.3.2/src/intel/perf, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/auxiliary -> /usr/src/debug/mesa/25.3.2/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/25.3.2/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/frontends/lavapipe ->
  /usr/src/debug/mesa/25.3.2/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/zink -> /usr/src/debug/mesa/25.3.2/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/vulkan -> /usr/src/debug/mesa/25.3.2/src/intel/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/nouveau/headers -> /usr/src/debug/mesa/25.3.2/src/nouveau/headers, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/dev -> /usr/src/debug/mesa/25.3.2/src/intel/dev, directory renamed /usr/src/debug/mesa/25.3.1/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/25.3.2/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/ds -> /usr/src/debug/mesa/25.3.2/src/intel/ds, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/program -> /usr/src/debug/mesa/25.3.2/src/mesa/program, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/nir -> /usr/src/debug/mesa/25.3.2/src/compiler/nir, directory renamed /us
 r/src/debug/mesa/25.3.1/src/vulkan/util -> /usr/src/debug/mesa/25.3.2/src/vulkan/util, directory renamed /usr/src/debug/mesa/25.3.1/src/util/format -> /usr/src/debug/mesa/25.3.2/src/util/format, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/shaders -> /usr/src/debug/mesa/25.3.2/src/intel/shaders, directory renamed /usr/src/debug/mesa/25.3.1/src/util -> /usr/src/debug/mesa/25.3.2/src/util, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/r600 -> /usr/src/debug/mesa/25.3.2/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/25.3.1/src/virtio/vulkan -> /usr/src/debug/mesa/25.3.2/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/vulkan -> /usr/src/debug/mesa/25.3.2/src/amd/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/common -> /usr/src/debug/mesa/25.3.2/src/amd/common, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/spirv -> /usr/src/debug/mesa/25.3.2/src/compiler/spirv, directory renamed /usr/src/debug
 /mesa/25.3.1/src/mesa -> /usr/src/debug/mesa/25.3.2/src/mesa, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/25.3.2/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/compiler -> /usr/src/debug/mesa/25.3.2/src/intel/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler -> /usr/src/debug/mesa/25.3.2/src/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/vulkan/layers -> /usr/src/debug/mesa/25.3.2/src/amd/vulkan/layers
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 194625376 to 194625527 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 74781810 to 74785906 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "25.3.1" to "25.3.2"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 25.3.1 [default] to 25.3.2 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.2.so
Changes to packages/x86_64-linux/mesa-native (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.2.so

--===============1317354693264641892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-25.3.1-25.3.2.patch"

RnJvbSBkZWYxZDQ4M2RmNTRkNTkxZjQ2MTMyZGU3YjQ1YzMwYTU2Mjk3NDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDoyMDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2E6IHVwZ3JhZGUgMjUuMy4xIC0+IDI1LjMuMgoKLS0tCiAuLi5zdS1kcm9wLWZpbGUtbmFtZXMt
ZnJvbS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2ggfCAgOSArKystLS0tLS0KIC4uLnJlbm8tZG9u
LXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCB8IDEzICsrKysrLS0tLS0t
LS0KIC4uLmRvbi10LWR1bXAtZ2VudmsucHktYXJncy10by1nZW5lcmF0ZWQtZmlsZS5wYXRjaCB8
ICA2ICsrKy0tLQogLi4uc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5n
LnBhdGNoIHwgIDIgKy0KIC4uLmV0LWRyb3AtZmlsZS1uYW1lcy1mcm9tLXRoZS1nZW5lcmF0ZWQt
ZmlsZS5wYXRjaCB8ICA5ICsrKy0tLS0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQogNiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLWV0aG9zdS1kcm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2Vu
ZXJhdGVkLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAx
LWV0aG9zdS1kcm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2gKaW5k
ZXggYWFiMTczODRkMi4uZTNlZWQ0NzNjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvZmlsZXMvMDAwMS1ldGhvc3UtZHJvcC1maWxlLW5hbWVzLWZyb20tdGhlLWdlbmVy
YXRlZC1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtZXRob3N1LWRyb3AtZmlsZS1uYW1lcy1mcm9tLXRoZS1nZW5lcmF0ZWQtZmlsZS5wYXRjaApA
QCAtMSw3ICsxLDcgQEAKLUZyb20gNGMzZmFkNzEwYzViYzcwMmUyOGFlMmJjYzNjNzNiMDU0N2M0
OTU0ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjViODA4NmY4NmI5YzRhNDVmZjIy
NDE1ZjFhNTM5YjMzZmM2NmU0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdl
ZCwgMTkgTm92IDIwMjUgMTQ6MTk6MzYgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGV0aG9z
dTogZHJvcCBmaWxlIG5hbWVzIGZyb20gdGhlIGdlbmVyYXRlZCBmaWxlCitTdWJqZWN0OiBbUEFU
Q0hdIGV0aG9zdTogZHJvcCBmaWxlIG5hbWVzIGZyb20gdGhlIGdlbmVyYXRlZCBmaWxlCiAKIEhh
dmluZyBmaWxlIG5hbWVzIGFuZCBkYXRlcyBpbiB0aGUgZ2VuZXJhdGVkIGZpbGUgYWZmZWN0cwog
cmVwcm9kdWNpYmlsaXR5LiBCdWlsZCBzeXN0ZW1zIChsaWtlIE9FKSBlcnJvciBvdXQgb24gdGhl
IGdlbl9oZWFkZXIucHkKQEAgLTE1LDcgKzE1LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9y
dCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC9jZGIK
ICAxIGZpbGUgY2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2Fs
bGl1bS9kcml2ZXJzL2V0aG9zdS9nZW5faGVhZGVyLnB5IGIvc3JjL2dhbGxpdW0vZHJpdmVycy9l
dGhvc3UvZ2VuX2hlYWRlci5weQotaW5kZXggYjU0NTE2YTgxMmM3Li40NDQ3MTg5MzU5NGIgMTAw
NjQ0CitpbmRleCBiNTQ1MTZhLi40NDQ3MTg5IDEwMDY0NAogLS0tIGEvc3JjL2dhbGxpdW0vZHJp
dmVycy9ldGhvc3UvZ2VuX2hlYWRlci5weQogKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldGhv
c3UvZ2VuX2hlYWRlci5weQogQEAgLTI5LDIxICsyOSw5IEBAIGRlZiBkdW1wX2MoYXJncywgZ3Vh
cmQsIGZ1bmMpOgpAQCAtNDAsNiArNDAsMyBAQCBpbmRleCBiNTQ1MTZhODEyYzcuLjQ0NDcxODkz
NTk0YiAxMDA2NDQKICAJCXByaW50KCJDb3B5cmlnaHQgKEMpICVzLSVzIGJ5IHRoZSBmb2xsb3dp
bmcgYXV0aG9yczoiICUgKHAuY29weXJpZ2h0X3llYXIsIGN1cnJlbnRfeWVhcikpCiAgCQlmb3Ig
YXV0aG9yIGluIHAuYXV0aG9yczoKICAJCQlwcmludCgiLSAiICsgYXV0aG9yKQotLS0gCi0yLjUx
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1m
cmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29k
ZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKaW5kZXggNjk0OGFiZTQzOS4uODg5N2Iz
ZjhhZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1m
cmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1l
bmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAwMjdhYzM2NzU2Y2M3NWVlYTllZDRmZWUxMzVhMzUxYWYzMGIzNWZkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAxOTRhNjRmMjY1NjVjNDk1NDI0ZWU5OTIzMTJkNTM3YzY2Y2I4OTk3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5
LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgogRGF0ZTogVHVlLCAxNiBKdWwgMjAyNCAxMjozMjo0NyAr
MDMwMAogU3ViamVjdDogW1BBVENIXSBmcmVlZHJlbm86IGRvbid0IGVuY29kZSBidWlsZCBwYXRo
IGludG8gYmluYXJpZXMKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJh
cnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgogIDMgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2ZyZWVk
cmVuby9hZnVjL21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9hZnVjL21lc29uLmJ1aWxkCi1p
bmRleCBiYjdjZWJmNWE3NDguLjM1MWNjMzFlZjJkZSAxMDA2NDQKK2luZGV4IDVkZGRjOWEuLjE5
MzI0MTAgMTAwNjQ0CiAtLS0gYS9zcmMvZnJlZWRyZW5vL2FmdWMvbWVzb24uYnVpbGQKICsrKyBi
L3NyYy9mcmVlZHJlbm8vYWZ1Yy9tZXNvbi5idWlsZAogQEAgLTU2LDEwICs1NiwxMiBAQCBpZiB3
aXRoX3Rlc3RzCkBAIC01MCw3ICs1MCw3IEBAIGluZGV4IGJiN2NlYmY1YTc0OC4uMzUxY2MzMWVm
MmRlIDEwMDY0NAogICAgICApCiAgICAgIHRlc3QoJ2FmdWMtZGlzYXNtJywKIGRpZmYgLS1naXQg
YS9zcmMvZnJlZWRyZW5vL2RlY29kZS9tZXNvbi5idWlsZCBiL3NyYy9mcmVlZHJlbm8vZGVjb2Rl
L21lc29uLmJ1aWxkCi1pbmRleCA0NjllZWI0ZWI1OTcuLmRmYTFjMTJkMGQ5ZiAxMDA2NDQKK2lu
ZGV4IGNmNWMxZTcuLjk2ZGNiMGEgMTAwNjQ0CiAtLS0gYS9zcmMvZnJlZWRyZW5vL2RlY29kZS9t
ZXNvbi5idWlsZAogKysrIGIvc3JjL2ZyZWVkcmVuby9kZWNvZGUvbWVzb24uYnVpbGQKIEBAIC0x
OTQsNiArMTk0LDcgQEAgaWYgZGVwX2x1YS5mb3VuZCgpIGFuZCBkZXBfbGliYXJjaGl2ZS5mb3Vu
ZCgpCkBAIC02MSw3ICs2MSw3IEBAIGluZGV4IDQ2OWVlYjRlYjU5Ny4uZGZhMWMxMmQwZDlmIDEw
MDY0NAogICAgICAgICAgY2FwdHVyZTogdHJ1ZSwKICAgICAgICApCiAgICAgICAgdGVzdCgnY2Zm
ZHVtcC0nICsgbmFtZSwKLUBAIC0yNDcsNyArMjQ4LDggQEAgaWYgd2l0aF90ZXN0cworQEAgLTI4
Myw3ICsyODQsOCBAQCBpZiB3aXRoX3Rlc3RzCiAgICAgICAgb3V0cHV0OiBuYW1lICsgJy5sb2cn
LAogICAgICAgIGNvbW1hbmQ6IFtjcmFzaGRlYywgYXJncywgZmlsZXMoJy4uL3Rlc3RzL3RyYWNl
cy8nICsgbmFtZSArICcuZGV2Y29yZScpXSwKICAgICAgICBjYXB0dXJlOiB0cnVlLApAQCAtNzIs
NyArNzIsNyBAQCBpbmRleCA0NjllZWI0ZWI1OTcuLmRmYTFjMTJkMGQ5ZiAxMDA2NDQKICAKICAg
ICAgdGVzdCgnY3Jhc2hkZWMtJyArIG5hbWUsCiBkaWZmIC0tZ2l0IGEvc3JjL2ZyZWVkcmVuby9t
ZXNvbi5idWlsZCBiL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKLWluZGV4IDk4ZTQ5YjhmY2Yw
ZS4uMTQ1ZTcyNTk3ZWI5IDEwMDY0NAoraW5kZXggMjllMWJjNC4uYWZiNzQyNiAxMDA2NDQKIC0t
LSBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKICsrKyBiL3NyYy9mcmVlZHJlbm8vbWVzb24u
YnVpbGQKIEBAIC02LDcgKzYsNyBAQCBpbmNfZnJlZWRyZW5vX3JubiA9IGluY2x1ZGVfZGlyZWN0
b3JpZXMoJ3JubicpCkBAIC04NCw2ICs4NCwzIEBAIGluZGV4IDk4ZTQ5YjhmY2YwZS4uMTQ1ZTcy
NTk3ZWI5IDEwMDY0NAogIAogIGRlcF9saWJhcmNoaXZlID0gZGVwZW5kZW5jeSgnbGliYXJjaGl2
ZScsIGFsbG93X2ZhbGxiYWNrOiB0cnVlLCByZXF1aXJlZDogZmFsc2UpCiAgZGVwX2xpYnhtbDIg
PSBkZXBlbmRlbmN5KCdsaWJ4bWwtMi4wJywgYWxsb3dfZmFsbGJhY2s6IHRydWUsIHJlcXVpcmVk
OiBmYWxzZSkKLS0tLQotMi4zOS4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2Z4c3RyZWFtLWRvbi10LWR1bXAtZ2VudmsucHktYXJncy10by1n
ZW5lcmF0ZWQtZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtZ2Z4c3RyZWFtLWRvbi10LWR1bXAtZ2VudmsucHktYXJncy10by1nZW5lcmF0ZWQtZmlsZS5w
YXRjaAppbmRleCAwOTdjYTg0ZTNiLi40M2JjN2NkZGU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWdmeHN0cmVhbS1kb24tdC1kdW1wLWdlbnZrLnB5
LWFyZ3MtdG8tZ2VuZXJhdGVkLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1nZnhzdHJlYW0tZG9uLXQtZHVtcC1nZW52ay5weS1hcmdzLXRvLWdl
bmVyYXRlZC1maWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMGYwNjdlODZiYzlmN2Zi
YzYwYzI1MzlkYzYxMmEwNTBlZTI1NjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBk
YmRkNGZlOTM0ZmE3Y2U1MjZjZjA2MzM3OTQ0ZWExZGRiY2Q0MzY3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVh
bGNvbW0uY29tPgogRGF0ZTogV2VkLCAxOSBOb3YgMjAyNSAxMTozNjo0MiArMDIwMAogU3ViamVj
dDogW1BBVENIXSBnZnhzdHJlYW06IGRvbid0IGR1bXAgZ2VudmsucHkgYXJncyB0byBnZW5lcmF0
ZWQgZmlsZXMKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNo
a292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dmeHN0
cmVhbS9jb2RlZ2VuL3NjcmlwdHMvY2VyZWFsZ2VuZXJhdG9yLnB5IGIvc3JjL2dmeHN0cmVhbS9j
b2RlZ2VuL3NjcmlwdHMvY2VyZWFsZ2VuZXJhdG9yLnB5Ci1pbmRleCAwNzc1NzFlOWVkYTUuLjIx
N2MzZTFkMGU5NCAxMDA2NDQKK2luZGV4IDJiNmEzYzcuLjZiMTEyMDkgMTAwNjQ0CiAtLS0gYS9z
cmMvZ2Z4c3RyZWFtL2NvZGVnZW4vc2NyaXB0cy9jZXJlYWxnZW5lcmF0b3IucHkKICsrKyBiL3Ny
Yy9nZnhzdHJlYW0vY29kZWdlbi9zY3JpcHRzL2NlcmVhbGdlbmVyYXRvci5weQotQEAgLTI1NCwx
MyArMjU0LDcgQEAgZGVmIGJhbm5lcl9jb21tYW5kKGFyZ3YpOgorQEAgLTI1NiwxMyArMjU2LDcg
QEAgZGVmIGJhbm5lcl9jb21tYW5kKGFyZ3YpOgogICAgICAgICBSZXR1cm4gYSBzdHJpbmcgY29y
cmVzcG9uZGluZyB0byB0aGUgY29tbWFuZCwgd2l0aCBwbGF0Zm9ybS1zcGVjaWZpYwogICAgICAg
ICBwYXRocyByZW1vdmVkLiIiIgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1j
bGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24t
bWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggYmFhOThh
MGQ0Ni4uYzBmNTExZTMwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1p
c2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAwMmNjMjE4MDBmZTI5ZjU2NmFkZDUyNWU2M2Y2MTljMDUzNmQ2ZTdiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNjM0YmMxNGVkMTc5NzRmYjk1OWYyNzYzZThmY2U4Y2Vk
Y2ZjOGZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItcm9ja2V0
LWRyb3AtZmlsZS1uYW1lcy1mcm9tLXRoZS1nZW5lcmF0ZWQtZmlsZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItcm9ja2V0LWRyb3AtZmlsZS1uYW1lcy1mcm9t
LXRoZS1nZW5lcmF0ZWQtZmlsZS5wYXRjaAppbmRleCAzZTllZGM0MTFmLi41NGJhMzFhMWZlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLXJvY2tldC1k
cm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMi1yb2NrZXQtZHJvcC1maWxlLW5hbWVzLWZy
b20tdGhlLWdlbmVyYXRlZC1maWxlLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBkNTQ2MmM4
NTJkMzBmYzQxYTIyMzczMDg0ODU1MGRiNGY5Njc1NTE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiMjBiNDgwOGM2MTM4NjU3ZjZmOTZkYzYwNWU2MmRiNWM5NDA0NzhjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtv
dkBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogV2VkLCAxOSBOb3YgMjAyNSAxNDoxOTozNiArMDIw
MAotU3ViamVjdDogW1BBVENIIDIvMl0gcm9ja2V0OiBkcm9wIGZpbGUgbmFtZXMgZnJvbSB0aGUg
Z2VuZXJhdGVkIGZpbGUKK1N1YmplY3Q6IFtQQVRDSF0gcm9ja2V0OiBkcm9wIGZpbGUgbmFtZXMg
ZnJvbSB0aGUgZ2VuZXJhdGVkIGZpbGUKIAogSGF2aW5nIGZpbGUgbmFtZXMgYW5kIGRhdGVzIGlu
IHRoZSBnZW5lcmF0ZWQgZmlsZSBhZmZlY3RzCiByZXByb2R1Y2liaWxpdHkuIEJ1aWxkIHN5c3Rl
bXMgKGxpa2UgT0UpIGVycm9yIG91dCBvbiB0aGUgZ2VuX2hlYWRlci5weQpAQCAtMTUsNyArMTUs
NyBAQCBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzdhMwogIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvcm9ja2V0L2dlbl9oZWFk
ZXIucHkgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL3JvY2tldC9nZW5faGVhZGVyLnB5Ci1pbmRleCBm
M2M2NjE1ZGNiNDIuLjU0NTdlZjcxZDU5NSAxMDA2NDQKK2luZGV4IGYzYzY2MTUuLjU0NTdlZjcg
MTAwNjQ0CiAtLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL3JvY2tldC9nZW5faGVhZGVyLnB5CiAr
KysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL3JvY2tldC9nZW5faGVhZGVyLnB5CiBAQCAtMjksMjEg
KzI5LDkgQEAgZGVmIGR1bXBfYyhhcmdzLCBndWFyZCwgZnVuYyk6CkBAIC00MCw2ICs0MCwzIEBA
IGluZGV4IGYzYzY2MTVkY2I0Mi4uNTQ1N2VmNzFkNTk1IDEwMDY0NAogIAkJcHJpbnQoIkNvcHly
aWdodCAoQykgJXMtJXMgYnkgdGhlIGZvbGxvd2luZyBhdXRob3JzOiIgJSAocC5jb3B5cmlnaHRf
eWVhciwgY3VycmVudF95ZWFyKSkKICAJCWZvciBhdXRob3IgaW4gcC5hdXRob3JzOgogIAkJCXBy
aW50KCItICIgKyBhdXRob3IpCi0tLSAKLTIuNTEuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jCmluZGV4IDgzNWU0ZDQ2ZWEuLjY2YzQ5ZWE2OGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL21lc2EuaW5jCkBAIC0yMiw4ICsyMiw4IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9hcmNoaXZl
Lm1lc2EzZC5vcmcvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1y
b2NrZXQtZHJvcC1maWxlLW5hbWVzLWZyb20tdGhlLWdlbmVyYXRlZC1maWxlLnBhdGNoIFwKICIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA1OWQwZDk4NTYyMmY0OTU4OGYwMWFhMjkxNTI4MDRm
NGRhOGZmZTZhZGQwNDZlMDBhNTI5MjMzNzljMmQ4ZGEiCi1QViA9ICIyNS4zLjEiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZTY5ZGFiMGQwZWEwM2UzZThjYjE0MWIwMzJmNThlYTlmY2YzYjljMWY2
MWIzMWY2NTkyY2I0YmJkOGQwMTg1ZCIKK1BWID0gIjI1LjMuMiIKIAogVVBTVFJFQU1fQ0hFQ0tf
R0lUVEFHUkVHRVggPSAibWVzYS0oP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKLS0gCjIuNDcuMQoK

--===============1317354693264641892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-25.3.1.so", added "/usr/lib/libgallium-25.3.2.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.2.so
Changes to packages/x86_64-linux/mesa-native (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.2.so

--===============1317354693264641892==--

