Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DDCD5CC85
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17192.1765872145451731656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ey5X6SEd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FTHedG+z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262e8feb-41585490-978d-4e9c-b7ef-47b7e834a01a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FBfVOBrvG3sEQHKffi2CJojakzuczoGcC/3XFHazvcg=;
	b=ey5X6SEd4tPHfsnFET/t2I5Sfq72XabC2BAOeeT2/IZ2GEMPOfZ/CYDNHQoblphA
	zpUpDDTVuTv2IZ/W3Vxj/SHwWpnR6v6YWN64xcM3GpbWGaCPSPHhOsTJCMStarmE+rj
	5CgL93glpesopiZIbYPFn+xRcjLKa57zwdkv3Oiw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FBfVOBrvG3sEQHKffi2CJojakzuczoGcC/3XFHazvcg=;
	b=FTHedG+zXzbENPUxFbpqDFtOLqma1meuBCnUvjsyzgNa8Nyi/CH8n/gaB1SzZf+H
	7o34KYdDIx5+iNlbX+HNbHGmuL/cuDF+6ZI8Wn5kvgw8npNz9WmTtWEJlpmW87I3vta
	j02HuAtuL+8vfL7yYMiC1gb+jFLKTnX+S692z7LM=
Content-Type: multipart/mixed; boundary="===============0909228485695166015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.29.0 SUCCEEDED
Message-ID: <0101019b262e8feb-41585490-978d-4e9c-b7ef-47b7e834a01a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227815

--===============0909228485695166015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycairo* to *1.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.28.0-1.29.0.patch
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
From c7399055666214ae8e204b5101c98344c1b40e27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:50:26 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.28.0 -> 1.29.0

---
 .../{python3-pycairo_1.28.0.bb => python3-pycairo_1.29.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.28.0.bb => python3-pycairo_1.29.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
index 498c4db586..20c2c332cd 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc"
+SRC_URI[sha256sum] = "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142"
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 
-- 
2.47.1


--===============0909228485695166015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycairo-1.28.0.dist-info -> /usr/lib/python3.13/site-packages/pycairo-1.29.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.13/site-packages/pycairo-1.28.0.dist-info moved to /usr/lib/python3.13/site-packages/pycairo-1.29.0.dist-info

--===============0909228485695166015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycairo: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.28.0/pycairo-1.28.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.29.0/pycairo-1.29.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycairo: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 515768 to 504888 (-2%)
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: FILELIST: directory renamed /usr/src/debug/python3-pycairo/1.28.0/cairo -> /usr/src/debug/python3-pycairo/1.29.0/cairo
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 365270 to 369202 (+1%)
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.28.0 [default] to 1.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycairo-1.28.0.dist-info -> /usr/lib/python3.13/site-packages/pycairo-1.29.0.dist-info
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.28.0" to "1.29.0"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 460408 to 460475 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.13/site-packages/pycairo-1.28.0.dist-info moved to /usr/lib/python3.13/site-packages/pycairo-1.29.0.dist-info

--===============0909228485695166015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.28.0-1.29.0.patch"

RnJvbSBjNzM5OTA1NTY2NjIxNGFlOGUyMDRiNTEwMWM5ODM0NGMxYjQwZTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NTA6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y2Fpcm86IHVwZ3JhZGUgMS4yOC4wIC0+IDEuMjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHljYWlyb18xLjI4LjAuYmIgPT4gcHl0aG9uMy1weWNhaXJvXzEuMjkuMC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y2Fpcm9fMS4yOC4wLmJi
ID0+IHB5dGhvbjMtcHljYWlyb18xLjI5LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yOC4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yOS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNhaXJvXzEuMjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yOS4wLmJiCmluZGV4IDQ5OGM0ZGI1ODYuLjIwYzJjMzMy
Y2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNh
aXJvXzEuMjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljYWlyb18xLjI5LjAuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICJjYWlybyBweXRo
b24zIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L3B5Y2Fp
cm8tJHtQVn0udGFyLmd6IgogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9w
eWdvYmplY3QvcHljYWlyby9yZWxlYXNlcy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNmVj
NWM2MTI2NzgxZWIxNjcwODlhMTIzOTE5Zjg3YmFhMjc0MGRhMmNjYTkwOThiZThiM2E2YjkxY2M1
ZmJjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzZjdmZGU5NzMyNWNhZTgwMjI0YzA5ZjEyNTY0
ZWY1OGQwZDBmNjU1ZGEwZTNiMDQwZjU4MDdiZDViZDMxNDIiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9
L3B5Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============0909228485695166015==--

