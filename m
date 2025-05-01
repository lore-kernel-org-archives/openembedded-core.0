Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D427BC3ABBC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1771.1746113606695801833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cSIMCcX/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JM26OjLT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b702b-d9b4d48f-a0b8-4bcb-99e8-8f8501b7b1bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rqTjGLSJT0/Nic7JM4118tqxkdYSMc0WLfoh+MkLhKI=;
	b=cSIMCcX/O61G1cWmuYvchHnf6O3GY7iFhwStEhlXAdqeFvqKKpF9HQ5l1SkhY/XE
	e+HOi5YyPMKQ5Ufw5JL87KHMLB0y8AnvMZYIdGlV5Iy5yvUzwc4bhfLIVxS5A0L6qeX
	fAHzcweocXNpPVkvMte38JMSuImz6tMHVEa9LMS8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rqTjGLSJT0/Nic7JM4118tqxkdYSMc0WLfoh+MkLhKI=;
	b=JM26OjLTgL6topoSKWwDrN7/K6xnaawV14AhxGJA7B1oAqolRjyl/u9kO+RpBMWl
	IHRcdJjzkp45sZZSs/9QwpcSFlkunS0X5Xt5w4RcK8t5bcXeGqmsD38sB7M+lKlg9Cz
	NL8AQWLtaEEINUGlPRHTnDKTAXnCAuhCusiXSXVk=
Content-Type: multipart/mixed; boundary="===============8736050691332004745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 80.1.0 FAILED
Message-ID: <010101968c7b702b-d9b4d48f-a0b8-4bcb-99e8-8f8501b7b1bc-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215826

--===============8736050691332004745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *80.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-78.1.0-80.1.0.patch
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
From 8397f35ae75670ddca4df1ff387310fb73a7af8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:27:56 +0000
Subject: [PATCH] python3-setuptools: upgrade 78.1.0 -> 80.1.0

---
 ...tutils-sysconfig.py-make-it-possible-to-substite.patch | 8 ++++----
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 2 +-
 ...-setuptools_78.1.0.bb => python3-setuptools_80.1.0.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_78.1.0.bb => python3-setuptools_80.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 8ccffeef1d..3c95babe6a 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From c3d2c40e10f24724ab2e3d5f236823f3076c7aec Mon Sep 17 00:00:00 2001
