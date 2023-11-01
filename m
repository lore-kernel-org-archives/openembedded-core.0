Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC52C169C2
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.8658.1698848704600524775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N4UG9oc4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mMvsVKhl;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460579-16f2dd0c-088d-4514-aa08-3e2e485e9fa3-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dZCmE6bcFjbFYLmKadibhQzV71TZNI8YIvulnjy2cFk=;
	b=N4UG9oc4o3MxWP0swGkna2jJzc5THA/DBYOVBFRprIirgmg2WhKPjKK+7PCtfxb1
	znJKlooTJuROWP3g7YainwEpYyJykbpdCx3NO0Fw3sDkEeWfFntCgJWh03KXzXK9gIg
	a6DBLpwsT7Qmq662PJh+QZ/FXLGcqAm5F0+DHejc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dZCmE6bcFjbFYLmKadibhQzV71TZNI8YIvulnjy2cFk=;
	b=mMvsVKhlFvm94DqCLBRd1Uvg9KK7Qse4epTcgWVPAN4F6EWzv+BE8XAW2MFBCafR
	28bkE4FrpWQ7dRHKUGDmUYze+0Z++q4zJZDAeVQl/fuRQKAd96k1mk4C6xfPT2VI1Uk
	im+R5Iuca6oArT9lcvIKyTKv17G96lDLuMoVmhSw=
Content-Type: multipart/mixed; boundary="===============5212458167417164881=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.25.1 SUCCEEDED
Message-ID: <0101018b8b460579-16f2dd0c-088d-4514-aa08-3e2e485e9fa3-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189965

--===============5212458167417164881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.25.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.25.0-1.25.1.patch
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
From 30d2fabb16fa8b1faf23de1db0043f14eadf56df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:20:49 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.25.0 -> 1.25.1

---
 .../{python3-pycairo_1.25.0.bb => python3-pycairo_1.25.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.25.0.bb => python3-pycairo_1.25.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
index a9e89b0f7a..1599f6d39e 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "37842b9bfa6339c45a5025f752e1d78d5840b1a0f82303bdd5610846ad8b5c4f"
+SRC_URI[sha256sum] = "7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.39.2


--===============5212458167417164881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.25.0-1.25.1.patch"

RnJvbSAzMGQyZmFiYjE2ZmE4YjFmYWYyM2RlMWRiMDA0M2YxNGVhZGY1NmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyMDo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjI1LjAgLT4gMS4yNS4xCgotLS0KIC4uLi97cHl0aG9u
My1weWNhaXJvXzEuMjUuMC5iYiA9PiBweXRob24zLXB5Y2Fpcm9fMS4yNS4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljYWlyb18xLjI1LjAuYmIg
PT4gcHl0aG9uMy1weWNhaXJvXzEuMjUuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI1LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI1LjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y2Fpcm9fMS4yNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljYWlyb18xLjI1LjEuYmIKaW5kZXggYTllODliMGY3YS4uMTU5OWY2ZDM5
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fp
cm9fMS4yNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNhaXJvXzEuMjUuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImNhaXJvIHB5dGhv
bjMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vcHljYWly
by0ke1BWfS50YXIuZ3oiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5
Z29iamVjdC9weWNhaXJvL3JlbGVhc2VzLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3ODQy
YjliZmE2MzM5YzQ1YTUwMjVmNzUyZTFkNzhkNTg0MGIxYTBmODIzMDNiZGQ1NjEwODQ2YWQ4YjVj
NGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2UyYmU0ZmJjM2I0NTM2ZjE2ZGI3YTExOTgyY2Jm
NzEzZTc1MDY5YTRkNzNkNDRmZTVhNDliNjg0MjNmNWMwYyIKIAogUyA9ICIke1dPUktESVJ9L3B5
Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============5212458167417164881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycairo: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.25.0/pycairo-1.25.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.25.1/pycairo-1.25.1.tar.gz"
packages/core2-64-poky-linux/python3-pycairo: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 365516 to 365514 (-0%)
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.25.0 [default] to 1.25.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.25.0" to "1.25.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.25.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.25.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.25.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.25.1.egg-info

--===============5212458167417164881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.25.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.25.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.25.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.25.1.egg-info

--===============5212458167417164881==--

