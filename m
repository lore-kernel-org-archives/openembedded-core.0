Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D905C021B9
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8096.1739623335941482662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JoXVV3+r;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0neF9oRG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a19019-b6fa3c1e-fd78-4ae0-b2a3-0b2f9d32015e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kvC0d5J24WrmylJXwGvTaW2yaCj5h4cSGAosmkm3Ojc=;
	b=JoXVV3+r9y4R9vvgxqZRxfS/w2c7yVWXXN12+GuCzNsLEMmTAM/H8pZXq3aC+CnT
	bKZc1yuczcv1/6wZII9b6o+K3PmbMTVlsTxqoyvhFGuTV2Gf9Gj5dvrNMa2D1Pti06+
	7U6ivE6EuE4EKUr+ZXbV1/kIK5rk3m+zIOvrKleg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kvC0d5J24WrmylJXwGvTaW2yaCj5h4cSGAosmkm3Ojc=;
	b=0neF9oRGaWq5j/XgPjIVT2NbbKPz8A3g4kPqZAOSBxMIKJLuwANtfo53XUIir15Z
	176RucsVQhhyyaYNpS0ECdo5RoM1vgOrzAsbv/xfNaOsmgRJlZazVrhbqVQecIxHjVi
	gJqlExxxVrucA/GbxZm2Hii4ZWb6e2KcsmcCAAuI=
Content-Type: multipart/mixed; boundary="===============7757171358800875403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 5.3.1 SUCCEEDED
Message-ID: <0101019509a19019-b6fa3c1e-fd78-4ae0-b2a3-0b2f9d32015e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211426

--===============7757171358800875403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *5.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-5.3.0-5.3.1.patch
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
From 2ac7596471e06016e4f9fa98b5f2ccfe1ee8072c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:52:39 +0000
Subject: [PATCH] python3-lxml: upgrade 5.3.0 -> 5.3.1

---
 .../python/{python3-lxml_5.3.0.bb => python3-lxml_5.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.3.0.bb => python3-lxml_5.3.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb b/meta/recipes-devtools/python/python3-lxml_5.3.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.3.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.3.1.bb
index 4c9c22e5c4..8a3ec862f7 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
+SRC_URI[sha256sum] = "106b7b5d2977b339f1e97efe2778e2ab20e99994cbb0ec5e55771ed0795920c8"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.44.1


--===============7757171358800875403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-lxml: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz;downloadfilename=lxml-5.3.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz;downloadfilename=lxml-5.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.1.tar.gz;downloadfilename=lxml-5.3.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.1.tar.gz;downloadfilename=lxml-5.3.1.tar.gz"
packages/core2-64-poky-linux/python3-lxml: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 17889480 to 17885504 (-0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 18479026 to 18479477 (+0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PV changed from "5.3.0" to "5.3.1"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5257020 to 5256819 (-0%)
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.3.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-5.3.1.dist-info

--===============7757171358800875403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-5.3.0-5.3.1.patch"

RnJvbSAyYWM3NTk2NDcxZTA2MDE2ZTRmOWZhOThiNWYyY2NmZTFlZTgwNzJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6NTI6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNS4zLjAgLT4gNS4zLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzUuMy4wLmJiID0+IHB5dGhvbjMtbHhtbF81LjMuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzUuMy4wLmJiID0+IHB5dGhv
bjMtbHhtbF81LjMuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzUuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuMy4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMS5i
YgppbmRleCA0YzljMjJlNWM0Li44YTNlYzg2MmY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMS5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGUxMDljYTMwZDFlZGVjMWFjNjBjZGJlMzQxOTA1ZGMzYjhm
NTViMTY4NTVlMDNhNTRhYWY1OWU1MWVjOGM2ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDZi
N2I1ZDI5NzdiMzM5ZjFlOTdlZmUyNzc4ZTJhYjIwZTk5OTk0Y2JiMGVjNWU1NTc3MWVkMDc5NTky
MGM4IgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjQ0LjEKCg==

--===============7757171358800875403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.3.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-5.3.1.dist-info

--===============7757171358800875403==--

