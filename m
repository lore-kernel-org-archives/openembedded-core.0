Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732DFCA5FFF
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13635.1791178118087436838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CcWBoZDJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1r34nTTb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a10a891001-57f5377d-c78d-4d3b-a0cb-9e71c458f73f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8uLVMbxNDQQGxFKznEcrbjxw/WmaVxGK/Y4pqAlu+cU=;
	b=CcWBoZDJNwfV/8HGGZ7Il6hXARaThi5R83gI447Pts6dBQDTinyEZ2BAER0VWL+7
	GtiOj9MdJAOyWYQ7QzD7d+Q914lQxw88xorOBlxD92oKMquOTwFButpEzcmm98L1zIR
	Vsc3MnAKik07cDNgyofACRVy9nwa8JwdSH2f2Kc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8uLVMbxNDQQGxFKznEcrbjxw/WmaVxGK/Y4pqAlu+cU=;
	b=1r34nTTbJ5lYTYdYRnp7dWoPa+3edFPrDqBPV5saH4hkmx7hAm+0j+zvXf1RnjI6
	XPRlG0x1LXsHnqg6tUjPUeipwK6SSIF0WsHHWuT8UXBCuNmjyrunhjlvQiz9iQ3mgIL
	i2ll+9JFDT6ctNDiFZPsjyEKnPi1R9gw7dRBTUAI=
Content-Type: multipart/mixed; boundary="===============7225487962147906413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.29.2 SUCCEEDED
Message-ID: <010101a10a891001-57f5377d-c78d-4d3b-a0cb-9e71c458f73f-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247209

--===============7225487962147906413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycairo* to *1.29.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.29.1-1.29.2.patch
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
From 06a443a88aa510103fb9a7615e1686ac4d611b24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:20:51 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.29.1 -> 1.29.2

.. _v1.29.2:

1.29.2 - 2026-10-04
-------------------
---
 .../{python3-pycairo_1.29.1.bb => python3-pycairo_1.29.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.29.1.bb => python3-pycairo_1.29.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.29.2.bb
index b70d1f177d..28c0ab0d7a 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f"
+SRC_URI[sha256sum] = "3e69fff74fe64f5ba2dfa31f67c6bdf26413342574047437d2ac520d35e9a489"
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 
-- 
2.47.1


--===============7225487962147906413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info -> /usr/lib/python3.14/site-packages/pycairo-1.29.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info moved to /usr/lib/python3.14/site-packages/pycairo-1.29.2.dist-info

--===============7225487962147906413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycairo-changelog.txt"

.. _v1.29.2:

1.29.2 - 2026-10-04
-------------------

--===============7225487962147906413==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.29.1-1.29.2.patch"

RnJvbSAwNmE0NDNhODhhYTUxMDEwM2ZiOWE3NjE1ZTE2ODZhYzRkNjExYjI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNToyMDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjI5LjEgLT4gMS4yOS4yCgouLiBfdjEuMjkuMjoKCjEu
MjkuMiAtIDIwMjYtMTAtMDQKLS0tLS0tLS0tLS0tLS0tLS0tLQotLS0KIC4uLi97cHl0aG9uMy1w
eWNhaXJvXzEuMjkuMS5iYiA9PiBweXRob24zLXB5Y2Fpcm9fMS4yOS4yLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljYWlyb18xLjI5LjEuYmIgPT4g
cHl0aG9uMy1weWNhaXJvXzEuMjkuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI5LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjI5LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y2Fpcm9fMS4yOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHljYWlyb18xLjI5LjIuYmIKaW5kZXggYjcwZDFmMTc3ZC4uMjhjMGFiMGQ3YSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fpcm9f
MS4yOS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNh
aXJvXzEuMjkuMi5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImNhaXJvIHB5dGhvbjMi
CiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vcHljYWlyby0k
e1BWfS50YXIuZ3oiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5Z29i
amVjdC9weWNhaXJvL3JlbGVhc2VzLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRmYmQyNmI0
YWYyNGM5Nzg3ZDg0Y2Y1NDQ4ZTM0ZWI4ZGNhMDY0YjczMjQ3OWFhZWNkMDMxMDk1MjBlZWJkNWYi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2U2OWZmZjc0ZmU2NGY1YmEyZGZhMzFmNjdjNmJkZjI2
NDEzMzQyNTc0MDQ3NDM3ZDJhYzUyMGQzNWU5YTQ4OSIKIAogUyA9ICIke1VOUEFDS0RJUn0vcHlj
YWlyby0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============7225487962147906413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycairo: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.29.1/pycairo-1.29.1.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.29.2/pycairo-1.29.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: FILELIST: directory renamed /usr/src/debug/python3-pycairo/1.29.1/cairo -> /usr/src/debug/python3-pycairo/1.29.2/cairo
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info -> /usr/lib/python3.14/site-packages/pycairo-1.29.2.dist-info
packages/x86-64-v3-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.14/site-packages/pycairo-1.29.1.dist-info moved to /usr/lib/python3.14/site-packages/pycairo-1.29.2.dist-info

--===============7225487962147906413==--

