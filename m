Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6769CC54FC6
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11258.1747312308696674317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M8Me3uBx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HWZTF1gE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3edf9d2-d3277f1a-9f2d-43ac-a729-649135d240cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3TMvmgPj2iH69ukYvbuvKVy29LMjlCUeNVEPBm5BKDk=;
	b=M8Me3uBxQriJZmvnd+cquJKSejpEMVlNAiThnkkDsM60JlE8k26Nor61dOt54KNG
	4aNaR2QZA2uypPQ/PixuEnO/ggYDX1ZzqOkbLnmqLklpJ0VFZsdnRq+NniUxDOavO/p
	w69QbwgW7zyifXu7EvhJzStYLkLuWFaiJkMom1Zk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3TMvmgPj2iH69ukYvbuvKVy29LMjlCUeNVEPBm5BKDk=;
	b=HWZTF1gEX7qlxwSDScT8dMrMZ5Re4nCFsOnwZkuraYibuznKfnyJ4NPGwxM1iG2j
	t2+NIfab+Hap9ziY6uqB+32tilzn1kR6GJuLRmsMjJ+uziMPSpPI49ilC07/9ad2Gxw
	hxzvMA6YyCjyEPd3/xhWezfoqiUaIwA7NrLIQPxk=
Content-Type: multipart/mixed; boundary="===============5085917212531447698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dnf: upgrading to 4.23.0 SUCCEEDED
Message-ID: <01010196d3edf9d2-d3277f1a-9f2d-43ac-a729-649135d240cb-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216597

--===============5085917212531447698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dnf* to *4.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.22.0-4.23.0.patch
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
From 67bd0eaf2a7efbd714788563175492598c30afd1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:24:49 +0000
Subject: [PATCH] dnf: upgrade 4.22.0 -> 4.23.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 6 +++---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 6 +++---
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb}  | 2 +-
 9 files changed, 17 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..562381fc1e 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From f8703379cb3420a30030bdfcd8786078141b90af Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..a4e78bce12 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 2941d0c54927c5c3ed30f02c6227e5abc181a777 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index a76b6ac4..a2ba58c9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -4,8 +4,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..d0531a2b9c 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 54086025a5d2ff48631076177a8a8ddea5e1f879 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..3995da03ad 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From b1695ff90e5aea2e3a361da555b9be9cb48cc4ce Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..951b744c24 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From ee3bb2123b4068f6e4a55786d26e1b8adcc1e42e Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..30d1787489 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
+From 326f83512b1badc2f84f98717fdc330ea2287505 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index 62b9434b..14d4757c 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1002,7 +1002,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..88219061c3 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 60545970476eb4f80953013844081bc3691e7243 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index a2ba58c9..98aa9df0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
+@@ -20,7 +20,7 @@ ELSE ()
      MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
  ENDIF()
  
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..73f8544d19 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From c0ad7879c19f6010a691d4d420845ca8c318dd27 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index e5ac3c9824..fe3deb4344 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============5085917212531447698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.22.0-4.23.0.patch"

