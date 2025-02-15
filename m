Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A5C021B2
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8060.1739623335830717786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jtbMF+Gy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UOKyV4CW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019509a187ec-95e3b170-d66a-49b7-8bb9-91dbdb026109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9ID8RjJpIDr8UuV7dTRmfb+ZGZXcXUtafxJgYBp5EuE=;
	b=jtbMF+Gy2XvjE9rLpWuq2JT12DTqipRYdtxnUo7xxbYgV4/EwgZA9hwiU1BnQzEA
	oJXnHJTOo4L7Z25RZNszqbQIXrou/FqMwOQ0kIdAkRYjWzKS1Tn6dKUXiTKH3q73gDD
	nDZaftaVSVJQM0nTJaSKlTq/xkavAafuD16LAkfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9ID8RjJpIDr8UuV7dTRmfb+ZGZXcXUtafxJgYBp5EuE=;
	b=UOKyV4CWgdHVlNk8j+k/Y439grvlqBiUgXgpeAv3wif7fwqFGA9fl7OLT9zf8nBl
	XbQQ7lF+fQhzvpi7bCZHhpSGX+dkZxprG5+iL5Q/YYc34uHASTz5+X5w3OND4DatJxm
	VHk32eRhqBlrybH5O2dps5rqgTxb9KmfRn5pLLj4=
Content-Type: multipart/mixed; boundary="===============1492247189639640825=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.12 SUCCEEDED
Message-ID: <0101019509a187ec-95e3b170-d66a-49b7-8bb9-91dbdb026109-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211420

--===============1492247189639640825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.0.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.0.11-3.0.12.patch
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
From 1bf04264e72ace8028a63efd1718df52aa1b511d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:40:15 +0000
Subject: [PATCH] python3-cython: upgrade 3.0.11 -> 3.0.12

---
 ...t-import-relative-paths-in-generated-C-code.-GH.patch | 9 +++------
 ...python3-cython_3.0.11.bb => python3-cython_3.0.12.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.11.bb => python3-cython_3.0.12.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch b/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
index bbafc29416..a23a3d6bef 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
@@ -1,4 +1,4 @@
-From 9b5f3b09f76899eba510c2d8f3ed2b0f752a4d1b Mon Sep 17 00:00:00 2001
+From 35e70067ac3ad2d7757a2292fae87ec9df8febea Mon Sep 17 00:00:00 2001
 From: Oscar Benjamin <oscar.j.benjamin@gmail.com>
 Date: Sat, 24 Aug 2024 08:30:31 +0100
 Subject: [PATCH] Output import-relative paths in generated C code. (GH-6341)
@@ -16,7 +16,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/Cython/Compiler/ExprNodes.py b/Cython/Compiler/ExprNodes.py
-index a6bb1688e..0fbb15368 100644
+index 7704d1d..c2c6fda 100644
 --- a/Cython/Compiler/ExprNodes.py
 +++ b/Cython/Compiler/ExprNodes.py
 @@ -21,6 +21,7 @@ import re
@@ -42,7 +42,7 @@ index a6bb1688e..0fbb15368 100644
  
          # This combination makes CPython create a new dict for "frame.f_locals" (see GH #1836).
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 43c6b5f07..8c29d6db7 100644
+index 43c6b5f..8c29d6d 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -13,6 +13,7 @@ from collections import defaultdict
@@ -68,6 +68,3 @@ index 43c6b5f07..8c29d6db7 100644
                  code.putln('%s,' % escaped_filename.as_c_string_literal())
          else:
              # Some C compilers don't like an empty array
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta/recipes-devtools/python/python3-cython_3.0.12.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.0.11.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.12.bb
index c1d45eaff5..f1951e3ae6 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.12.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
 SRC_URI += "file://0001-Output-import-relative-paths-in-generated-C-code.-GH.patch"
-SRC_URI[sha256sum] = "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
+SRC_URI[sha256sum] = "b988bb297ce76c671e28c97d017b95411010f7c77fa6623dd0bb47eed1aee1bc"
 
 inherit pypi setuptools3 cython
 
-- 
2.44.1


--===============1492247189639640825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.0.11-3.0.12.patch"

