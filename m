Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367A9C98307
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3734.1790055734411703759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tb49xPKD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pQkU+6zM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0c7a2d95d-2d012705-628d-4bc6-8a1c-fd2051ef3e8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D8fsndBte9yAdVINFN2WrQ3cqZJf0l/AVzEckw914O4=;
	b=Tb49xPKDm72jjKMVsX4ZdlDeGlYn5ju7WTBKWDYzGq3dmeNLAnzdgu7bluvVV4Ek
	nPxtxImN5IY6YinNnnv4mXOGo+MkgFhpMmaP9b9bPSD7cX1Pi4Hkz2ykJn1kJm5EYLT
	kzlUCmx5SUyV0IpSJ0SQgvFzOxgAQSftrRkoWkFk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D8fsndBte9yAdVINFN2WrQ3cqZJf0l/AVzEckw914O4=;
	b=pQkU+6zMd9Z0abJXKdu9hVq8ebxOf1Zu3BpB89AgoRWm3X7bvwuufgSzO3K9rSqI
	Zp7NqqK6469KOCxNeKjzlHJzPoFs7TMs3J7TLYjci4Vywed22U7G6qaSKoc66d+69mh
	W1nFfOXil+XsUNRpCwY4uhHBfSbAGM6YwBec5CZo=
Content-Type: multipart/mixed; boundary="===============8182264159533529175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2026.9.21.13 SUCCEEDED
Message-ID: <010101a0c7a2d95d-2d012705-628d-4bc6-8a1c-fd2051ef3e8d-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246373

--===============8182264159533529175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2026.9.21.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2026.6.1.19-2026.9.patch
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
From 8f0203cac6d40f501d210cd5e5af88805384ff0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 22 Sep 2026 05:27:05 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2026.6.1.19 ->
 2026.9.21.13

---
 ...2026.6.1.19.bb => python3-trove-classifiers_2026.9.21.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.6.1.19.bb => python3-trove-classifiers_2026.9.21.13.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
index 99282cf3dc..b24753e381 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c5132b4b61a829d11cfbd2d72e97f20a45ed6edb95e45c5efdeb5e00836b2745"
+SRC_URI[sha256sum] = "0a9ebc8d4e2f3e8a22848c5258033035bec17a3012ac3fea16dbaa764489eb71"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.47.1


--===============8182264159533529175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed

--===============8182264159533529175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2026.6.1.19-2026.9.patch"

RnJvbSA4ZjAyMDNjYWM2ZDQwZjUwMWQyMTBjZDVlNWFmODg4MDUzODRmZjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjIgU2VwIDIwMjYgMDU6Mjc6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjYuNi4xLjE5IC0+CiAyMDI2Ljku
MjEuMTMKCi0tLQogLi4uMjAyNi42LjEuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI2LjkuMjEuMTMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjYuMS4xOS5iYiA9PiBweXRob24zLXRyb3ZlLWNs
YXNzaWZpZXJzXzIwMjYuOS4yMS4xMy5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNi42LjEuMTku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNi45LjIxLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjYu
MS4xOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjYuOS4yMS4xMy5iYgppbmRleCA5OTI4MmNmM2RjLi5iMjQ3NTNl
MzgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNi42LjEuMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYuOS4yMS4xMy5iYgpAQCAtMyw3
ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3Np
ZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImM1MTMyYjRiNjFhODI5ZDExY2ZiZDJkNzJlOTdmMjBhNDVlZDZlZGI5
NWU0NWM1ZWZkZWI1ZTAwODM2YjI3NDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE5ZWJjOGQ0
ZTJmM2U4YTIyODQ4YzUyNTgwMzMwMzViZWMxN2EzMDEyYWMzZmVhMTZkYmFhNzY0NDg5ZWI3MSIK
IAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogCi0tIAoyLjQ3LjEKCg==

--===============8182264159533529175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.6.1.19.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.9.21.13.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2026.6.1.19" to "2026.9.21.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 113875 to 113955 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2026.6.1.19 [default] to 2026.9.21.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2026.6.1.19" to "2026.9.21.13"
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.9.21.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed

--===============8182264159533529175==--

