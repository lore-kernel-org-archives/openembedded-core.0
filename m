Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB95C369AD
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18075.1743511396844481230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KKCNKVU2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fkDaWYU2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f1609fb7-53d9e21d-8764-495a-a28e-fea726f6d0f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BdPnJVHsPboAwqUr/5yuEjNoMQuJQsqa++NaNg/m5AM=;
	b=KKCNKVU25yv+SFi8v9l87glw9OWMNAOHh9iFSkL6H0F9pnrMHayo5ot7VSA9E2Jy
	SSpms421uC1Lod1aWSJ3oV/4T2orCSe2/leIVbO29XD9D8VVJDgzblYydYyVLfva/mJ
	X9yIth0l+t5s9JynAlfeZLpsDkoYUfkbWAsD6TiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BdPnJVHsPboAwqUr/5yuEjNoMQuJQsqa++NaNg/m5AM=;
	b=fkDaWYU2k/LzsrUPlOaeq3ZHSfxDJaMtR/NdCY1bbEPxvb11T/t99fkX7hE9e6TJ
	cHl9VNprQ3/qdmzCU8PxhLc8jjq1ASl2/E6kPALtQ0CqIvkxouGnYh2haKB7ICC9SyY
	CzEkwESglJNn0rTB8F8m3r4cqZlFjoopW/1vy4V0=
Content-Type: multipart/mixed; boundary="===============1931173216979451928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-calver: upgrading to 2025.03.31 SUCCEEDED
Message-ID: <01010195f1609fb7-53d9e21d-8764-495a-a28e-fea726f6d0f9-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214058

--===============1931173216979451928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-calver* to *2025.03.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-calver-upgrade-2022.6.26-2025.03.31.patch
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
From 5c0cc00db027cbb8ef1b122332708d6996ebd38f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:49:05 +0000
Subject: [PATCH] python3-calver: upgrade 2022.6.26 -> 2025.03.31

---
 .../python3-calver/0001-setup.py-hard-code-version.patch | 9 +++------
 ...-calver_2022.6.26.bb => python3-calver_2025.03.31.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-calver_2022.6.26.bb => python3-calver_2025.03.31.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
index 43f8a78ef0..2f6627c339 100644
--- a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
+++ b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
@@ -1,10 +1,10 @@
-From 390a233ed969f82b2ef209b23bfb523e785603f9 Mon Sep 17 00:00:00 2001
+From 4330fe9874ce72026860f96f35faf796e7ea8384 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 9 May 2023 10:19:41 -0400
 Subject: [PATCH] setup.py: hard-code version
 
 setup.py is pulling the build version from the current date rather than
-a release tag or other predictable method, causing reproducibility 
+a release tag or other predictable method, causing reproducibility
 issues in builds. Patch this to make reproducible builds work while
 discussing this with upstream maintainer (or developing a patch that can
 make calver rely on a more standard pyproject.toml solution).
@@ -17,7 +17,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 73f6b10..2e27cf1 100644
+index cff2eaf..79c883d 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -42,5 +42,5 @@ setup(
@@ -27,6 +27,3 @@ index 73f6b10..2e27cf1 100644
 -    version=calver_version(True),
 +    version=calver_version("2022.6.26"),
  )
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2025.03.31.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-calver_2022.6.26.bb
rename to meta/recipes-devtools/python/python3-calver_2025.03.31.bb
index b2e7e0769d..c1e6caa34e 100644
--- a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.03.31.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     git://github.com/di/calver;branch=master;protocol=https \
     file://0001-setup.py-hard-code-version.patch \
 "
-SRCREV = "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
+SRCREV = "e1f9f3aaa5fc8f3a244e1d479c08340a45c8bfa8"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============1931173216979451928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 1676 to 2200 (+31%)

--===============1931173216979451928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-calver-upgrade-2022.6.26-2025.03.31.patch"

