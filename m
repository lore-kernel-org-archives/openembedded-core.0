Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCB9C25B7D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1268.1715794337174362206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hVT3ztug;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P7h1koFz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f7d4fde20-a9425286-489e-47a8-9243-19fa1c151c9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=61r7Wzpxih1fgJEVSJOaR12luENvdZ9dtY0SuT4koxY=;
	b=hVT3ztug741Ru9CMGYdMg0e/5cpJ7YPCtyV+3oEp32vkNejDwj9YrLdquRkwbZVd
	bziBX3WIO0QR+XHxvUCuReY9CBIZA4kYb7CumKBB+lzuqlZjlI44DWj6ewnGQgQ91S8
	p7QA5T7G4wTv7xYN1gOKvTtsWr/jrgJaCYA5n1ls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=61r7Wzpxih1fgJEVSJOaR12luENvdZ9dtY0SuT4koxY=;
	b=P7h1koFz00eomLK5G1wKrNiWBs4P8/oQwZ/SisMhHgUXAVnHwo86cQRvJGguf1Uc
	3ZrMos8b/VzFLYosrLhl9JRE2nDcpWfjlNYGyqjjn8e3WXwx6gNRwfwcgDGPfdrYVb0
	hQbjBqSXx8UKKqKZmExT/Y5oCC2Qmy4mLE5ql13M=
Content-Type: multipart/mixed; boundary="===============7065877570170582410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.20.0 SUCCEEDED
Message-ID: <0101018f7d4fde20-a9425286-489e-47a8-9243-19fa1c151c9d-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199332

--===============7065877570170582410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.19.2-4.20.0.patch
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
From 1ae7b01bcb164a6dcbb02536780df20d3690a36b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:44:38 +0000
Subject: [PATCH] dnf: upgrade 4.19.2 -> 4.20.0

---
 .../dnf/0001-Corretly-install-tmpfiles.d-configuration.patch | 2 +-
 ...01-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 2 +-
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch        | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch        | 5 +----
 .../dnf/dnf/0001-set-python-path-for-completion_helper.patch | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch  | 2 +-
 ...029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch          | 2 +-
 meta/recipes-devtools/dnf/{dnf_4.19.2.bb => dnf_4.20.0.bb}   | 2 +-
 9 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.19.2.bb => dnf_4.20.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..36a5026b80 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From 9cd56fd7010c7bf334b6dc7fc41510c0752a1818 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..854c9fab5c 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 1ab6f0a6b57c27f98757829b4ef6e06c0213e147 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..ccd3e3169b 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From b88ca1f9a2785264432c5cd24816f0513d7cad7e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..ef0318c8d8 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From 6e8c60578ced8c562f0928c36de0bfe576918e33 Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..57edf33c93 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From f3b13590aeda37e3d808b25ee14660b80e804f2f Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index cfbda11f77..cef396d794 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
+From 7ca686b44d97d2b99958dffe283cac4f10bdd0b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..75348d1551 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 61f1a39978e3b4e25235dd5c490c9899405bb12c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..1e0a4d5d35 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From f3e0dd435f742b5ffa7359e3bc7d5e24ea971e39 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
 Subject: [PATCH] Run python scripts using env
diff --git a/meta/recipes-devtools/dnf/dnf_4.19.2.bb b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.19.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.20.0.bb
index cc91dbe400..4757346cbf 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "9b2b2e8ddab99caba4bc8059cab4263163172e81"
+SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============7065877570170582410==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.19.2-4.20.0.patch"

