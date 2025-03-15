Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2491EC36003
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10362.1742048296642557333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fVYPQFY+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lAhppWoR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2b7c26-421a8051-872c-4c01-95cd-3244beef26f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=toEg5rhvw4HYrA4Cl7Mwp3YkJ7PmoCL3t5wXN5uRJQ0=;
	b=fVYPQFY+iAG6Z2jSJEzA/0IFy2Lr2izLIclRET3o92Bih6rcquOpZVyhcTYZAo/D
	67F7hqDOchdo78ZRd/iTll6f6qiA+kDqbpDyiM4ZaL8tZh98cPoU3+vsCXe4kyr8lcp
	xgFyXl71UMoi7La/3YwWrlg2y3fuJGq2JqFvYctc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=toEg5rhvw4HYrA4Cl7Mwp3YkJ7PmoCL3t5wXN5uRJQ0=;
	b=lAhppWoR9iM9sYcl6thE6TmkoERR7Wnh6kXYSW4ttYi7JJfOavUUSI/vtHv9KSO7
	XVmwZ4vk45hHNYpgBTk6719w2oAquNXVoPqIbPNs6B1JzQKia5jnW8aP633OUTAgc/U
	txiz3SrrrKyJ31A/UaUOleTryXYK0/EYrMqARfxk=
Content-Type: multipart/mixed; boundary="===============4565014518185637327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dnf: upgrading to 4.23.0 SUCCEEDED
Message-ID: <010101959a2b7c26-421a8051-872c-4c01-95cd-3244beef26f7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212903

--===============4565014518185637327==
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
From ccfa48db17934a75e284ca68a23cd7bf15a1b58b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:58:29 +0000
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
index fd942228b9..d56b294a22 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From c084e1a25b11573d62580c6ed25c0ba80482e0e4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..65cf020556 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From a77798e9f6f92de3c1b18c6a12285326c2d9a588 Mon Sep 17 00:00:00 2001
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
index 18f9a30949..e5bc0b2966 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 6307994a783209adf8124f664c5fc93ec5922680 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..edd9664c56 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From f030f93f2a07969c34b2145bc863afc428443e72 Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..bf44340a05 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From e538a05edcdc92bed00185cd485370f21224a5c1 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..1e75c06d6c 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
+From 085d8a6b2c0ed53d3a46448926da5f7af2466374 Mon Sep 17 00:00:00 2001
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
index 64ea7874d3..f339556579 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From d8edc0d92bbdb3c3cf829d739818f4a7b1511dbc Mon Sep 17 00:00:00 2001
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
index eb46113f3a..717e580aea 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From 462fe5dd92b76a85e4d8e4ee81ec686464ead61c Mon Sep 17 00:00:00 2001
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
2.44.1


--===============4565014518185637327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.22.0-4.23.0.patch"

