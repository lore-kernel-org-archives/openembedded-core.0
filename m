Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6115CAC584
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.89798.1756850189834494852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Plzj5zMP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=K96zZhsi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6e739f-edb4e27d-90fb-473d-94d5-a627568e68e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5vYmH4+pT2LarGxRk0fN8zQY0ZPTRgyIDvFxQ0bjLjs=;
	b=Plzj5zMPjgENvgCPA7Mxr50mT6vE766uOiuFfxhVGGeCuHCMMoUOH9fGkvLH8vno
	IaaOP0oOjgKlSn7BAsH2n4nkEpAfMZdV+JRjqe7oscCCVCHv/GqKbsY3D28AKrZlgrR
	EdKizDPPXp81PhsXYfyXSMo4nd9sEmbZ4fiQYCMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850189;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5vYmH4+pT2LarGxRk0fN8zQY0ZPTRgyIDvFxQ0bjLjs=;
	b=K96zZhsippU2oyPhkMI0CRgRuD9y5r+JycTYvlN+9HqF2ZLMX8hI4SblMKLvcFMJ
	ikNLbHyQUcz2MXRcmK7rJa8lVNaFMECPdXn3m7Xk0S7sEwZywqFjlDO8MfAFUj17MY5
	EbGcxN+oSV/E1E/XtRnc8tI5RAlS6l706EYTK4i0=
Content-Type: multipart/mixed; boundary="===============3576253151395662320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.0.1 SUCCEEDED
Message-ID: <010101990c6e739f-edb4e27d-90fb-473d-94d5-a627568e68e7-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222775

--===============3576253151395662320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-6.0.0-6.0.1.patch
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
From ead11374d1c05ea6edfb59fb8581cc653114249a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:01:45 +0000
Subject: [PATCH] python3-lxml: upgrade 6.0.0 -> 6.0.1

---
 .../python/{python3-lxml_6.0.0.bb => python3-lxml_6.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.0.bb => python3-lxml_6.0.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.0.bb b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.1.bb
index 56f5664c9b..5d76641675 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "032e65120339d44cdc3efc326c9f660f5f7205f3a535c1fdbf898b29ea01fb72"
+SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============3576253151395662320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-6.0.0-6.0.1.patch"

RnJvbSBlYWQxMTM3NGQxYzA1ZWE2ZWRmYjU5ZmI4NTgxY2M2NTMxMTQyNDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODowMTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA2LjAuMCAtPiA2LjAuMQoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNi4wLjAuYmIgPT4gcHl0aG9uMy1seG1sXzYuMC4xLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNi4wLjAuYmIgPT4gcHl0aG9u
My1seG1sXzYuMC4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNi4wLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNi4wLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4xLmJi
CmluZGV4IDU2ZjU2NjRjOWIuLjVkNzY2NDE2NzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4xLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwMzJlNjUxMjAzMzlkNDRjZGMzZWZjMzI2YzlmNjYwZjVmNzIw
NWYzYTUzNWMxZmRiZjg5OGIyOWVhMDFmYjcyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiM2E4
ODJlYmYyN2RkMDI2ZGYzODAxYTg3Y2Y0OWZmNzkxMzM2ZTBmOTRiMGZhZDE5NWRiNzdlMDEyNDA2
OTAiCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuNDcuMQoK

--===============3576253151395662320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.0.tar.gz;downloadfilename=lxml-6.0.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.0.tar.gz;downloadfilename=lxml-6.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.1.tar.gz;downloadfilename=lxml-6.0.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.1.tar.gz;downloadfilename=lxml-6.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-lxml: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 21513832 to 21479456 (-0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 21120119 to 21128465 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "6.0.0" to "6.0.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5983894 to 5977656 (-0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGV changed from 6.0.0 [default] to 6.0.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PV changed from "6.0.0" to "6.0.1"
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.1.dist-info

--===============3576253151395662320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.1.dist-info

--===============3576253151395662320==--