RnJvbSAxYWU3YjAxYmNiMTY0YTZkY2JiMDI1MzY3ODBkZjIwZDM2OTBhMzZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6NDQ6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xOS4yIC0+IDQuMjAuMAoKLS0tCiAuLi4vZG5mLzAwMDEtQ29ycmV0bHkt
aW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2ggfCAyICstCiAuLi4wMS1Eby1u
b3QtaGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggfCAyICst
CiAuLi4vZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCAg
ICAgICAgfCAyICstCiAuLi4vZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5k
bGluZy5wYXRjaCAgICAgICAgfCA1ICstLS0tCiAuLi4vZG5mL2RuZi8wMDAxLXNldC1weXRob24t
cGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2ggfCAyICstCiAuLi4vZG5mL2RuZi8wMDA1
LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaCAgfCAyICstCiAuLi4w
MjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gg
fCAyICstCiAuLi4vZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0
Y2ggICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4xOS4y
LmJiID0+IGRuZl80LjIwLjAuYmJ9ICAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi97ZG5mXzQuMTkuMi5iYiA9PiBkbmZfNC4yMC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxl
cy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCmluZGV4
IGZkOTQyMjI4YjkuLjM2YTUwMjZiODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1p
bnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZjcwZWIzMDhjODM3ZjJjOTQ0ZTIzYmI2ODBhNTAxYTYwNTAwNGQ2NSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOWNkNTZmZDcwMTBjN2JmMzM0YjZkYzdmYzQxNTEwYzA3NTJhMTgx
OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjozNjoyMCArMDIw
MAogU3ViamVjdDogW1BBVENIXSBDb3JyZXRseSBpbnN0YWxsIHRtcGZpbGVzLmQgY29uZmlndXJh
dGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Eby1u
b3QtaGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5
c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAppbmRleCAzNzM1OWE1NzY1Li44NTRjOWZhYjVj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1o
YXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5
c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2NhNmQx
NGZiYzY0MTlmZjYyMzliNGJhMTZmNzdkYTIwZmIzMWQwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMWFiNmYwYTZiNTdjMjdmOTg3NTc4MjliNGVmNmUwNmMwMjEzZTE0NyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjoyNTo0NyArMDIwMAogU3ViamVj
dDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgL2V0YyBhbmQgc3lzdGVtZCB1bml0IGRpcmVjdG9y
aWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13
cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCmluZGV4IDE4
ZjlhMzA5NDkuLmNjZDNlMzE2OWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10
by1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNDllMjgzMjI4NGFiODgzZTE4NWQ5
MDIwYzg4MTUxOGE2OGU2YzM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiODhjYTFm
OWEyNzg1MjY0NDMyYzVjZDI0ODE2ZjA1MTNkN2NhZDdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBUdWUsIDI4IEFwciAyMDIwIDE1OjU1OjAwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRuZjog
d3JpdGUgdGhlIGxvZyBsb2NrIHRvIHJvb3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24t
aGFuZGxpbmcucGF0Y2gKaW5kZXggNmJmZmU5YWYwYS4uZWYwMzE4YzhkOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24t
aGFuZGxpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1s
b2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDM4ODE3NTdlYWJmZGUyZmY1NDQwMGFiMTI3YjEwNmFiMDg1ZDgzZjAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDZlOGM2MDU3OGNlZDhjNTYyZjA5MjhjMzZkZTBiZmU1NzY5MThlMzMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5s
aUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxMyBNYXIgMjAyNCAxMToyMjowNSArMDgwMAog
U3ViamVjdDogW1BBVENIXSBsb2NrLnB5OiBmaXggRXhjZXB0aW9uIGhhbmRsaW5nCkBAIC01Nyw2
ICs1NywzIEBAIGluZGV4IDY4MTdhYWM5Li41NzE4MDYyYSAxMDA2NDQKICAKICAgICAgZGVmIF9f
ZXhpdF9fKHNlbGYsICpleGNfYXJncyk6CiAgICAgICAgICBpZiBzZWxmLmNvdW50ID09IDE6Ci0t
LSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8w
MDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlv
bl9oZWxwZXIucGF0Y2gKaW5kZXggZmNkOTcwYTdhZS4uNTdlZGYzM2M5MyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNv
bXBsZXRpb25faGVscGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
LzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZmEzMmM3ZGNhYmFhM2MwMGQzNjIwYTMyNjZlNDk2MjkzNjVjMGNiZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjNiMTM1OTBhZWRhMzdlM2Q4MDhiMjVlZTE0
NjYwYjgwZTgwNGYyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhs
bWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPgogRGF0ZTogV2VkLCAxMSBNYXIgMjAyMCAyMjoxMDow
MiArMDAwMAogU3ViamVjdDogW1BBVENIXSBzZXQgcHl0aG9uIHBhdGggZm9yIGNvbXBsZXRpb25f
aGVscGVyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURv
LW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGly
LnBhdGNoCmluZGV4IGNmYmRhMTFmNzcuLmNlZjM5NmQ3OTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8t
bG9nZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8t
bm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjNmQwM2I1MWUyMDk4ZmM2ODFlNjgxMTc5MGJkNWRjNjU5NzA5MWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA3Y2E2ODZiNDRkOTdkMmI5OTk1OGRmZmUyODNjYWM0ZjEwYmRk
MGI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDExIEphbiAyMDE3IDE1OjEwOjEzICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBwcmVwZW5kIGluc3RhbGxyb290IHRvIGxvZ2Rp
ci4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90
LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElS
LWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCmluZGV4IDY0ZWE3ODc0ZDMuLjc1MzQ4ZDE1NTEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1Q
WVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1i
eS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDViMTU0ZWE2OWFm
ZGNkODYyMjk5YTBiN2YyNTVmNmVjZTM2ODZjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNjFmMWEzOTk3OGUzYjRlMjUyMzVkZDVjNDkwYzk4OTk0MDViYjEyYyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODoyOTowNyArMDIwMAogU3ViamVjdDogW1BB
VENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNj
cmlwdHMtdXNpbmctZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAz
MC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCmluZGV4IGViNDYxMTNmM2EuLjFl
MGE0ZDVkMzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAt
UnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGQzNTU2NzY3Yjg0ZjM2ODc3NDNmZGFkMGE4OGFmMDczOWQ3MzZl
YTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYzZTBkZDQzNWY3NDJiNWZmYTczNTll
M2JjN2Q1ZTI0ZWE5NzFlMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIw
MTYgMTg6Mjk6MzcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUnVuIHB5dGhvbiBzY3JpcHRzIHVz
aW5nIGVudgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xOS4y
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTku
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMC4wLmJiCmlu
ZGV4IGNjOTFkYmU0MDAuLjQ3NTczNDZjYmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mXzQuMTkuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zl80LjIwLjAuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2RuZi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2MKIAog
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gImZpbGU6Ly8wMDAxLWRuZi13cml0ZS10aGUt
bG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAotU1JDUkVWID0gIjliMmIyZThkZGFiOTljYWJhNGJj
ODA1OWNhYjQyNjMxNjMxNzJlODEiCitTUkNSRVYgPSAiZTNjYjQzOGMwZmQwOGM3OTY3NmMwZjMy
NzZhYTdkNzVjZDg1NTdjNiIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVy
PlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNDQuMAoK

--===============7065877570170582410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 960925 to 960915 (-0%)
packages/core2-64-poky-linux/dnf: PV changed from "4.19.2" to "4.20.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.19.2 [default] to 4.20.0 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.19.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info

--===============7065877570170582410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.19.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info

--===============7065877570170582410==--

