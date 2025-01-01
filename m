Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAFCE77197
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11489.1735723939159868366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iULT1a1o;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LaerkRkc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101942135ab8a-19ce8446-6bdd-4a1d-a07d-e2898fa81989-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xM+zzpMilbQsknhCF/x9P9eoDedWCJZSbcYkqdhYAhk=;
	b=iULT1a1oCUeXu0dPFJ1+1KF6vm8Y5U77uipFyhDBFfcsTei7Jpz07IwdkcoXl0o8
	xauaz2rvDqtijFDo12gtA4dg2jYCe0klAqtKwRn4A/R3L8GyGS/EcQ5i/qeJUd/GiVj
	PBNF+h1Pi5BxMqU88Y4q8DH2W+RlmLDHbK0oNSso=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xM+zzpMilbQsknhCF/x9P9eoDedWCJZSbcYkqdhYAhk=;
	b=LaerkRkcYjajwm5F25p5FXo6IQWKWHFSuJNPiE7lV93kCWukrraC/3JBEGdyVoXn
	Gz+/1n/g9EumUGBaixkxAi+SJknU7Ob7KiwRTs/JJ/uY82tF7qwR0wu+VYLr1S7nyax
	N5+ayJDCrrFFQ8ltFmlHBNdv9pJkuRmMa9bLcQBk=
Content-Type: multipart/mixed; boundary="===============3093649093323073759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2
 SUCCEEDED
Message-ID: <010101942135ab8a-19ce8446-6bdd-4a1d-a07d-e2898fa81989-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209234

