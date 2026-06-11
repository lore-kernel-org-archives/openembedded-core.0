Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000BCCD98DF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50425.1781195507361500303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DKJ+WXD1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B6WkvBaU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb7868409-edec9068-4e69-44d7-8f81-52bc80f2b162-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195506;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kipz3Mvw9TG6898VDeg/UNW+fQ86QaraNp762EP3eOg=;
	b=DKJ+WXD1faO+Wbh8jPJRg70CldXm1LXq++gj+FvLcC+bUWhaX5VeHCJMl2/uAz9C
	Y9ANvqrBWBvr/UPWxze50wo0TxBYT4OkQkQiS6MjVVPTGIg1Td5LsSVLGv+GBxBbZhD
	WKNm45s7HlgRKmDAney5Qoecx6IPhVm+rILdzMg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195506;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kipz3Mvw9TG6898VDeg/UNW+fQ86QaraNp762EP3eOg=;
	b=B6WkvBaUgPM/kbumX3u0x7p/oAXMd/8FzSNp1J9jB3PDIoBn3p/PrdQgFX+wEkws
	ulA7lqYgYyH2L+VFiZg/cRppDfs6pulsMAzFl4olHZw3/KGre8PX41c7NJvxMlHIsZr
	30ufQFv7Dq/DgF+M960SmiinMhXOO5v9Dp326wgs=
Content-Type: multipart/mixed; boundary="===============5155787600636376835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.27.0 SUCCEEDED
Message-ID: <0101019eb7868409-edec9068-4e69-44d7-8f81-52bc80f2b162-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238497

--===============5155787600636376835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.27.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.8-2.27.0.patch
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
From 44f42b535f88820a07bf9f7ed96fd767edb252fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:59:05 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.8 -> 2.27.0

---
 .../python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.8.bb
rename to meta/recipes-devtools/python/python3-pdm_2.27.0.bb
index 91fcc6a5af..f378e1edda 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
+SRC_URI[sha256sum] = "dbfbc484065d0150fa5b29484ead908354313d8699cf74c099d4531826bd04de"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============5155787600636376835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.8-2.27.0.patch"

RnJvbSA0NGY0MmI1MzVmODg4MjBhMDdiZjlmN2VkOTZmZDc2N2VkYjI1MmZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6NTk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI2LjggLT4gMi4yNy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjYuOC5iYiA9PiBweXRob24zLXBkbV8yLjI3LjAuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjYuOC5iYiA9PiBweXRo
b24zLXBkbV8yLjI3LjAuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI3LjAu
YmIKaW5kZXggOTFmY2M2YTVhZi4uZjM3OGUxZWRkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjguYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI3LjAuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1M2EyMGI0YjZiZWFhODhkYTU3N2E3NDEzZWJiYjUx
YmVlNTM0NDQxMzM5YjAwNmRiYTIyNjBlZGJjODE3NTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZGJmYmM0ODQwNjVkMDE1MGZhNWIyOTQ4NGVhZDkwODM1NDMxM2Q4Njk5Y2Y3NGMwOTlkNDUzMTgy
NmJkMDRkZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============5155787600636376835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.8.tar.gz;downloadfilename=pdm-2.26.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.27.0.tar.gz;downloadfilename=pdm-2.27.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.8" to "2.27.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2500151 to 2516493 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.8 [default] to 2.27.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info

--===============5155787600636376835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info

--===============5155787600636376835==--

