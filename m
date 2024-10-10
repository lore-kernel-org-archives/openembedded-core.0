Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54768CFC61C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53270.1728588950198805331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aAswZF9/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tAAqKgmp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277ee27de-e305b07c-e4fb-49db-9e2a-388e4c360458-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5BXrblt4ClsDFmuRYrKAwOaU11vsD8m++DiN+UkNILw=;
	b=aAswZF9/J1VxrCsRRZwltQGW8oYLsy4Kx0NWFzHxDjHUCVhDdMxptHCtfpmK9Ax0
	h6EnWyWdIiSr8++RITtQ6q6UkZgnUKkoBDj5qfidpYCwNMuhdUohyX+eN8G3mIgvYbt
	xBymlzlu0mo6NojDimqjKXAsb4Vg6/Q8tvytOY1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5BXrblt4ClsDFmuRYrKAwOaU11vsD8m++DiN+UkNILw=;
	b=tAAqKgmprZIrB8hbsHRlZ35AhpsX2rKsXcGmsbmiDrojXB5BJYjOPVlUn/h+EnKY
	9jwb6giEyMCWMuh0hI42j88Gx0eyF4AgmWcmOV3MJSrP4NH1Bk/dh93f6FtoJ7rUaIC
	QPrIyKrsA1nqzG/SLG1Qp4pzWUZBVKBBde22Vruk=
Content-Type: multipart/mixed; boundary="===============3551296997533325425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 75.1.0 SUCCEEDED
Message-ID: <0101019277ee27de-e305b07c-e4fb-49db-9e2a-388e4c360458-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205461

--===============3551296997533325425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *75.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-72.1.0-75.1.0.patch
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
From 25328762bbba7e84b21fdf7292ef9524dcbd2814 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:47:34 +0000
Subject: [PATCH] python3-setuptools: upgrade 72.1.0 -> 75.1.0

---
 ...stutils-sysconfig.py-make-it-possible-to-substite.patch | 7 ++-----
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...3-setuptools_72.1.0.bb => python3-setuptools_75.1.0.bb} | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_75.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 68dca43e21..763df92d41 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
+From 7b6f46c2f5380bec55e8d8964637d797ddb3de18 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 7ebe67687..8039021a8 100644
+index 7ebe676..8039021 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -121,6 +121,8 @@ def get_python_inc(plat_specific=False, prefix=None):
@@ -56,6 +56,3 @@ index 7ebe67687..8039021a8 100644
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
          if standard_lib:
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e227c2889c..1a1be1ac99 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From cc5b7b6d994e90f9e21e21c649b1caceed660614 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 36114d4..3249ddf 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.1.0.bb
index 5a01111934..bc18bd6e46 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
+SRC_URI[sha256sum] = "d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538"
 
 DEPENDS += "python3"
 
-- 
2.44.1


--===============3551296997533325425==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-72.1.0-75.1.0.patch"

