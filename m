Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87AC021B7
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.42723.1738416054165155538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P/W62BhX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GsE1uYEZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194c1abdcb8-e6a18d2a-141b-466b-86be-91e24ec88f85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ubNIu9t87xodZP5VB34VDl/FB84ZsRg+6Wv6DHAzrLk=;
	b=P/W62BhXIwcJYwForJhRwfjU3q8uTkHwoNCLv82HEtsIyowf7rLrAABTQM/9fv5R
	9iECl1GG/xh9c4Jag+O9KcXHEA9hMh0TbYJQS+ucAtCFxfnJE5qW7kZlc4GCI+9oDzM
	0kE8IvCmytI3GXxZQTNaYaosoym39hbidoQmLA0s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ubNIu9t87xodZP5VB34VDl/FB84ZsRg+6Wv6DHAzrLk=;
	b=GsE1uYEZrGiXPlMkHb2hIbonkYqqD57CVZEy2umK8DVPB8pSKhcHoySL/JaJoWob
	CyuzToTjn1SJW6Z1VPFcyY9V1Bsk1kOtX7K3bqMhqnbqkvR5J74/xd8rzXXeb1nk32C
	tYR8p48GTY2rBUqX1OLXDbq25dHR2cPAp9dsGcVI=
Content-Type: multipart/mixed; boundary="===============8809695058832217527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.19.1 SUCCEEDED
Message-ID: <01010194c1abdcb8-e6a18d2a-141b-466b-86be-91e24ec88f85-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210538

--===============8809695058832217527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygments* to *2.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.19.0-2.19.1.patch
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
From 4a66d7ac730e1b8a8b79bfb3bc422188bfac50e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:20:04 +0000
Subject: [PATCH] python3-pygments: upgrade 2.19.0 -> 2.19.1

---
 .../{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.19.1.bb
index f1bc845662..de24ed3f11 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "afc4146269910d4bdfabcd27c24923137a74d562a23a320a41a55ad303e19783"
+SRC_URI[sha256sum] = "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
 
 inherit pypi
 
-- 
2.44.1


--===============8809695058832217527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pygments: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.0.tar.gz;downloadfilename=pygments-2.19.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.1.tar.gz;downloadfilename=pygments-2.19.1.tar.gz"
packages/core2-64-poky-linux/python3-pygments: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 8295992 to 8296049 (+0%)
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.13/site-packages/pygments-2.19.0.dist-info moved to /usr/lib/python3.13/site-packages/pygments-2.19.1.dist-info

--===============8809695058832217527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.13/site-packages/pygments-2.19.0.dist-info moved to /usr/lib/python3.13/site-packages/pygments-2.19.1.dist-info

--===============8809695058832217527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.19.0-2.19.1.patch"

RnJvbSA0YTY2ZDdhYzczMGUxYjhhOGI3OWJmYjNiYzQyMjE4OGJmYWM1MGU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODoyMDowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnbWVudHM6IHVwZ3JhZGUgMi4xOS4wIC0+IDIuMTkuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlnbWVudHNfMi4xOS4wLmJiID0+IHB5dGhvbjMtcHlnbWVudHNfMi4xOS4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Z21lbnRzXzIuMTkuMC5i
YiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTkuMS5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4xOS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTkuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnbWVudHNfMi4xOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4xOS4xLmJiCmluZGV4IGYxYmM4NDU2NjIuLmRl
MjRlZDNmMTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWdtZW50c18yLjE5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5Z21lbnRzXzIuMTkuMS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJCU0Qt
Mi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNmExM2M5
MDUxNGUyODk5ZjFlYmE3ZjQxYzNlZTU5MiIKIAogaW5oZXJpdCBweXRob25faGF0Y2hsaW5nCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYWZjNDE0NjI2OTkxMGQ0YmRmYWJjZDI3YzI0OTIzMTM3YTc0
ZDU2MmEyM2EzMjBhNDFhNTVhZDMwM2UxOTc4MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MWMx
NmQyYTg1NzZkYzA2NDlkOWYzOWUwODliNWYwMmJjZDI3ZmJhMTBkOGZiNGRjYzI4MTczZjdhNDUx
NTFmIgogCiBpbmhlcml0IHB5cGkKIAotLSAKMi40NC4xCgo=

--===============8809695058832217527==--

