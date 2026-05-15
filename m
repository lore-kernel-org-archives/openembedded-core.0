Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A27CD5BB2
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34829.1778851231040779576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oH2MWe6+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r7oGdZq1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e2bcbc0c0-af011d53-8340-4f09-a8c8-68b496aedf26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DdrdOGLjXzYTSGM8qo8+OX6LhjKubh08cv4dwjt7WBk=;
	b=oH2MWe6+i1mJprIroSrRCZrxSkfR+BuisaSgyHf5AtmonfgXKoybVOhoKI2ny7mE
	e6zgvhJNJAgd1jLcMSoV0m8gI+wS/4R7Po3Pvi5z5PI7uvUnQ63kDQ1wpWa9/T45AJH
	7to8nL9wHrpXq8Sa3+HVbOQc/d7ZknNl0eBewF7U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DdrdOGLjXzYTSGM8qo8+OX6LhjKubh08cv4dwjt7WBk=;
	b=r7oGdZq1++snp6zEfLKrnF3hud6K/hfDBbvPQAWbD0Veu46wdt0wkvLw4sH4P77q
	xo7uNk224wb2hx9mzbD1XWuNa9GV/XI5mGpnP84cGi7+zkPU7KO+G7A93jtIoLwPSbu
	WkzJ1lCy8z8fadaH3y9tv59r+uDQuXK4hAQVjcyA=
Content-Type: multipart/mixed; boundary="===============0754666665328700736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2026.5.7.17 SUCCEEDED
Message-ID: <0101019e2bcbc0c0-af011d53-8340-4f09-a8c8-68b496aedf26-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237122

--===============0754666665328700736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2026.5.7.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2026.4.28.13-2026..patch
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
From e79bf04f685e677de56bc9f9796343ff65461b4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:06:12 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2026.4.28.13 ->
 2026.5.7.17

---
 ...2026.4.28.13.bb => python3-trove-classifiers_2026.5.7.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.4.28.13.bb => python3-trove-classifiers_2026.5.7.17.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.5.7.17.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.5.7.17.bb
index 1ed81eccff..1339af03a8 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.5.7.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676"
+SRC_URI[sha256sum] = "a04a48f8f0a787cb996514d3969ac7608aa3c60cb15d073c1e02801e60533e80"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.47.1


--===============0754666665328700736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2026.4.28.13-2026..patch"

RnJvbSBlNzliZjA0ZjY4NWU2NzdkZTU2YmM5Zjk3OTYzNDNmZjY1NDYxYjRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MDY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjYuNC4yOC4xMyAtPgogMjAyNi41
LjcuMTcKCi0tLQogLi4uMjAyNi40LjI4LjEzLmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNi41LjcuMTcuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjQuMjguMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI2LjUuNy4xNy5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNi40LjI4LjEz
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZp
ZXJzXzIwMjYuNS43LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjQu
MjguMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10
cm92ZS1jbGFzc2lmaWVyc18yMDI2LjUuNy4xNy5iYgppbmRleCAxZWQ4MWVjY2ZmLi4xMzM5YWYw
M2E4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNi40LjI4LjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjUuNy4xNy5iYgpAQCAtMyw3
ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3Np
ZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImM4NWJiOGE1M2MzZGU3MzMwZDE2OTliODQ0ZWQ5ZmI4MDlhNjAyYTA5
YWMxNWRjNzlhZDZkMWE1MDliZTA2NzYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA0YTQ4Zjhm
MGE3ODdjYjk5NjUxNGQzOTY5YWM3NjA4YWEzYzYwY2IxNWQwNzNjMWUwMjgwMWU2MDUzM2U4MCIK
IAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogCi0tIAoyLjQ3LjEKCg==

--===============0754666665328700736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.4.28.13.tar.gz;downloadfilename=trove_classifiers-2026.4.28.13.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.5.7.17.tar.gz;downloadfilename=trove_classifiers-2026.5.7.17.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2026.4.28.13" to "2026.5.7.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2026.4.28.13 [default] to 2026.5.7.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 113532 to 113636 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was removed

--===============0754666665328700736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.7.17.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was removed

--===============0754666665328700736==--

