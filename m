Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B16C48BED
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88275.1705340028984120907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PCM5WOcO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e45h2lKv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fcbba-3b41f062-f302-4120-b88a-ffb002952c6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nxqjFMgFpQ+3metr3abuIJnVe3PJbTi5LjxY0KYMXUA=;
	b=PCM5WOcOrx+Rd0aie9cPOCXdV+0bdZ1rxf/AOrAqTnoTLMG7TL0Kp4v/CxAvEOWA
	VM9xW3x+BFWOJXNl6P5NirmpZRLKcIs3RIuO3nLRO3G2qDp1gquGeFeWteY+MrJJ3+X
	GHQwuXxgN/r6fvEMwVBC1h8TidkmByjfk2QrNQsI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nxqjFMgFpQ+3metr3abuIJnVe3PJbTi5LjxY0KYMXUA=;
	b=e45h2lKvqnOqO8NgXfv7UVYs5vHl9lbzLaY9H/zZJABtLqTlbohWkHCjB2WMxsJ9
	lMhfO3uWsmiUNGHaamwAPTWi/UfLvb/g/F0oYWjO8XhFGH+/wkwUrWg2nqUHcbfRFzx
	iG1Hhkl9klyav+sWUQ64mpHu32+PKeTFeu+4xAuo=
Content-Type: multipart/mixed; boundary="===============2378451382805358703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.1.8 SUCCEEDED
Message-ID: <0101018d0e2fcbba-3b41f062-f302-4120-b88a-ffb002952c6a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193730

--===============2378451382805358703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.1.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.11.29-2024.1..patch
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
From 9b8da39fe3fd4c0ff57becde4ff106218a716f81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:22:02 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2023.11.29 -> 2024.1.8

---
 ...iers_2023.11.29.bb => python3-trove-classifiers_2024.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.11.29.bb => python3-trove-classifiers_2024.1.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
index a06d08455c..9e7e61a37e 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ff8f7fd82c7932113b46e7ef6742c70091cc63640c8c65db00d91f2e940b9514"
+SRC_URI[sha256sum] = "6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.42.0


--===============2378451382805358703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.2.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/WHEEL was removed

--===============2378451382805358703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.11.29.tar.gz;downloadfilename=trove-classifiers-2023.11.29.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.1.8.tar.gz;downloadfilename=trove-classifiers-2024.1.8.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.11.29" to "2024.1.8"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 91204 to 91754 (+1%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.11.29 [default] to 2024.1.8 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.11.29" to "2024.1.8"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.2.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.11.29.dist-info/WHEEL was removed

--===============2378451382805358703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.11.29-2024.1..patch"

RnJvbSA5YjhkYTM5ZmUzZmQ0YzBmZjU3YmVjZGU0ZmYxMDYyMThhNzE2ZjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MjI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjMuMTEuMjkgLT4gMjAyNC4xLjgK
Ci0tLQogLi4uaWVyc18yMDIzLjExLjI5LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNf
MjAyNC4xLjguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10
cm92ZS1jbGFzc2lmaWVyc18yMDIzLjExLjI5LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNC4xLjguYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuMTEuMjkuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4xLjgu
YmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuMTEuMjkuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjEuOC5iYgppbmRleCBhMDZkMDg0NTVjLi45ZTdlNjFhMzdlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy4x
MS4yOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNC4xLjguYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNsYXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUt
Mi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMy
NGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZjhmN2ZkODJj
NzkzMjExM2I0NmU3ZWY2NzQyYzcwMDkxY2M2MzY0MGM4YzY1ZGIwMGQ5MWYyZTk0MGI5NTE0Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjZlMzZjYWY0MzBmZjY0ODVjNGI1N2E0YzZiMzY0YTEzZjZh
ODk4ZDE2Yjk0MTdjNmMzNzQ2N2U1OWMxNGIwNWEiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0
dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0CiAKLS0gCjIuNDIuMAoK

--===============2378451382805358703==--