RnJvbSAxYmYwNDI2NGU3MmFjZTgwMjhhNjNlZmQxNzE4ZGY1MmFhMWI1MTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6NDA6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjAuMTEgLT4gMy4wLjEyCgotLS0KIC4uLnQtaW1wb3J0
LXJlbGF0aXZlLXBhdGhzLWluLWdlbmVyYXRlZC1DLWNvZGUuLUdILnBhdGNoIHwgOSArKystLS0t
LS0KIC4uLnB5dGhvbjMtY3l0aG9uXzMuMC4xMS5iYiA9PiBweXRob24zLWN5dGhvbl8zLjAuMTIu
YmJ9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRob25f
My4wLjExLmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMC4xMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtT3V0cHV0
LWltcG9ydC1yZWxhdGl2ZS1wYXRocy1pbi1nZW5lcmF0ZWQtQy1jb2RlLi1HSC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1PdXRwdXQtaW1w
b3J0LXJlbGF0aXZlLXBhdGhzLWluLWdlbmVyYXRlZC1DLWNvZGUuLUdILnBhdGNoCmluZGV4IGJi
YWZjMjk0MTYuLmEyM2EzZDZiZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1PdXRwdXQtaW1wb3J0LXJlbGF0aXZlLXBhdGhzLWlu
LWdlbmVyYXRlZC1DLWNvZGUuLUdILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1PdXRwdXQtaW1wb3J0LXJlbGF0aXZlLXBhdGhzLWlu
LWdlbmVyYXRlZC1DLWNvZGUuLUdILnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5YjVmM2Iw
OWY3Njg5OWViYTUxMGMyZDhmM2VkMmIwZjc1MmE0ZDFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAzNWU3MDA2N2FjM2FkMmQ3NzU3YTIyOTJmYWU4N2VjOWRmOGZlYmVhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT3NjYXIgQmVuamFtaW4gPG9zY2FyLmouYmVuamFtaW5A
Z21haWwuY29tPgogRGF0ZTogU2F0LCAyNCBBdWcgMjAyNCAwODozMDozMSArMDEwMAogU3ViamVj
dDogW1BBVENIXSBPdXRwdXQgaW1wb3J0LXJlbGF0aXZlIHBhdGhzIGluIGdlbmVyYXRlZCBDIGNv
ZGUuIChHSC02MzQxKQpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9DeXRob24vQ29tcGlsZXIvRXhwck5v
ZGVzLnB5IGIvQ3l0aG9uL0NvbXBpbGVyL0V4cHJOb2Rlcy5weQotaW5kZXggYTZiYjE2ODhlLi4w
ZmJiMTUzNjggMTAwNjQ0CitpbmRleCA3NzA0ZDFkLi5jMmM2ZmRhIDEwMDY0NAogLS0tIGEvQ3l0
aG9uL0NvbXBpbGVyL0V4cHJOb2Rlcy5weQogKysrIGIvQ3l0aG9uL0NvbXBpbGVyL0V4cHJOb2Rl
cy5weQogQEAgLTIxLDYgKzIxLDcgQEAgaW1wb3J0IHJlCkBAIC00Miw3ICs0Miw3IEBAIGluZGV4
IGE2YmIxNjg4ZS4uMGZiYjE1MzY4IDEwMDY0NAogIAogICAgICAgICAgIyBUaGlzIGNvbWJpbmF0
aW9uIG1ha2VzIENQeXRob24gY3JlYXRlIGEgbmV3IGRpY3QgZm9yICJmcmFtZS5mX2xvY2FscyIg
KHNlZSBHSCAjMTgzNikuCiBkaWZmIC0tZ2l0IGEvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUu
cHkgYi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQotaW5kZXggNDNjNmI1ZjA3Li44YzI5
ZDZkYjcgMTAwNjQ0CitpbmRleCA0M2M2YjVmLi44YzI5ZDZkIDEwMDY0NAogLS0tIGEvQ3l0aG9u
L0NvbXBpbGVyL01vZHVsZU5vZGUucHkKICsrKyBiL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2Rl
LnB5CiBAQCAtMTMsNiArMTMsNyBAQCBmcm9tIGNvbGxlY3Rpb25zIGltcG9ydCBkZWZhdWx0ZGlj
dApAQCAtNjgsNiArNjgsMyBAQCBpbmRleCA0M2M2YjVmMDcuLjhjMjlkNmRiNyAxMDA2NDQKICAg
ICAgICAgICAgICAgICAgY29kZS5wdXRsbignJXMsJyAlIGVzY2FwZWRfZmlsZW5hbWUuYXNfY19z
dHJpbmdfbGl0ZXJhbCgpKQogICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAjIFNvbWUgQyBj
b21waWxlcnMgZG9uJ3QgbGlrZSBhbiBlbXB0eSBhcnJheQotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuMTEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMC4xMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMC4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuMTIuYmIKaW5kZXggYzFkNDVlYWZmNS4u
ZjE5NTFlM2FlNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWN5dGhvbl8zLjAuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWN5dGhvbl8zLjAuMTIuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQXBhY2hl
LTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT02MWMzZWU4
OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtT3V0
cHV0LWltcG9ydC1yZWxhdGl2ZS1wYXRocy1pbi1nZW5lcmF0ZWQtQy1jb2RlLi1HSC5wYXRjaCIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MTQ2ZGQyYWY4NjgyYjRjYTYxMzMxODUxZTZhZWJjZTlm
ZTUxNThlNzUzMDAzNDNmODBjMDdjYTgwYjFmYWZmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5
ODhiYjI5N2NlNzZjNjcxZTI4Yzk3ZDAxN2I5NTQxMTAxMGY3Yzc3ZmE2NjIzZGQwYmI0N2VlZDFh
ZWUxYmMiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBjeXRob24KIAotLSAKMi40NC4xCgo=

--===============1492247189639640825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.0.11.tar.gz;downloadfilename=cython-3.0.11.tar.gz file://0001-Output-import-relative-paths-in-generated-C-code.-GH.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.0.12.tar.gz;downloadfilename=cython-3.0.12.tar.gz file://0001-Output-import-relative-paths-in-generated-C-code.-GH.patch"
packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27934008 to 27965768 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22875035 to 22910364 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.0.11" to "3.0.12"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15165839 to 15174857 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.0.11 [default] to 3.0.12 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.0.11" to "3.0.12"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/Cython-3.0.11.dist-info moved to /usr/lib/python3.13/site-packages/Cython-3.0.12.dist-info

--===============1492247189639640825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/Cython-3.0.11.dist-info moved to /usr/lib/python3.13/site-packages/Cython-3.0.12.dist-info

--===============1492247189639640825==--

