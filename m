Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC87C3ABC6
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1802.1746113612252095661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FjZP/MWq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FNX8pJtY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7b6083-86991bc3-1a95-4e4a-a425-66941096d52f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xGcUdY7qX3U5SDVGGb4PFe9GnAC24JEzhBZSD4G7Xu4=;
	b=FjZP/MWqWJoFc908+kQVhc6i+2RKGH0nVFMFCVZohmT6CcCgy4zNkkLvkM2/g0/K
	1UBIu4Xj9K3WZoEVsMA+2rcXO82yXKajAxjpY8oIbzDiTK8ViAEkQLch+N8Pszaeug3
	KOCi0N95Lsyy7ImvB2OxvWH/r5eAuK64lvVvDla4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xGcUdY7qX3U5SDVGGb4PFe9GnAC24JEzhBZSD4G7Xu4=;
	b=FNX8pJtY0yXLOoihIu0oMXecFKm3Hkd521rOdwqisQj751JdKbxGl8I0f3AaJVsv
	0EyHKJsjLN/U1lyzxkCtTL66sYvnzMyEx4XRovKh9g8NHU1TyT3Z9YuUZhHXpvFW1M7
	RcQ0vzOMjV4CRqqbucOtKCtxpysZlUnL4iD8sAfw=
Content-Type: multipart/mixed; boundary="===============7298235873434921622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-calver: upgrading to 2025.04.17 SUCCEEDED
Message-ID: <010101968c7b6083-86991bc3-1a95-4e4a-a425-66941096d52f-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215813

--===============7298235873434921622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-calver* to *2025.04.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-calver-upgrade-2025.04.02-2025.04.17.patch
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
From 8652be031ac4b7382d048f169904ecb73e0fb646 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:43:41 +0000
Subject: [PATCH] python3-calver: upgrade 2025.04.02 -> 2025.04.17

---
 ...ython3-calver_2025.04.02.bb => python3-calver_2025.04.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.02.bb => python3-calver_2025.04.17.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.02.bb b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.02.bb
rename to meta/recipes-devtools/python/python3-calver_2025.04.17.bb
index 3f169e1f7c..290be21ce2 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.02.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "e9c8017caf3e3aff214fbb581ee7f366de55f629"
+SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============7298235873434921622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-calver-upgrade-2025.04.02-2025.04.17.patch"

RnJvbSA4NjUyYmUwMzFhYzRiNzM4MmQwNDhmMTY5OTA0ZWNiNzNlMGZiNjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODo0Mzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2FsdmVyOiB1cGdyYWRlIDIwMjUuMDQuMDIgLT4gMjAyNS4wNC4xNwoKLS0tCiAuLi55
dGhvbjMtY2FsdmVyXzIwMjUuMDQuMDIuYmIgPT4gcHl0aG9uMy1jYWx2ZXJfMjAyNS4wNC4xNy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNhbHZlcl8yMDI1
LjA0LjAyLmJiID0+IHB5dGhvbjMtY2FsdmVyXzIwMjUuMDQuMTcuYmJ9ICg4OSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjA0
LjAyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1
LjA0LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wNC4wMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjA0LjE3LmJiCmlu
ZGV4IDNmMTY5ZTFmN2MuLjI5MGJlMjFjZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wNC4wMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjUuMDQuMTcuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vZGkvY2FsdmVyO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0
cHM7dGFnPSR7UFZ9IgotU1JDUkVWID0gImU5YzgwMTdjYWYzZTNhZmYyMTRmYmI1ODFlZTdmMzY2
ZGU1NWY2MjkiCitTUkNSRVYgPSAiM2I3NGJkY2UzNWYyODE0ZWIyYjY1ZGIzOWExMzNkNWM4NDlk
ZGVhNyIKIAogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhv
bi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============7298235873434921622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-calver: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver: SRC_URI changed from "git://github.com/di/calver;branch=master;protocol=https;tag=2025.04.02" to "git://github.com/di/calver;branch=master;protocol=https;tag=2025.04.17"
packages/core2-64-poky-linux/python3-calver: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-dbg: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-dbg: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-dev: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-dev: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-doc: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-doc: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-locale: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-locale: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 2610 to 2955 (+13%)
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: FILELIST: added "/usr/lib/python3-calver/ptest/tests/conftest.py"
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-src: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-src: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver-staticdev: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver-staticdev: PV changed from "2025.04.02" to "2025.04.17"
packages/core2-64-poky-linux/python3-calver/python3-calver: PKGSIZE changed from 18416 to 18417 (+0%)
packages/core2-64-poky-linux/python3-calver/python3-calver: PKGV changed from 2025.04.02 [default] to 2025.04.17 [default]
packages/core2-64-poky-linux/python3-calver/python3-calver: PV changed from "2025.04.02" to "2025.04.17"
Changes to packages/core2-64-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/WHEEL was removed

--===============7298235873434921622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 2610 to 2955 (+13%)
packages/core2-64-poky-linux/python3-calver/python3-calver-ptest: FILELIST: added "/usr/lib/python3-calver/ptest/tests/conftest.py"
Changes to packages/core2-64-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.2.dist-info/WHEEL was removed

--===============7298235873434921622==--

