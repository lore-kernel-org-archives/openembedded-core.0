Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C90F4212A
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19735.1776261873605934514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2KPvcqEr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kiNQaf0h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d9175495e-7a7db172-914e-4a40-90f8-35dad532ef84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5kdjoggiYQi8DnuPGqgP/0fBuySVbBJLqGRAshk1hwE=;
	b=2KPvcqErwWkAuD5eqQFCatoQQx31RSe+NvcWLBWq8qK3JhIPMMHXssYyyayldZ9O
	oPterQVJ8HCDfOyh9xigiaz3OY4s5ptzPvg98s8B0/WID73QqC5yavtXJmVDpNov8Ie
	m6/7yvTA4D8rUtcuowF1g1nyqTUnoJ8K/YZCKSc0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5kdjoggiYQi8DnuPGqgP/0fBuySVbBJLqGRAshk1hwE=;
	b=kiNQaf0hrSC66UZwTbaaHTidHCR5oJgyQmmyzQPPpAgal3zCUdkWFcD8m2ssJtTQ
	fvBSkC1E1QBmRCF4hbT2QkFardpVIMXTxCtbd3f5chBuFefVb1++QY2ZcQlFz37ayNA
	OZrKIkqD8pNkSHSY4RYD9GMRn+9ocSBuekV8f3zQ=
Content-Type: multipart/mixed; boundary="===============7059555580888221196=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.3.2 SUCCEEDED
Message-ID: <0101019d9175495e-7a7db172-914e-4a40-90f8-35dad532ef84-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235223

--===============7059555580888221196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.3.1-8.3.2.patch
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
From ca7f5fff43306daa642285eecaf9c48c86c55407 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:27:50 +0000
Subject: [PATCH] python3-click: upgrade 8.3.1 -> 8.3.2

---
 .../python/{python3-click_8.3.1.bb => python3-click_8.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.1.bb
rename to meta/recipes-devtools/python/python3-click_8.3.2.bb
index 1f42fe1a50..a7d15996d0 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
+SRC_URI[sha256sum] = "14162b8b3b3550a7d479eafa77dfd3c38d9dc8951f6f69c78913a8f9a7540fd5"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============7059555580888221196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/exceptions.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/complex.rst", added "/usr/lib/python3-click/ptest/docs/complex.md /usr/lib/python3-click/ptest/docs/entry-points.md /usr/lib/python3-click/ptest/docs/upgrade-guides.md /usr/lib/python3-click/ptest/tests/test_stream_lifecycle.py /usr/lib/python3-click/ptest/docs/exceptions.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.3.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.3.2.dist-info

--===============7059555580888221196==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.3.1-8.3.2.patch"

RnJvbSBjYTdmNWZmZjQzMzA2ZGFhNjQyMjg1ZWVjYWY5YzQ4Yzg2YzU1NDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6Mjc6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMy4xIC0+IDguMy4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4zLjEuYmIgPT4gcHl0aG9uMy1jbGlja184LjMuMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4zLjEuYmIgPT4gcHl0
aG9uMy1jbGlja184LjMuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC4zLjIuYmIKaW5kZXggMWY0MmZlMWE1MC4uYTdkMTU5OTZkMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMi5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjEyZmY0Nzg1ZDMzN2ExYmI0OTBiYjdlOWMyYjFlZTVkYTMxMTJlOTRhODYyMmYyNmE2Yzc3ZjVk
MmZjNjg0MmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTQxNjJiOGIzYjM1NTBhN2Q0NzllYWZh
NzdkZmQzYzM4ZDlkYzg5NTFmNmY2OWM3ODkxM2E4ZjlhNzU0MGZkNSIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============7059555580888221196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.3.1.tar.gz;downloadfilename=click-8.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.3.2.tar.gz;downloadfilename=click-8.3.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 477026 to 511233 (+7%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/exceptions.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/complex.rst", added "/usr/lib/python3-click/ptest/docs/complex.md /usr/lib/python3-click/ptest/docs/entry-points.md /usr/lib/python3-click/ptest/tests/test_stream_lifecycle.py /usr/lib/python3-click/ptest/docs/upgrade-guides.md /usr/lib/python3-click/ptest/docs/exceptions.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.3.1" to "8.3.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 907069 to 908179 (+0%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.3.1 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.3.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.3.1" to "8.3.2"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.3.2.dist-info

--===============7059555580888221196==--

