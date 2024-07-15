Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FD4C5474E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1306.1721071146992678871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aNwwbiWu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0jEdKz6O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190b7d595b4-b7f8bf88-9de5-4ea1-b6ac-924ad3046e35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OxKhvq8ajvr3tQhlSo3FlkPsIGIZ92InUpb5PBmdRwk=;
	b=aNwwbiWuW8Hv6Q7hhhlaMG0YbSVjD78xtwxC++hAaz4I/4K7tXkip/ngFCIOT2aK
	SMHZ04lL3IiA2EtYuqQ+3cpg5SoZVP6ZjHPHdvKfIES6H8O//VBe1fYFqzDenhNb7zL
	hypMcK2XHXabIswh2Zg1iNyF65J5b1gS2lYwsiR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OxKhvq8ajvr3tQhlSo3FlkPsIGIZ92InUpb5PBmdRwk=;
	b=0jEdKz6OJ99cLoIppUTobPfPXx8h7TiCyhmiVpri6NQy15Ys6SQKYguaohB63yZj
	tCqs9UjejpiIO9lF/R/1CgMAB9Gc+YwRIueajDr58/qy397wmkD2uMeUoOCt8ucJEC4
	nqlWRJrZsgTYouT44PD1fjsb0sxmmEiL8VgBSZ0I=
Content-Type: multipart/mixed; boundary="===============1487443957759175797=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.26.1 SUCCEEDED
Message-ID: <01010190b7d595b4-b7f8bf88-9de5-4ea1-b6ac-924ad3046e35-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201980

--===============1487443957759175797==
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
From c9516b4486d388675b086fd00ad3274fccb07d8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 11:17:52 +0000
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


--===============1487443957759175797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info", added "/usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info moved to /usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info

--===============1487443957759175797==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.26.0-1.26.1.patch"

RnJvbSBjOTUxNmI0NDg2ZDM4ODY3NWIwODZmZDAwYWQzMjc0ZmNjYjA3ZDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTE6MTc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y2Fpcm86IHVwZ3JhZGUgMS4yNi4wIC0+IDEuMjYuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtcHljYWlyb18xLjI2LjAuYmIgPT4gcHl0aG9uMy1weWNhaXJvXzEuMjYuMS5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y2Fpcm9fMS4yNi4wLmJi
ID0+IHB5dGhvbjMtcHljYWlyb18xLjI2LjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yNi4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yNi4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNhaXJvXzEuMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yNi4xLmJiCmluZGV4IGVhOGI4MWJlNzYuLjkzZjE4MWJm
NWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNh
aXJvXzEuMjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljYWlyb18xLjI2LjEuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICJjYWlybyBweXRo
b24zIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L3B5Y2Fp
cm8tJHtQVn0udGFyLmd6IgogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9w
eWdvYmplY3QvcHljYWlyby9yZWxlYXNlcy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZGRk
ZDBhODc0ZmJkZGIyMWUxNGFjZDliOTU1ODgxZWUxZGM2ZTYzYjljNTQ5YTE5MmQ2MTNhOTA3Zjlj
YmViIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExMWI5OTljZTU1Yjc5OGRiZjEzNTE2YWIwMzhl
MGNlOGI2ZWMyOTliMjA4ZDdjNGU3NjdhNmY3ZTY4ZTg0MzAiCiAKIFMgPSAiJHtXT1JLRElSfS9w
eWNhaXJvLSR7UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============1487443957759175797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.26.0/pycairo-1.26.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.26.1/pycairo-1.26.1.tar.gz"
packages/core2-64-poky-linux/python3-pycairo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 365517 to 365519 (+0%)
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info", added "/usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info"
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.26.0" to "1.26.1"
Changes to packages/core2-64-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.12/site-packages/pycairo-1.26.0.egg-info moved to /usr/lib/python3.12/site-packages/pycairo-1.26.1.egg-info

--===============1487443957759175797==--

