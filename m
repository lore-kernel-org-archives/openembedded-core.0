Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE95C52CD9
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2175.1719853075763009769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QmZOslkG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VoIeyPZK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101906f3b4d1b-1c5f7228-9b46-46b2-8d71-c00c1f5eb3f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WLHqDc25W/xdF7TkQoUt2aBjM0w29uyCXzNYtjZZO2U=;
	b=QmZOslkGwVgZkrSkMrACL/zZux3qMBCgw5q9t2DuJ9KGJzbB/UvtxrVhrzkSqz01
	J4OMeS0HiLkGlvKxt+Y7eeGbEZwvnlGeMe4LqO3JP7hvWbMst1jQuHJZNGmlHuDkAI9
	S+8eqHbhvbs4lVChk9mU+uN3z6ILnqYGmTQFbkMc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WLHqDc25W/xdF7TkQoUt2aBjM0w29uyCXzNYtjZZO2U=;
	b=VoIeyPZK5/rJ3+/JJeW25Iua2Sf/Dha/P0jwvAo0KeczTljr/j/MyNo5YADIyAMh
	YURKpXk/duBBfqr8KqyXVs2ReKz6k4LLewVzRRGThJQx6VeMWB04xAjsGC7uWub5s/t
	jDsXDKRb0GAdY4Qz31JtwUv5/r1Fmjy3H7RXRztQ=
Content-Type: multipart/mixed; boundary="===============4573293134118920085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.26.1 SUCCEEDED
Message-ID: <010101906f3b4d1b-1c5f7228-9b46-46b2-8d71-c00c1f5eb3f1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201332

--===============4573293134118920085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.26.0-1.26.1.patch
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
From ae3673ba3e53d6c330d732bb3f7c5f32c4473785 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 09:00:22 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.26.0 -> 1.26.1

---
 .../{python3-pycairo_1.26.0.bb => python3-pycairo_1.26.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.26.0.bb => python3-pycairo_1.26.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
index ea8b81be76..93f181bf5f 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "2dddd0a874fbddb21e14acd9b955881ee1dc6e63b9c549a192d613a907f9cbeb"
+SRC_URI[sha256sum] = "a11b999ce55b798dbf13516ab038e0ce8b6ec299b208d7c4e767a6f7e68e8430"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.44.0


--===============4573293134118920085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.26.0/pycairo-1.26.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.26.1/pycairo-1.26.1.tar.gz"
packages/core2-64-poky-linux/python3-pycairo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 365517 to 365519 (+0%)
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info", added "/usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info moved to /usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info

--===============4573293134118920085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info", added "/usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info moved to /usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info

--===============4573293134118920085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.26.0-1.26.1.patch"

RnJvbSBhZTM2NzNiYTNlNTNkNmMzMzBkNzMyYmIzZjdjNWYzMmM0NDczNzg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwOTowMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjI2LjAgLT4gMS4yNi4xCgotLS0KIC4uLi97cHl0aG9u
My1weWNhaXJvXzEuMjYuMC5iYiA9PiBweXRob24zLXB5Y2Fpcm9fMS4yNi4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljYWlyb18xLjI2LjAuYmIg
PT4gcHl0aG9uMy1weWNhaXJvXzEuMjYuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI2LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI2LjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y2Fpcm9fMS4yNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljYWlyb18xLjI2LjEuYmIKaW5kZXggZWE4YjgxYmU3Ni4uOTNmMTgxYmY1
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fp
cm9fMS4yNi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNhaXJvXzEuMjYuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImNhaXJvIHB5dGhv
bjMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vcHljYWly
by0ke1BWfS50YXIuZ3oiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5
Z29iamVjdC9weWNhaXJvL3JlbGVhc2VzLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkZGRk
MGE4NzRmYmRkYjIxZTE0YWNkOWI5NTU4ODFlZTFkYzZlNjNiOWM1NDlhMTkyZDYxM2E5MDdmOWNi
ZWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTExYjk5OWNlNTViNzk4ZGJmMTM1MTZhYjAzOGUw
Y2U4YjZlYzI5OWIyMDhkN2M0ZTc2N2E2ZjdlNjhlODQzMCIKIAogUyA9ICIke1dPUktESVJ9L3B5
Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============4573293134118920085==--