--===============3093649093323073759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2* has Succeeded.

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
From 90752880554dc582f4ac5780db28e083e66ca80c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 08:31:14 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...Lists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 ...0001-tests-Fix-narrowing-errors-seen-with-clang.patch | 2 +-
 ...-egl-spec-make-egl_ext_surface_compression-cond.patch | 9 +++------
 ...-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb               | 2 +-
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 0c872d3e9b..75c2d2fbfc 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 2af98d67e16e083c36e3193aefbda942399a455a Mon Sep 17 00:00:00 2001
+From db3a33a91ce0a28f297fe270167cf2d0a44354e2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index cfdfeb683e..22dd6c360a 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 70f8d56bf9db9d85f3d197ab9de972e3a514514c Mon Sep 17 00:00:00 2001
+From 6559f5a7d82d411eb035f9d7c5dfb9987182803d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 69cc302912..c9e7fe1e96 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
+From 8320c2ff5793a612aa7d7223ae317657744169f1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-index d9540bcfde27..01a70164f444 100644
+index d9540bcfd..01a70164f 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 +++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 @@ -2,10 +2,12 @@ link_libraries(
@@ -39,7 +39,7 @@ index d9540bcfde27..01a70164f444 100644
  
  # vim: ft=cmake:
 diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index e3d55d4331fb..35f13fd007b4 100644
+index e3d55d433..35f13fd00 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 +++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 @@ -25,7 +25,6 @@
@@ -50,6 +50,3 @@ index e3d55d4331fb..35f13fd007b4 100644
  #include "../../egl-wayland.h"
  
  static enum piglit_result
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 17bcbce190..fd085da220 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 9b2c2213a2d7aaea350649ee031e227b44343428 Mon Sep 17 00:00:00 2001
+From 29033f323d870552410c31d1e3721304b8a38e99 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 767e93c43e..ce1ce12a07 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 3d621cf028acb3b464759abb72a38102844079b2 Mon Sep 17 00:00:00 2001
+From ddd12c056bf05f80ddd728750a519bc502d55f3e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3e950ff61c..829cb7730f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d04d6fff00849a2a8e29ef3251c6ca04a2f68dc7"
+SRCREV = "00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============3093649093323073759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082641954 to 2082665033 (+0%)
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-trivial.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-one.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-overflow.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one_write-z.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test"

--===============3093649093323073759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-trivial.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one_write-z.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-one.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-overflow.shader_test"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7

--===============3093649093323073759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA5MDc1Mjg4MDU1NGRjNTgyZjRhYzU3ODBkYjI4ZTA4M2U2NmNhODBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODozMToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uTGlzdHMudHh0LWRvLW5v
dC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggfCAyICstCiAuLi4wMDAxLXRl
c3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCB8IDIgKy0KIC4u
Li1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoIHwg
OSArKystLS0tLS0KIC4uLi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZh
cmlhYmxlLnBhdGNoIHwgMiArLQogLi4uLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJk
Y29kZS1idWlsZC1wYXQucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAgICB8IDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4t
d2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2Fu
bmVyLXBhdGgtZnIucGF0Y2gKaW5kZXggMGM4NzJkM2U5Yi4uNzVjMmQyZmJmYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4
dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90
LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMmFmOThkNjdlMTZlMDgzYzM2ZTMxOTNhZWZiZGE5NDIzOTlhNDU1YSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZGIzYTMzYTkxY2UwYTI4ZjI5N2ZlMjcwMTY3Y2YyZDBhNDQzNTRl
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIzIEF1ZyAyMDI0IDE1OjI5OjQ1ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkbyBub3Qgb2J0YWluIHdheWxhbmQtc2Nh
bm5lciBwYXRoIGZyb20KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgt
bmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKaW5kZXggY2ZkZmViNjgzZS4u
MjJkZDZjMzYwYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgt
bmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDcwZjhkNTZiZjlkYjlkODVmM2QxOTdhYjlkZTk3MmUzYTUxNDUxNGMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDY1NTlmNWE3ZDgyZDQxMWViMDM1ZjlkN2M1ZGZiOTk4NzE4Mjgw
M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAzIE1heSAyMDIzIDIxOjU5OjQzIC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHRlc3RzOiBGaXggbmFycm93aW5nIGVycm9ycyBzZWVuIHdpdGggY2xhbmcKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWds
LXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1l
Z2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAppbmRleCA2OWNjMzAyOTEyLi5j
OWU3ZmUxZTk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xp
dC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNv
bmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10
ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYzk3ZDVlYWNhZTRmNTg0MzEzYzkyNTFlNTg1YmIwMjQ2
Y2NlZmZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MzIwYzJmZjU3OTNhNjEyYWE3
ZDcyMjNhZTMxNzY1Nzc0NDE2OWYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IEZyaSwgMjIgTm92IDIw
MjQgMjI6NTI6MzEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvZWdsL3NwZWM6IG1ha2Ug
ZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uIGNvbmRpdGlvbmFsCkBAIC0yMCw3ICsyMCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24vQ01ha2VM
aXN0cy5nbGVzMy50eHQgYi90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Np
b24vQ01ha2VMaXN0cy5nbGVzMy50eHQKLWluZGV4IGQ5NTQwYmNmZGUyNy4uMDFhNzAxNjRmNDQ0
IDEwMDY0NAoraW5kZXggZDk1NDBiY2ZkLi4wMWE3MDE2NGYgMTAwNjQ0CiAtLS0gYS90ZXN0cy9l
Z2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24vQ01ha2VMaXN0cy5nbGVzMy50eHQK
ICsrKyBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9DTWFrZUxp
c3RzLmdsZXMzLnR4dAogQEAgLTIsMTAgKzIsMTIgQEAgbGlua19saWJyYXJpZXMoCkBAIC0zOSw3
ICszOSw3IEBAIGluZGV4IGQ5NTQwYmNmZGUyNy4uMDFhNzAxNjRmNDQ0IDEwMDY0NAogIAogICMg
dmltOiBmdD1jbWFrZToKIGRpZmYgLS1naXQgYS90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZh
Y2VfY29tcHJlc3Npb24vY3JlYXRlX3N1cmZhY2UuYyBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRf
c3VyZmFjZV9jb21wcmVzc2lvbi9jcmVhdGVfc3VyZmFjZS5jCi1pbmRleCBlM2Q1NWQ0MzMxZmIu
LjM1ZjEzZmQwMDdiNCAxMDA2NDQKK2luZGV4IGUzZDU1ZDQzMy4uMzVmMTNmZDAwIDEwMDY0NAog
LS0tIGEvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uL2NyZWF0ZV9z
dXJmYWNlLmMKICsrKyBiL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lv
bi9jcmVhdGVfc3VyZmFjZS5jCiBAQCAtMjUsNyArMjUsNiBAQApAQCAtNTAsNiArNTAsMyBAQCBp
bmRleCBlM2Q1NWQ0MzMxZmIuLjM1ZjEzZmQwMDdiNCAxMDA2NDQKICAjaW5jbHVkZSAiLi4vLi4v
ZWdsLXdheWxhbmQuaCIKICAKICBzdGF0aWMgZW51bSBwaWdsaXRfcmVzdWx0Ci0tLSAKLTIuMzku
NQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAy
LWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXIt
V0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5kZXggMTdiY2JjZTE5MC4uZmQw
ODVkYTIyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNl
LXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gOWIyYzIyMTNhMmQ3YWFlYTM1MDY0OWVlMDMxZTIyN2I0NDM0MzQyOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjkwMzNmMzIzZDg3MDU1MjQxMGMzMWQxZTM3MjEzMDRi
OGEzOGU5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhc2NhbCBCYWNoIDxwYXNj
YWwuYmFjaEBzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3QgMjAxOCAxNDo0MzoxNyArMDIw
MAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBXQVlMQU5EX0lOQ0xVREVfRElS
UyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQt
cGF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0
cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCmlu
ZGV4IDc2N2U5M2M0M2UuLmNlMWNlMTJhMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90
LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29k
ZS1idWlsZC1wYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNkNjIxY2YwMjhhY2IzYjQ2
NDc1OWFiYjcyYTM4MTAyODQ0MDc5YjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRk
ZDEyYzA1NmJmMDVmODBkZGQ3Mjg3NTBhNTE5YmM1MDJkNTVmM2UgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTc6MTM6NTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
dGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJkY29kZSBidWlsZCBwYXRoIGlu
dG8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgppbmRleCAzZTk1
MGZmNjFjLi44MjljYjc3MzBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hCiAgICAg
ICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAotU1JDUkVWID0gImQwNGQ2
ZmZmMDA4NDlhMmE4ZTI5ZWYzMjUxYzZjYTA0YTJmNjhkYzciCitTUkNSRVYgPSAiMDBhZmZjZjNh
NzhhMTIwMGNjOGZiMWU1MjY0YzE5YWMxZjhmMGZhMiIKICMgKHdoZW4gUFYgZ29lcyBhYm92ZSAx
LjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4wK2dpdHIiCiAKLS0gCjIuNDQuMQoK

--===============3093649093323073759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:68ccf2aacd0db7e6e9fb3e3307d52814284ef8d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 400 Local 389 Mirrors 0 Missed 11 Current 613 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2146 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2780 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2781 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2782 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2783 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2784 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2785 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2786 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch unihash changed to b74c5c1f94f14b90b90db91a0915c0b025724744cfdb3c3624c589608070e33c
NOTE: Setscene tasks completed
NOTE: Running task 2787 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2789 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2791 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to f18089f9e9107d80e08a4b927b7eed6fa476de4ccda2a38f328e7ac2049eb6ea
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2792 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2792 tasks of which 2778 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101081803.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101081803.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2025346
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2025346
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============3093649093323073759==--

