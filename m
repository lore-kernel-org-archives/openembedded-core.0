Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18C4C27C79
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5945.1689456454938029247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B7XC27fN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73aab8-9e0b2157-83e9-44ef-bb84-855716aea92d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=13WS4zdE+T8y22FqmnAm1mPQs8SFUjgVujOWmVsLldk=;
	b=B7XC27fNZXnn05l8VYmwXPtyyIefHyYIr0t/ggBBzK4jMk8kHgGzeE1H/uKthz7Z
	X1ZWh7ipxwCytdrTNYuZEW0TmiQtO5zJL0D9+VRx5eMlD3SK4Yk6rTKdvfKyz1aNkJH
	nB/rbKPdS9Fj0LusgE6sqZzQR8c3Mq1MbkVut0do=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=13WS4zdE+T8y22FqmnAm1mPQs8SFUjgVujOWmVsLldk=;
	b=PkcVa6j9HR9iswEAMIN/3A23WkmiZ7xXY0ueuncky012WW/wrOxY6Rrjd7UpV3uw
	p5O4x21V38QauDftSVSs+1UV2TK9AEtjqaZPnFX1+0tQC5vcFGgGbG1sZmJqGJ4pvnN
	yTG1TakyDhyGKcOSwCkMROgXnScScCyxIQwYM4So=
Content-Type: multipart/mixed; boundary="===============5285069709119686813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 4.9.3 SUCCEEDED
Message-ID: <010101895b73aab8-9e0b2157-83e9-44ef-bb84-855716aea92d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184346

--===============5285069709119686813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-lxml* to *4.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-4.9.2-4.9.3.patch
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
From 8985719741245472d87e4f9dcd147404fe2a577d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:45:54 +0000
Subject: [PATCH] python3-lxml: upgrade 4.9.2 -> 4.9.3

---
 .../python/{python3-lxml_4.9.2.bb => python3-lxml_4.9.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_4.9.2.bb => python3-lxml_4.9.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.2.bb b/meta/recipes-devtools/python/python3-lxml_4.9.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_4.9.2.bb
rename to meta/recipes-devtools/python/python3-lxml_4.9.3.bb
index c7f1e1fc3c..b911f7b2ad 100644
--- a/meta/recipes-devtools/python/python3-lxml_4.9.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_4.9.3.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67"
+SRC_URI[sha256sum] = "48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.39.2


--===============5285069709119686813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-lxml: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz;downloadfilename=lxml-4.9.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz;downloadfilename=lxml-4.9.2.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.3.tar.gz;downloadfilename=lxml-4.9.3.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.3.tar.gz;downloadfilename=lxml-4.9.3.tar.gz"
packages/core2-32-poky-linux/python3-lxml: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 12884724 to 12877712 (-0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 16769767 to 16783601 (+0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "4.9.2" to "4.9.3"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5098986 to 5099872 (+0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGV changed from 4.9.2 [default] to 4.9.3 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PV changed from "4.9.2" to "4.9.3"
Changes to packages/core2-32-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info moved to /usr/lib/python3.11/site-packages/lxml-4.9.3.dist-info

--===============5285069709119686813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info moved to /usr/lib/python3.11/site-packages/lxml-4.9.3.dist-info

--===============5285069709119686813==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-4.9.2-4.9.3.patch"

RnJvbSA4OTg1NzE5NzQxMjQ1NDcyZDg3ZTRmOWRjZDE0NzQwNGZlMmE1NzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6NDU6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNC45LjIgLT4gNC45LjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzQuOS4yLmJiID0+IHB5dGhvbjMtbHhtbF80LjkuMy5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzQuOS4yLmJiID0+IHB5dGhv
bjMtbHhtbF80LjkuMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzQuOS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMy5i
YgppbmRleCBjN2YxZTFmYzNjLi5iOTExZjdiMmFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMy5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMjQ1NWNmYWViN2FjNzAzMzhiMzI1N2Y0MWUyMWYwNzI0ZjRi
NWIwYzBlNzcwMmRhNjdlZTZjMzY0MDgzNWI2NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ODYy
OGJkNTNhNDI2YzllYjliYzA2NmE5MjNhY2FhMDg3OGQxZTg2MTI5ZmQ1MzU5YWVlOTkyODVmNGVl
ZDljIgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjM5LjIKCg==

--===============5285069709119686813==--