RnJvbSBjY2ZhNDhkYjE3OTM0YTc1ZTI4NGNhNjhhMjNjZDdiZjE1YTFiNThiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6NTg6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
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
Y2gKaW5kZXggZmQ5NDIyMjhiOS4uZDU2YjI5NGEyMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmln
dXJhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNv
cnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmNzBlYjMwOGM4MzdmMmM5NDRlMjNiYjY4MGE1MDFhNjA1MDA0ZDY1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMDg0ZTFhMjViMTE1NzNkNjI1ODBjNmVkMjVjMGJh
ODA0ODJlMGU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjM2
OjIwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGluc3RhbGwgdG1wZmlsZXMuZCBj
b25maWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0
Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IDM3MzU5YTU3NjUuLjY1
Y2YwMjA1NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEt
RG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0
Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAzY2E2ZDE0ZmJjNjQxOWZmNjIzOWI0YmExNmY3N2RhMjBmYjMxZDAzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBhNzc3OThlOWY2ZjkyZGUzYzFiMThjNmExMjI4NTMyNmMyZDlhNTg4
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
ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAppbmRleCAxOGY5YTMwOTQ5Li5lNWJjMGIyOTY2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0
ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMDQ5ZTI4MzIyODRhYjg4M2UxODVkOTAyMGM4ODE1MThhNjhlNmMzOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjMwNzk5NGE3ODMyMDlhZGY4MTI0ZjY2NGM1
ZmM5M2VjNTkyMjY4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyOCBBcHIgMjAyMCAx
NTo1NTowMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBkbmY6IHdyaXRlIHRoZSBsb2cgbG9jayB0
byByb290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxv
Y2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCmluZGV4
IDZiZmZlOWFmMGEuLmVkZDk2NjRjNTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9u
LWhhbmRsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzODgxNzU3ZWFiZmRlMmZmNTQ0
MDBhYjEyN2IxMDZhYjA4NWQ4M2YwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMDMw
ZjkzZjJhMDc5NjljMzRiMjE0NWJjODYzYWZjNDI4NDQzZTcyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFdlZCwgMTMgTWFyIDIwMjQgMTE6MjI6MDUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbG9j
ay5weTogZml4IEV4Y2VwdGlvbiBoYW5kbGluZwpAQCAtNTcsNiArNTcsMyBAQCBpbmRleCA2ODE3
YWFjOS4uNTcxODA2MmEgMTAwNjQ0CiAgCiAgICAgIGRlZiBfX2V4aXRfXyhzZWxmLCAqZXhjX2Fy
Z3MpOgogICAgICAgICAgaWYgc2VsZi5jb3VudCA9PSAxOgotLS0gCi0yLjI1LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgt
Zm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCmluZGV4
IGZjZDk3MGE3YWUuLmJmNDQzNDBhMDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0
aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZhMzJj
N2RjYWJhYTNjMDBkMzYyMGEzMjY2ZTQ5NjI5MzY1YzBjYmUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGU1MzhhMDVlZGNkYzkyYmVkMDAxODVjZDQ4NTM3MGYyMTIyNGE1YzEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3Rh
LmNvbT4KIERhdGU6IFdlZCwgMTEgTWFyIDIwMjAgMjI6MTA6MDIgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc2V0IHB5dGhvbiBwYXRoIGZvciBjb21wbGV0aW9uX2hlbHBlcgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxs
cm9vdC10by1sb2dkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1
LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAppbmRleCBhMWM1OGQ2
NTYzLi4xZTc1YzA2ZDZjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxy
b290LXRvLWxvZ2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGU3ZmM0YTg1MjNhYWQ2
MTY0OTNlNmFkMzNjNTA5ZTFlNTMwZDg1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MDg1ZDhhNmIyYzBlZDUzZDNhNDY0NDg5MjZkYTVmN2FmMjQ2NjM3NCBNb24gU2VwIDE3IDAwOjAw
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
dGhvbi5wYXRjaAppbmRleCA2NGVhNzg3NGQzLi5mMzM5NTU2NTc5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExf
RElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRo
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1YjE1NGVhNjlhZmRjZDg2MjI5OWEwYjdm
MjU1ZjZlY2UzNjg2YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ4ZWRjMGQ5MmJi
ZGIzYzNjZjgyOWQ3Mzk4MThmNGE3YjE1MTFkYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
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
ZXggZWI0NjExM2YzYS4uNzE3ZTU4MGFlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVz
aW5nLWVudi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDM1NTY3NjdiODRmMzY4Nzc0M2Zk
YWQwYTg4YWYwNzM5ZDczNmVhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDYyZmU1
ZGQ5MmI3NmE4NWU0ZDhlNGVlODFlYzY4NjQ2NGVhZDYxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
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
SVJ9L2dpdCIKLS0gCjIuNDQuMQoK

