Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FD3E9A050
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1402.1771440091416486362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Im/Rz6hO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pg7RDiFX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ead92-1bd0d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7GD4THprNfne2SSjlQHz0v62cGXL9thPoIzrYBDNdeI=;
	b=Im/Rz6hOjQIR3mFKFmm1BAIBAmEOoSOh38J/ZhumcQJHwdBnzN0WyWXGauthwJrd
	FAwoOS+Re95cQfZGxrdbyz/ZBpjqzSu+4H8H90bxrPmdBQMGdIdHny0SOtoDuR1+oPA
	CaBeiBnjLfhQ5cQ9HvlQbrmPix/t/Hcq/AlVK/AI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7GD4THprNfne2SSjlQHz0v62cGXL9thPoIzrYBDNdeI=;
	b=pg7RDiFXYv207pzkPZoRtydDBsUxOEcjY1lKjMGtHCMXFoO8+j2bMaA/4p97I//8
	2HYSuMnMk9ic2O9Wf2R590xyf8yhmdMkxbvUGDQ5MZ+ErE0+MMvbhi71mr2sp5B488J
	qSgKlwKZxVmR/fMGa3RhnEQyrAScfAcmIaEuaKGY=
Content-Type: multipart/mixed; boundary="===============4108194074826009190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.4,2.86.4 SUCCEEDED
Message-ID: <0101019c720ead92-1bd0d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231318

--===============4108194074826009190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.86.4,2.86.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.86.3-2.86.4-2.86.patch
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
From f26f7cdd559a18e73650dfde820cfb625e61af3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 09:50:13 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.86.3 -> 2.86.4,2.86.3 ->
 2.86.4

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch    | 2 +-
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch        | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch  | 2 +-
 ...move-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...o-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch      | 4 ++--
 ...son.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch        | 6 +++---
 meta/recipes-core/glib-2.0/files/relocate-modules.patch     | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch         | 2 +-
 ...lib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb} | 0
 .../glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 14 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 06841ddfb8..f2abc132fe 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
+From cfdbeaf0908e066a6fda2da6c517b2afc3a9646c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b91624da8b..aaca41c879 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
+From adeb92bfb0d77dccce81a89f66b69765955f4d6c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 2ebf01b672..0ea9a0a866 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
+From 4b325856a07d2f5a507e325762fe69d9a6243f6f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d6dd66357a..4098f53fc0 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
+From 9e9627abeab6d2d5e6af96a095d6fa8d6bf1d5d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 7a2fc0b7ef..ddd6478913 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
+From 343e5d98b22fff1cd17f4ce26b3ff63076f316dd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e4b0d6be79..5f408905e5 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
+From efb81022de5e6fdcc66534f8645d528fdb59206c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index dab1d61..cc3a5ed 100644
+index 89556c6..57b4228 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2092,7 +2092,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 712ae25b27..52b65045e0 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
+From d4bf8705362142f0edd6d6c04524e187243e2621 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index cc3a5ed..58dd87a 100644
+index 57b4228..4924207 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1090,7 +1090,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8dbdf746b7..08c4e414a6 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
+From 5279825f77ac36d62c97ed9371a65c51c3df8c30 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
index daf86224d5..b68922af9b 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
@@ -1,4 +1,4 @@
-From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 2001
+From d79a6b0b5c7bd00eab132e721a7cbe2d811fffc0 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 18 Dec 2025 23:12:18 +0000
 Subject: [PATCH] gbufferedinputstream: Fix a potential integer overflow in
