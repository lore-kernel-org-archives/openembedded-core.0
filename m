Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A69D4A5E8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1440.1768526750779691020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gty2HREW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NCiqFue0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019bc468b246-5e3ba8a1-50e4-465e-b541-2a9d4838b2fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6ptR8GEZt/liP1LTQtoL8vmpPDqJcIzttnfvXmcN71A=;
	b=gty2HREWfSe6Y9QkMgfo1lbQuQFjgw43wPD1NcrCn4Ofzwu/OoMzYSaxDaO7xU0q
	/icvypEJ1j4BCj6Cg/Gh5/+/k2q0ZOXIUNrMvr06ODWXTmxrJ+UakYR5UEE/8e8GBpo
	CXLIeVT3YE/HKrp1qpQHUHAq2hucktECnCmTadEI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6ptR8GEZt/liP1LTQtoL8vmpPDqJcIzttnfvXmcN71A=;
	b=NCiqFue0sQ7mkO9IKsOwYrxlrHjN6vzcbeVEMVHfdbechyWTCxSybEhk+D6Q5i7M
	OJsGfG1P5TmLOkkuqL6uAE74TmnizMRK8rS0ZwaTHPskAlCgyn01CpetggelbPiGcPS
	Euh5vgegWwsjDw+m552cyfIUQlKI/HBwU7cW5t/c=
Content-Type: multipart/mixed; boundary="===============6908855191454737066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa: upgrading to 25.3.3 SUCCEEDED
Message-ID: <0101019bc468b246-5e3ba8a1-50e4-465e-b541-2a9d4838b2fc-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229494

--===============6908855191454737066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *25.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-25.3.1-25.3.3.patch
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
From 95687490e3ee3f21e0add8457ac1dd41f3a1965f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 23:46:40 +0000
Subject: [PATCH] mesa: upgrade 25.3.1 -> 25.3.3

---
 ...su-drop-file-names-from-the-generated-file.patch |  9 +++------
 ...reno-don-t-encode-build-path-into-binaries.patch | 13 +++++--------
 ...don-t-dump-genvk.py-args-to-generated-file.patch |  6 +++---
 ...son-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...et-drop-file-names-from-the-generated-file.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                 |  4 ++--
 6 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
index aab17384d2..920716518b 100644
--- a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
@@ -1,7 +1,7 @@
-From 4c3fad710c5bc702e28ae2bcc3c73b0547c4954d Mon Sep 17 00:00:00 2001
+From 8546d71546bac64168d96765e1956e47ce49e28d Mon Sep 17 00:00:00 2001
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
index 6948abe439..d6a6d39f72 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From a51c363079c7fdab89053d2be259d8df285aa763 Mon Sep 17 00:00:00 2001
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
index 097ca84e3b..b9db011869 100644
--- a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
@@ -1,4 +1,4 @@
-From c0f067e86bc9f7fbc60c2539dc612a050ee2569f Mon Sep 17 00:00:00 2001
+From 97d53d1e0da07e9d3b37c0b54c67b68f182cfd79 Mon Sep 17 00:00:00 2001
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
index baa98a0d46..e5e73de73d 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From cc6e6cd60fda3d0a455c40e2b4ac594e8ef0787c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
index 3e9edc411f..fbd60bfa1f 100644
--- a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
+++ b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
@@ -1,7 +1,7 @@
-From d5462c852d30fc41a223730848550db4f9675517 Mon Sep 17 00:00:00 2001
+From 2ebb2bd9edaedcf7d2d65fbcf4b6876bfce5a9e3 Mon Sep 17 00:00:00 2001
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
index 835e4d46ea..252bc71635 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da"
-PV = "25.3.1"
+SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
+PV = "25.3.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============6908855191454737066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-25.3.1-25.3.3.patch"

