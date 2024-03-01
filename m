Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA66C54E72
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.36619.1709330715952703473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TeYxnR4I;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZCD0Ub33;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dfc0cd1c0-9b5ed1b2-dab1-4df1-a61b-2f69bbf0dfe3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KrmD42GZbJlsF063xolDPouLph/XyyRPmN3wrUaw1Ps=;
	b=TeYxnR4It7jrYXYm/M4CdJWzMhmfN67cLzf0VPZ4gtsGIC7t7uq+AIXHZP+RBd9R
	LhQMoPcZo3jFtRkFoNVkwgASNKV1vCq7xcIuEGL7ZAbqedoTei6v50OYUrTnOzkZ0lX
	wpO915AoSzcpjniCG2ufF/O1uuEVC8aDLCdMD8GQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KrmD42GZbJlsF063xolDPouLph/XyyRPmN3wrUaw1Ps=;
	b=ZCD0Ub331WZuPrYR3igVGLMS9UXsr0scRvF4QjAxgVoQzxSXL8xPS5bjzB2dD1XZ
	SC7I8B4ZQqhvWvO7H5hGwg0a/xlb49xZtdIj6oZD6uicoOXBZZ8oSxCO+Oqu90AgG1h
	uF0u6gCfmVAWYlvSo8xwjQTtcNplrAybOGjBJa1Q=
Content-Type: multipart/mixed; boundary="===============7365412351508880459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.6.1 SUCCEEDED
Message-ID: <0101018dfc0cd1c0-9b5ed1b2-dab1-4df1-a61b-2f69bbf0dfe3-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196466

--===============7365412351508880459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *expat* to *2.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.6.0-2.6.1.patch
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
From efa902f047acccfc58e9b267f14c5af5be95d370 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 10:33:20 +0000
Subject: [PATCH] expat: upgrade 2.6.0 -> 2.6.1

---
 meta/recipes-core/expat/{expat_2.6.0.bb => expat_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.0.bb => expat_2.6.1.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.0.bb b/meta/recipes-core/expat/expat_2.6.1.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.0.bb
rename to meta/recipes-core/expat/expat_2.6.1.bb
index 1f9f7b269a..9bdc3b6206 100644
--- a/meta/recipes-core/expat/expat_2.6.0.bb
+++ b/meta/recipes-core/expat/expat_2.6.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0ec6f55736b78d85ba"
+SRC_URI[sha256sum] = "4677d957c0c6cb2a3321101944574c24113b637c7ab1cf0659a27c5babc201fd"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.42.0


--===============7365412351508880459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/expat/expat-bin: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-bin: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-dbg: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-dbg: PKGSIZE changed from 2115024 to 2113112 (-0%)
packages/core2-64-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.9.0", added "/usr/lib/.debug/libexpat.so.1.9.1"
packages/core2-64-poky-linux/expat/expat-dbg: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-dev: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-dev: PKGSIZE changed from 65714 to 65824 (+0%)
packages/core2-64-poky-linux/expat/expat-dev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-doc: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-doc: PKGSIZE changed from 81987 to 82815 (+1%)
packages/core2-64-poky-linux/expat/expat-doc: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-locale: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-locale: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-ptest: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-ptest: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-src: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-src: PKGSIZE changed from 1249845 to 1248922 (-0%)
packages/core2-64-poky-linux/expat/expat-src: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat-staticdev: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat-staticdev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat/expat: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat/expat: PKGSIZE changed from 174073 to 174065 (-0%)
packages/core2-64-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.9.0", added "/usr/lib/libexpat.so.1.9.1"
packages/core2-64-poky-linux/expat/expat: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/expat: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_6_0/expat-2.6.0.tar.bz2 file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_6_1/expat-2.6.1.tar.bz2 file://run-ptest"
packages/core2-64-poky-linux/expat: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
Changes to packages/core2-64-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.9.0 to libexpat.so.1.9.1
  /usr/lib/cmake/expat-2.6.0 moved to /usr/lib/cmake/expat-2.6.1
  /usr/lib/libexpat.so.1.9.0 moved to /usr/lib/libexpat.so.1.9.1
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.9.0 to libexpat.so.1.9.1
  /usr/lib/cmake/expat-2.6.0 moved to /usr/lib/cmake/expat-2.6.1
  /usr/lib/libexpat.so.1.9.0 moved to /usr/lib/libexpat.so.1.9.1

--===============7365412351508880459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.9.0", added "/usr/lib/libexpat.so.1.9.1"
Changes to packages/core2-64-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.9.0 to libexpat.so.1.9.1
  /usr/lib/cmake/expat-2.6.0 moved to /usr/lib/cmake/expat-2.6.1
  /usr/lib/libexpat.so.1.9.0 moved to /usr/lib/libexpat.so.1.9.1
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.9.0 to libexpat.so.1.9.1
  /usr/lib/cmake/expat-2.6.0 moved to /usr/lib/cmake/expat-2.6.1
  /usr/lib/libexpat.so.1.9.0 moved to /usr/lib/libexpat.so.1.9.1

--===============7365412351508880459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.6.0-2.6.1.patch"

RnJvbSBlZmE5MDJmMDQ3YWNjY2ZjNThlOWIyNjdmMTRjNWFmNWJlOTVkMzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMDozMzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV4
cGF0OiB1cGdyYWRlIDIuNi4wIC0+IDIuNi4xCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0
L3tleHBhdF8yLjYuMC5iYiA9PiBleHBhdF8yLjYuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9leHBhdC97ZXhwYXRfMi42LjAuYmIgPT4gZXhwYXRfMi42LjEuYmJ9ICg5MiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi42LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdF8yLjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjYuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi42LjEuYmIKaW5kZXggMWY5ZjdiMjY5YS4uOWJk
YzNiNjIwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi42LjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi42LjEuYmIKQEAgLTE1LDcg
KzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvUl8ke1ZFUlNJ
T05fVEFHfS9leHBhdC0ke1BWfS50YXIuYnoyICBcCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzLyIKIFVQU1RSRUFNX0NIRUNL
X1JFR0VYID0gInJlbGVhc2VzL3RhZy9SXyg/UDxwdmVyPi4rKSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImZmNjBlNmE2YjZjZTU3MGFlMDEyZGM3YjczMTY5YzdmZGY0YjZiZjA4YzEyZWQwZWM2
ZjU1NzM2Yjc4ZDg1YmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDY3N2Q5NTdjMGM2Y2IyYTMz
MjExMDE5NDQ1NzRjMjQxMTNiNjM3YzdhYjFjZjA2NTlhMjdjNWJhYmMyMDFmZCIKIAogRVhUUkFf
T0VDTUFLRTpjbGFzcy1uYXRpdmUgKz0gIi1ERVhQQVRfQlVJTERfRE9DUz1PRkYiCiAKLS0gCjIu
NDIuMAoK

--===============7365412351508880459==--