RnJvbSAyNTMyODc2MmJiYmE3ZTg0YjIxZmRmNzI5MmVmOTUyNGRjYmQyODE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6NDc6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNzIuMS4wIC0+IDc1LjEuMAoKLS0tCiAuLi5zdHV0
aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIHwgNyAr
Ky0tLS0tCiAuLi4xLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0
YWxsLnBhdGNoIHwgNCArKy0tCiAuLi4zLXNldHVwdG9vbHNfNzIuMS4wLmJiID0+IHB5dGhvbjMt
c2V0dXB0b29sc183NS4xLjAuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1zZXR1cHRvb2xzXzcyLjEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfNzUu
MS4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAppbmRleCA2OGRjYTQzZTIxLi43NjNkZjkyZDQxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3Rp
dGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1
YnN0aXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhOWYzNDgzYjQ5MjMxNzk1OWEzNTg4
NjMwOGMzMWMwNzhlMzUwYTM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3YjZmNDZj
MmY1MzgwYmVjNTVlOGQ4OTY0NjM3ZDc5N2RkYjNkZTE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFdl
ZCwgMTEgTWF5IDIwMjIgMjE6NDE6MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gX2Rpc3R1dGls
cy9zeXNjb25maWcucHk6IG1ha2UgaXQgcG9zc2libGUgdG8gc3Vic3RpdGUgdGhlCkBAIC0yMCw3
ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9zZXR1cHRvb2xzL19kaXN0dXRpbHMvc3lzY29uZmlnLnB5IGIvc2V0
dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQotaW5kZXggN2ViZTY3Njg3Li44MDM5MDIx
YTggMTAwNjQ0CitpbmRleCA3ZWJlNjc2Li44MDM5MDIxIDEwMDY0NAogLS0tIGEvc2V0dXB0b29s
cy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5
c2NvbmZpZy5weQogQEAgLTEyMSw2ICsxMjEsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9z
cGVjaWZpYz1GYWxzZSwgcHJlZml4PU5vbmUpOgpAQCAtNTYsNiArNTYsMyBAQCBpbmRleCA3ZWJl
Njc2ODcuLjgwMzkwMjFhOCAxMDA2NDQKICAgICAgICAgIHJldHVybiBfcG9zaXhfbGliKHN0YW5k
YXJkX2xpYiwgbGlicHl0aG9uLCBlYXJseV9wcmVmaXgsIHByZWZpeCkKICAgICAgZWxpZiBvcy5u
YW1lID09ICJudCI6CiAgICAgICAgICBpZiBzdGFuZGFyZF9saWI6Ci0tLSAKLTIuMzkuMgotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaApp
bmRleCBlMjI3YzI4ODljLi4xYTFiZTFhYzk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90
LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3Qt
ZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgw
ZmU2MzgxNmViM2JmZDFmNWI2ZDM1NGUxZjI0NDI4MDVjZmY0ZTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGNjNWI3YjZkOTk0ZTkwZjllMjFlMjFjNjQ5YjFjYWNlZWQ2NjA2MTQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFzeV9pbnN0YWxs
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFA
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5IGIvc2V0dXB0b29scy9j
b21tYW5kL2Vhc3lfaW5zdGFsbC5weQotaW5kZXggODU4ZmIyMC4uNjJiZDg1MyAxMDA2NDQKK2lu
ZGV4IDM2MTE0ZDQuLjMyNDlkZGYgMTAwNjQ0CiAtLS0gYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFz
eV9pbnN0YWxsLnB5CiArKysgYi9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5CiBA
QCAtNjcyLDYgKzY3MiwxMSBAQCBjbGFzcyBlYXN5X2luc3RhbGwoQ29tbWFuZCk6CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183Mi4x
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183
NS4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183NS4xLjAuYmIKaW5k
ZXggNWEwMTExMTkzNC4uYmMxOGJkNmU0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc1LjEuMC5iYgpAQCAtMTMsNyAr
MTMsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmRp
dGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VSSSArPSAiIFwKICAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUt
dG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZDI0M2VmZjU2ZDA5
NWU1ODE3Zjc5NmVkZTZhZTMyOTQxMjc4ZjU0MmUwZjk0MTg2N2NjMDVhZTUyYjE2MmVjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImQ1OWEyMWIxN2EyNzVmYjg3MmE5YzNkYWU3Mzk2MzE2MGFlMDc5
ZjEwNDllZDk1Njg4MGNkN2MwOWIxMjA1MzgiCiAKIERFUEVORFMgKz0gInB5dGhvbjMiCiAKLS0g
CjIuNDQuMQoK

--===============3551296997533325425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set -> /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections, directory renamed /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__ -> /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__, directory renamed /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info -> /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info, removed "/usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload.cpython-312.pyc /usr/lib/python3.12/site-packages/
 setuptools/_distutils/command/wininst-7.1.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py /usr/lib/python3.12/site-packages/setuptools/command/register.py /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py /usr/lib/python3.12/site-packages/setuptool
 s/_distutils/command/wininst-14.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload_docs.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_
 distutils/__pycache__/_itertools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA /usr/lib/python3.12/site-packag
 es/setuptools/_distutils/_vendor/packaging/py.typed /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_parser.cpytho
 n-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe /usr/lib/python3.12/site-packages/setuptools/_d
 istutils/_functools.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/uploa
 d.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.
 py /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py", added "/usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/compat/py312.py /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/compat/__pycache__/py312.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE /usr/lib/python3.12/site-pack
 ages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json /usr/lib/python3.12/site-packages/setuptools/config/NOTICE /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 10935811 to 8388636 (-23%)
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info
  /usr/lib/python3.12/site-packages/setuptools/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/compat/__pycache__/py312.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload_docs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info
  /usr/lib/python3.12/site-packages/setuptools/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was removed

--===============3551296997533325425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-72.1.0.tar.gz;downloadfilename=setuptools-72.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-75.1.0.tar.gz;downloadfilename=setuptools-75.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-64-poky-linux/python3-setuptools: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 449936 to 451823 (+0%)
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PV changed from "72.1.0" to "75.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 10935811 to 8388636 (-23%)
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set -> /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections, directory renamed /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__ -> /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__, directory renamed /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info -> /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info, removed "/usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py /us
 r/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__p
 ycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_dist
 utils/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/py.typed /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.
 py /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/upload.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.
 1.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/register.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_itertools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py /usr/lib/python3.12/site-packages/setuptools/tests/test_regist
 er.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload_docs.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc /
 usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_functools.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/pyth
 on3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_parser.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py", added "/usr/lib/python3.12/site-packages/setuptools/compat/__pycache__/py312.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt /usr/lib/python3.
 12/site-packages/setuptools/compat/py312.py /usr/lib/python3.12/site-packages/setuptools/config/NOTICE /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 72.1.0 [default] to 75.1.0 [default]
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info
  /usr/lib/python3.12/site-packages/setuptools/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/compat/__pycache__/py312.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/upload_docs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-75.1.0.dist-info
  /usr/lib/python3.12/site-packages/setuptools/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/config/distutils.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/config/setuptools.schema.json was added
  /usr/lib/python3.12/site-packages/setuptools/config/_validate_pyproject/NOTICE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/collections/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_distutils/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was removed
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was removed

--===============3551296997533325425==--