@@ -23,7 +23,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
-index 9e6bacc62..56d656be0 100644
+index 779f2d2..7fd0e84 100644
 --- a/gio/gbufferedinputstream.c
 +++ b/gio/gbufferedinputstream.c
 @@ -590,7 +590,7 @@ g_buffered_input_stream_peek (GBufferedInputStream *stream,
@@ -36,7 +36,7 @@ index 9e6bacc62..56d656be0 100644
  
    end = MIN (offset + count, available);
 diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-input-stream.c
-index a1af4eeff..2b2a0d9aa 100644
+index 321654d..5d3e976 100644
 --- a/gio/tests/buffered-input-stream.c
 +++ b/gio/tests/buffered-input-stream.c
 @@ -60,6 +60,16 @@ test_peek (void)
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 09de155d08..d03b9ee809 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
+From a6c2ae473459cd82c670e32a5eb16bb8713bd49b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 8ef140d0d7..81909c34b4 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
+From c312df182d4af0a2a73fa1ce401e7e478abfbc52 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675..d1f25ef8f2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,7 +237,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b3211d8d34b9df5dca05787ef0ad5d7ca75dec998b970e1aab0001d229977c65"
+SRC_URI[archive.sha256sum] = "d4e2b5d791d5015ffd8c6971ad8e975a0a55c1a14926cdb25cf843ff00682260"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============4108194074826009190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.86.3-2.86.4-2.86.patch"

RnJvbSBmMjZmN2NkZDU1OWExOGU3MzY1MGRmZGU4MjBjZmI2MjVlNjFhZjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMDk6NTA6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMC1pbml0aWFsLGdsaWItMi4wOiB1cGdyYWRlIDIuODYuMyAtPiAyLjg2LjQsMi44Ni4z
IC0+CiAyLjg2LjQKCi0tLQogLi4uLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2ggICAgfCAyICstCiAuLi4vZmlsZXMvMDAwMS1GaXgtREFUQURJUk5B
TUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi8wMDAxLUluc3RhbGwt
Z2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggIHwgMiArLQogLi4ubW92
ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2ggfCAy
ICstCiAuLi5vLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5
LS5wYXRjaCB8IDIgKy0KIC4uLi8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmct
YXMtd2VsbC5wYXRjaCAgICAgIHwgNCArKy0tCiAuLi5zb24uYnVpbGQtZG8tbm90LWVuYWJsZS1w
aWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCB8IDQgKystLQogLi4uMDEwLURvLW5vdC1o
YXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9DVkUtMjAyNi0wOTg4LnBhdGNoICAgICAgICB8
IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1
bGVzLnBhdGNoICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3Nr
aXAtdGltZW91dC5wYXRjaCAgICAgICAgIHwgMiArLQogLi4ubGliLTIuMC1pbml0aWFsXzIuODYu
My5iYiA9PiBnbGliLTIuMC1pbml0aWFsXzIuODYuNC5iYn0gfCAwCiAuLi4vZ2xpYi0yLjAve2ds
aWItMi4wXzIuODYuMy5iYiA9PiBnbGliLTIuMF8yLjg2LjQuYmJ9ICAgICB8IDAKIG1ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQogMTQgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWluaXRpYWxfMi44Ni4z
LmJiID0+IGdsaWItMi4wLWluaXRpYWxfMi44Ni40LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi44Ni4zLmJiID0+IGdsaWItMi4wXzIuODYu
NC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRp
ci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggMDY4NDFkZGZiOC4uZjJhYmMxMzJm
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1u
b3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1w
a2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZmUzOTY1MzgzZDk0
YjMwMzBlODVhYjg5OTk1NTg1ODcxMGZlYzVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjZmRiZWFmMDkwOGUwNjZhNmZkYTJkYTZjNTE3YjJhZmMzYTk2NDZjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBGcmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIERvIG5vdCBwcmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGluIHBrZy1jb25maWcg
ZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
Rml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRj
aAppbmRleCBiOTE2MjRkYThiLi5hYWNhNDFjODc5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFU
QURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NjZj
NThhYWUzNWY5ZTJiY2VmNTIzOGUwMzMxYTExOWUwZTUxYWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhZGViOTJiZmIwZDc3ZGNjY2U4MWE4OWY2NmI2OTc2NTk1NWY0ZDZjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
IERhdGU6IFNhdCwgMTUgTWFyIDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0g
Rml4IERBVEFESVJOQU1FIG9uIHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGli
ZXhlY19QUk9HUkFNLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4
IDJlYmYwMWI2NzIuLjBlYTlhMGE4NjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJP
R1JBTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUlu
c3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDBkZTNhM2E3OTFjYTMyZjIzMzBlYjNhOGFkOWRhMGZlNmRjZTk1MGMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRiMzI1ODU2YTA3ZDJmNWE1MDdlMzI1NzYyZmU2
OWQ5YTYyNDNmNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25l
biA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNTox
NDo1OCArMDIwMAogU3ViamVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMg
bGliZXhlY19QUk9HUkFNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNj
aGVtYXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92
ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKaW5k
ZXggZDZkZDY2MzU3YS4uNDA5OGY1M2ZjMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1w
YXRocy1pbi1zY2hlbWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2No
ZW1hcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjgyOWYzMjA1ZTRkODM5MGYwMmVhYThl
N2E3YmY4NWU1MWNiYjdlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWU5NjI3YWJl
YWI2ZDJkNWU2YWY5NmEwOTVkNmZhOGQ2YmYxZDVkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
RnJpLCAxMiBKdW4gMjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUg
dGhlIHdhcm5pbmcgYWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hlbWFzCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJj
ZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91
dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKaW5kZXggN2EyZmMwYjdlZi4uZGRkNjQ3ODkxMyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVz
dHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNl
cy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gOTEyZTY3NGJiMGEzYjUxZGFiYWE1OGRhMTgzNDQ5MWVmOTRlNmEyYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzQzZTVkOThiMjJmZmYxY2QxN2Y0Y2UyNmIzZmY2MzA3NmYz
MTZkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE4OjIyOjQ2ICsw
MTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdpby90ZXN0cy9yZXNvdXJjZXMuYzogY29tbWVudCBvdXQg
YSBidWlsZCBob3N0LW9ubHkgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1h
dG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAppbmRleCBlNGIwZDZiZTc5Li41ZjQw
ODkwNWU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qt
b24tY2xhbmctYXMtd2VsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjZkZGFlMDJkNzY3
N2JjZmY3YzM5MzNlZTg1NmQzNGRmNDFiNTQ4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZWZiODEwMjJkZTVlNmZkY2M2NjUzNGY4NjQ1ZDUyOGZkYjU5MjA2YyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBT
YXQsIDEyIE9jdCAyMDE5IDE3OjQ2OjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBS
dW4gYXRvbWljcyB0ZXN0IG9uIGNsYW5nIGFzIHdlbGwKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxk
IGIvbWVzb24uYnVpbGQKLWluZGV4IGRhYjFkNjEuLmNjM2E1ZWQgMTAwNjQ0CitpbmRleCA4OTU1
NmM2Li41N2I0MjI4IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxk
CiBAQCAtMjA5Miw3ICsyMDkyLDcgQEAgYXRvbWljZGVmaW5lID0gJycnCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1l
bmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVh
dHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKaW5kZXggNzEyYWUyNWIyNy4uNTJiNjUwNDVlMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWls
ZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVu
YWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYzZjZDNjMGE2NmFlOGYyMTAxODVlMGNiMDViMjE3MmRjMTkyY2U5ZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZDRiZjg3MDUzNjIxNDJmMGVkZDZkNmMwNDUyNGUxODcyNDNlMjYy
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIzIDIyOjI4OjI3ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBkbyBub3QgZW5hYmxlIHBpZGZkIGZlYXR1cmVz
IG9uIG5hdGl2ZSBnbGliCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNv
bi5idWlsZAotaW5kZXggY2MzYTVlZC4uNThkZDg3YSAxMDA2NDQKK2luZGV4IDU3YjQyMjguLjQ5
MjQyMDcgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0x
MDkwLDcgKzEwOTAsOCBAQCBpZiBjYy5saW5rcygnJycjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90
LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRo
LWludG8tdmFyaW91cy10b29scy5wYXRjaAppbmRleCA4ZGJkZjc0NmI3Li4wOGM0ZTQxNGE2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1o
YXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBh
dGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MGU0MDIz
MGU2YTNjNTJiNzljNmY5MmU4YzA2MGJkNGQ5M2YwMzc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1Mjc5ODI1Zjc3YWMzNmQ2MmM5N2VkOTM3MWE2NWM1MWMzZGY4YzMwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBUdWUsIDMgT2N0IDIwMTcgMTA6NDU6NTUgKzAzMDAKIFN1YmplY3Q6
IFtQQVRDSF0gRG8gbm90IGhhcmRjb2RlIHB5dGhvbiBwYXRoIGludG8gdmFyaW91cyB0b29scwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvQ1ZFLTIwMjYtMDk4
OC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL0NWRS0yMDI2LTA5ODgu
cGF0Y2gKaW5kZXggZGFmODYyMjRkNS4uYjY4OTIyYWY5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvQ1ZFLTIwMjYtMDk4OC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9DVkUtMjAyNi0wOTg4LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjNTc2NmNmZjYxZmZjZTBiOGU3ODdlYWUwOTkwOGFjMzQ4MzM4ZTVmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNzlhNmIwYjVjN2JkMDBlYWIxMzJlNzIxYTdjYmUy
ZDgxMWZmZmMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbGlwIFdpdGhuYWxs
IDxwd2l0aG5hbGxAZ25vbWUub3JnPgogRGF0ZTogVGh1LCAxOCBEZWMgMjAyNSAyMzoxMjoxOCAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBnYnVmZmVyZWRpbnB1dHN0cmVhbTogRml4IGEgcG90ZW50
aWFsIGludGVnZXIgb3ZlcmZsb3cgaW4KQEAgLTIzLDcgKzIzLDcgQEAgU2lnbmVkLW9mZi1ieTog
UGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL2didWZm
ZXJlZGlucHV0c3RyZWFtLmMgYi9naW8vZ2J1ZmZlcmVkaW5wdXRzdHJlYW0uYwotaW5kZXggOWU2
YmFjYzYyLi41NmQ2NTZiZTAgMTAwNjQ0CitpbmRleCA3NzlmMmQyLi43ZmQwZTg0IDEwMDY0NAog
LS0tIGEvZ2lvL2didWZmZXJlZGlucHV0c3RyZWFtLmMKICsrKyBiL2dpby9nYnVmZmVyZWRpbnB1
dHN0cmVhbS5jCiBAQCAtNTkwLDcgKzU5MCw3IEBAIGdfYnVmZmVyZWRfaW5wdXRfc3RyZWFtX3Bl
ZWsgKEdCdWZmZXJlZElucHV0U3RyZWFtICpzdHJlYW0sCkBAIC0zNiw3ICszNiw3IEBAIGluZGV4
IDllNmJhY2M2Mi4uNTZkNjU2YmUwIDEwMDY0NAogIAogICAgZW5kID0gTUlOIChvZmZzZXQgKyBj
b3VudCwgYXZhaWxhYmxlKTsKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvYnVmZmVyZWQtaW5wdXQt
c3RyZWFtLmMgYi9naW8vdGVzdHMvYnVmZmVyZWQtaW5wdXQtc3RyZWFtLmMKLWluZGV4IGExYWY0
ZWVmZi4uMmIyYTBkOWFhIDEwMDY0NAoraW5kZXggMzIxNjU0ZC4uNWQzZTk3NiAxMDA2NDQKIC0t
LSBhL2dpby90ZXN0cy9idWZmZXJlZC1pbnB1dC1zdHJlYW0uYwogKysrIGIvZ2lvL3Rlc3RzL2J1
ZmZlcmVkLWlucHV0LXN0cmVhbS5jCiBAQCAtNjAsNiArNjAsMTYgQEAgdGVzdF9wZWVrICh2b2lk
KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUt
bW9kdWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRl
LW1vZHVsZXMucGF0Y2gKaW5kZXggMDlkZTE1NWQwOC4uZDAzYjllZTgwOSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNGJiYzc3YmM0NjViNDI0NTQxMTJiYzZhMzMyNjRj
MmMzZTAxM2U1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNmMyYWU0NzM0NTljZDgy
YzY3MGUzMmE1ZWIxNmJiODcxM2JkNDliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIw
MTYgMTU6MzU6NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRo
ZSBHSU8gbW9kdWxlIGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCmluZGV4IDhlZjE0
MGQwZDcuLjgxOTA5YzM0YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY3N2I5ZGQ3
MmRkMDEwM2M3YTI4ZGQ3ZTFjZGY2ZTMxNmVjYmYwMzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGMzMTJkZjE4MmQ0YWYwYTJhNzNmYTFjZTQwMWU3ZTQ3OGFiZmJjNTIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4K
IERhdGU6IFRodSwgMjggTWFyIDIwMjQgMTY6Mjc6MDkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
U2tpcCAvdGltZW91dC9yb3VuZGluZyB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODYuMy5iYiBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44Ni40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFs
XzIuODYuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAt
aW5pdGlhbF8yLjg2LjQuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuODYuMy5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
XzIuODYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44Ni4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg2LjQuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi5pbmMKaW5kZXggMmUxNWNjNzY3NS4uZDFmMjVlZjhmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZ2xpYi5pbmMKQEAgLTIzNyw3ICsyMzcsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIGZpbGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRm
ZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImIzMjExZDhkMzRiOWRmNWRj
YTA1Nzg3ZWYwYWQ1ZDdjYTc1ZGVjOTk4Yjk3MGUxYWFiMDAwMWQyMjk5NzdjNjUiCitTUkNfVVJJ
W2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJkNGUyYjVkNzkxZDUwMTVmZmQ4YzY5NzFhZDhlOTc1YTBh
NTVjMWExNDkyNmNkYjI1Y2Y4NDNmZjAwNjgyMjYwIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3Nz
IGZpbGVzIGluIEZJTEVTUEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMg
YnVpbGQgKHVzaW5nIHNpdGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0g
CjIuNDcuMQoK

--===============4108194074826009190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGSIZE changed from 30736 to 175280 (+470%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.8600.3 /usr/lib/libgobject-2.0.so.0.8600.3 /usr/lib/libgthread-2.0.so.0.8600.3 /usr/lib/libgirepository-2.0.so.0.8600.3 /usr/lib/libglib-2.0.so.0.8600.3 /usr/lib/libgmodule-2.0.so.0.8600.3", added "/usr/lib/libgio-2.0.so.0.8600.4 /usr/lib/libgobject-2.0.so.0.8600.4 /usr/lib/libgthread-2.0.so.0.8600.4 /usr/lib/libgirepository-2.0.so.0.8600.4 /usr/lib/libgmodule-2.0.so.0.8600.4 /usr/lib/libglib-2.0.so.0.8600.4"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============4108194074826009190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 37453266 to 37467786 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8600.3 /usr/lib/.debug/libglib-2.0.so.0.8600.3 /usr/lib/.debug/libgobject-2.0.so.0.8600.3 /usr/lib/.debug/libgmodule-2.0.so.0.8600.3 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py /usr/lib/.debug/libgirepository-2.0.so.0.8600.3 /usr/lib/.debug/libgthread-2.0.so.0.8600.3", added "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py /usr/lib/.debug/libglib-2.0.so.0.8600.4 /usr/lib/.debug/libgio-2.0.so.0.8600.4 /usr/lib/.debug/libgobject-2.0.so.0.8600.4 /usr/lib/.debug/libgmodule-2.0.so.0.8600.4 /usr/lib/.debug/libgthread-2.0.so.0.8600.4 /usr/lib/.debug/libgirepository-2.0.so.0.8600.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGSIZE changed from 30736 to 175280 (+470%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGSIZE changed from 144579 to 144401 (-0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25712452 to 25714362 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.86.3/gthread/tests -> /usr/src/debug/glib-2.0/2.86.4/gthread/tests, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository/inspector -> /usr/src/debug/glib-2.0/2.86.4/girepository/inspector, directory renamed /usr/src/debug/glib-2.0/2.86.3/gobject/tests -> /usr/src/debug/glib-2.0/2.86.4/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.86.3/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.86.4/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository/decompiler -> /usr/src/debug/glib-2.0/2.86.4/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.86.3/glib/tests -> /usr/src/debug/glib-2.0/2.86.4/glib/tests, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio/inotify -> /usr/src/debug/glib-2.0/2.86.4/gio/inotify, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio/tests -> /usr/src/debug/glib-2.0/2.86.4/gio/te
 sts, directory renamed /usr/src/debug/glib-2.0/2.86.3/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.86.4/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.86.3/gmodule -> /usr/src/debug/glib-2.0/2.86.4/gmodule, directory renamed /usr/src/debug/glib-2.0/2.86.3/gmodule/tests -> /usr/src/debug/glib-2.0/2.86.4/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository -> /usr/src/debug/glib-2.0/2.86.4/girepository, directory renamed /usr/src/debug/glib-2.0/2.86.3/glib -> /usr/src/debug/glib-2.0/2.86.4/glib, directory renamed /usr/src/debug/glib-2.0/2.86.3/gthread -> /usr/src/debug/glib-2.0/2.86.4/gthread, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository/tests -> /usr/src/debug/glib-2.0/2.86.4/girepository/tests, directory renamed /usr/src/debug/glib-2.0/2.86.3/glib/deprecated -> /usr/src/debug/glib-2.0/2.86.4/glib/deprecated, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio/tests/modules -> /usr/src/debug/glib-2.0/2.86.4/gio/tests
 /modules, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.86.4/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio/xdgmime -> /usr/src/debug/glib-2.0/2.86.4/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.86.3/gobject -> /usr/src/debug/glib-2.0/2.86.4/gobject, directory renamed /usr/src/debug/glib-2.0/2.86.3/glib/libcharset -> /usr/src/debug/glib-2.0/2.86.4/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository/cmph -> /usr/src/debug/glib-2.0/2.86.4/girepository/cmph, directory renamed /usr/src/debug/glib-2.0/2.86.3/girepository/compiler -> /usr/src/debug/glib-2.0/2.86.4/girepository/compiler, directory renamed /usr/src/debug/glib-2.0/2.86.3/gio -> /usr/src/debug/glib-2.0/2.86.4/gio, directory renamed /usr/src/debug/glib-2.0/2.86.3/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.86.4/glib/tests/path-test-subdir
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.8600.3 /usr/lib/libgirepository-2.0.so.0.8600.3 /usr/lib/libgobject-2.0.so.0.8600.3 /usr/lib/libgio-2.0.so.0.8600.3 /usr/lib/libgthread-2.0.so.0.8600.3 /usr/lib/libgmodule-2.0.so.0.8600.3", added "/usr/lib/libgirepository-2.0.so.0.8600.4 /usr/lib/libglib-2.0.so.0.8600.4 /usr/lib/libgio-2.0.so.0.8600.4 /usr/lib/libgobject-2.0.so.0.8600.4 /usr/lib/libgthread-2.0.so.0.8600.4 /usr/lib/libgmodule-2.0.so.0.8600.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.86/glib-2.86.3.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch file://CVE-2026-0988.patch" to "https://download.gnome.org/sources//glib/2.86/glib-2.86.4.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0
 001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch file://CVE-2026-0988.patch"
packages/x86-64-v3-poky-linux/glib-2.0: PV changed from "2.86.3" to "2.86.4"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.86.3 [default] to 2.86.4 [default]
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.3 to libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.3 to libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.3 to libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.3 to libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.3 to libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.3 to libgthread-2.0.so.0.8600.4
  /usr/lib/libgio-2.0.so.0.8600.3 moved to /usr/lib/libgio-2.0.so.0.8600.4
  /usr/lib/libgirepository-2.0.so.0.8600.3 moved to /usr/lib/libgirepository-2.0.so.0.8600.4
  /usr/lib/libglib-2.0.so.0.8600.3 moved to /usr/lib/libglib-2.0.so.0.8600.4
  /usr/lib/libgmodule-2.0.so.0.8600.3 moved to /usr/lib/libgmodule-2.0.so.0.8600.4
  /usr/lib/libgobject-2.0.so.0.8600.3 moved to /usr/lib/libgobject-2.0.so.0.8600.4
  /usr/lib/libgthread-2.0.so.0.8600.3 moved to /usr/lib/libgthread-2.0.so.0.8600.4
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============4108194074826009190==--

