Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B1ECAC5A0
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.89787.1756850180157864169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Mc2kl/G2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Iw+0VM/E;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6e848c-a67cda75-a84c-4a66-8e40-849d246f02b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8fHJcql4zAA+drPANuYJYc4RqJp1GN2G5FQ1LAbft2A=;
	b=Mc2kl/G28Uu4ry6PKXdiCirCVPrROm8RAmjKnQ/Pt2ybPEHTJb28Qxpw1ZNYAfXU
	PHUNh8TnLxJd2aOsW1lFXPA3gThKVSKVEzKi6WpflwryNJxMmi6ByBW5eStdUwHgfRV
	9JQPw+R6xthEA1PAZ0TQtErQPwU8P6sD308zCTIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8fHJcql4zAA+drPANuYJYc4RqJp1GN2G5FQ1LAbft2A=;
	b=Iw+0VM/EpBbMQFXtyNpNZN+gm11esoB4fBefH+SvF/T47TzG73w5Qi0Q0X4ih6fI
	82qSmmdgkiK5nHP0fv1tD9miqbwxWwa8fh6OrV8NFBiwcdwV9gEWeMDbqPPwLVEylCB
	hQt5wvuiFnWNLJDaHzzKxOIzqbU1Ue+Ozq5Gq/xU=
Content-Type: multipart/mixed; boundary="===============7219062046726845841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.8.26.11 SUCCEEDED
Message-ID: <010101990c6e848c-a67cda75-a84c-4a66-8e40-849d246f02b6-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222790

--===============7219062046726845841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.8.26.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.5.9.12-2025.8.patch
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
From 1551518ea3c37ea16ad303901b6e8b4f6b7cf98f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:46:58 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.5.9.12 ->
 2025.8.26.11

---
 ...2025.5.9.12.bb => python3-trove-classifiers_2025.8.26.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.5.9.12.bb => python3-trove-classifiers_2025.8.26.11.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.8.26.11.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.8.26.11.bb
index 68b09537bc..42705b7897 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.8.26.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
+SRC_URI[sha256sum] = "e73efff317c492a7990092f9c12676c705bf6cfe40a258a93f63f4b4c9941432"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============7219062046726845841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.5.9.12-2025.8.patch"

RnJvbSAxNTUxNTE4ZWEzYzM3ZWExNmFkMzAzOTAxYjZlOGI0ZjZiN2NmOThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODo0Njo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNS41LjkuMTIgLT4KIDIwMjUuOC4y
Ni4xMQoKLS0tCiAuLi4yMDI1LjUuOS4xMi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjUuOC4yNi4xMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuNS45LjEyLmJiID0+IHB5dGhvbjMtdHJvdmUtY2xh
c3NpZmllcnNfMjAyNS44LjI2LjExLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjUuOS4xMi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjguMjYuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuNS45
LjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNS44LjI2LjExLmJiCmluZGV4IDY4YjA5NTM3YmMuLjQyNzA1Yjc4
OTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92
ZS1jbGFzc2lmaWVyc18yMDI1LjUuOS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS44LjI2LjExLmJiCkBAIC0zLDcg
KzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lm
aWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiN2NhN2M4YTdhNzZlMmNkMzE0NDY4YzY3N2M2OWQxMmNjMjM1NzcxMWZj
YWI0YTYwZjg3OTk0YzE1ODllNWNiNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNzNlZmZmMzE3
YzQ5MmE3OTkwMDkyZjljMTI2NzZjNzA1YmY2Y2ZlNDBhMjU4YTkzZjYzZjRiNGM5OTQxNDMyIgog
CiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJ
X1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============7219062046726845841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.5.9.12.tar.gz;downloadfilename=trove_classifiers-2025.5.9.12.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.8.26.11.tar.gz;downloadfilename=trove_classifiers-2025.8.26.11.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.5.9.12" to "2025.8.26.11"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.5.9.12 [default] to 2025.8.26.11 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 95240 to 95449 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed

--===============7219062046726845841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.26.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed

--===============7219062046726845841==--

