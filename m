Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E142CD6E64
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1557.1780328132711460937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UR0zBD3X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aQaS9yi3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d386e8-8456d36f-c6a2-454f-b789-b1273605841e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KIdG43tJJv2QDnEGevHyVBVQn9jZbNuvsCilt2knjnQ=;
	b=UR0zBD3XtUwy0EBowhmHZy5Lx/AtwSm3jXYNkV1LMccYvBPwqtz9tFnUNb1ceEyu
	lyged0KcTCgmXrvDvOomRh74INeefEpLQRLc84pFlwSlmWV2A6EtHz6m3Nrbj/PYBTA
	J7jXZOzDqAhezOchc/f4Y1qrk2E6MBd0NbwU2rAc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KIdG43tJJv2QDnEGevHyVBVQn9jZbNuvsCilt2knjnQ=;
	b=aQaS9yi3KADBMLoC6BZ7jRp+AkuCoYlfX3yYibln8XXdA/MY4j8whvgidIeVyfJ8
	zx2D5LbfN4CW02O5fHQaizjKMe5bYoI1eOfNFjZ24QlrORU8UGylfC5Kd0ilDZlhNUB
	IIxtebpuvu0I6EZ855NcsLA2KhqYINnGFNP+Dbzg=
Content-Type: multipart/mixed; boundary="===============5179741864648226279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.1.1 SUCCEEDED
Message-ID: <0101019e83d386e8-8456d36f-c6a2-454f-b789-b1273605841e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237883

--===============5179741864648226279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-6.1.0-6.1.1.patch
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
From 8cd51ef7e29b7fd3a4cd4d432e926785614e1c02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:38:28 +0000
Subject: [PATCH] python3-lxml: upgrade 6.1.0 -> 6.1.1

---
 .../python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.1.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.1.bb
index b7bbf5c3d6..77386ebdd0 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
+SRC_URI[sha256sum] = "ba96ae44888e0185281e937633a743ea90d5a196c6000f82565ebb0580012d40"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============5179741864648226279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info

--===============5179741864648226279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-6.1.0-6.1.1.patch"

RnJvbSA4Y2Q1MWVmN2UyOWI3ZmQzYTRjZDRkNDMyZTkyNjc4NTYxNGUxYzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODozODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA2LjEuMCAtPiA2LjEuMQoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNi4xLjAuYmIgPT4gcHl0aG9uMy1seG1sXzYuMS4xLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNi4xLjAuYmIgPT4gcHl0aG9u
My1seG1sXzYuMS4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzYuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNi4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNi4xLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMS4xLmJi
CmluZGV4IGI3YmJmNWMzZDYuLjc3Mzg2ZWJkZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMS4xLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJiZmQ1N2Q4MDA4YzQ5NjU3MDlhOTE5YzNlOWE5OGY3NmMyYzdj
YjMxOTA4NmIzZDI2ODU4MjUwNjIwMDIzYjEzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhOTZh
ZTQ0ODg4ZTAxODUyODFlOTM3NjMzYTc0M2VhOTBkNWExOTZjNjAwMGY4MjU2NWViYjA1ODAwMTJk
NDAiCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuNDcuMQoK

--===============5179741864648226279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.0.tar.gz;downloadfilename=lxml-6.1.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.0.tar.gz;downloadfilename=lxml-6.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.1.tar.gz;downloadfilename=lxml-6.1.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.1.tar.gz;downloadfilename=lxml-6.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-lxml: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 21258062 to 21258102 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: FILELIST: directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml -> /usr/src/debug/python3-lxml/6.1.1/src/lxml, directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml/includes -> /usr/src/debug/python3-lxml/6.1.1/src/lxml/includes, directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml/html -> /usr/src/debug/python3-lxml/6.1.1/src/lxml/html
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5930862 to 5930523 (-0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info

--===============5179741864648226279==--