--===============4565014518185637327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 70 recipes from the core2-64 sysroot...done.
Removing 84 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8493761a006b69258d8e9782946313ab82d83df2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 657 Local 600 Mirrors 0 Missed 57 Current 246 (91% match, 93% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_package_qa_setscene)
NOTE: Running setscene task 269 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 301 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 310 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 324 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 328 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 335 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 338 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 349 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.8.bb:do_create_spdx_setscene)
NOTE: recipe libcomps-0.1.21-r0: task do_package_qa_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dnf-4.23.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libksba-1.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe npth-1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/pinentry/pinentry_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe dnf-4.23.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libksba-1.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe npth-1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.24.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 381 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe pinentry-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-1.24.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 383 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.8.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-1.34.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe pinentry-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.24.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe npth-1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe npth-1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 405 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe npth-1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libksba-1.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 410 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe npth-1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: recipe libdnf-0.73.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 420 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.24.2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 422 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 423 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 426 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-1.24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcomps-0.1.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsolv-0.7.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_packagedata_setscene)
NOTE: recipe gpgme-1.24.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 440 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsolv-0.7.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 444 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libdnf-0.73.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.24.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 458 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 464 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 468 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-1.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.24.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 479 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 482 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libksba-1.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 489 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe npth-1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_create_spdx_setscene)
NOTE: recipe libksba-1.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 502 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.24.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 505 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe npth-1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 509 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe librepo-1.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcomps-0.1.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcomps-0.1.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 577 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.24.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 585 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.24.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-1.34.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gpgme-1.24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/expat/2.6.4/temp/log.do_packagedata_setscene.1637327
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 682 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_package_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running task 981 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_fetch)
NOTE: Running task 991 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_fetch)
NOTE: Running task 1002 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running task 1010 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1020 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1052 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe rpm-1_4.20.0-r0: task do_fetch: Started
NOTE: Running task 1057 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_recipe_qa)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libsolv-0.7.31-r0: task do_fetch: Started
NOTE: Running setscene task 705 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1091 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_fetch)
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Started
NOTE: recipe dnf-4.23.0-r0: task do_recipe_qa: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 708 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_fetch: Started
NOTE: recipe librepo-1.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1171 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_fetch)
NOTE: recipe libsolv-0.7.31-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1175 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1177 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_unpack)
NOTE: recipe gnupg-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1184 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_unpack)
NOTE: Running task 1185 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1190 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe libdnf-0.73.4-r0: task do_fetch: Succeeded
NOTE: Running task 1195 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_unpack)
NOTE: recipe debugedit-5.1-r0: task do_fetch: Started
NOTE: recipe librepo-1.19.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_unpack: Started
NOTE: recipe dnf-4.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.31-r0: task do_unpack: Started
NOTE: recipe gnupg-2.5.5-r0: task do_unpack: Started
NOTE: Running task 1237 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_fetch)
NOTE: Running task 1238 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_unpack)
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.73.4-r0: task do_unpack: Started
NOTE: recipe debugedit-5.1-r0: task do_unpack: Started
NOTE: recipe dnf-4.23.0-r0: task do_fetch: Started
NOTE: recipe debugedit-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1272 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_patch)
NOTE: recipe dnf-4.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_unpack)
NOTE: recipe debugedit-5.1-r0: task do_patch: Started
NOTE: recipe dnf-4.23.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1274 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_patch)
NOTE: recipe libsolv-0.7.31-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1275 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_patch)
NOTE: Running task 1276 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe debugedit-5.1-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.31-r0: task do_patch: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Started
NOTE: Running task 1278 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_patch)
NOTE: recipe libdnf-0.73.4-r0: task do_unpack: Succeeded
NOTE: Running task 1279 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_patch)
NOTE: recipe rpm-1_4.20.0-r0: task do_patch: Started
NOTE: recipe libdnf-0.73.4-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.31-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_generate_toolchain_file)
NOTE: recipe librepo-1.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_generate_toolchain_file)
NOTE: recipe libsolv-0.7.31-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.19.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.31-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1285 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_patch)
NOTE: recipe librepo-1.19.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_package_setscene: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_patch: Started
NOTE: Running setscene task 709 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 721 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running task 1286 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_patch)
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe libdnf-0.73.4-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1288 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_generate_toolchain_file)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnupg-2.5.5-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdnf-0.73.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1300 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 743 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1356 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1372 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1373 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_generate_toolchain_file)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe gnupg-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1377 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_generate_toolchain_file)
NOTE: recipe dnf-4.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.23.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 757 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe dnf-4.23.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe dnf-4.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 793 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 796 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 800 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 802 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 809 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 818 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1408 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1435 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 837 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 840 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 844 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 845 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_package_setscene)
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.74-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1471 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1472 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 858 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 860 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.74-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 861 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1489 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.74-r0: task do_fetch: Started
NOTE: recipe libcap-2.74-r0: task do_fetch: Succeeded
NOTE: Running task 1492 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_unpack)
NOTE: recipe libcap-2.74-r0: task do_unpack: Started
NOTE: recipe libcap-2.74-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 895 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 903 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1958 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata)
NOTE: Running task 2025 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.4-r0: task do_packagedata: Started
NOTE: Running task 2088 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2171 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_collect_spdx_deps)
NOTE: Running task 2192 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2254 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.74-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.74-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2345 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 2346 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_create_spdx)
NOTE: Running task 2347 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.74-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_configure)
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2359 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure)
NOTE: Running task 2360 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_configure)
NOTE: recipe librepo-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.74-r0: task do_create_spdx: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_configure: Started
NOTE: Running task 2361 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: Running task 2362 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_configure)
NOTE: recipe debugedit-5.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_configure: Started
NOTE: Running task 2363 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.19.0-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2364 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2366 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe librepo-1.19.0-r0: task do_compile: Started
NOTE: Running task 2367 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2368 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2369 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_install)
NOTE: recipe librepo-1.19.0-r0: task do_install: Started
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2371 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_create_spdx)
NOTE: recipe elfutils-0.192-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package)
NOTE: recipe librepo-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.19.0-r0: task do_package: Started
NOTE: recipe librepo-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.192-r0: task do_create_spdx: Succeeded
NOTE: Running task 2375 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librepo-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_packagedata)
NOTE: recipe librepo-1.19.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_packagedata unihash changed to 426c429016d6fabda43859cf6a73ae5e6647d061e9a9e753aee6e929b2380a40
NOTE: Setscene tasks completed
NOTE: Running task 2377 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_create_spdx)
NOTE: Running task 2378 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_ipk)
NOTE: Running task 2379 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_deb)
NOTE: Running task 2380 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_rpm)
NOTE: recipe debugedit-5.1-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_qa)
NOTE: Running task 2382 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_compile)
NOTE: recipe librepo-1.19.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.19.0-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.19.0-r0: task do_package_write_deb: Started
NOTE: recipe librepo-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.19.0-r0: task do_package_qa: Started
NOTE: recipe debugedit-5.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_compile)
NOTE: recipe librepo-1.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_compile: Started
NOTE: recipe librepo-1.19.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_ipk unihash changed to b8101e4452d27dd2d9accd96c76ebf4a19641451f5d9a41ea540c364b67b727e
NOTE: recipe librepo-1.19.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_qa unihash changed to 180cfc7cba6ee80ed53597de6eb1b6c7e5a468f9e07d3da0580cb2c9984a9d55
NOTE: recipe librepo-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_rpm unihash changed to 413124604d760fe6cc496f2a8af0b59200a3f6aa22a63b4d1b2b6cee8ece4761
NOTE: recipe librepo-1.19.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.19.0.bb:do_package_write_deb unihash changed to 80dbd471ee4c678893f592e2072a562e8dfe3aa5cb9eaaa0213bcd509a36df4f
NOTE: recipe debugedit-5.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_install)
NOTE: recipe debugedit-5.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Started
NOTE: recipe debugedit-5.1-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_package)
NOTE: recipe debugedit-5.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2388 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_install)
NOTE: recipe rpm-1_4.20.0-r0: task do_install: Started
NOTE: recipe debugedit-5.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_packagedata)
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_packagedata: Started
NOTE: Running task 2391 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_packagedata unihash changed to ff1faf7d97507764abca850927aafec550e8d2683357c26dd502cf7298aac91d
NOTE: Setscene tasks completed
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata unihash changed to 1af46c81e6a9f63168b5b20109045d6cef6a6daf3f146480fb00e7aefbdbaee0
NOTE: Setscene tasks completed
NOTE: Running task 2392 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_install: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2393 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package)
NOTE: recipe rpm-1_4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package: Started
NOTE: recipe gnupg-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_compile)
NOTE: recipe gnupg-2.5.5-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_configure)
NOTE: recipe libsolv-0.7.31-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.31-r0: task do_configure: Succeeded
NOTE: Running task 2398 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_compile)
NOTE: recipe libsolv-0.7.31-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.20.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_packagedata unihash changed to c3cca96c9729981f6692e8f732a81731f22cddc6d50ff98c91ed1a75423f2faa
NOTE: Setscene tasks completed
NOTE: Running task 2400 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_create_spdx)
NOTE: Running task 2401 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_ipk)
NOTE: Running task 2402 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_deb)
NOTE: Running task 2403 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_rpm)
NOTE: Running task 2404 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_qa)
NOTE: recipe rpm-1_4.20.0-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.31-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.20.0-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2405 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_install)
NOTE: Running task 2406 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.31-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsolv-0.7.31-r0: task do_install: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_ipk unihash changed to c8c3ed1642ffb2429f934d6e554363b64a3a77003f29cd4ca75c582718b409bb
NOTE: recipe libsolv-0.7.31-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsolv-0.7.31-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_populate_sysroot)
NOTE: Running task 2408 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_package)
NOTE: recipe rpm-1_4.20.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_qa unihash changed to fa24d10bb1f5cc8498994abfe4b13859e819fe790ff9c14fa921f83579a075ff
NOTE: recipe libsolv-0.7.31-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.31-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_rpm unihash changed to 333b0f898bedf597f1ddbcebb5b72ab86f428bef73118faceff101dceb408388
NOTE: recipe libsolv-0.7.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2409 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.73.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.20.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_package_write_deb unihash changed to 50176ccb32fcefb2285140a1e55e6fdc2b257a3e28e0e96f799ceb5b5c6312b6
NOTE: recipe libdnf-0.73.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2410 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_configure)
NOTE: recipe libdnf-0.73.4-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.31-r0: task do_package: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_packagedata)
NOTE: Running task 2412 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_compile)
NOTE: recipe libsolv-0.7.31-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.73.4-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.31-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_packagedata unihash changed to 53ac5f349b4758cc8ab3e1afd3127a159623e0daef4deb4043daf3abf402cf86
NOTE: Setscene tasks completed
NOTE: Running task 2413 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.31.bb:do_create_spdx)
NOTE: recipe libsolv-0.7.31-r0: task do_create_spdx: Started
NOTE: recipe libsolv-0.7.31-r0: task do_create_spdx: Succeeded
NOTE: Running task 2414 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.73.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.73.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_install)
NOTE: recipe gnupg-2.5.5-r0: task do_install: Started
NOTE: recipe gnupg-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package)
NOTE: Running task 2417 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_populate_sysroot)
NOTE: recipe gnupg-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe gnupg-2.5.5-r0: task do_package: Started
NOTE: recipe gnupg-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_packagedata)
NOTE: recipe gnupg-2.5.5-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_packagedata unihash changed to 14d39f451b42a538211bbabb4d1de3abe8c348cf594340849915d695943fb042
NOTE: Setscene tasks completed
NOTE: Running task 2419 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_create_spdx)
NOTE: Running task 2420 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_ipk)
NOTE: Running task 2421 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_deb)
NOTE: Running task 2422 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_rpm)
NOTE: Running task 2423 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_qa)
NOTE: recipe gnupg-2.5.5-r0: task do_create_spdx: Started
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_ipk: Started
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_deb: Started
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_rpm: Started
NOTE: recipe gnupg-2.5.5-r0: task do_package_qa: Started
NOTE: recipe gnupg-2.5.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_ipk unihash changed to 6d54c9020cd04281d79e390914381770a1e1eade12686ca033845b6f9442ade7
NOTE: recipe gnupg-2.5.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_qa unihash changed to 06c69a32271b804529b9a9194f348a800c5dd3fbd29fa6721279d4da48d9c83f
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_rpm unihash changed to 64f231834f9060e0f67badd790d3ce75f89819f3c11568252e147796ed59ef53
NOTE: recipe gnupg-2.5.5-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.5.bb:do_package_write_deb unihash changed to 97ff8ce172cde24ede5141d081067256a7688c0e2af8ef083c3f8b27953b0951
NOTE: recipe libdnf-0.73.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2424 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_install)
NOTE: recipe libdnf-0.73.4-r0: task do_install: Started
NOTE: recipe libdnf-0.73.4-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package)
NOTE: Running task 2426 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.73.4-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.73.4-r0: task do_package: Started
NOTE: recipe libdnf-0.73.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2427 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_configure)
NOTE: recipe dnf-4.23.0-r0: task do_configure: Started
NOTE: recipe dnf-4.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_compile)
NOTE: recipe dnf-4.23.0-r0: task do_compile: Started
NOTE: recipe dnf-4.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_install)
NOTE: recipe dnf-4.23.0-r0: task do_install: Started
NOTE: recipe dnf-4.23.0-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_package: Succeeded
NOTE: Running task 2432 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_packagedata)
NOTE: recipe libdnf-0.73.4-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.73.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_packagedata unihash changed to f62c22b6f3eefb11278e4438d9bd14771da13648641dc7ee46cf30e248bfa520
NOTE: Setscene tasks completed
NOTE: Running task 2433 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_package)
NOTE: Running task 2434 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_create_spdx)
NOTE: Running task 2435 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_ipk)
NOTE: Running task 2436 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_deb)
NOTE: Running task 2437 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_rpm)
NOTE: recipe dnf-4.23.0-r0: task do_package: Started
NOTE: Running task 2438 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_qa)
NOTE: recipe libdnf-0.73.4-r0: task do_create_spdx: Started
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_ipk: Started
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_deb: Started
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.73.4-r0: task do_package_qa: Started
NOTE: recipe libdnf-0.73.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2439 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_collect_spdx_deps)
NOTE: recipe dnf-4.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dnf-4.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_qa unihash changed to de1976990c5e3f729f2ae97a688449b0d8bcf3a89fa1fee6c469a6d626980f61
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_ipk unihash changed to 5fb1fa0cc7a3f677784341f1bde3ea91d2395a43d14a05a26c55ac18da0b90c9
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_rpm unihash changed to a260113d63c33661373c179a1057c90d3dfeec16b20c7e6fbb7db88660ac423a
NOTE: recipe dnf-4.23.0-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_packagedata)
NOTE: recipe dnf-4.23.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_create_spdx)
NOTE: Running task 2442 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_package_write_ipk)
NOTE: Running task 2443 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_package_write_deb)
NOTE: Running task 2444 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_package_write_rpm)
NOTE: Running task 2445 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_package_qa)
NOTE: recipe dnf-4.23.0-r0: task do_create_spdx: Started
NOTE: recipe dnf-4.23.0-r0: task do_package_write_ipk: Started
NOTE: recipe dnf-4.23.0-r0: task do_package_write_deb: Started
NOTE: recipe dnf-4.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.23.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.23.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2446 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_create_package_spdx)
NOTE: recipe dnf-4.23.0-r0: task do_create_package_spdx: Started
NOTE: recipe dnf-4.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dnf-4.23.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libdnf-0.73.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb:do_package_write_deb unihash changed to c15da9d703722b2e245120e0c03e9dfc1da8a6452bfdb34ddab80dad98323674
NOTE: Running noexec task 2447 of 2447 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2447 tasks of which 2307 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.7.0-r0 to 0:2.6.4-r0) [version-going-backwards]
ERROR: expat-2.6.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4565014518185637327==
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
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 962190 to 972308 (+1%)
packages/core2-64-poky-linux/dnf: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============4565014518185637327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============4565014518185637327==--

