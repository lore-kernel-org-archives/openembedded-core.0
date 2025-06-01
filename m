Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F623C77B73
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27782.1748786120552370013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oWdFarwD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OW+3sL3p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6ce3e-e52f515e-77a4-414c-b17d-f2476bb80a84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jMcqIMd3tO8ikEd3K0TlR2lkVLHyGRvxJUxKj4+MaFU=;
	b=oWdFarwD9n5QFiaxn/R/zmtljxbcoACWGAhcOh5eohj5dp43rHf5gFnRY1m8v6Sb
	6R4a8GrnwWdbqTxzOsCn+7tOgxoKtvfKzxED9rIOKrKFkr6Rm7qdGdZQCwgFk1g/pOc
	VATQqTV/IMJooLuzcMuBT/nQ2k+b3TbJE8z+mnAk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jMcqIMd3tO8ikEd3K0TlR2lkVLHyGRvxJUxKj4+MaFU=;
	b=OW+3sL3pjv/KNNI6//egQyKdAuLo3IZOjwMUgeCv1mkv0a67ds+KSqEPaKATmAEO
	uGov5ju/wqdHmCt9gpADzS06+vlklW1mPQEQNIy34kDzMhVAsPqNi7InbORT80jsWRj
	xwEik1AUHXJqNxDyx/anNfK4MN2sOFAsbqqPll7g=
Content-Type: multipart/mixed; boundary="===============7195429713101166046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.5.9.12 SUCCEEDED
Message-ID: <010101972bc6ce3e-e52f515e-77a4-414c-b17d-f2476bb80a84-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217614

--===============7195429713101166046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.5.9.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch
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
From 9f348a7f89c2dcd6cae3d053cfabdd01d291410d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:05:01 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.3.19.19 ->
 2025.5.9.12

---
 ...2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
index 39fb997e88..68b09537bc 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
+SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============7195429713101166046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.19.19.tar.gz;downloadfilename=trove_classifiers-2025.3.19.19.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.5.9.12.tar.gz;downloadfilename=trove_classifiers-2025.5.9.12.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5496 (+23%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93568 to 95240 (+2%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt /usr/bin/trove-classifiers /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.5.9.12"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed

--===============7195429713101166046==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch"

RnJvbSA5ZjM0OGE3Zjg5YzJkY2Q2Y2FlM2QwNTNjZmFiZGQwMWQyOTE0MTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDowNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNS4zLjE5LjE5IC0+CiAyMDI1LjUu
OS4xMgoKLS0tCiAuLi4yMDI1LjMuMTkuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjUuOS4xMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4xOS4xOS5iYiA9PiBweXRob24zLXRyb3ZlLWNs
YXNzaWZpZXJzXzIwMjUuNS45LjEyLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTkuMTku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS41LjkuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4x
OS4xOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjUuNS45LjEyLmJiCmluZGV4IDM5ZmI5OTdlODguLjY4YjA5NTM3
YmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92
ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTkuMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuNS45LjEyLmJiCkBAIC0zLDcg
KzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lm
aWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOThlOWQzOTZmZTkwOGQ1ZjQzYjc0NTRmYTRjNDNkMTdjZDBmZGFkZjA0
NmY0NWZiMzhhNWUzYWY4ZDk1OWVjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3Y2E3YzhhN2E3
NmUyY2QzMTQ0NjhjNjc3YzY5ZDEyY2MyMzU3NzExZmNhYjRhNjBmODc5OTRjMTU4OWU1Y2I1Igog
CiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJ
X1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============7195429713101166046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5496 (+23%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL /usr/bin/trove-classifiers"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed

--===============7195429713101166046==--

