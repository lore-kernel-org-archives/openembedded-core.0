Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E6CD3423
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2348.1762384575357205704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Kk1oNtSD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Lckgbnuj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564e8678-7d383217-ac2d-4693-8865-96ad5be025b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d4ZDwj1jXh9LGmghk5Z3ijRTP3p+Js/g/JxK6Ei8l6g=;
	b=Kk1oNtSDxg0/xlUdzzwM8SK4HUXcG4uVogLVdCRtVF92fkUnBY51luEN/3t0J2fk
	+8VFoSYmN45E6cNpt9WbZcVgcc3/xoEqHDXCHxGLpvclNbraEYuWxRDRKv+wwXWs4V8
	2sOUK6+CWnFoN426/DDyTn+BQTwehcU4BlY3ZV8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d4ZDwj1jXh9LGmghk5Z3ijRTP3p+Js/g/JxK6Ei8l6g=;
	b=LckgbnujMRDIpU3tRkPzqfJdcaNKI/xWh5cQih+dzTi3AWKnm2H2O8k4cj8YjvhA
	L1xircONipDdoJaOk5yS39F+vLCGVryoyJNEftZh+1MQJiN29m4IAc0eauTmMM9M5jk
	VW4WSo2OBKWAQkREw12KZmNyR6n352LdINGvuYHU=
Content-Type: multipart/mixed; boundary="===============3081966192398023749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dnf: upgrading to 4.24.0 SUCCEEDED
Message-ID: <0101019a564e8678-7d383217-ac2d-4693-8865-96ad5be025b0-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225808

--===============3081966192398023749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dnf* to *4.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.23.0-4.24.0.patch
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
From f824d5db3fa18b52339b92a544e0dc7b3dd65e2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:38:23 +0000
Subject: [PATCH] dnf: upgrade 4.23.0 -> 4.24.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 6 +++---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb}  | 2 +-
 9 files changed, 16 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..cfdef32e70 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From ad3f0b7a7b23f2f119df368505a1b5eff78cbdf9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..d201472e4f 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From c7ebd5cb6f64b804508d31d03cacf5e2bb8d1cc3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index e71e9517..8fcb2069 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -3,8 +3,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..c4992e0915 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 38980ba33f8557ec1350317b5be8107f928c986c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..c20cd57f1b 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From 07b3044093631df84c6cdbfe3ae61aa05d7c6398 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 13 Mar 2024 11:22:05 +0800
 Subject: [PATCH] lock.py: fix Exception handling
@@ -57,6 +57,3 @@ index 6817aac9..5718062a 100644
  
      def __exit__(self, *exc_args):
          if self.count == 1:
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index fcd970a7ae..ab25435caa 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From aef7d391c4cf8e1c9b64675656705636d77b779d Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..2de3de7cfe 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
+From 6e0dc6d3bae6bb65fa157219eee7684609009aa6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index e0d88cac..8e540fcd 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1030,7 +1030,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..a32b8d12f0 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 53b15e8e66238caf144e72331a35ed3c153799d9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index 8fcb2069..59ec6f0b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -19,7 +19,7 @@ ELSE ()
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..62206ce52d 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From 8d8b1ebd243db36cd53616a32701dce50493d7f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
 Subject: [PATCH] Run python scripts using env
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 17e35a05..28827e38 100755
+index 1fb712b0..ce8d4b8f 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -23,7 +23,7 @@ index 17e35a05..28827e38 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 55ceb3f2..e38973c7 100755
+index 10716dec..817d7da5 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/dnf/dnf_4.23.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.23.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.24.0.bb
index 927a8d8930..d40b85c4b0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.23.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
+SRCREV = "e47634fbe3565d0580e89ec21adb7c1b308642ce"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
-- 
2.47.1


--===============3081966192398023749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.23.0-4.24.0.patch"

