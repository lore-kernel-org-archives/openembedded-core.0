Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB02CC0218B
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.17799.1736936769402549075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FwrVUrgC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SIpjVy5w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194697fc4af-871bf7a4-b7f9-40e3-a885-a43ad42ef16d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936768;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5hA7rzTjv1a6k77fooiyoSuBmqz2qTrOZRNrRnePFbQ=;
	b=FwrVUrgCNkdlWanKsQnH6CoYq4EP+Boj80w+FeG+KSYhl4PH8Fe8EUKcBlo4g2RD
	T2FUaOrc9pU0CKW3vrARHFqgJ/lgGamOmIIQNNg1LftYwrGonTlEziexyWtgNKscKJL
	pcTw+wTdHqLJtck59Af+m/fsvAuPoKXm5puKmZoE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936768;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5hA7rzTjv1a6k77fooiyoSuBmqz2qTrOZRNrRnePFbQ=;
	b=SIpjVy5w5MfJFRHVZR1gSAvQfmSoHOtOzYTdOfZ3OQJ6l+DcK7jHT/yX13hKnl5r
	sHcdaNG3Z7He6TAg01sTctIdnVRlP4g4ubICireEZqRqPclBqh5BA7IBr62gYvUp8HW
	Ga+VShuQSyEphWqRl9NlugTBJPVwyDm48YfsW5II=
Content-Type: multipart/mixed; boundary="===============4561753643441368163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.0.1 SUCCEEDED
Message-ID: <01010194697fc4af-871bf7a4-b7f9-40e3-a885-a43ad42ef16d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209843

--===============4561753643441368163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.0.0-2.0.1.patch
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
From 133d0ab3d107c79903b1f3e7bcba4e95c3544dad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:36:03 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.0.0 -> 2.0.1

---
 ...ython3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
index 09b1a2340d..8fb39a7d67 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f"
+SRC_URI[sha256sum] = "10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157"
 
 inherit python_poetry_core pypi
 
-- 
2.44.1


--===============4561753643441368163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.0.0-2.0.1.patch"

RnJvbSAxMzNkMGFiM2QxMDdjNzk5MDNiMWYzZTdiY2JhNGU5NWMzNTQ0ZGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6MzY6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIuMC4wIC0+IDIuMC4xCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8yLjAuMC5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4w
LjAuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8yLjAuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4wLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4w
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4wLjEuYmIKaW5kZXgg
MDliMWEyMzQwZC4uOGZiMzlhN2Q2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjAuMS5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzMxN2EzY2MzOTMyMDExYTYxMTE0MjM2YjJk
NDk4ODNmNGZiMTQwM2QyZjVlOTc3NzFhYzBkMDc3Y2ZhMzk2ZiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxMDE3N2MyNzcyNDY5ZDkwMzJhNDlmMGQ4NzA3YWY3NjFiMWM1OTdjZWEzYjRmYjMxNTQ2
ZTVjZDQzNmViMTU3IgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDQuMQoK

--===============4561753643441368163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.0.0.tar.gz;downloadfilename=poetry_core-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.0.1.tar.gz;downloadfilename=poetry_core-2.0.1.tar.gz"
packages/core2-64-poky-linux/python3-poetry-core: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2447753 to 2450434 (+0%)
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info

--===============4561753643441368163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info

--===============4561753643441368163==--

