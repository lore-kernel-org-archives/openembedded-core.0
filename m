Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284FFC54E65
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1356.1721071145260986075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DQog2FPu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vh3wOoN2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d5922a-8809c563-45dd-4e86-9208-bb80be7a6806-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7EA6ZN87jlVKzVkiVazo6QtDKwR/xzQN4XZZwQig2eU=;
	b=DQog2FPu0xCb4etUxrq7NL0P/PL4EpQJpd8MHDy6cT+7kJxU9NeM24+NMlY7WgKG
	xSYTxwjrDWcdzhxLPpgemTHPsqLC27oR06d98aL+dYTVJAZzWurMKXxmGrnLvB+mMO+
	ltX/0f/sYMlA4VTgzP1Ev/toPwhqlSwleKaD+Ix4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7EA6ZN87jlVKzVkiVazo6QtDKwR/xzQN4XZZwQig2eU=;
	b=vh3wOoN2xXwbvd+q0O5Xz94lfkn6q+Lgpam+ETkg8QHry2ppM+T18zvAjWRaeYlo
	h56Cs2Bb0QozTZOkOyZG2mFO8x0gW2mpkyNyg5bxYzp1km53TjXiRFaQLZ9CnrVj1Hi
	B4F1EV+c8FXzc6xtTqjBJ3dJ3e+lNUjnAqudgkLY=
Content-Type: multipart/mixed; boundary="===============3946777849454287273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.21.0 SUCCEEDED
Message-ID: <01010190b7d5922a-8809c563-45dd-4e86-9208-bb80be7a6806-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201966

--===============3946777849454287273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.20.0-4.21.0.patch
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
From aaaa31dd8e38a8805e31c349e7744988274139c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 09:04:59 +0000
Subject: [PATCH] dnf: upgrade 4.20.0 -> 4.21.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 2 +-
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb}  | 2 +-
 9 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..cb376dbcef 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From ce0c18a4f91a3a3c1053b3e69f904d5a3a3694f6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..0e3c1c7fab 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 3d77be3cdc88f4d3eb9586aae3713a6215d3c829 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..f25d3fd0ad 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From acd68b43c685b587b8a3385e8a66fbdb70cfc134 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..48db8f537d 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From bae92744b75fd57849bfb6eaa9085bff595206a1 Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..94080d0a1b 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From 4d7398a1643771ff8c0f9895468fed99bb2c191c Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index cfbda11f77..b29440821c 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
+From d73ec53985538e60e04aae32f81af39a1ba2eec6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 1824bd00..4dcb1c1c 100644
+index c14f8363..bfc07ab9 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -944,7 +944,7 @@ class Cli(object):
+@@ -953,7 +953,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..114b6319e6 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From f8bb32b273521e0edac0254b46bc21532c3b4135 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..96ab2c1e04 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From 855666d49227d6f7f4817ac52eddf6d2c17e276d Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.20.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.21.0.bb
index 98edab0614..6800b5c716 100644
--- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
+SRCREV = "d29dfa0634235d7ad957c4746a749eb1e4a85a88"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============3946777849454287273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dnf/dnf: FILELIST: directory renamed /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info -> /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info, removed "/etc/libreport/events.d/collect_dnf.conf"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info

--===============3946777849454287273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.20.0-4.21.0.patch"

