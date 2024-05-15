Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAF0C3065E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1249.1715794338266273834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Z+OT3wx5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XPuQOyXf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fdf51-44e634d8-ed3a-4c78-92a1-1989985f5511-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GLCCuEpQGrA962EKYjrZ55rPJfyp3x8HB78Obho4WAE=;
	b=Z+OT3wx5z+0LoQ7rSYjnjVz7qeil8Wy6N0pNgwLuzcDfMTFyUlxezJ33vcho8XYD
	IsQ+kLj50L6h3Iy4VM1kbBa5AYFevpqLkTxE0mCbcPq7BB4UkUhtpLv+sNp4h8SIGyO
	SsYPs8Wd5BTlf+rLYkAYsYXDDcSFQCfQhEqxWeUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GLCCuEpQGrA962EKYjrZ55rPJfyp3x8HB78Obho4WAE=;
	b=XPuQOyXfz6XNt81Wbc30p/N99j0iR0GpXk7aN87LYwJVGrbA9n5laaMyd/xnPSwB
	C+DWfmUeZapiZ+CR9ooudCWKE5Rg6e2LPJmh0xommpgWw3flSUBUtydjr9qiIXJD8Fr
	Awqe0OkD2A5zrxzw+XCINj+6Ra0A11gzS/l5UyqI=
Content-Type: multipart/mixed; boundary="===============6711593200632415727=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 5.2.2 SUCCEEDED
Message-ID: <0101018f7d4fdf51-44e634d8-ed3a-4c78-92a1-1989985f5511-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199333

--===============6711593200632415727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-lxml* to *5.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-5.2.1-5.2.2.patch
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
From dc4b308bdf19b5fe78a944097351ccaf9c8e7098 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:51:02 +0000
Subject: [PATCH] python3-lxml: upgrade 5.2.1 -> 5.2.2

---
 .../python/{python3-lxml_5.2.1.bb => python3-lxml_5.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.2.1.bb => python3-lxml_5.2.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.2.1.bb b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.2.1.bb
rename to meta/recipes-devtools/python/python3-lxml_5.2.2.bb
index 44a10505f3..e5a22e7090 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.2.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "3f7765e69bbce0906a7c74d5fe46d2c7a7596147318dbc08e4a2431f3060e306"
+SRC_URI[sha256sum] = "bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.44.0


--===============6711593200632415727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-lxml: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.1.tar.gz;downloadfilename=lxml-5.2.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.1.tar.gz;downloadfilename=lxml-5.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.2.tar.gz;downloadfilename=lxml-5.2.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.2.tar.gz;downloadfilename=lxml-5.2.2.tar.gz"
packages/core2-64-poky-linux/python3-lxml: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 17343496 to 17345072 (+0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 18493597 to 18497924 (+0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PV changed from "5.2.1" to "5.2.2"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5001287 to 5001953 (+0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.12/site-packages/lxml-5.2.1.dist-info moved to /usr/lib/python3.12/site-packages/lxml-5.2.2.dist-info

--===============6711593200632415727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.12/site-packages/lxml-5.2.1.dist-info moved to /usr/lib/python3.12/site-packages/lxml-5.2.2.dist-info

--===============6711593200632415727==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-5.2.1-5.2.2.patch"

RnJvbSBkYzRiMzA4YmRmMTliNWZlNzhhOTQ0MDk3MzUxY2NhZjljOGU3MDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6NTE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNS4yLjEgLT4gNS4yLjIKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzUuMi4xLmJiID0+IHB5dGhvbjMtbHhtbF81LjIuMi5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzUuMi4xLmJiID0+IHB5dGhv
bjMtbHhtbF81LjIuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzUuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuMi4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMi5i
YgppbmRleCA0NGExMDUwNWYzLi5lNWEyMmU3MDkwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMi5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Y3NzY1ZTY5YmJjZTA5MDZhN2M3NGQ1ZmU0NmQyYzdhNzU5
NjE0NzMxOGRiYzA4ZTRhMjQzMWYzMDYwZTMwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjJk
YzQ4OTgxODBiZWE3OTg2M2Q1NDg3ZTVmOWM3YzM0Mjk3NDE0YmFkNTRiY2QwZjA4NTJhZWU5Y2Zk
Yjg3IgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjQ0LjAKCg==

--===============6711593200632415727==--

