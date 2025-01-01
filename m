Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C8DC02190
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11494.1735723946151979625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YLMnNyPB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Er6vLnNJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019421358e1e-223348e8-a3f4-40d0-b44c-6ce10a44056d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8eCcEiOMzwvlAINcqDkAH0Ba1pcuZJLvY2VKuQF3H1c=;
	b=YLMnNyPBjyr0Fxc7jq1ka51UPdbNTsMaN4hzZakNWrDxV1VrapXeE0RnB82N2+Db
	4AicTQzuYAsSSz+2YS4TCe40h22Q4x6w4w35UJIw0peT0Ihe51gXHJDmH6NWR+6yrtX
	pMbjTisPqmEQ0rFIQo5iTSOLhmx1djXafvrecWA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8eCcEiOMzwvlAINcqDkAH0Ba1pcuZJLvY2VKuQF3H1c=;
	b=Er6vLnNJa7j63MzXTjS/O1YPIQuv/HFwKTl/rFD2H0mG3UA0qThdjEVvrOnNyCWh
	7KS38zfPDxl6+xin5DpyI7h7maF0DbnxGx7I1uC/Y7KwBGoel0gTLpvmhXAfiP/ezyd
	d1T+sucIgKjAnd9ogE+la4qiobO3JpE7PGEIc6so=
Content-Type: multipart/mixed; boundary="===============3465150709840153621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.1 SUCCEEDED
Message-ID: <0101019421358e1e-223348e8-a3f4-40d0-b44c-6ce10a44056d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209214

--===============3465150709840153621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.2.0-3.2.1.patch
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
From b62f4aa8dc8dd3f94d2c02859598fb14b5258a70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:17:54 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.2.0 -> 3.2.1

---
 .../{python3-pyparsing_3.2.0.bb => python3-pyparsing_3.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.0.bb => python3-pyparsing_3.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
index f1be9debbc..ab4eba129a 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c"
+SRC_URI[sha256sum] = "61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a"
 
 inherit pypi python_flit_core
 
-- 
2.44.1


--===============3465150709840153621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.0.tar.gz;downloadfilename=pyparsing-3.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.1.tar.gz;downloadfilename=pyparsing-3.2.1.tar.gz"
packages/core2-64-poky-linux/python3-pyparsing: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 874374 to 879637 (+1%)
Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.0.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info

--===============3465150709840153621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.0.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info

--===============3465150709840153621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.2.0-3.2.1.patch"

RnJvbSBiNjJmNGFhOGRjOGRkM2Y5NGQyYzAyODU5NTk4ZmIxNGI1MjU4YTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzoxNzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwYXJzaW5nOiB1cGdyYWRlIDMuMi4wIC0+IDMuMi4xCgotLS0KIC4uLi97cHl0aG9u
My1weXBhcnNpbmdfMy4yLjAuYmIgPT4gcHl0aG9uMy1weXBhcnNpbmdfMy4yLjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4wLmJi
ID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMi4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXBhcnNpbmdfMy4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjEuYmIKaW5kZXggZjFiZTlkZWJiYy4uYWI0
ZWJhMTI5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5cGFyc2luZ18zLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHlwYXJzaW5nXzMuMi4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIEJVR1RSQUNLRVIgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3B5cGFyc2luZy9weXBhcnNpbmcvaXNzdWVzIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02NTdhNTY2MjMz
ODg4NTEzZTFmMDdiYTEzZTJmNDdmMSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiZjc0ZTI3
MjQ2ZDU5NWQ5YTc0YjE4NmI4MTBmNmZiYjg2NzI2ZGJmM2I5NTMyZWZiMzQzZjZkNzI5NGZlOWMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjE5ODA4NTRmZDY2ZGUzYTkwMDI4ZDY3OWE5NTRkNWYy
NjIzZTgzMTQ0YjVhZmU1ZWU4NmY0M2Q3NjJlNWYwYSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9m
bGl0X2NvcmUKIAotLSAKMi40NC4xCgo=

--===============3465150709840153621==--

