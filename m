Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67367C3ABA7
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20177.1744723977284157943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=izAuCKDN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dRxZHTe3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019639a721d9-3b5487f8-8859-4c58-ae8f-b95e1f83a46c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RYj78Yyy+V64upRpU/W39UGXwA92LKns1QtRwNq1vd0=;
	b=izAuCKDNQ3ybuOVwId/iP2OqVzQfSmKrA0SnOphEdt9o9NA56/UItYbTHIMR3zc4
	ZNdjdp7/L/SqJ3cwj4syzPvl4+5VIlbRvtcvrkyaoX5pbsxkCELssQXg3H2jwAiNibz
	n+UFiBNifqRj3O5EMEPnYLPakAXNw9DbWQ8z5cAk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RYj78Yyy+V64upRpU/W39UGXwA92LKns1QtRwNq1vd0=;
	b=dRxZHTe3g7fSIlmApfJ8JYzAxG1xoSmSo1kfi0yoMiY6wFPiGjavKw0gCEAhxmCg
	zegHYA7fidCi8ZLbv0JJNmn+j1yYOODV1iZqX+ldH8ea4Fga9OdB55kkTbd08limGdi
	noc23M4OgjHJ1t7DOUo0vtP4JAUXvIRhal7O1W+s=
Content-Type: multipart/mixed; boundary="===============3147903562360761361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.23.1 SUCCEEDED
Message-ID: <0101019639a721d9-3b5487f8-8859-4c58-ae8f-b95e1f83a46c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214881

--===============3147903562360761361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.22.4-2.23.1.patch
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
From 3880529ff0d75cd288e219c556675918a56a0989 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:36:55 +0000
Subject: [PATCH] python3-pdm: upgrade 2.22.4 -> 2.23.1

---
 .../python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.22.4.bb b/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.22.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.23.1.bb
index e6f35b3c7a..acab401392 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.22.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
+SRC_URI[sha256sum] = "cf12cd2201df78a6543a5485ac1d7015a73b3a6b10c98b66dfae6ebd481386fe"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============3147903562360761361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.22.4-2.23.1.patch"

RnJvbSAzODgwNTI5ZmYwZDc1Y2QyODhlMjE5YzU1NjY3NTkxOGE1NmEwOTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6MzY6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjIyLjQgLT4gMi4yMy4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjIuNC5iYiA9PiBweXRob24zLXBkbV8yLjIzLjEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjIuNC5iYiA9PiBweXRo
b24zLXBkbV8yLjIzLjEuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjIyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjIuNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjIzLjEu
YmIKaW5kZXggZTZmMzViM2M3YS4uYWNhYjQwMTM5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjIyLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjIzLjEuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0ODNmM2QyMjg1MDM5Y2VhN2UwN2M1YmE2YWM3ZTFm
Y2JhMzU4MTI5Zjg4MzFmYjc1MDY1YTc5N2QyN2I5MjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Y2YxMmNkMjIwMWRmNzhhNjU0M2E1NDg1YWMxZDcwMTVhNzNiM2E2YjEwYzk4YjY2ZGZhZTZlYmQ0
ODEzODZmZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAot
LSAKMi40Ny4xCgo=

--===============3147903562360761361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.22.4.tar.gz;downloadfilename=pdm-2.22.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.23.1.tar.gz;downloadfilename=pdm-2.23.1.tar.gz"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.22.4" to "2.23.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2140255 to 2155818 (+1%)
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.22.4 [default] to 2.23.1 [default]
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.22.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info

--===============3147903562360761361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.22.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info

--===============3147903562360761361==--

