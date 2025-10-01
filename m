Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16AACCD183
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18065.1759325532292667273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n1Mg0pCH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jzuF5QkG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff94b35-6fc8d12e-0fe1-4990-abc2-711073090105-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pGkT0wJWqE03z/s1fp1aualKRF1BUvK9M84nvPoEIY8=;
	b=n1Mg0pCHCXtW6osa9kgXweB01Awkofk6eb4Z+7+ONz9jVPKSikeVszfeOC1ngbkS
	NU/AXPDoqVAfmQuDe7GBWe46FPCh89MHJu+xhe/gAVqgxP3Fl99f9PYjU4PnWNwK6kr
	pZtwLJf/2GxfaWsimSm+BbYabNqqUvEjA1l1qeTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325539;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pGkT0wJWqE03z/s1fp1aualKRF1BUvK9M84nvPoEIY8=;
	b=jzuF5QkGE9MXEE+Imze1NV7NPJ9t/gss8+Inxysd8ZCbv2EVux20eiiXJJFVILP9
	dxJcgEIPuQrt2hgLj6Bk3+rMm0jr+bzFyS5i1R8q5/q4hO7ce5ziCJw5VfWQVNMOaJQ
	e7AhUmFp0rbIRRgsJtcoLvH+mJpl9aNzGQd30Rn8=
Content-Type: multipart/mixed; boundary="===============5375211239867412163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.0.2 SUCCEEDED
Message-ID: <010101999ff94b35-6fc8d12e-0fe1-4990-abc2-711073090105-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224237

--===============5375211239867412163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-6.0.1-6.0.2.patch
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
From 31f9392bbc3d31a6ed0226481fa844a1ffe70f8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:04:36 +0000
Subject: [PATCH] python3-lxml: upgrade 6.0.1 -> 6.0.2

---
 .../python/{python3-lxml_6.0.1.bb => python3-lxml_6.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.1.bb => python3-lxml_6.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.1.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.2.bb
index 5d76641675..876fda93b6 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690"
+SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============5375211239867412163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.1.tar.gz;downloadfilename=lxml-6.0.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.1.tar.gz;downloadfilename=lxml-6.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.2.tar.gz;downloadfilename=lxml-6.0.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.2.tar.gz;downloadfilename=lxml-6.0.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-lxml: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 21479456 to 21496904 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 21128465 to 21142569 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "6.0.1" to "6.0.2"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGV changed from 6.0.1 [default] to 6.0.2 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5977656 to 5980310 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PV changed from "6.0.1" to "6.0.2"
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-6.0.1.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.2.dist-info

--===============5375211239867412163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-6.0.1-6.0.2.patch"

RnJvbSAzMWY5MzkyYmJjM2QzMWE2ZWQwMjI2NDgxZmE4NDRhMWZmZTcwZjhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOTowNDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA2LjAuMSAtPiA2LjAuMgoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNi4wLjEuYmIgPT4gcHl0aG9uMy1seG1sXzYuMC4yLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNi4wLjEuYmIgPT4gcHl0aG9u
My1seG1sXzYuMC4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNi4wLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNi4wLjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4yLmJi
CmluZGV4IDVkNzY2NDE2NzUuLjg3NmZkYTkzYjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4yLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIyYjNhODgyZWJmMjdkZDAyNmRmMzgwMWE4N2NmNDlmZjc5MTMz
NmUwZjk0YjBmYWQxOTVkYjc3ZTAxMjQwNjkwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNkNzlm
MzM2N2JkNzRiMzE3ZGRhNjU1ZGM4ZmNmYTMwNGQ5ZWI2ZTRmYjA2YjcxNjhjNWNmMjdmOTZlMGNk
NjIiCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuNDcuMQoK

--===============5375211239867412163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-6.0.1.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.2.dist-info

--===============5375211239867412163==--

