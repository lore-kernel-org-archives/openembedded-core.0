Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA57C83F2F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1420.1751386805057472888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Oh1Ps059;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CjMtZEeN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6ca0020-7460ed11-5570-4ced-a8ab-25b09efbba2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hq8TI+jIGk3OMnIeStK4P+Usr94qMYdrTVp/6krRweo=;
	b=Oh1Ps059rxEHWkT2ffkmS6zdAUKzcgDVOyJoCoyWHinW9CA6U5vWIgj3WnPjLSO4
	PtKnuThbjNyS+ZR7M6H07DqJjLXciCJoY1Sq5I4crek6nmpyyBfu3EGiphu+Gxka6o8
	DbVE3f1EUfmj2uIQK4ksBXV2CWmxYca3yJWJCVWc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hq8TI+jIGk3OMnIeStK4P+Usr94qMYdrTVp/6krRweo=;
	b=CjMtZEeNjlFb5TD5lKI4gpdhY2f2E0y4cPkFfbCxrMaRlGDGz6kNVgifjJ9oWpjQ
	ljF4aJuLcGGJIJ+8KHjcXTRcaFbksPiDY7A0ieqiCfi9ZOq02qE+HzSXzRc5Q0E9bHq
	jphI0nhXl2S0TGhqItuiC27WsuEhdPHHrC8IETiI=
Content-Type: multipart/mixed; boundary="===============0029577608257613413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.5.0 SUCCEEDED
Message-ID: <01010197c6ca0020-7460ed11-5570-4ced-a8ab-25b09efbba2b-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219644

--===============0029577608257613413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.4.0-2.5.0.patch
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
From 96214e4954d1b7463f74120cfc9eebbb743a156f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:07:14 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.4.0 -> 2.5.0

---
 .../{python3-urllib3_2.4.0.bb => python3-urllib3_2.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.4.0.bb => python3-urllib3_2.5.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index 7a4bffc05e..a4f3995730 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
+SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============0029577608257613413==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.4.0-2.5.0.patch"

RnJvbSA5NjIxNGU0OTU0ZDFiNzQ2M2Y3NDEyMGNmYzllZWJiYjc0M2ExNTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDowNzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAyLjQuMCAtPiAyLjUuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
dXJsbGliM18yLjQuMC5iYiA9PiBweXRob24zLXVybGxpYjNfMi41LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXVybGxpYjNfMi40LjAuYmIgPT4g
cHl0aG9uMy11cmxsaWIzXzIuNS4wLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi41LjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
bGxpYjNfMi40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11cmxsaWIzXzIuNS4wLmJiCmluZGV4IDdhNGJmZmMwNWUuLmE0ZjM5OTU3MzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNC4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIu
NS4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdXJs
bGliMy91cmxsaWIzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9NTJkMjczYTMwNTRjZWQ1NjEyNzVkNGQxNTI2MGVjZGEiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI0MTRiYzY1MzViNzg3ZmViZDc1Njc4MDRjYzAxNWZlZTM5ZGFh
YjhhZDg2MjY4ZjEzMTBhOTI1MDY5N2RlNDY2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNmYzQ3
NzMzYzdlNDE5ZDRiYzNmNmIzZGMyYjRmODkwYmI3NDM5MDZhMzBkNTZiYTRhNWJmYTRiYmZmOTI3
NjAiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcuMQoK

--===============0029577608257613413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info

--===============0029577608257613413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-urllib3: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.4.0.tar.gz;downloadfilename=urllib3-2.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.5.0.tar.gz;downloadfilename=urllib3-2.5.0.tar.gz"
packages/core2-64-poky-linux/python3-urllib3: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.4.0" to "2.5.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 867524 to 878241 (+1%)
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.4.0" to "2.5.0"
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info

--===============0029577608257613413==--

