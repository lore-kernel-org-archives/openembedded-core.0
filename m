Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C28AC5AD4E
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 06:06:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.826.1786169196316668912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 23:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Psm3kVtY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YH+QOw7X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fdffafb32-e01dfb10-2e60-4f8b-b11d-d23e7f4d8676-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786169195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dz+3tF0lBGXSoE8449EbxSYyl2V7UudmGlMPt0HEqfg=;
	b=Psm3kVtYXmTT/EwNdWdaO1rDgd5DOlBNYB2fooOBvGcx7kTe7Rb8/QQvTQHYjHX7
	1oVx19nzmzouXTKHe35jOQrGrJMtytFGpoZXLsdHS6TyS6O/xsodYZJNulSMbTN3D39
	dGiZ9spsPGDHcH4PhLguFI2nOYnfvNp7AJttrMvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786169195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dz+3tF0lBGXSoE8449EbxSYyl2V7UudmGlMPt0HEqfg=;
	b=YH+QOw7Xqp7tL6sXufza22jf2Z9Upj3IXlDt73XDGSQA1T6Qzc1IMUTnEqJgViGE
	BYCYVEMMKCzk+MdBQPNP97ArhdI0LrL63iuoR3TtouRFh/swfj5MGnA+eE7QbpGbVMI
	HxduriT9zQ8lkYumHDGEutL8d0jlLefmEhZB7lwc=
Content-Type: multipart/mixed; boundary="===============5298966886977534293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.29.1 SUCCEEDED
Message-ID: <0101019fdffafb32-e01dfb10-2e60-4f8b-b11d-d23e7f4d8676-000000@us-west-2.amazonses.com>
Date: Sat, 8 Aug 2026 06:06:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 06:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243030

--===============5298966886977534293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycairo* to *1.29.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.29.0-1.29.1.patch
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
From 17f02d4b9fda2a3ff95b8f04a10342b6a0cd7350 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 8 Aug 2026 05:24:27 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.29.0 -> 1.29.1

Source: NEWS

.. _v1.29.1:

1.29.1 - 2026-08-07
-------------------

* Update dependencies (libpng, zlib) for the Windows wheels :pr:`442`
* Fix documentation build with Python 3.15 :pr:`441`
* Build wheels for Python 3.15 (except for 32bit Windows) :pr:`444`
* Fix a memory leak in :meth:`ScaledFont.text_to_glyphs` :pr:`446`
* Fix some minor reference leaks :pr:`447`
---
 .../{python3-pycairo_1.29.0.bb => python3-pycairo_1.29.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.29.0.bb => python3-pycairo_1.29.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
index 2d018e676a..19e41baac4 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142"
+SRC_URI[sha256sum] = "4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f"
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 
-- 
2.47.1


--===============5298966886977534293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycairo-changelog.txt"

Changelog for python3-pycairo: 1.29.0 -> 1.29.1
Source: NEWS

.. _v1.29.1:

1.29.1 - 2026-08-07
-------------------

* Update dependencies (libpng, zlib) for the Windows wheels :pr:`442`
* Fix documentation build with Python 3.15 :pr:`441`
* Build wheels for Python 3.15 (except for 32bit Windows) :pr:`444`
* Fix a memory leak in :meth:`ScaledFont.text_to_glyphs` :pr:`446`
* Fix some minor reference leaks :pr:`447`

--===============5298966886977534293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycairo-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.14/site-packages/pycairo-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info

--===============5298966886977534293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycairo: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.29.0/pycairo-1.29.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.29.1/pycairo-1.29.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycairo: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 561616 to 562176 (+0%)
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 369202 to 369228 (+0%)
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: FILELIST: directory renamed /usr/src/debug/python3-pycairo/1.29.0/cairo -> /usr/src/debug/python3-pycairo/1.29.1/cairo
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 472769 to 476865 (+1%)
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycairo-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.14/site-packages/pycairo-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info

--===============5298966886977534293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.29.0-1.29.1.patch"

RnJvbSAxN2YwMmQ0YjlmZGEyYTNmZjk1YjhmMDRhMTAzNDJiNmEwY2Q3MzUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgOCBBdWcgMjAyNiAwNToyNDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjI5LjAgLT4gMS4yOS4xCgpTb3VyY2U6IE5FV1MKCi4u
IF92MS4yOS4xOgoKMS4yOS4xIC0gMjAyNi0wOC0wNwotLS0tLS0tLS0tLS0tLS0tLS0tCgoqIFVw
ZGF0ZSBkZXBlbmRlbmNpZXMgKGxpYnBuZywgemxpYikgZm9yIHRoZSBXaW5kb3dzIHdoZWVscyA6
cHI6YDQ0MmAKKiBGaXggZG9jdW1lbnRhdGlvbiBidWlsZCB3aXRoIFB5dGhvbiAzLjE1IDpwcjpg
NDQxYAoqIEJ1aWxkIHdoZWVscyBmb3IgUHl0aG9uIDMuMTUgKGV4Y2VwdCBmb3IgMzJiaXQgV2lu
ZG93cykgOnByOmA0NDRgCiogRml4IGEgbWVtb3J5IGxlYWsgaW4gOm1ldGg6YFNjYWxlZEZvbnQu
dGV4dF90b19nbHlwaHNgIDpwcjpgNDQ2YAoqIEZpeCBzb21lIG1pbm9yIHJlZmVyZW5jZSBsZWFr
cyA6cHI6YDQ0N2AKLS0tCiAuLi4ve3B5dGhvbjMtcHljYWlyb18xLjI5LjAuYmIgPT4gcHl0aG9u
My1weWNhaXJvXzEuMjkuMS5iYn0gICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXB5Y2Fpcm9fMS4yOS4wLmJiID0+IHB5dGhvbjMtcHljYWlyb18xLjI5LjEuYmJ9
ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y2Fpcm9fMS4yOS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y2Fpcm9fMS4yOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNhaXJvXzEuMjkuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9fMS4yOS4xLmJi
CmluZGV4IDJkMDE4ZTY3NmEuLjE5ZTQxYmFhYzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNhaXJvXzEuMjkuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI5LjEuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgREVQRU5EUyA9ICJjYWlybyBweXRob24zIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNF
X1VSSX0vZG93bmxvYWQvdiR7UFZ9L3B5Y2Fpcm8tJHtQVn0udGFyLmd6IgogR0lUSFVCX0JBU0Vf
VVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weWdvYmplY3QvcHljYWlyby9yZWxlYXNlcy8iCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmM2Y3ZmRlOTczMjVjYWU4MDIyNGMwOWYxMjU2NGVmNThk
MGQwZjY1NWRhMGUzYjA0MGY1ODA3YmQ1YmQzMTQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRm
YmQyNmI0YWYyNGM5Nzg3ZDg0Y2Y1NDQ4ZTM0ZWI4ZGNhMDY0YjczMjQ3OWFhZWNkMDMxMDk1MjBl
ZWJkNWYiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L3B5Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============5298966886977534293==--