RnJvbSA5NTY4NzQ5MGUzZWUzZjIxZTBhZGQ4NDU3YWMxZGQ0MWYzYTE5NjVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjM6NDY6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhOiB1cGdyYWRlIDI1LjMuMSAtPiAyNS4zLjMKCi0tLQogLi4uc3UtZHJvcC1maWxlLW5hbWVz
LWZyb20tdGhlLWdlbmVyYXRlZC1maWxlLnBhdGNoIHwgIDkgKysrLS0tLS0tCiAuLi5yZW5vLWRv
bi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggfCAxMyArKysrKy0tLS0t
LS0tCiAuLi5kb24tdC1kdW1wLWdlbnZrLnB5LWFyZ3MtdG8tZ2VuZXJhdGVkLWZpbGUucGF0Y2gg
fCAgNiArKystLS0KIC4uLnNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFu
Zy5wYXRjaCB8ICAyICstCiAuLi5ldC1kcm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2VuZXJhdGVk
LWZpbGUucGF0Y2ggfCAgOSArKystLS0tLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1ldGhvc3UtZHJvcC1maWxlLW5hbWVzLWZyb20tdGhlLWdl
bmVyYXRlZC1maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1ldGhvc3UtZHJvcC1maWxlLW5hbWVzLWZyb20tdGhlLWdlbmVyYXRlZC1maWxlLnBhdGNoCmlu
ZGV4IGFhYjE3Mzg0ZDIuLjkyMDcxNjUxOGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL2ZpbGVzLzAwMDEtZXRob3N1LWRyb3AtZmlsZS1uYW1lcy1mcm9tLXRoZS1nZW5l
cmF0ZWQtZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8w
MDAxLWV0aG9zdS1kcm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDRjM2ZhZDcxMGM1YmM3MDJlMjhhZTJiY2MzYzczYjA1NDdj
NDk1NGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg1NDZkNzE1NDZiYWM2NDE2OGQ5
Njc2NWUxOTU2ZTQ3Y2U0OWUyOGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEbWl0
cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBX
ZWQsIDE5IE5vdiAyMDI1IDE0OjE5OjM2ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBldGhv
c3U6IGRyb3AgZmlsZSBuYW1lcyBmcm9tIHRoZSBnZW5lcmF0ZWQgZmlsZQorU3ViamVjdDogW1BB
VENIXSBldGhvc3U6IGRyb3AgZmlsZSBuYW1lcyBmcm9tIHRoZSBnZW5lcmF0ZWQgZmlsZQogCiBI
YXZpbmcgZmlsZSBuYW1lcyBhbmQgZGF0ZXMgaW4gdGhlIGdlbmVyYXRlZCBmaWxlIGFmZmVjdHMK
IHJlcHJvZHVjaWJpbGl0eS4gQnVpbGQgc3lzdGVtcyAobGlrZSBPRSkgZXJyb3Igb3V0IG9uIHRo
ZSBnZW5faGVhZGVyLnB5CkBAIC0xNSw3ICsxNSw3IEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvY2Ri
CiAgMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dh
bGxpdW0vZHJpdmVycy9ldGhvc3UvZ2VuX2hlYWRlci5weSBiL3NyYy9nYWxsaXVtL2RyaXZlcnMv
ZXRob3N1L2dlbl9oZWFkZXIucHkKLWluZGV4IGI1NDUxNmE4MTJjNy4uNDQ0NzE4OTM1OTRiIDEw
MDY0NAoraW5kZXggYjU0NTE2YS4uNDQ0NzE4OSAxMDA2NDQKIC0tLSBhL3NyYy9nYWxsaXVtL2Ry
aXZlcnMvZXRob3N1L2dlbl9oZWFkZXIucHkKICsrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRo
b3N1L2dlbl9oZWFkZXIucHkKIEBAIC0yOSwyMSArMjksOSBAQCBkZWYgZHVtcF9jKGFyZ3MsIGd1
YXJkLCBmdW5jKToKQEAgLTQwLDYgKzQwLDMgQEAgaW5kZXggYjU0NTE2YTgxMmM3Li40NDQ3MTg5
MzU5NGIgMTAwNjQ0CiAgCQlwcmludCgiQ29weXJpZ2h0IChDKSAlcy0lcyBieSB0aGUgZm9sbG93
aW5nIGF1dGhvcnM6IiAlIChwLmNvcHlyaWdodF95ZWFyLCBjdXJyZW50X3llYXIpKQogIAkJZm9y
IGF1dGhvciBpbiBwLmF1dGhvcnM6CiAgCQkJcHJpbnQoIi0gIiArIGF1dGhvcikKLS0tIAotMi41
MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEt
ZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNv
ZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCmluZGV4IDY5NDhhYmU0MzkuLmQ2YTZk
MzlmNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEt
ZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQt
ZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDI3YWMzNjc1NmNjNzVlZWE5ZWQ0ZmVlMTM1YTM1MWFmMzBiMzVmZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTUxYzM2MzA3OWM3ZmRhYjg5MDUzZDJiZTI1OWQ4ZGYyODVhYTc2
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRy
eS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KIERhdGU6IFR1ZSwgMTYgSnVsIDIwMjQgMTI6MzI6NDcg
KzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZnJlZWRyZW5vOiBkb24ndCBlbmNvZGUgYnVpbGQgcGF0
aCBpbnRvIGJpbmFyaWVzCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IERtaXRyeSBC
YXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KICAzIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9mcmVl
ZHJlbm8vYWZ1Yy9tZXNvbi5idWlsZCBiL3NyYy9mcmVlZHJlbm8vYWZ1Yy9tZXNvbi5idWlsZAot
aW5kZXggYmI3Y2ViZjVhNzQ4Li4zNTFjYzMxZWYyZGUgMTAwNjQ0CitpbmRleCA1ZGRkYzlhLi4x
OTMyNDEwIDEwMDY0NAogLS0tIGEvc3JjL2ZyZWVkcmVuby9hZnVjL21lc29uLmJ1aWxkCiArKysg
Yi9zcmMvZnJlZWRyZW5vL2FmdWMvbWVzb24uYnVpbGQKIEBAIC01NiwxMCArNTYsMTIgQEAgaWYg
d2l0aF90ZXN0cwpAQCAtNTAsNyArNTAsNyBAQCBpbmRleCBiYjdjZWJmNWE3NDguLjM1MWNjMzFl
ZjJkZSAxMDA2NDQKICAgICAgKQogICAgICB0ZXN0KCdhZnVjLWRpc2FzbScsCiBkaWZmIC0tZ2l0
IGEvc3JjL2ZyZWVkcmVuby9kZWNvZGUvbWVzb24uYnVpbGQgYi9zcmMvZnJlZWRyZW5vL2RlY29k
ZS9tZXNvbi5idWlsZAotaW5kZXggNDY5ZWViNGViNTk3Li5kZmExYzEyZDBkOWYgMTAwNjQ0Citp
bmRleCBjZjVjMWU3Li45NmRjYjBhIDEwMDY0NAogLS0tIGEvc3JjL2ZyZWVkcmVuby9kZWNvZGUv
bWVzb24uYnVpbGQKICsrKyBiL3NyYy9mcmVlZHJlbm8vZGVjb2RlL21lc29uLmJ1aWxkCiBAQCAt
MTk0LDYgKzE5NCw3IEBAIGlmIGRlcF9sdWEuZm91bmQoKSBhbmQgZGVwX2xpYmFyY2hpdmUuZm91
bmQoKQpAQCAtNjEsNyArNjEsNyBAQCBpbmRleCA0NjllZWI0ZWI1OTcuLmRmYTFjMTJkMGQ5ZiAx
MDA2NDQKICAgICAgICAgIGNhcHR1cmU6IHRydWUsCiAgICAgICAgKQogICAgICAgIHRlc3QoJ2Nm
ZmR1bXAtJyArIG5hbWUsCi1AQCAtMjQ3LDcgKzI0OCw4IEBAIGlmIHdpdGhfdGVzdHMKK0BAIC0y
ODMsNyArMjg0LDggQEAgaWYgd2l0aF90ZXN0cwogICAgICAgIG91dHB1dDogbmFtZSArICcubG9n
JywKICAgICAgICBjb21tYW5kOiBbY3Jhc2hkZWMsIGFyZ3MsIGZpbGVzKCcuLi90ZXN0cy90cmFj
ZXMvJyArIG5hbWUgKyAnLmRldmNvcmUnKV0sCiAgICAgICAgY2FwdHVyZTogdHJ1ZSwKQEAgLTcy
LDcgKzcyLDcgQEAgaW5kZXggNDY5ZWViNGViNTk3Li5kZmExYzEyZDBkOWYgMTAwNjQ0CiAgCiAg
ICAgIHRlc3QoJ2NyYXNoZGVjLScgKyBuYW1lLAogZGlmZiAtLWdpdCBhL3NyYy9mcmVlZHJlbm8v
bWVzb24uYnVpbGQgYi9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCi1pbmRleCA5OGU0OWI4ZmNm
MGUuLjE0NWU3MjU5N2ViOSAxMDA2NDQKK2luZGV4IDI5ZTFiYzQuLmFmYjc0MjYgMTAwNjQ0CiAt
LS0gYS9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCiArKysgYi9zcmMvZnJlZWRyZW5vL21lc29u
LmJ1aWxkCiBAQCAtNiw3ICs2LDcgQEAgaW5jX2ZyZWVkcmVub19ybm4gPSBpbmNsdWRlX2RpcmVj
dG9yaWVzKCdybm4nKQpAQCAtODQsNiArODQsMyBAQCBpbmRleCA5OGU0OWI4ZmNmMGUuLjE0NWU3
MjU5N2ViOSAxMDA2NDQKICAKICBkZXBfbGliYXJjaGl2ZSA9IGRlcGVuZGVuY3koJ2xpYmFyY2hp
dmUnLCBhbGxvd19mYWxsYmFjazogdHJ1ZSwgcmVxdWlyZWQ6IGZhbHNlKQogIGRlcF9saWJ4bWwy
ID0gZGVwZW5kZW5jeSgnbGlieG1sLTIuMCcsIGFsbG93X2ZhbGxiYWNrOiB0cnVlLCByZXF1aXJl
ZDogZmFsc2UpCi0tLS0KLTIuMzkuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLWdmeHN0cmVhbS1kb24tdC1kdW1wLWdlbnZrLnB5LWFyZ3MtdG8t
Z2VuZXJhdGVkLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8w
MDAxLWdmeHN0cmVhbS1kb24tdC1kdW1wLWdlbnZrLnB5LWFyZ3MtdG8tZ2VuZXJhdGVkLWZpbGUu
cGF0Y2gKaW5kZXggMDk3Y2E4NGUzYi4uYjlkYjAxMTg2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nZnhzdHJlYW0tZG9uLXQtZHVtcC1nZW52ay5w
eS1hcmdzLXRvLWdlbmVyYXRlZC1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2Z4c3RyZWFtLWRvbi10LWR1bXAtZ2VudmsucHktYXJncy10by1n
ZW5lcmF0ZWQtZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzBmMDY3ZTg2YmM5Zjdm
YmM2MGMyNTM5ZGM2MTJhMDUwZWUyNTY5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
OTdkNTNkMWUwZGEwN2U5ZDNiMzdjMGI1NGM2N2I2OGYxODJjZmQ3OSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1
YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTkgTm92IDIwMjUgMTE6MzY6NDIgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gZ2Z4c3RyZWFtOiBkb24ndCBkdW1wIGdlbnZrLnB5IGFyZ3MgdG8gZ2VuZXJh
dGVkIGZpbGVzCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlz
aGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9nZnhz
dHJlYW0vY29kZWdlbi9zY3JpcHRzL2NlcmVhbGdlbmVyYXRvci5weSBiL3NyYy9nZnhzdHJlYW0v
Y29kZWdlbi9zY3JpcHRzL2NlcmVhbGdlbmVyYXRvci5weQotaW5kZXggMDc3NTcxZTllZGE1Li4y
MTdjM2UxZDBlOTQgMTAwNjQ0CitpbmRleCAyYjZhM2M3Li42YjExMjA5IDEwMDY0NAogLS0tIGEv
c3JjL2dmeHN0cmVhbS9jb2RlZ2VuL3NjcmlwdHMvY2VyZWFsZ2VuZXJhdG9yLnB5CiArKysgYi9z
cmMvZ2Z4c3RyZWFtL2NvZGVnZW4vc2NyaXB0cy9jZXJlYWxnZW5lcmF0b3IucHkKLUBAIC0yNTQs
MTMgKzI1NCw3IEBAIGRlZiBiYW5uZXJfY29tbWFuZChhcmd2KToKK0BAIC0yNTYsMTMgKzI1Niw3
IEBAIGRlZiBiYW5uZXJfY29tbWFuZChhcmd2KToKICAgICAgICAgUmV0dXJuIGEgc3RyaW5nIGNv
cnJlc3BvbmRpbmcgdG8gdGhlIGNvbW1hbmQsIHdpdGggcGxhdGZvcm0tc3BlY2lmaWMKICAgICAg
ICAgcGF0aHMgcmVtb3ZlZC4iIiIKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMt
Y2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29u
LW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4IGJhYTk4
YTBkNDYuLmU1ZTczZGU3M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1t
aXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMDJjYzIxODAwZmUyOWY1NjZhZGQ1MjVlNjNmNjE5YzA1MzZkNmU3YiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2M2ZTZjZDYwZmRhM2QwYTQ1NWM0MGUyYjRhYzU5NGU4
ZWYwNzg3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG1lc29uIG1pc2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBzL2NsYW5n
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLXJvY2tl
dC1kcm9wLWZpbGUtbmFtZXMtZnJvbS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLXJvY2tldC1kcm9wLWZpbGUtbmFtZXMtZnJv
bS10aGUtZ2VuZXJhdGVkLWZpbGUucGF0Y2gKaW5kZXggM2U5ZWRjNDExZi4uZmJkNjBiZmExZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMi1yb2NrZXQt
ZHJvcC1maWxlLW5hbWVzLWZyb20tdGhlLWdlbmVyYXRlZC1maWxlLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItcm9ja2V0LWRyb3AtZmlsZS1uYW1lcy1m
cm9tLXRoZS1nZW5lcmF0ZWQtZmlsZS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZDU0NjJj
ODUyZDMwZmM0MWEyMjM3MzA4NDg1NTBkYjRmOTY3NTUxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMmViYjJiZDllZGFlZGNmN2QyZDY1ZmJjZjRiNjg3NmJmY2U1YTllMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hr
b3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTkgTm92IDIwMjUgMTQ6MTk6MzYgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzJdIHJvY2tldDogZHJvcCBmaWxlIG5hbWVzIGZyb20gdGhl
IGdlbmVyYXRlZCBmaWxlCitTdWJqZWN0OiBbUEFUQ0hdIHJvY2tldDogZHJvcCBmaWxlIG5hbWVz
IGZyb20gdGhlIGdlbmVyYXRlZCBmaWxlCiAKIEhhdmluZyBmaWxlIG5hbWVzIGFuZCBkYXRlcyBp
biB0aGUgZ2VuZXJhdGVkIGZpbGUgYWZmZWN0cwogcmVwcm9kdWNpYmlsaXR5LiBCdWlsZCBzeXN0
ZW1zIChsaWtlIE9FKSBlcnJvciBvdXQgb24gdGhlIGdlbl9oZWFkZXIucHkKQEAgLTE1LDcgKzE1
LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC83YTMKICAxIGZpbGUgY2hhbmdlZCwgMTIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL3JvY2tldC9nZW5faGVh
ZGVyLnB5IGIvc3JjL2dhbGxpdW0vZHJpdmVycy9yb2NrZXQvZ2VuX2hlYWRlci5weQotaW5kZXgg
ZjNjNjYxNWRjYjQyLi41NDU3ZWY3MWQ1OTUgMTAwNjQ0CitpbmRleCBmM2M2NjE1Li41NDU3ZWY3
IDEwMDY0NAogLS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9yb2NrZXQvZ2VuX2hlYWRlci5weQog
KysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9yb2NrZXQvZ2VuX2hlYWRlci5weQogQEAgLTI5LDIx
ICsyOSw5IEBAIGRlZiBkdW1wX2MoYXJncywgZ3VhcmQsIGZ1bmMpOgpAQCAtNDAsNiArNDAsMyBA
QCBpbmRleCBmM2M2NjE1ZGNiNDIuLjU0NTdlZjcxZDU5NSAxMDA2NDQKICAJCXByaW50KCJDb3B5
cmlnaHQgKEMpICVzLSVzIGJ5IHRoZSBmb2xsb3dpbmcgYXV0aG9yczoiICUgKHAuY29weXJpZ2h0
X3llYXIsIGN1cnJlbnRfeWVhcikpCiAgCQlmb3IgYXV0aG9yIGluIHAuYXV0aG9yczoKICAJCQlw
cmludCgiLSAiICsgYXV0aG9yKQotLS0gCi0yLjUxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhLmluYwppbmRleCA4MzVlNGQ0NmVhLi4yNTJiYzcxNjM1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9tZXNhLmluYwpAQCAtMjIsOCArMjIsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8vYXJjaGl2
ZS5tZXNhM2Qub3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
cm9ja2V0LWRyb3AtZmlsZS1uYW1lcy1mcm9tLXRoZS1nZW5lcmF0ZWQtZmlsZS5wYXRjaCBcCiAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTlkMGQ5ODU2MjJmNDk1ODhmMDFhYTI5MTUyODA0
ZjRkYThmZmU2YWRkMDQ2ZTAwYTUyOTIzMzc5YzJkOGRhIgotUFYgPSAiMjUuMy4xIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjA1MzI4YjM4OTFjMDAwZTZhMTEwYTNlNzMyMWQ4YmZiYjIxNjMxZDEz
MmJmODZiZDNkNGE4ZjQ1YzUzNWVmNmIiCitQViA9ICIyNS4zLjMiCiAKIFVQU1RSRUFNX0NIRUNL
X0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEK
Cg==

