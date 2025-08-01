Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B34FCA0EE7
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.88811.1754057271284911783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jxep3P4j;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CkDnlBLy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5e5da-17978269-8df0-4758-9b68-6b9f5f16c232-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xi6a4yeGBvWn2369Dw11hqKyyVyMI5QLni8R5SwR8aA=;
	b=jxep3P4jA70fSzO556WIiygd+0XuGWaQltm/PjJBu0N6fZj+T6DYzTFnP0mphWng
	8Rx/1X4/naB3S8orwJA+k4sZGEz85RibTnnmDRRjrJ06FaB/csLIodY3AgT9yUYme/W
	pUk1HnCLNq0DgfXRKWgVyd0SC45pSB+yb3uOkzfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xi6a4yeGBvWn2369Dw11hqKyyVyMI5QLni8R5SwR8aA=;
	b=CkDnlBLyj/ggk6P/tu55wUe92VPbdMz5cvReZkA7EJlUtRJvxeivLXqxsE8mPTUr
	ONhpagHn1Y9SCZiRptbkCMPcxjKXJwQT8xIZdR/5Es5z+iCXx4IdOfMGLorK+o1CcnS
	NnMrMIVw+FeU3PIdfPY3kFklIoxEC3PqP6TTZrJc=
Content-Type: multipart/mixed; boundary="===============6362075646507067188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.7.14 SUCCEEDED
Message-ID: <0101019865f5e5da-17978269-8df0-4758-9b68-6b9f5f16c232-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221273

--===============6362075646507067188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.7.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.7.9-2025.7.14.patch
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
From 7fd8508e5ddbfa99a8a5615acd49d910e77cf153 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:16:44 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.7.9 -> 2025.7.14

---
 ...python3-certifi_2025.7.9.bb => python3-certifi_2025.7.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.7.9.bb => python3-certifi_2025.7.14.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb b/meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
index 709346486a..d223b8694c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079"
+SRC_URI[sha256sum] = "8ea99dbdfaaf2ba2f9bac77b9249ef62ec5218e7c2b2e903378ed5fccf765995"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============6362075646507067188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.7.9.tar.gz;downloadfilename=certifi-2025.7.9.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.7.14.tar.gz;downloadfilename=certifi-2025.7.14.tar.gz"
packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 293915 to 300202 (+2%)
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.7.9" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.7.9 [default] to 2025.7.14 [default]
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/WHEEL was removed

--===============6362075646507067188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.7.9-2025.7.14.patch"

RnJvbSA3ZmQ4NTA4ZTVkZGJmYTk5YThhNTYxNWFjZDQ5ZDkxMGU3N2NmMTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToxNjo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDI1LjcuOSAtPiAyMDI1LjcuMTQKCi0tLQogLi4ucHl0
aG9uMy1jZXJ0aWZpXzIwMjUuNy45LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjcuMTQuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZXJ0aWZpXzIwMjUu
Ny45LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjcuMTQuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS43Ljku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1Ljcu
MTQuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS43LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNy4xNC5iYgppbmRleCA3
MDkzNDY0ODZhLi5kMjIzYjg2OTRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjcuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjcuMTQuYmIKQEAgLTcsNyArNyw3IEBA
IEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3OTI4NmIx
MjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzFkMmVjMDUzOTUxNDhlZTEwY2Y2
NzJmZmMyOGNkMzdlYTBhYjBkOTlmOWNjNzRjNDNlNTg4Y2JkMTExYjA3OSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI4ZWE5OWRiZGZhYWYyYmEyZjliYWM3N2I5MjQ5ZWY2MmVjNTIxOGU3YzJiMmU5
MDMzNzhlZDVmY2NmNzY1OTk1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVp
bGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============6362075646507067188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.7.9.dist-info/WHEEL was removed

--===============6362075646507067188==--

