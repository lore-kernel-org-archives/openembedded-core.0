Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01A1C54795
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1364.1721071146723212751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hZEoPFIu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UIYOWe6d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190b7d59391-51c15753-a985-44cd-b34e-e0e6c7bc5b04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0BNB4ZWbVygQzzN18s8SNG0pgSNOSUZxF9/RWNfSmGg=;
	b=hZEoPFIusdp1jy6/8TODZ5GoDfN91amsFJ+SfC1XJGlzsVXzuHJdVf5NPEc2cX3s
	QUogxQc1YP85oB+SF4HxmsaqYD3VO7ytrI24BYltiFj+hOtqEcSJqoEVVvzkAOOWISc
	NyjQJ2mMHXJMob1DWfJVfPwzdaQ/GO0U4+gjDegs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0BNB4ZWbVygQzzN18s8SNG0pgSNOSUZxF9/RWNfSmGg=;
	b=UIYOWe6dvk/OJ5iHWw1tLIc4Z/O5OLqI97N+GpzZwGEJGY73CLR0gDiN9HrGvnuY
	vKzl6kpqSbnFoT8VMArNbQpaYQE3b4qZwDHiI5NArZd19w6XxI/FUrSeAG85Rox2GXO
	14kerREgJs7qDI82BsKSRCmT2Yn4aOLpnwAsJwOg=
Content-Type: multipart/mixed; boundary="===============8468094196961094381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.73.2 SUCCEEDED
Message-ID: <01010190b7d59391-51c15753-a985-44cd-b34e-e0e6c7bc5b04-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201972

--===============8468094196961094381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.73.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.73.1-0.73.2.patch
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
From 1c216207802ef556011b2fa7a557972e745647c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 09:45:32 +0000
Subject: [PATCH] libdnf: upgrade 0.73.1 -> 0.73.2

---
 ...1-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 2 +-
 ...1-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 2 +-
 .../libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch       | 2 +-
 ...4-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 2 +-
 meta/recipes-devtools/libdnf/libdnf/armarch.patch               | 2 +-
 .../libdnf/libdnf/enable_test_data_dir_set.patch                | 2 +-
 .../libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb}               | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 046e09eab2..a2f6b19cf5 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,4 +1,4 @@
-From 5d6db56791d326e6b486dca54fe2335af0225229 Mon Sep 17 00:00:00 2001
+From 02134d76950f32fa78b01a49d671814f02126547 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
 Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 223c1be218..5c0ff9bd18 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From bf9bde4af952b67cc357d25b9863889099ea9665 Mon Sep 17 00:00:00 2001
+From 72048cbdd2363b4e84611d273e8a3d7847062d85 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 27f76077d7..4ac0183d40 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From a6b3bc4fb3db996cd6c5616a99c16d085704dae0 Mon Sep 17 00:00:00 2001
+From fd9491c3997bba94c45001ad0e7025edaa194e37 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index ecab47e5af..6257b704e3 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From e40def862bdeb10da295b15c5904fe2829d391c7 Mon Sep 17 00:00:00 2001
+From 0c68a5c651acf381cd3ef406e3bfd30f6edf877d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 63debdb58f..405bcca1be 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From aa0f8b65feec64420a9b7b61cfcc8bcce161e14b Mon Sep 17 00:00:00 2001
+From 3dbcb84f4a287dd0a9229cd8e357d8fa3652710c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index e4f6d447f1..dca4d05bb3 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 25229773a9d4472235278bb45f75439e56630cee Mon Sep 17 00:00:00 2001
+From c2cffb2d8f16f5a2d242e7d9da8bcf8ab8ba75da Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
index 3ab840b1b0..ed433d4a9f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "0120e70747dcf05e716792e2e846c62eccd44319"
+SRCREV = "86bbb159732e43dd6dff98c96e99382843f7c63b"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============8468094196961094381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.12/site-packages/libdnf-0.73.1.dist-info moved to /usr/lib/python3.12/site-packages/libdnf-0.73.2.dist-info

--===============8468094196961094381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.73.1-0.73.2.patch"

