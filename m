Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D109D6006C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4684.1731964639284455034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QQ6DS1qW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XoXBXvlX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010193412315e5-c1b6e15a-3fef-4c0e-a5a0-56163572b2f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B/qrYkZvTJUFd/PgHQZ4Rjle/HqA3RmBpwqcWzvtguw=;
	b=QQ6DS1qWfdHtD0jMzvkGaTpW4aPM5qOzPbWYZcLTk0yXSmYIyR7Q/fsbVDsOhgVh
	Y13KZRV6DZ8o7SGFI4yB2ZyOKztSzgH+um/ENlUIeZOXBVZkC2YDB/2CVQSo7ozuWLg
	guG1208riGZntrDgMqenJfN7RylUC4gd071GS6to=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B/qrYkZvTJUFd/PgHQZ4Rjle/HqA3RmBpwqcWzvtguw=;
	b=XoXBXvlXbd2+77oOyz+G3KLkSI2gGBZSNzXhLZ/szYppRkdACK9meiP7ibCJrTge
	Rqwwr+HM/WdZEY9Ilt6vNVQrFl+TCN6Dzs7WBAimdCji0gR0HeS6kIiYxoZeeBxjt1N
	gbxkTiW/AOiV3dhuI6aEi/Q7olEeNKBD8t9qxZA4=
Content-Type: multipart/mixed; boundary="===============7976342720499618135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 75.5.0 FAILED
Message-ID: <01010193412315e5-c1b6e15a-3fef-4c0e-a5a0-56163572b2f0-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207293

--===============7976342720499618135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *75.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-72.1.0-75.5.0.patch
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
From 86072eb91a147d059031e8f0197bb80e7a4a5f45 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 02:34:55 +0000
Subject: [PATCH] python3-setuptools: upgrade 72.1.0 -> 75.5.0

---
 ...stutils-sysconfig.py-make-it-possible-to-substite.patch | 7 ++-----
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...3-setuptools_72.1.0.bb => python3-setuptools_75.5.0.bb} | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_75.5.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 68dca43e21..8bf27eedd1 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
+From badde0504de7ad4334bf461228a9fdbda1265a65 Mon Sep 17 00:00:00 2001
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
index 16b316e9cc..44196b46c5 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From 646fbdd1d3bb0107a2f2c78742324acf0885c923 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -16,7 +16,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 36114d4..3249ddf 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.5.0.bb
index 5a01111934..a7369db37d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
+SRC_URI[sha256sum] = "5c4ccb41111392671f02bb5f8436dfc5a9a7185e80500531b133f5775c4163ef"
 
 DEPENDS += "python3"
 
-- 
2.44.1


--===============7976342720499618135==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-72.1.0-75.5.0.patch"

RnJvbSA4NjA3MmViOTFhMTQ3ZDA1OTAzMWU4ZjAxOTdiYjgwZTdhNGE1ZjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDI6MzQ6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNzIuMS4wIC0+IDc1LjUuMAoKLS0tCiAuLi5zdHV0
aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIHwgNyAr
Ky0tLS0tCiAuLi4xLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0
YWxsLnBhdGNoIHwgNCArKy0tCiAuLi4zLXNldHVwdG9vbHNfNzIuMS4wLmJiID0+IHB5dGhvbjMt
c2V0dXB0b29sc183NS41LjAuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1zZXR1cHRvb2xzXzcyLjEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfNzUu
NS4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAppbmRleCA2OGRjYTQzZTIxLi44YmYyN2VlZGQxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3Rp
dGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1
YnN0aXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhOWYzNDgzYjQ5MjMxNzk1OWEzNTg4
NjMwOGMzMWMwNzhlMzUwYTM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYWRkZTA1
MDRkZTdhZDQzMzRiZjQ2MTIyOGE5ZmRiZGExMjY1YTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
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
bmRleCAxNmIzMTZlOWNjLi40NDE5NmI0NmM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90
LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3Qt
ZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgw
ZmU2MzgxNmViM2JmZDFmNWI2ZDM1NGUxZjI0NDI4MDVjZmY0ZTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDY0NmZiZGQxZDNiYjAxMDdhMmYyYzc4NzQyMzI0YWNmMDg4NWM5MjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFzeV9pbnN0YWxs
CkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFA
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5IGIvc2V0dXB0b29scy9j
b21tYW5kL2Vhc3lfaW5zdGFsbC5weQotaW5kZXggODU4ZmIyMC4uNjJiZDg1MyAxMDA2NDQKK2lu
ZGV4IDM2MTE0ZDQuLjMyNDlkZGYgMTAwNjQ0CiAtLS0gYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFz
eV9pbnN0YWxsLnB5CiArKysgYi9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5CiBA
QCAtNjcyLDYgKzY3MiwxMSBAQCBjbGFzcyBlYXN5X2luc3RhbGwoQ29tbWFuZCk6CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183Mi4x
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183
NS41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183NS41LjAuYmIKaW5k
ZXggNWEwMTExMTkzNC4uYTczNjlkYjM3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc1LjUuMC5iYgpAQCAtMTMsNyAr
MTMsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmRp
dGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VSSSArPSAiIFwKICAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUt
dG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZDI0M2VmZjU2ZDA5
NWU1ODE3Zjc5NmVkZTZhZTMyOTQxMjc4ZjU0MmUwZjk0MTg2N2NjMDVhZTUyYjE2MmVjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjVjNGNjYjQxMTExMzkyNjcxZjAyYmI1Zjg0MzZkZmM1YTlhNzE4
NWU4MDUwMDUzMWIxMzNmNTc3NWM0MTYzZWYiCiAKIERFUEVORFMgKz0gInB5dGhvbjMiCiAKLS0g
CjIuNDQuMQoK

--===============7976342720499618135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:775a8ad179b09c5aa015ce7024f1d682d368632f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 308 Local 292 Mirrors 0 Missed 16 Current 328 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 365 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: Running task 940 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_recipe_qa)
NOTE: Running task 941 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-75.5.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1103 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1104 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_fetch)
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-75.5.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1175 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_unpack)
NOTE: Running task 1177 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-75.5.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 610 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1180 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_patch)
NOTE: Running task 1182 of 1806 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-75.5.0-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 1806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-75.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-75.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 636 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-75.5.0-r0: task do_patch: Failed
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1281 tasks of which 1269 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117023357.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117023357.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/75.5.0/temp/log.do_patch.3315875
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-setuptools-native-75.5.0-r0 do_patch: Applying patch '0001-conditionally-do-not-fetch-code-by-easy_install.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/75.5.0/setuptools-75.5.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/75.5.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 FAILED at 672.
1 out of 1 hunk FAILED -- rejects in file setuptools/command/easy_install.py
Patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/75.5.0/temp/log.do_patch.3315875
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.5.0.bb:do_patch) failed with exit code '1'

--===============7976342720499618135==--