RnJvbSA2N2JkMGVhZjJhN2VmYmQ3MTQ3ODg1NjMxNzU0OTI1OThjMzBhZmQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6MjQ6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4yMi4wIC0+IDQuMjMuMAoKLS0tCiAuLi4vMDAwMS1Db3JyZXRseS1pbnN0
YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCAgICB8IDIgKy0KIC4uLjEtRG8tbm90
LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoIHwgNiArKyst
LS0KIC4uLi9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNo
ICAgICAgIHwgMiArLQogLi4uL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFu
ZGxpbmcucGF0Y2ggICAgICAgfCA1ICstLS0tCiAuLi4vZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRo
LWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCAgICB8IDIgKy0KIC4uLi9kbmYvZG5mLzAwMDUt
RG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIHwgNiArKystLS0KIC4u
LjI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNo
IHwgNiArKystLS0KIC4uLi9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVu
di5wYXRjaCAgICAgICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYve2Ru
Zl80LjIyLjAuYmIgPT4gZG5mXzQuMjMuMC5iYn0gIHwgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL3tkbmZfNC4yMi4wLmJiID0+IGRuZl80LjIzLjAuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxs
LXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0
Y2gKaW5kZXggZmQ5NDIyMjhiOS4uNTYyMzgxZmMxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmln
dXJhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNv
cnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmNzBlYjMwOGM4MzdmMmM5NDRlMjNiYjY4MGE1MDFhNjA1MDA0ZDY1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmODcwMzM3OWNiMzQyMGEzMDAzMGJkZmNkODc4NjA3
ODE0MWI5MGFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjM2
OjIwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGluc3RhbGwgdG1wZmlsZXMuZCBj
b25maWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0
Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IDM3MzU5YTU3NjUuLmE0
ZTc4YmNlMTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEt
RG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0
Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAzY2E2ZDE0ZmJjNjQxOWZmNjIzOWI0YmExNmY3N2RhMjBmYjMxZDAzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAyOTQxZDBjNTQ5MjdjNWMzZWQzMGYwMmM2MjI3ZTVhYmMxODFhNzc3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQg
ZGlyZWN0b3JpZXMKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQg
Yi9DTWFrZUxpc3RzLnR4dAotaW5kZXggNGFlZTk5ZmIuLjllMmU5ZTllIDEwMDY0NAoraW5kZXgg
YTc2YjZhYzQuLmEyYmE1OGM5IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NN
YWtlTGlzdHMudHh0Ci1AQCAtMyw4ICszLDggQEAgQ01BS0VfTUlOSU1VTV9SRVFVSVJFRCAoVkVS
U0lPTiAyLjQpCitAQCAtNCw4ICs0LDggQEAgUFJPSkVDVCAoZG5mIE5PTkUpCiAgCiAgSU5DTFVE
RSAoJHtDTUFLRV9TT1VSQ0VfRElSfS9WRVJTSU9OLmNtYWtlKQogIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRv
LXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0
ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAppbmRleCAxOGY5YTMwOTQ5Li5kMDUzMWEyYjlj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0
ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMDQ5ZTI4MzIyODRhYjg4M2UxODVkOTAyMGM4ODE1MThhNjhlNmMzOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTQwODYwMjVhNWQyZmY0ODYzMTA3NjE3N2E4
YThkZGVhNWUxZjg3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyOCBBcHIgMjAyMCAx
NTo1NTowMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBkbmY6IHdyaXRlIHRoZSBsb2cgbG9jayB0
byByb290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxv
Y2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCmluZGV4
IDZiZmZlOWFmMGEuLjM5OTVkYTAzYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9u
LWhhbmRsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzODgxNzU3ZWFiZmRlMmZmNTQ0
MDBhYjEyN2IxMDZhYjA4NWQ4M2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMTY5
NWZmOTBlNWFlYTJlM2EzNjFkYTU1NWI5YmU5Y2I0OGNjNGNlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFdlZCwgMTMgTWFyIDIwMjQgMTE6MjI6MDUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbG9j
ay5weTogZml4IEV4Y2VwdGlvbiBoYW5kbGluZwpAQCAtNTcsNiArNTcsMyBAQCBpbmRleCA2ODE3
YWFjOS4uNTcxODA2MmEgMTAwNjQ0CiAgCiAgICAgIGRlZiBfX2V4aXRfXyhzZWxmLCAqZXhjX2Fy
Z3MpOgogICAgICAgICAgaWYgc2VsZi5jb3VudCA9PSAxOgotLS0gCi0yLjI1LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgt
Zm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCmluZGV4
IGZjZDk3MGE3YWUuLjk1MWI3NDRjMjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0
aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZhMzJj
N2RjYWJhYTNjMDBkMzYyMGEzMjY2ZTQ5NjI5MzY1YzBjYmUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGVlM2JiMjEyM2I0MDY4ZjZlNGE1NTc4NmQyNmUxYjhhZGNjMWU0MmUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3Rh
LmNvbT4KIERhdGU6IFdlZCwgMTEgTWFyIDIwMjAgMjI6MTA6MDIgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc2V0IHB5dGhvbiBwYXRoIGZvciBjb21wbGV0aW9uX2hlbHBlcgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxs
cm9vdC10by1sb2dkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1
LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAppbmRleCBhMWM1OGQ2
NTYzLi4zMGQxNzg3NDg5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxy
b290LXRvLWxvZ2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGU3ZmM0YTg1MjNhYWQ2
MTY0OTNlNmFkMzNjNTA5ZTFlNTMwZDg1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MzI2ZjgzNTEyYjFiYWRjMmY4NGY5ODcxN2ZkYzMzMGVhMjI4NzUwNSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAxMSBKYW4gMjAxNyAxNToxMDoxMyArMDIwMAogU3ViamVjdDogW1BBVENI
XSBEbyBub3QgcHJlcGVuZCBpbnN0YWxscm9vdCB0byBsb2dkaXIuCkBAIC0xNCwxMCArMTQsMTAg
QEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9kbmYvY2xpL2NsaS5weSBiL2RuZi9jbGkvY2xpLnB5Ci1pbmRleCBkMzg0NGRm
My4uYWMwODBmNzkgMTAwNjQ0CitpbmRleCA2MmI5NDM0Yi4uMTRkNDc1N2MgMTAwNjQ0CiAtLS0g
YS9kbmYvY2xpL2NsaS5weQogKysrIGIvZG5mL2NsaS9jbGkucHkKLUBAIC05NTQsNyArOTU0LDcg
QEAgY2xhc3MgQ2xpKG9iamVjdCk6CitAQCAtMTAwMiw3ICsxMDAyLDcgQEAgY2xhc3MgQ2xpKG9i
amVjdCk6CiAgICAgICAgICAgICAgbG9nZ2VyLndhcm5pbmcoXygiVW5hYmxlIHRvIGRldGVjdCBy
ZWxlYXNlIHZlcnNpb24gKHVzZSAnLS1yZWxlYXNldmVyJyB0byBzcGVjaWZ5ICIKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJyZWxlYXNlIHZlcnNpb24pIikpCiAgCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lO
U1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5
dGhvbi5wYXRjaAppbmRleCA2NGVhNzg3NGQzLi44ODIxOTA2MWMzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExf
RElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRo
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1YjE1NGVhNjlhZmRjZDg2MjI5OWEwYjdm
MjU1ZjZlY2UzNjg2YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYwNTQ1OTcwNDc2
ZWI0ZjgwOTUzMDEzODQ0MDgxYmMzNjkxZTcyNDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZy
aSwgMzAgRGVjIDIwMTYgMTg6Mjk6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNl
dCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24KQEAgLTEwLDEwICsxMCwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDllMmU5ZTll
Li4yMDU2MDg5ZCAxMDA2NDQKK2luZGV4IGEyYmE1OGM5Li45OGFhOWRmMCAxMDA2NDQKIC0tLSBh
L0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTE5LDcgKzE5LDcgQEAg
RUxTRSAoKQorQEAgLTIwLDcgKzIwLDcgQEAgRUxTRSAoKQogICAgICBNRVNTQUdFIChGQVRBTF9F
UlJPUiAiSW52YWxpZCBQWVRIT05fREVTSVJFRCB2YWx1ZTogIiAke1BZVEhPTl9ERVNJUkVEfSkK
ICBFTkRJRigpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKaW5k
ZXggZWI0NjExM2YzYS4uNzNmODU0NGQxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVz
aW5nLWVudi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDM1NTY3NjdiODRmMzY4Nzc0M2Zk
YWQwYTg4YWYwNzM5ZDczNmVhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzBhZDc4
NzljMTlmNjAxMGE2OTFkNGQ0MjA4NDVjYThjMzE4ZGQyNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogRnJpLCAzMCBEZWMgMjAxNiAxODoyOTozNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBSdW4g
cHl0aG9uIHNjcmlwdHMgdXNpbmcgZW52CkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYmlu
L2RuZi1hdXRvbWF0aWMuaW4gYi9iaW4vZG5mLWF1dG9tYXRpYy5pbgotaW5kZXggMTdlMzVhMDUu
LjI4ODI3ZTM4IDEwMDc1NQoraW5kZXggMWZiNzEyYjAuLmNlOGQ0YjhmIDEwMDc1NQogLS0tIGEv
YmluL2RuZi1hdXRvbWF0aWMuaW4KICsrKyBiL2Jpbi9kbmYtYXV0b21hdGljLmluCiBAQCAtMSw0
ICsxLDQgQEAKQEAgLTIzLDcgKzIzLDcgQEAgaW5kZXggMTdlMzVhMDUuLjI4ODI3ZTM4IDEwMDc1
NQogICMKICAjIENvcHlyaWdodCAoQykgMjAxNC0yMDE2IFJlZCBIYXQsIEluYy4KIGRpZmYgLS1n
aXQgYS9iaW4vZG5mLmluIGIvYmluL2RuZi5pbgotaW5kZXggNTVjZWIzZjIuLmUzODk3M2M3IDEw
MDc1NQoraW5kZXggMTA3MTZkZWMuLjgxN2Q3ZGE1IDEwMDc1NQogLS0tIGEvYmluL2RuZi5pbgog
KysrIGIvYmluL2RuZi5pbgogQEAgLTEsNCArMSw0IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZl80LjIzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZl80LjIzLjAuYmIKaW5kZXggZTVhYzNjOTgyNC4uZmUzZGViNDM0NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMi4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMjMuMC5iYgpAQCAtMjAsNyArMjAsNyBAQCBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvZG5mLmdp
dDticmFuY2g9bWFzdGVyO3Byb3RvYwogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAotU1JD
UkVWID0gImRhOWE3MDY2YmU4ZTE2MjhkOTQ1MzQyOGQzMzY4NTIyNWNkOWM5MGQiCitTUkNSRVYg
PSAiOGZhNGJiOTRhOTllYWRhZWQ5MWFkMmVlNTFmMjdhNGJhYWZjZWJlZCIKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dPUktE
SVJ9L2dpdCIKLS0gCjIuNDcuMQoK

--===============5085917212531447698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 962190 to 972308 (+1%)
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============5085917212531447698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============5085917212531447698==--