RnJvbSAxYzIxNjIwNzgwMmVmNTU2MDExYjJmYTdhNTU3OTcyZTc0NTY0N2MzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDk6NDU6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IHVwZ3JhZGUgMC43My4xIC0+IDAuNzMuMgoKLS0tCiAuLi4xLUZpbmRHdGtEb2MuY21h
a2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2ggfCAyICstCiAuLi4x
LUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGliZG4ucGF0
Y2ggfCAyICstCiAuLi4vbGliZG5mL2xpYmRuZi8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIu
Y21ha2UucGF0Y2ggICAgICAgfCAyICstCiAuLi40LVNldC1saWJzb2x2LXZhcmlhYmxlcy13aXRo
LXBrZy1jb25maWctY21ha2Utcy1vd24tbW8ucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2ggICAgICAgICAg
ICAgICAgfCAyICstCiAuLi4vbGliZG5mL3tsaWJkbmZfMC43My4xLmJiID0+IGxpYmRuZl8wLjcz
LjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5m
L3tsaWJkbmZfMC43My4xLmJiID0+IGxpYmRuZl8wLjczLjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNt
YWtlLWRyb3AtdGhlLXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNtYWtlLWRyb3AtdGhl
LXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoCmluZGV4IDA0NmUwOWVhYjIuLmEyZjZi
MTljZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAw
MDEtRmluZEd0a0RvYy5jbWFrZS1kcm9wLXRoZS1yZXF1aXJlbWVudC1mb3ItR1RLRE9DX1NDQS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLUZpbmRH
dGtEb2MuY21ha2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDVkNmRiNTY3OTFkMzI2ZTZiNDg2ZGNhNTRmZTIzMzVhZjAyMjUy
MjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDAyMTM0ZDc2OTUwZjMyZmE3OGIwMWE0
OWQ2NzE4MTRmMDIxMjY1NDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjQgTm92IDIw
MTYgMTQ6MzM6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRmluZEd0a0RvYy5jbWFrZTogZHJv
cCB0aGUgcmVxdWlyZW1lbnQgZm9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxp
YnNvbHZleHQtbGliZG4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRu
Zi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGli
ZG4ucGF0Y2gKaW5kZXggMjIzYzFiZTIxOC4uNWMwZmY5YmQxOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1HZXQtcGFyYW1ldGVycy1mb3ItYm90
aC1saWJzb2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29s
di1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmY5YmRl
NGFmOTUyYjY3Y2MzNTdkMjViOTg2Mzg4OTA5OWVhOTY2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzIwNDhjYmRkMjM2M2I0ZTg0NjExZDI3M2U4YTNkNzg0NzA2MmQ4NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVHVlLCA3IEZlYiAyMDE3IDEyOjE2OjAzICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEdldCBwYXJhbWV0ZXJzIGZvciBib3RoIGxpYnNvbHYgYW5kIGxpYnNvbHZleHQg
KGxpYmRuZiBpcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJk
bmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtl
LnBhdGNoCmluZGV4IDI3Zjc2MDc3ZDcuLjRhYzAxODNkNDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtZHJvcC1GaW5kUHl0aG9uSW5zdERpci5j
bWFrZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAx
LWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE2YjNiYzRmYjNkYjk5NmNkNmM1NjE2YTk5YzE2ZDA4NTcwNGRhZTAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGZkOTQ5MWMzOTk3YmJhOTRjNDUwMDFhZDBlNzAyNWVkYWExOTRlMzcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEgSnVuIDIwMjEgMTA6MjM6NTkgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gZHJvcCBGaW5kUHl0aG9uSW5zdERpci5jbWFrZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJs
ZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ct
Y29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoCmluZGV4IGVjYWI0N2U1YWYuLjYyNTdiNzA0ZTMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDQtU2V0
LWxpYnNvbHYtdmFyaWFibGVzLXdpdGgtcGtnLWNvbmZpZy1jbWFrZS1zLW93bi1tby5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDA0LVNldC1saWJzb2x2
LXZhcmlhYmxlcy13aXRoLXBrZy1jb25maWctY21ha2Utcy1vd24tbW8ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGU0MGRlZjg2MmJkZWIxMGRhMjk1YjE1YzU5MDRmZTI4MjlkMzkxYzcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBjNjhhNWM2NTFhY2YzODFjZDNlZjQwNmUzYmZk
MzBmNmVkZjg3N2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6
MjQ6NTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IGxpYnNvbHYgdmFyaWFibGVzIHdpdGgg
cGtnLWNvbmZpZyAoY21ha2UncyBvd24gbW9kdWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmRuZi9saWJkbmYvYXJtYXJjaC5wYXRjaAppbmRleCA2M2RlYmRiNThmLi40MDViY2Nh
MWJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1h
cmNoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2FybWFy
Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFhMGY4YjY1ZmVlYzY0NDIwYTliN2I2MWNm
Y2M4YmNjZTE2MWUxNGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNkYmNiODRmNGEy
ODdkZDBhOTIyOWNkOGUzNTdkOGZhMzY1MjcxMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
IERhdGU6IFRodSwgOSBOb3YgMjAyMyAxMDoyOTozMSArMDAwMAogU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IEZpeCBhcm0gYXJjaCBtYXBwaW5nIGlzc3VlcyBmb3IgcWVtdWFybXY1CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRh
X2Rpcl9zZXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFi
bGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2gKaW5kZXggZTRmNmQ0NDdmMS4uZGNhNGQwNWJiMyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rl
c3RfZGF0YV9kaXJfc2V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYv
bGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMjUyMjk3NzNhOWQ0NDcyMjM1Mjc4YmI0NWY3NTQzOWU1NjYzMGNlZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYzJjZmZiMmQ4ZjE2ZjVhMmQyNDJlN2Q5ZGE4YmNmOGFiOGJhNzVk
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjIgSnVsIDIwMjAgMTM6MzE6MTEgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbGliZG5mOiBhbGxvdyByZXByb2R1Y2libGUgYmluYXJ5IGJ1aWxkcwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGli
ZG5mXzAuNzMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJk
bmZfMC43My4yLmJiCmluZGV4IDNhYjg0MGIxYjAuLmVkNDMzZDRhOWYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzMuMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjczLjIuYmIKQEAgLTEzLDcgKzEzLDcgQEAg
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmRu
ZjticmFuY2g9ZG5mLTQtbWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovL2FybWFyY2gucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICIwMTIwZTcwNzQ3ZGNmMDVlNzE2NzkyZTJlODQ2
YzYyZWNjZDQ0MzE5IgorU1JDUkVWID0gIjg2YmJiMTU5NzMyZTQzZGQ2ZGZmOThjOTZlOTkzODI4
NDNmN2M2M2IiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oPyE0XC45
MClcZCsoXC5cZCspKykiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjQ0LjAKCg==

--===============8468094196961094381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdnf: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 59730880 to 59741824 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dev: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-doc: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-src: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7357909 to 7362153 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
packages/core2-64-poky-linux/libdnf/libdnf: PV changed from "0.73.1" to "0.73.2"
packages/core2-64-poky-linux/libdnf/libdnf: PKGV changed from 0.73.1 [default] to 0.73.2 [default]
Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.12/site-packages/libdnf-0.73.1.dist-info moved to /usr/lib/python3.12/site-packages/libdnf-0.73.2.dist-info

--===============8468094196961094381==--