RnJvbSBhYWFhMzFkZDhlMzhhODgwNWUzMWMzNDllNzc0NDk4ODI3NDEzOWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDk6MDQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4yMC4wIC0+IDQuMjEuMAoKLS0tCiAuLi4vMDAwMS1Db3JyZXRseS1pbnN0
YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCAgICB8IDIgKy0KIC4uLjEtRG8tbm90
LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoIHwgMiArLQog
Li4uL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggICAg
ICAgfCAyICstCiAuLi4vZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGlu
Zy5wYXRjaCAgICAgICB8IDUgKy0tLS0KIC4uLi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9y
LWNvbXBsZXRpb25faGVscGVyLnBhdGNoICAgIHwgMiArLQogLi4uL2RuZi9kbmYvMDAwNS1Eby1u
b3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2ggfCA2ICsrKy0tLQogLi4uMjkt
RG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggfCAy
ICstCiAuLi4vZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gg
ICAgICAgICB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4yMC4w
LmJiID0+IGRuZl80LjIxLjAuYmJ9ICB8IDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi97ZG5mXzQuMjAuMC5iYiA9PiBkbmZfNC4yMS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxl
cy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCmluZGV4
IGZkOTQyMjI4YjkuLmNiMzc2ZGJjZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1p
bnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZjcwZWIzMDhjODM3ZjJjOTQ0ZTIzYmI2ODBhNTAxYTYwNTAwNGQ2NSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gY2UwYzE4YTRmOTFhM2EzYzEwNTNiM2U2OWY5MDRkNWEzYTM2OTRm
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjozNjoyMCArMDIw
MAogU3ViamVjdDogW1BBVENIXSBDb3JyZXRseSBpbnN0YWxsIHRtcGZpbGVzLmQgY29uZmlndXJh
dGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Eby1u
b3QtaGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5
c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAppbmRleCAzNzM1OWE1NzY1Li4wZTNjMWM3ZmFi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1o
YXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5
c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2NhNmQx
NGZiYzY0MTlmZjYyMzliNGJhMTZmNzdkYTIwZmIzMWQwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gM2Q3N2JlM2NkYzg4ZjRkM2ViOTU4NmFhZTM3MTNhNjIxNWQzYzgyOSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjoyNTo0NyArMDIwMAogU3ViamVj
dDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgL2V0YyBhbmQgc3lzdGVtZCB1bml0IGRpcmVjdG9y
aWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13
cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCmluZGV4IDE4
ZjlhMzA5NDkuLmYyNWQzZmQwYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10
by1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNDllMjgzMjI4NGFiODgzZTE4NWQ5
MDIwYzg4MTUxOGE2OGU2YzM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhY2Q2OGI0
M2M2ODViNTg3YjhhMzM4NWU4YTY2ZmJkYjcwY2ZjMTM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBUdWUsIDI4IEFwciAyMDIwIDE1OjU1OjAwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRuZjog
d3JpdGUgdGhlIGxvZyBsb2NrIHRvIHJvb3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24t
aGFuZGxpbmcucGF0Y2gKaW5kZXggNmJmZmU5YWYwYS4uNDhkYjhmNTM3ZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24t
aGFuZGxpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1s
b2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDM4ODE3NTdlYWJmZGUyZmY1NDQwMGFiMTI3YjEwNmFiMDg1ZDgzZjAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGJhZTkyNzQ0Yjc1ZmQ1Nzg0OWJmYjZlYWE5MDg1YmZmNTk1MjA2YTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5s
aUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxMyBNYXIgMjAyNCAxMToyMjowNSArMDgwMAog
U3ViamVjdDogW1BBVENIXSBsb2NrLnB5OiBmaXggRXhjZXB0aW9uIGhhbmRsaW5nCkBAIC01Nyw2
ICs1NywzIEBAIGluZGV4IDY4MTdhYWM5Li41NzE4MDYyYSAxMDA2NDQKICAKICAgICAgZGVmIF9f
ZXhpdF9fKHNlbGYsICpleGNfYXJncyk6CiAgICAgICAgICBpZiBzZWxmLmNvdW50ID09IDE6Ci0t
LSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlv
bl9oZWxwZXIucGF0Y2gKaW5kZXggZmNkOTcwYTdhZS4uOTQwODBkMGExYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNv
bXBsZXRpb25faGVscGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
LzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZmEzMmM3ZGNhYmFhM2MwMGQzNjIwYTMyNjZlNDk2MjkzNjVjMGNiZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGQ3Mzk4YTE2NDM3NzFmZjhjMGY5ODk1NDY4
ZmVkOTliYjJjMTkxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhs
bWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPgogRGF0ZTogV2VkLCAxMSBNYXIgMjAyMCAyMjoxMDow
MiArMDAwMAogU3ViamVjdDogW1BBVENIXSBzZXQgcHl0aG9uIHBhdGggZm9yIGNvbXBsZXRpb25f
aGVscGVyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURv
LW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGly
LnBhdGNoCmluZGV4IGNmYmRhMTFmNzcuLmIyOTQ0MDgyMWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8t
bG9nZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8t
bm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjNmQwM2I1MWUyMDk4ZmM2ODFlNjgxMTc5MGJkNWRjNjU5NzA5MWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBkNzNlYzUzOTg1NTM4ZTYwZTA0YWFlMzJmODFhZjM5YTFiYTJl
ZWM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDExIEphbiAyMDE3IDE1OjEwOjEzICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBwcmVwZW5kIGluc3RhbGxyb290IHRvIGxvZ2Rp
ci4KQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2RuZi9jbGkvY2xpLnB5IGIvZG5mL2NsaS9j
bGkucHkKLWluZGV4IDE4MjRiZDAwLi40ZGNiMWMxYyAxMDA2NDQKK2luZGV4IGMxNGY4MzYzLi5i
ZmMwN2FiOSAxMDA2NDQKIC0tLSBhL2RuZi9jbGkvY2xpLnB5CiArKysgYi9kbmYvY2xpL2NsaS5w
eQotQEAgLTk0NCw3ICs5NDQsNyBAQCBjbGFzcyBDbGkob2JqZWN0KToKK0BAIC05NTMsNyArOTUz
LDcgQEAgY2xhc3MgQ2xpKG9iamVjdCk6CiAgICAgICAgICAgICAgbG9nZ2VyLndhcm5pbmcoXygi
VW5hYmxlIHRvIGRldGVjdCByZWxlYXNlIHZlcnNpb24gKHVzZSAnLS1yZWxlYXNldmVyJyB0byBz
cGVjaWZ5ICIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZWxlYXNlIHZlcnNpb24p
IikpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURv
LW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxM
X0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAppbmRleCA2NGVhNzg3NGQzLi4xMTRiNjMxOWU2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1z
ZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9E
SVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ1YjE1NGVh
NjlhZmRjZDg2MjI5OWEwYjdmMjU1ZjZlY2UzNjg2YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGY4YmIzMmIyNzM1MjFlMGVkYWMwMjU0YjQ2YmMyMTUzMmMzYjQxMzUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6Mjk6MDcgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhv
bi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
LzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAppbmRleCBlYjQ2MTEzZjNh
Li45NmFiMmMxZTA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMzU1Njc2N2I4NGYzNjg3NzQzZmRhZDBhODhhZjA3Mzlk
NzM2ZWE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NTU2NjZkNDkyMjdkNmY3ZjQ4
MTdhYzUyZWRkZjZkMmMxN2UyNzZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDMwIERl
YyAyMDE2IDE4OjI5OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJ1biBweXRob24gc2NyaXB0
cyB1c2luZyBlbnYKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9iaW4vZG5mLWF1dG9tYXRp
Yy5pbiBiL2Jpbi9kbmYtYXV0b21hdGljLmluCi1pbmRleCAxN2UzNWEwNS4uMjg4MjdlMzggMTAw
NzU1CitpbmRleCAxZmI3MTJiMC4uY2U4ZDRiOGYgMTAwNzU1CiAtLS0gYS9iaW4vZG5mLWF1dG9t
YXRpYy5pbgogKysrIGIvYmluL2RuZi1hdXRvbWF0aWMuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAt
MjMsNyArMjMsNyBAQCBpbmRleCAxN2UzNWEwNS4uMjg4MjdlMzggMTAwNzU1CiAgIwogICMgQ29w
eXJpZ2h0IChDKSAyMDE0LTIwMTYgUmVkIEhhdCwgSW5jLgogZGlmZiAtLWdpdCBhL2Jpbi9kbmYu
aW4gYi9iaW4vZG5mLmluCi1pbmRleCA1NWNlYjNmMi4uZTM4OTczYzcgMTAwNzU1CitpbmRleCAx
MDcxNmRlYy4uODE3ZDdkYTUgMTAwNzU1CiAtLS0gYS9iaW4vZG5mLmluCiArKysgYi9iaW4vZG5m
LmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mXzQuMjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMjEuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZl80LjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
XzQuMjEuMC5iYgppbmRleCA5OGVkYWIwNjE0Li42ODAwYjVjNzE2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmZfNC4yMS4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9kbmYuZ2l0O2JyYW5jaD1tYXN0
ZXI7cHJvdG9jCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEt
ZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIgogCi1TUkNSRVYgPSAiZTNjYjQz
OGMwZmQwOGM3OTY3NmMwZjMyNzZhYTdkNzVjZDg1NTdjNiIKK1NSQ1JFViA9ICJkMjlkZmEwNjM0
MjM1ZDdhZDk1N2M0NzQ2YTc0OWViMWU0YTg1YTg4IgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAK
Mi40NC4wCgo=

--===============3946777849454287273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf: FILELIST: directory renamed /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info -> /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info, removed "/etc/libreport/events.d/collect_dnf.conf"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 960915 to 961603 (+0%)
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.20.0" to "4.21.0"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info

--===============3946777849454287273==--