+From b10827349cfc443e4ef1d8f15b4f3c94907bf9ac Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index e5facae..0932f6f 100644
+index 7ddc869..01a06af 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
@@ -32,7 +32,7 @@ index e5facae..0932f6f 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -256,7 +258,13 @@ def get_python_lib(
+@@ -246,7 +248,13 @@ def get_python_lib(
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index e5facae..0932f6f 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -271,7 +279,7 @@ def get_python_lib(
+@@ -261,7 +269,7 @@ def get_python_lib(
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 785a2192c3..f5973ca099 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 92363514224b0aeba065f83b868a15a2a03601ab Mon Sep 17 00:00:00 2001
+From 04a2b2a74cbb728d6d0d68418a9732ce72fb675c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_80.1.0.bb
index 7455ec41af..24507205b3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "18fd474d4a82a5f83dac888df697af65afa82dec7323d09c3e37d1f14288da54"
+SRC_URI[sha256sum] = "2e308396e1d83de287ada2c2fd6e64286008fe6aca5008e0b6a8cb0e2c86eedd"
 
 DEPENDS += "python3"
 
-- 
2.47.1


--===============8736050691332004745==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-78.1.0-80.1.0.patch"

RnJvbSA4Mzk3ZjM1YWU3NTY3MGRkY2E0ZGYxZmYzODczMTBmYjczYTdhZjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOToyNzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA3OC4xLjAgLT4gODAuMS4wCgotLS0KIC4uLnR1dGls
cy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCB8IDggKysr
Ky0tLS0KIC4uLi1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaCB8IDIgKy0KIC4uLi1zZXR1cHRvb2xzXzc4LjEuMC5iYiA9PiBweXRob24zLXNldHVw
dG9vbHNfODAuMS4wLmJifSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtc2V0dXB0b29sc183OC4xLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzgwLjEuMC5i
Yn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2li
bGUtdG8tc3Vic3RpdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2li
bGUtdG8tc3Vic3RpdGUucGF0Y2gKaW5kZXggOGNjZmZlZWYxZC4uM2M5NWJhYmU2YSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0
ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzNkMmM0MGUxMGYyNDcyNGFiMmUzZDVmMjM2
ODIzZjMwNzZjN2FlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjEwODI3MzQ5Y2Zj
NDQzZTRlZjFkOGYxNWI0ZjNjOTQ5MDdiZjlhYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBXZWQsIDEx
IE1heSAyMDIyIDIxOjQxOjE0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIF9kaXN0dXRpbHMvc3lz
Y29uZmlnLnB5OiBtYWtlIGl0IHBvc3NpYmxlIHRvIHN1YnN0aXRlIHRoZQpAQCAtMjAsNyArMjAs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weSBiL3NldHVwdG9v
bHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkKLWluZGV4IGU1ZmFjYWUuLjA5MzJmNmYgMTAwNjQ0
CitpbmRleCA3ZGRjODY5Li4wMWEwNmFmIDEwMDY0NAogLS0tIGEvc2V0dXB0b29scy9fZGlzdHV0
aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5w
eQogQEAgLTEzNCw2ICsxMzQsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9zcGVjaWZpYzog
Ym9vbCA9IEZhbHNlLCBwcmVmaXg6IHN0ciB8IE5vbmUgPSBOb25lKSAtPiBzdApAQCAtMzIsNyAr
MzIsNyBAQCBpbmRleCBlNWZhY2FlLi4wOTMyZjZmIDEwMDY0NAogICAgICByZXNvbHZlZF9wcmVm
aXggPSBwcmVmaXggaWYgcHJlZml4IGlzIG5vdCBOb25lIGVsc2UgZGVmYXVsdF9wcmVmaXgKICAg
ICAgIyBNaW5HVyBpbWl0YXRlcyBwb3NpeCBsaWtlIGxheW91dCwgYnV0IG9zLm5hbWUgIT0gcG9z
aXgKICAgICAgb3NfbmFtZSA9ICJwb3NpeCIgaWYgaXNfbWluZ3coKSBlbHNlIG9zLm5hbWUKLUBA
IC0yNTYsNyArMjU4LDEzIEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKK0BAIC0yNDYsNyArMjQ4LDEz
IEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKICAKICAgICAgZWFybHlfcHJlZml4ID0gcHJlZml4CiAg
CkBAIC00Nyw3ICs0Nyw3IEBAIGluZGV4IGU1ZmFjYWUuLjA5MzJmNmYgMTAwNjQ0CiAgICAgICAg
ICBpZiBzdGFuZGFyZF9saWI6CiAgICAgICAgICAgICAgcHJlZml4ID0gcGxhdF9zcGVjaWZpYyBh
bmQgQkFTRV9FWEVDX1BSRUZJWCBvciBCQVNFX1BSRUZJWAogICAgICAgICAgZWxzZToKLUBAIC0y
NzEsNyArMjc5LDcgQEAgZGVmIGdldF9weXRob25fbGliKAorQEAgLTI2MSw3ICsyNjksNyBAQCBk
ZWYgZ2V0X3B5dGhvbl9saWIoCiAgICAgICAgICAgICAgIyBQdXJlIFB5dGhvbgogICAgICAgICAg
ICAgIGxpYmRpciA9ICJsaWIiCiAgICAgICAgICBpbXBsZW1lbnRhdGlvbiA9ICdweXB5JyBpZiBJ
U19QWVBZIGVsc2UgJ3B5dGhvbicKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gt
Y29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUt
YnktZWFzeV9pbnN0YWxsLnBhdGNoCmluZGV4IDc4NWEyMTkyYzMuLmY1OTczY2EwOTkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAw
MDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gOTIzNjM1MTQyMjRiMGFlYmEwNjVmODNiODY4YTE1YTJhMDM2
MDFhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDRhMmIyYTc0Y2JiNzI4ZDZkMGQ2
ODQxOGE5NzMyY2U3MmZiNjc1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4
dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgSnVsIDIwMTgg
MTA6MTM6MzggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZGl0aW9uYWxseSBkbyBub3QgZmV0
Y2ggY29kZSBieSBlYXN5X2luc3RhbGwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzc4LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgwLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29sc183OC4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzXzgwLjEuMC5iYgppbmRleCA3NDU1ZWM0MWFmLi4yNDUwNzIwNWIz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc183OC4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHNfODAuMS4wLmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29k
ZS1ieS1lCiBTUkNfVVJJICs9ICIgXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGls
cy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjE4ZmQ0NzRkNGE4MmE1ZjgzZGFjODg4ZGY2OTdhZjY1YWZhODJk
ZWM3MzIzZDA5YzNlMzdkMWYxNDI4OGRhNTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmUzMDgz
OTZlMWQ4M2RlMjg3YWRhMmMyZmQ2ZTY0Mjg2MDA4ZmU2YWNhNTAwOGUwYjZhOGNiMGUyYzg2ZWVk
ZCIKIAogREVQRU5EUyArPSAicHl0aG9uMyIKIAotLSAKMi40Ny4xCgo=

--===============8736050691332004745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8d09621a8b0a55e3e6e6d3d35c7323913d2d373b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 386 Local 186 Mirrors 0 Missed 200 Current 272 (48% match, 69% complete)
Removing 52 stale sstate objects for arch qemux86_64...done.
Removing 23 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 461 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 498 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 499 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 501 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 550 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 554 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 555 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 559 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 561 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 564 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 567 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 588 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 598 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 599 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 632 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 634 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 644 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 510 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_recipe_qa)
NOTE: Running task 548 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running task 608 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 616 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 624 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_recipe_qa: Started
NOTE: Running task 626 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 642 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 699 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 712 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 740 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 756 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 760 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: Running task 761 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 819 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 822 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 824 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Started
NOTE: Running task 838 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 854 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_unpack)
NOTE: Running task 855 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 890 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 891 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 898 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: Running task 900 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 905 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_unpack: Started
NOTE: Running task 906 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 907 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: Running task 910 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: Running task 915 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 916 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 917 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_patch: Started
NOTE: Running setscene task 654 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: Running task 927 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 928 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 933 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 934 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 935 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: Running task 936 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 937 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 938 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Started
NOTE: Running task 939 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: Running task 941 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: Running task 948 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: Running task 950 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Started
NOTE: Running task 952 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: Running task 955 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 959 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 971 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Started
NOTE: Running task 972 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 980 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 983 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_configure)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Succeeded
NOTE: Running task 985 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: Running task 992 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 994 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 996 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe curl-8.12.1-r0: task do_fetch: Started
NOTE: recipe curl-8.12.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: Running task 998 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1001 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1006 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: Running task 1008 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running task 1011 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1012 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe curl-8.12.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 1013 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1019 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 1020 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_compile)
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: Running task 1023 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 1024 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: Running task 1027 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: Running task 1038 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_compile: Started
NOTE: Running task 1044 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: Running task 1045 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: Running task 1046 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: Running task 1048 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1049 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: Running task 1050 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1054 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: Running task 1055 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: Running task 1057 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: Running task 1059 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: Running task 1063 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: Running task 1065 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: Running task 1066 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: Running task 1068 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: Running task 1070 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: Running task 1071 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: Running task 1072 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: Running task 1077 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe curl-8.12.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: Running task 1081 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1083 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_collect_spdx_deps)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1085 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: Running task 1093 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 1099 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: Running task 1102 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: Running task 1105 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_fetch)
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: Running task 1107 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1108 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 1111 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: Running task 1112 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1114 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe libarchive-3.7.9-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: Running task 1116 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 1117 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_patch)
NOTE: Running task 1118 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running task 1119 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_unpack)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: Running task 1123 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: Running task 1125 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: Running task 1127 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe libarchive-3.7.9-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: Running task 1139 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 1140 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe libarchive-3.7.9-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1146 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.9-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1151 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_recipe_qa)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1154 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: Running task 1155 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe libarchive-3.7.9-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.1.0-r0: task do_recipe_qa: Started
NOTE: Running task 1163 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1164 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1195 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 1210 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1214 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1226 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1228 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_fetch)
NOTE: Running task 1229 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running task 1230 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1231 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_fetch)
NOTE: Running task 1232 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe binutils-2.44-r0: task do_fetch: Started
NOTE: Running task 1234 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1235 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe python3-setuptools-80.1.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.44-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1238 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: Running task 1245 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: Running task 1256 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_unpack)
NOTE: Running task 1257 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1265 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1271 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe python3-setuptools-80.1.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: Running noexec task 1308 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.44-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: Running task 1335 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 1337 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1339 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1340 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_populate_lic)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_install)
NOTE: Running task 1345 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-80.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-80.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_install: Succeeded
NOTE: Running task 1351 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1353 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.1.0.bb:do_create_spdx)
NOTE: recipe meson-native-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-80.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1357 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_configure)
NOTE: Running task 1358 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_configure)
NOTE: Running task 1359 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe meson-native-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_configure: Started
NOTE: recipe meson-native-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-native-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe meson-native-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_compile)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1361 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_compile)
NOTE: recipe meson-native-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_compile: Started
NOTE: recipe binutils-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_patch)
NOTE: recipe binutils-2.44-r0: task do_patch: Started
NOTE: recipe binutils-2.44-r0: task do_patch: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/setupcfg.py", line 285, in __setitem__
|     current_value = getattr(target_obj, option_name)
| AttributeError: 'MinimalDistribution' object has no attribute 'entry_points'
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py", line 331, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 20, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/__init__.py", line 116, in setup
|     _install_setup_requires(attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/__init__.py", line 87, in _install_setup_requires
|     dist.parse_config_files(ignore_option_errors=True)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/dist.py", line 752, in parse_config_files
|     setupcfg.parse_configuration(
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
|         self, self.command_options, ignore_option_errors=ignore_option_errors
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|     )
|     ^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/setupcfg.py", line 176, in parse_configuration
|     options.parse()
|     ~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/setupcfg.py", line 502, in parse
|     section_parser_method(section_options)
|     ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/setupcfg.py", line 717, in parse_section_entry_points
|     self['entry_points'] = parsed
|     ~~~~^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/setupcfg.py", line 287, in __setitem__
|     raise KeyError(option_name) from e
| KeyError: 'entry_points'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/run.do_compile.3509906:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/meson-1.7.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/run.do_compile.3509906, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/run.do_compile.3509906, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/run.do_compile.3509906, line 163
NOTE: recipe meson-native-1.7.2-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/_apply_pyprojecttoml.py:82: SetuptoolsDeprecationWarning: `project.license` as a TOML table is deprecated
| !!
| 
|         ********************************************************************************
|         Please use a simple string containing a SPDX expression for `project.license`. You can also use `project.license-files`. (Both options available on setuptools>=77.0.0).
| 
|         By 2026-Feb-18, you need to update your project and remove deprecated calls
|         or your builds will no longer be supported.
| 
|         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
|         ********************************************************************************
| 
| !!
|   corresp(dist, value, root_dir)
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/_apply_pyprojecttoml.py:61: SetuptoolsDeprecationWarning: License classifiers are deprecated.
| !!
| 
|         ********************************************************************************
|         Please consider removing the following classifiers in favor of a SPDX license expression:
| 
|         License :: OSI Approved :: BSD License
| 
|         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
|         ********************************************************************************
| 
| !!
|   dist._finalize_license_expression()
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/dist.py:759: SetuptoolsDeprecationWarning: License classifiers are deprecated.
| !!
| 
|         ********************************************************************************
|         Please consider removing the following classifiers in favor of a SPDX license expression:
| 
|         License :: OSI Approved :: BSD License
| 
|         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
|         ********************************************************************************
| 
| !!
|   self._finalize_license_expression()
| usage: _in_process.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: _in_process.py --help [cmd1 cmd2 ...]
|    or: _in_process.py --help-commands
|    or: _in_process.py cmd --help
| 
| error: invalid command 'egg_info'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.3509917:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/markupsafe-3.0.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.3509917, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.3509917, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.3509917, line 163
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1363 tasks of which 1177 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501092735.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501092735.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/log.do_compile.3509906
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/log.do_compile.3509917
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: meson-native-1.7.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/run.do_compile.3509906' failed with exit code 1
ERROR: python3-markupsafe-native-3.0.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.3509917' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.7.2/temp/log.do_compile.3509906
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/log.do_compile.3509917
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_compile) failed with exit code '1'

--===============8736050691332004745==--