RnJvbSBmODI0ZDVkYjNmYTE4YjUyMzM5YjkyYTU0NGUwZGM3YjNkZDY1ZTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNTozODoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjIzLjAgLT4gNC4yNC4wCgotLS0KIC4uLi8wMDAxLUNvcnJldGx5LWluc3Rh
bGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoICAgIHwgMiArLQogLi4uMS1Eby1ub3Qt
aGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggfCA2ICsrKy0t
LQogLi4uL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gg
ICAgICAgfCAyICstCiAuLi4vZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5k
bGluZy5wYXRjaCAgICAgICB8IDUgKy0tLS0KIC4uLi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgt
Zm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoICAgIHwgMiArLQogLi4uL2RuZi9kbmYvMDAwNS1E
by1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
MjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gg
fCA0ICsrLS0KIC4uLi9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5w
YXRjaCAgICAgICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80
LjIzLjAuYmIgPT4gZG5mXzQuMjQuMC5iYn0gIHwgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL3tkbmZfNC4yMy4wLmJiID0+IGRuZl80LjI0LjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRt
cGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gK
aW5kZXggZmQ5NDIyMjhiOS4uY2ZkZWYzMmU3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJh
dGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJl
dGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmNzBlYjMwOGM4MzdmMmM5NDRlMjNiYjY4MGE1MDFhNjA1MDA0ZDY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZDNmMGI3YTdiMjNmMmYxMTlkZjM2ODUwNWExYjVlZmY3
OGNiZGY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjM2OjIw
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGluc3RhbGwgdG1wZmlsZXMuZCBjb25m
aWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAx
LURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1h
bmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IDM3MzU5YTU3NjUuLmQyMDE0
NzJlNGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8t
bm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1h
bmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAz
Y2E2ZDE0ZmJjNjQxOWZmNjIzOWI0YmExNmY3N2RhMjBmYjMxZDAzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBjN2ViZDVjYjZmNjRiODA0NTA4ZDMxZDAzY2FjZjVlMmJiOGQxY2MzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQgZGly
ZWN0b3JpZXMKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9D
TWFrZUxpc3RzLnR4dAotaW5kZXggNGFlZTk5ZmIuLjllMmU5ZTllIDEwMDY0NAoraW5kZXggZTcx
ZTk1MTcuLjhmY2IyMDY5IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtl
TGlzdHMudHh0Ci1AQCAtMyw4ICszLDggQEAgQ01BS0VfTUlOSU1VTV9SRVFVSVJFRCAoVkVSU0lP
TiAyLjQpCitAQCAtMyw4ICszLDggQEAgUFJPSkVDVCAoZG5mIE5PTkUpCiAgCiAgSU5DTFVERSAo
JHtDTUFLRV9TT1VSQ0VfRElSfS9WRVJTSU9OLmNtYWtlKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJv
b3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10
aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAppbmRleCAxOGY5YTMwOTQ5Li5jNDk5MmUwOTE1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10
aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMDQ5ZTI4MzIyODRhYjg4M2UxODVkOTAyMGM4ODE1MThhNjhlNmMzOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzg5ODBiYTMzZjg1NTdlYzEzNTAzMTdiNWJlODEw
N2Y5MjhjOTg2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyOCBBcHIgMjAyMCAxNTo1
NTowMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBkbmY6IHdyaXRlIHRoZSBsb2cgbG9jayB0byBy
b290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2su
cHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCmluZGV4IDZi
ZmZlOWFmMGEuLmMyMGNkNTdmMWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhh
bmRsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzODgxNzU3ZWFiZmRlMmZmNTQ0MDBh
YjEyN2IxMDZhYjA4NWQ4M2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwN2IzMDQ0
MDkzNjMxZGY4NGM2Y2RiZmUzYWU2MWFhMDVkN2M2Mzk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFdlZCwgMTMgTWFyIDIwMjQgMTE6MjI6MDUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbG9jay5w
eTogZml4IEV4Y2VwdGlvbiBoYW5kbGluZwpAQCAtNTcsNiArNTcsMyBAQCBpbmRleCA2ODE3YWFj
OS4uNTcxODA2MmEgMTAwNjQ0CiAgCiAgICAgIGRlZiBfX2V4aXRfXyhzZWxmLCAqZXhjX2FyZ3Mp
OgogICAgICAgICAgaWYgc2VsZi5jb3VudCA9PSAxOgotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9y
LWNvbXBsZXRpb25faGVscGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCmluZGV4IGZj
ZDk3MGE3YWUuLmFiMjU0MzVjYWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1m
b3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZhMzJjN2Rj
YWJhYTNjMDBkMzYyMGEzMjY2ZTQ5NjI5MzY1YzBjYmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGFlZjdkMzkxYzRjZjhlMWM5YjY0Njc1NjU2NzA1NjM2ZDc3Yjc3OWQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNv
bT4KIERhdGU6IFdlZCwgMTEgTWFyIDIwMjAgMjI6MTA6MDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gc2V0IHB5dGhvbiBwYXRoIGZvciBjb21wbGV0aW9uX2hlbHBlcgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9v
dC10by1sb2dkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURv
LW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAppbmRleCBhMWM1OGQ2NTYz
Li4yZGUzZGU3Y2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290
LXRvLWxvZ2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGU3ZmM0YTg1MjNhYWQ2MTY0
OTNlNmFkMzNjNTA5ZTFlNTMwZDg1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmUw
ZGM2ZDNiYWU2YmI2NWZhMTU3MjE5ZWVlNzY4NDYwOTAwOWFhNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogV2VkLCAxMSBKYW4gMjAxNyAxNToxMDoxMyArMDIwMAogU3ViamVjdDogW1BBVENIXSBE
byBub3QgcHJlcGVuZCBpbnN0YWxscm9vdCB0byBsb2dkaXIuCkBAIC0xNCwxMCArMTQsMTAgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9kbmYvY2xpL2NsaS5weSBiL2RuZi9jbGkvY2xpLnB5Ci1pbmRleCBkMzg0NGRmMy4u
YWMwODBmNzkgMTAwNjQ0CitpbmRleCBlMGQ4OGNhYy4uOGU1NDBmY2QgMTAwNjQ0CiAtLS0gYS9k
bmYvY2xpL2NsaS5weQogKysrIGIvZG5mL2NsaS9jbGkucHkKLUBAIC05NTQsNyArOTU0LDcgQEAg
Y2xhc3MgQ2xpKG9iamVjdCk6CitAQCAtMTAzMCw3ICsxMDMwLDcgQEAgY2xhc3MgQ2xpKG9iamVj
dCk6CiAgICAgICAgICAgICAgbG9nZ2VyLndhcm5pbmcoXygiVW5hYmxlIHRvIGRldGVjdCByZWxl
YXNlIHZlcnNpb24gKHVzZSAnLS1yZWxlYXNldmVyJyB0byBzcGVjaWZ5ICIKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJyZWxlYXNlIHZlcnNpb24pIikpCiAgCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RB
TExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhv
bi5wYXRjaAppbmRleCA2NGVhNzg3NGQzLi5hMzJiOGQxMmYwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElS
LWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1YjE1NGVhNjlhZmRjZDg2MjI5OWEwYjdmMjU1
ZjZlY2UzNjg2YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUzYjE1ZThlNjYyMzhj
YWYxNDRlNzIzMzFhMzVlZDNjMTUzNzk5ZDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwg
MzAgRGVjIDIwMTYgMTg6Mjk6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQ
WVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24KQEAgLTEwLDcgKzEwLDcgQEAgU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA5ZTJlOWU5ZS4uMjA1
NjA4OWQgMTAwNjQ0CitpbmRleCA4ZmNiMjA2OS4uNTllYzZmMGIgMTAwNjQ0CiAtLS0gYS9DTWFr
ZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKIEBAIC0xOSw3ICsxOSw3IEBAIEVMU0Ug
KCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5
dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAppbmRleCBlYjQ2MTEz
ZjNhLi42MjIwNmNlNTJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMzU1Njc2N2I4NGYzNjg3NzQzZmRhZDBhODhhZjA3
MzlkNzM2ZWE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZDhiMWViZDI0M2RiMzZj
ZDUzNjE2YTMyNzAxZGNlNTA0OTNkN2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDMw
IERlYyAyMDE2IDE4OjI5OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJ1biBweXRob24gc2Ny
aXB0cyB1c2luZyBlbnYKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9iaW4vZG5mLWF1dG9t
YXRpYy5pbiBiL2Jpbi9kbmYtYXV0b21hdGljLmluCi1pbmRleCAxN2UzNWEwNS4uMjg4MjdlMzgg
MTAwNzU1CitpbmRleCAxZmI3MTJiMC4uY2U4ZDRiOGYgMTAwNzU1CiAtLS0gYS9iaW4vZG5mLWF1
dG9tYXRpYy5pbgogKysrIGIvYmluL2RuZi1hdXRvbWF0aWMuaW4KIEBAIC0xLDQgKzEsNCBAQApA
QCAtMjMsNyArMjMsNyBAQCBpbmRleCAxN2UzNWEwNS4uMjg4MjdlMzggMTAwNzU1CiAgIwogICMg
Q29weXJpZ2h0IChDKSAyMDE0LTIwMTYgUmVkIEhhdCwgSW5jLgogZGlmZiAtLWdpdCBhL2Jpbi9k
bmYuaW4gYi9iaW4vZG5mLmluCi1pbmRleCA1NWNlYjNmMi4uZTM4OTczYzcgMTAwNzU1CitpbmRl
eCAxMDcxNmRlYy4uODE3ZDdkYTUgMTAwNzU1CiAtLS0gYS9iaW4vZG5mLmluCiArKysgYi9iaW4v
ZG5mLmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mXzQuMjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMjQu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZl80LjIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mXzQuMjQuMC5iYgppbmRleCA5MjdhOGQ4OTMwLi5kNDBiODVjNGIwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmZfNC4yNC4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9kbmYuZ2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAw
MDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIgogCi1TUkNSRVYgPSAiOGZh
NGJiOTRhOTllYWRhZWQ5MWFkMmVlNTFmMjdhNGJhYWZjZWJlZCIKK1NSQ1JFViA9ICJlNDc2MzRm
YmUzNTY1ZDA1ODBlODllYzIxYWRiN2MxYjMwODY0MmNlIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBpbmhlcml0IGNtYWtlIGdldHRleHQg
YmFzaC1jb21wbGV0aW9uIHNldHVwdG9vbHMzLWJhc2Ugc3lzdGVtZAotLSAKMi40Ny4xCgo=

--===============3081966192398023749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.24.0.dist-info

--===============3081966192398023749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-bash-completion: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-dbg: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-dbg: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-dev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-dev: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-doc: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-doc: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ar: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-be: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bg: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ca: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-cs: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-da: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-de: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-el: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eo: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-es: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fa: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fil: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fur: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gd: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-he: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-id: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ie: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-it: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ja: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ka: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-kk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ko: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-lt: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ml: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-mr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ms: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nb: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-om: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-or: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pa: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ru: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-si: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sq: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sv: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-th: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-tr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-uk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ur: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-vi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-src: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-src: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-staticdev: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-test-dep: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-test-main: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-test-main: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf: PKGSIZE changed from 972308 to 976303 (+0%)
packages/x86-64-v3-poky-linux/dnf: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf: PV changed from "4.23.0" to "4.24.0"
Changes to packages/x86-64-v3-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.24.0.dist-info

--===============3081966192398023749==--