--===============6908855191454737066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-25.3.1.so", added "/usr/lib/libgallium-25.3.3.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.3.so
Changes to packages/x86_64-linux/mesa-native (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.3.so

--===============6908855191454737066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-25.3.1.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch file://0001-ethosu-drop-file-names-from-the-generated-file.patch file://0002-rocket-drop-file-names-from-the-generated-file.patch" to "https://archive.mesa3d.org/mesa-25.3.3.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch file://0001-ethosu-drop-file-names-from-the-generated-file.patch file://0002-rocket-drop-file-names-from-the-generated-file.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-25.3.1.so", added "/usr/lib/libgallium-25.3.3.so"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 633968512 to 634003696 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-25.3.1.so", added "/usr/lib/.debug/libgallium-25.3.3.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 201969 to 204747 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 194625376 to 194625527 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/25.3.1/src/mesa -> /usr/src/debug/mesa/25.3.3/src/mesa, directory renamed /usr/src/debug/mesa/25.3.1/src/util -> /usr/src/debug/mesa/25.3.3/src/util, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler -> /usr/src/debug/mesa/25.3.3/src/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/zink -> /usr/src/debug/mesa/25.3.3/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/25.3.3/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/vulkan -> /usr/src/debug/mesa/25.3.3/src/intel/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/25.3.3/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/dev -> /usr/src/debug/mesa/25.3.3/src/intel/dev, directory renamed /usr/src/debug/mesa/25.
 3.1/src/util/format -> /usr/src/debug/mesa/25.3.3/src/util/format, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/r600 -> /usr/src/debug/mesa/25.3.3/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/compiler -> /usr/src/debug/mesa/25.3.3/src/intel/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/25.3.3/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/compiler/brw -> /usr/src/debug/mesa/25.3.3/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/compiler -> /usr/src/debug/mesa/25.3.3/src/amd/compiler, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/compiler/elk -> /usr/src/debug/mesa/25.3.3/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/genxml -> /usr/src/debug/mesa/25.3.3/src/intel/genxml, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/program -> /usr/src/debug/mesa/25.3.3/src/mesa/p
 rogram, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/common -> /usr/src/debug/mesa/25.3.3/src/amd/common, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/vulkan -> /usr/src/debug/mesa/25.3.3/src/amd/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/nouveau/headers -> /usr/src/debug/mesa/25.3.3/src/nouveau/headers, directory renamed /usr/src/debug/mesa/25.3.1/src/amd/vulkan/layers -> /usr/src/debug/mesa/25.3.3/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/isl -> /usr/src/debug/mesa/25.3.3/src/intel/isl, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/25.3.3/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/25.3.1/src/vulkan/runtime -> /usr/src/debug/mesa/25.3.3/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/25.3.1/src/loader -> /usr/src/debug/mesa/25.3.3/src/loader, directory renamed /usr/src/debug/mesa/25.3.1/src/virtio/vulkan -> /usr/src/debug/mesa/25.3.3/
 src/virtio/vulkan, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/spirv -> /usr/src/debug/mesa/25.3.3/src/compiler/spirv, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/shaders -> /usr/src/debug/mesa/25.3.3/src/intel/shaders, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/auxiliary -> /usr/src/debug/mesa/25.3.3/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/drivers/r300 -> /usr/src/debug/mesa/25.3.3/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/25.3.1/src/vulkan/util -> /usr/src/debug/mesa/25.3.3/src/vulkan/util, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/nir -> /usr/src/debug/mesa/25.3.3/src/compiler/nir, directory renamed /usr/src/debug/mesa/25.3.1/src/vulkan/wsi -> /usr/src/debug/mesa/25.3.3/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/25.3.1/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/25.3.3/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/v
 ulkan_hasvk -> /usr/src/debug/mesa/25.3.3/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/25.3.1/src/compiler/glsl -> /usr/src/debug/mesa/25.3.3/src/compiler/glsl, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/ds -> /usr/src/debug/mesa/25.3.3/src/intel/ds, directory renamed /usr/src/debug/mesa/25.3.1/src/intel/perf -> /usr/src/debug/mesa/25.3.3/src/intel/perf, directory renamed /usr/src/debug/mesa/25.3.1/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/25.3.3/src/gallium/frontends/lavapipe
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 74781810 to 74785906 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "25.3.1" to "25.3.3"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 25.3.1 [default] to 25.3.3 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.3.so
Changes to packages/x86_64-linux/mesa-native (sysroot):
  /usr/lib/libgallium-25.3.1.so moved to /usr/lib/libgallium-25.3.3.so

--===============6908855191454737066==--