RnJvbSA1YzBjYzAwZGIwMjdjYmI4ZWYxYjEyMjMzMjcwOGQ2OTk2ZWJkMzhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo0OTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2FsdmVyOiB1cGdyYWRlIDIwMjIuNi4yNiAtPiAyMDI1LjAzLjMxCgotLS0KIC4uLi9w
eXRob24zLWNhbHZlci8wMDAxLXNldHVwLnB5LWhhcmQtY29kZS12ZXJzaW9uLnBhdGNoIHwgOSAr
KystLS0tLS0KIC4uLi1jYWx2ZXJfMjAyMi42LjI2LmJiID0+IHB5dGhvbjMtY2FsdmVyXzIwMjUu
MDMuMzEuYmJ9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1j
YWx2ZXJfMjAyMi42LjI2LmJiID0+IHB5dGhvbjMtY2FsdmVyXzIwMjUuMDMuMzEuYmJ9ICg5MCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZl
ci8wMDAxLXNldHVwLnB5LWhhcmQtY29kZS12ZXJzaW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlci8wMDAxLXNldHVwLnB5LWhhcmQtY29kZS12ZXJz
aW9uLnBhdGNoCmluZGV4IDQzZjhhNzhlZjAuLjJmNjYyN2MzMzkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXIvMDAwMS1zZXR1cC5weS1oYXJk
LWNvZGUtdmVyc2lvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY2FsdmVyLzAwMDEtc2V0dXAucHktaGFyZC1jb2RlLXZlcnNpb24ucGF0Y2gKQEAgLTEs
MTAgKzEsMTAgQEAKLUZyb20gMzkwYTIzM2VkOTY5ZjgyYjJlZjIwOWIyM2JmYjUyM2U3ODU2MDNm
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDMzMGZlOTg3NGNlNzIwMjY4NjBmOTZm
MzVmYWY3OTZlN2VhODM4NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiBEYXRlOiBUdWUsIDkgTWF5IDIwMjMgMTA6
MTk6NDEgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gc2V0dXAucHk6IGhhcmQtY29kZSB2ZXJzaW9u
CiAKIHNldHVwLnB5IGlzIHB1bGxpbmcgdGhlIGJ1aWxkIHZlcnNpb24gZnJvbSB0aGUgY3VycmVu
dCBkYXRlIHJhdGhlciB0aGFuCi1hIHJlbGVhc2UgdGFnIG9yIG90aGVyIHByZWRpY3RhYmxlIG1l
dGhvZCwgY2F1c2luZyByZXByb2R1Y2liaWxpdHkgCithIHJlbGVhc2UgdGFnIG9yIG90aGVyIHBy
ZWRpY3RhYmxlIG1ldGhvZCwgY2F1c2luZyByZXByb2R1Y2liaWxpdHkKIGlzc3VlcyBpbiBidWls
ZHMuIFBhdGNoIHRoaXMgdG8gbWFrZSByZXByb2R1Y2libGUgYnVpbGRzIHdvcmsgd2hpbGUKIGRp
c2N1c3NpbmcgdGhpcyB3aXRoIHVwc3RyZWFtIG1haW50YWluZXIgKG9yIGRldmVsb3BpbmcgYSBw
YXRjaCB0aGF0IGNhbgogbWFrZSBjYWx2ZXIgcmVseSBvbiBhIG1vcmUgc3RhbmRhcmQgcHlwcm9q
ZWN0LnRvbWwgc29sdXRpb24pLgpAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBUcmV2
b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1
cC5weQotaW5kZXggNzNmNmIxMC4uMmUyN2NmMSAxMDA2NDQKK2luZGV4IGNmZjJlYWYuLjc5Yzg4
M2QgMTAwNjQ0CiAtLS0gYS9zZXR1cC5weQogKysrIGIvc2V0dXAucHkKIEBAIC00Miw1ICs0Miw1
IEBAIHNldHVwKApAQCAtMjcsNiArMjcsMyBAQCBpbmRleCA3M2Y2YjEwLi4yZTI3Y2YxIDEwMDY0
NAogLSAgICB2ZXJzaW9uPWNhbHZlcl92ZXJzaW9uKFRydWUpLAogKyAgICB2ZXJzaW9uPWNhbHZl
cl92ZXJzaW9uKCIyMDIyLjYuMjYiKSwKICApCi0tLSAKLTIuNDAuMAotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjIuNi4yNi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wMy4zMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjIuNi4yNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjAzLjMxLmJiCmluZGV4IGIyZTdl
MDc2OWQuLmMxZTZjYWEzNGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jYWx2ZXJfMjAyMi42LjI2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wMy4zMS5iYgpAQCAtNyw3ICs3LDcgQEAgU1JD
X1VSSSA9ICIgXAogICAgIGdpdDovL2dpdGh1Yi5jb20vZGkvY2FsdmVyO2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMgXAogICAgIGZpbGU6Ly8wMDAxLXNldHVwLnB5LWhhcmQtY29kZS12ZXJz
aW9uLnBhdGNoIFwKICIKLVNSQ1JFViA9ICIzMjY4ZDhhY2YyYzM0NWYzMmExYzVmMDhiYTI1ZGM2
N2Y3NmNjYTgxIgorU1JDUkVWID0gImUxZjlmM2FhYTVmYzhmM2EyNDRlMWQ0NzljMDgzNDBhNDVj
OGJmYTgiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRo
b24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============1931173216979451928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-calver: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-dbg: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-dbg: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-dev: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-dev: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-doc: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-doc: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-locale: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-locale: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 1676 to 2200 (+31%)
packages/core2-64-poky-linux/python3-calver/python3-calver-src: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-src: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver-staticdev: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-staticdev: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver: PKGV changed from 2022.6.26 [default] to 2025.03.31 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver: PV changed from "2022.6.26" to "2025.03.31"
packages/core2-64-poky-linux/python3-calver/python3-calver: PKGSIZE changed from 17563 to 18559 (+6%)

--===============1931173216979451928==--

