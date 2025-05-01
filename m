Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5ADC3ABC7
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1805.1746113613072496211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dt+k77h4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tlCPh5yL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7b634e-460edb11-303d-4e28-b146-af811070c69e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OC3JYIuLp1U52EmPAeLg4hAoLb2sTq/31AiMztC9g10=;
	b=Dt+k77h49d0r75exbyJORh9M4+nGqw049V4F8GRk7256C6C+3LX7pvfZYmaGG44R
	DeGL0d1vjwi+0SherBls5nosT7jwiL16WE5QmobJoGuqxTwCLB7tRrOat6RbvzS+sEn
	bIk+pXi1sn6e97Va4ftRywNgrPi8AwzxGI5mF+IA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OC3JYIuLp1U52EmPAeLg4hAoLb2sTq/31AiMztC9g10=;
	b=tlCPh5yLptYQUE2YpELmaCygdkC12PO7977UW1Y5ogh7Rcz7M0BtvK2tJJmsQvzP
	fGXenAYUuqcYVR9lDktYIqw8Xm1z/qbQML9ESMyZkq2osrvccHCDRy+U8zDuAY/jvid
	OmtZFvRcFzNqpshomjH8PrKQcvLmB3b8U9wNJw7E=
Content-Type: multipart/mixed; boundary="===============0032998255755700403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 5.4.0 SUCCEEDED
Message-ID: <010101968c7b634e-460edb11-303d-4e28-b146-af811070c69e-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215815

--===============0032998255755700403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *5.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-5.3.2-5.4.0.patch
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
From ed61e43fe171ee3107728bffc74c31febaa2257e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:58:52 +0000
Subject: [PATCH] python3-lxml: upgrade 5.3.2 -> 5.4.0

---
 .../python/{python3-lxml_5.3.2.bb => python3-lxml_5.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.3.2.bb => python3-lxml_5.4.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.2.bb b/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.3.2.bb
rename to meta/recipes-devtools/python/python3-lxml_5.4.0.bb
index cc0d4ecd25..126fbe99b4 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "773947d0ed809ddad824b7b14467e1a481b8976e87278ac4a730c2f7c7fcddc1"
+SRC_URI[sha256sum] = "d12832e1dbea4be280b22fd0ea7c9b87f0d8fc51ba06e92dc62d52f804f78ebd"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============0032998255755700403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.2.tar.gz;downloadfilename=lxml-5.3.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.2.tar.gz;downloadfilename=lxml-5.3.2.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.4.0.tar.gz;downloadfilename=lxml-5.4.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.4.0.tar.gz;downloadfilename=lxml-5.4.0.tar.gz"
packages/core2-64-poky-linux/python3-lxml: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "5.3.2" to "5.4.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5256673 to 5256603 (-0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGV changed from 5.3.2 [default] to 5.4.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PV changed from "5.3.2" to "5.4.0"
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.3.2.dist-info moved to /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info

--===============0032998255755700403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.3.2.dist-info moved to /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info

--===============0032998255755700403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-5.3.2-5.4.0.patch"

RnJvbSBlZDYxZTQzZmUxNzFlZTMxMDc3MjhiZmZjNzRjMzFmZWJhYTIyNTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODo1ODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA1LjMuMiAtPiA1LjQuMAoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNS4zLjIuYmIgPT4gcHl0aG9uMy1seG1sXzUuNC4wLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNS4zLjIuYmIgPT4gcHl0aG9u
My1seG1sXzUuNC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzUuMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNS4zLjIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuNC4wLmJi
CmluZGV4IGNjMGQ0ZWNkMjUuLjEyNmZiZTk5YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuMy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuNC4wLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI3NzM5NDdkMGVkODA5ZGRhZDgyNGI3YjE0NDY3ZTFhNDgxYjg5
NzZlODcyNzhhYzRhNzMwYzJmN2M3ZmNkZGMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQxMjgz
MmUxZGJlYTRiZTI4MGIyMmZkMGVhN2M5Yjg3ZjBkOGZjNTFiYTA2ZTkyZGM2MmQ1MmY4MDRmNzhl
YmQiCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuNDcuMQoK

--===============0032998255755700403==--

