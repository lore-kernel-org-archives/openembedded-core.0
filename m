Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FFCCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2353.1762384576266000481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=grsa9uBy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=njO5yg2i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564e94d4-f18af70b-f9a0-485a-a889-aa11d3ef10d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wby6Vik+JQImdGTkFj2gi2Trvat2hF1F6h0lqw5lruw=;
	b=grsa9uByEOmrMxVjzRFujNY1OYlCUe1JTw4W4L3VKFq/ogSNjtyCQPr86FJBa1av
	B6y18qaI2dEoRk5JgQY5b91kZnCyU1ZGbva8q6mrf9b/80tY2cLgxp6/aCgUWn0dMWj
	PgHbpw373aKV1nUhoNPilxlm+45M8GlxaSU9tWTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wby6Vik+JQImdGTkFj2gi2Trvat2hF1F6h0lqw5lruw=;
	b=njO5yg2ixlM2XZ0KsUaxDti48c0A4lw3Pne/b/TO8H/85lmr272tr0TLGtWMVcyC
	MIsQDhwnoPiL9tZRmgfDJNWujslPuJPe+k22HTMdALgLA4lOJAKnTEE8LwihtZBiX3R
	Yh9VPmpMU+4+S/6J6FVpmYCTad/kIg0t4Cr6+19o=
Content-Type: multipart/mixed; boundary="===============3787184069599086636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-calver: upgrading to 2025.10.20 SUCCEEDED
Message-ID: <0101019a564e94d4-f18af70b-f9a0-485a-a889-aa11d3ef10d6-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225821

--===============3787184069599086636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-calver* to *2025.10.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-calver-upgrade-2025.04.17-2025.10.20.patch
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
From 8957747e9d9ddc342fd5dabf111c50aa3da2f01a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:42:06 +0000
Subject: [PATCH] python3-calver: upgrade 2025.04.17 -> 2025.10.20

---
 ...ython3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.17.bb
rename to meta/recipes-devtools/python/python3-calver_2025.10.20.bb
index 85ad18701c..0aa468e05a 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
+SRCREV = "36c6977d6e2d9b9912c2afb83b4e36bb1289dbdd"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============3787184069599086636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed

--===============3787184069599086636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-calver: SRC_URI changed from "git://github.com/di/calver;branch=master;protocol=https;tag=2025.04.17" to "git://github.com/di/calver;branch=master;protocol=https;tag=2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dbg: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dbg: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dev: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dev: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-doc: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-doc: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-locale: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-locale: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 2955 to 2987 (+1%)
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-src: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-src: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-staticdev: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-staticdev: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PKGSIZE changed from 18417 to 18418 (+0%)
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PV changed from "2025.04.17" to "2025.10.20"
Changes to packages/x86-64-v3-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed

--===============3787184069599086636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-calver-upgrade-2025.04.17-2025.10.20.patch"

RnJvbSA4OTU3NzQ3ZTlkOWRkYzM0MmZkNWRhYmYxMTFjNTBhYTNkYTJmMDFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjo0MjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2FsdmVyOiB1cGdyYWRlIDIwMjUuMDQuMTcgLT4gMjAyNS4xMC4yMAoKLS0tCiAuLi55
dGhvbjMtY2FsdmVyXzIwMjUuMDQuMTcuYmIgPT4gcHl0aG9uMy1jYWx2ZXJfMjAyNS4xMC4yMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNhbHZlcl8yMDI1
LjA0LjE3LmJiID0+IHB5dGhvbjMtY2FsdmVyXzIwMjUuMTAuMjAuYmJ9ICg4OSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjA0
LjE3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1
LjEwLjIwLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wNC4xNy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjEwLjIwLmJiCmlu
ZGV4IDg1YWQxODcwMWMuLjBhYTQ2OGUwNWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4wNC4xNy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjUuMTAuMjAuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vZGkvY2FsdmVyO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0
cHM7dGFnPSR7UFZ9IgotU1JDUkVWID0gIjNiNzRiZGNlMzVmMjgxNGViMmI2NWRiMzlhMTMzZDVj
ODQ5ZGRlYTciCitTUkNSRVYgPSAiMzZjNjk3N2Q2ZTJkOWI5OTEyYzJhZmI4M2I0ZTM2YmIxMjg5
ZGJkZCIKIAogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhv
bi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============3787184069599086636==--

