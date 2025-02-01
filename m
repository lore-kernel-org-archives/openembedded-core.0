Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C01C021AE
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42635.1738416055133515208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bfgdmJAF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pkjR42sH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abe14a-83b2de6f-8375-4bd2-9e83-98e6dd09fb8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jRv/885RnOrIqi0Kdy0H+smGhjJ4ROxhZBIItGHNDOk=;
	b=bfgdmJAF0Jlh5d6EtEBhsP6BpWXYhQwOarbfsmYmwrJiQIESjG5ifN0F7p2QNKap
	kKcvde8vO1/u0UjJ4mT6oR/ZqCYBKUBHhnc5x8KwEA954p3ok1hK+VlEfFo+wFgvoP/
	XHyJjVjVe4U1mUc/irb3TxlI5n2AZmMc6ndK1jJk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jRv/885RnOrIqi0Kdy0H+smGhjJ4ROxhZBIItGHNDOk=;
	b=pkjR42sHPM9AYDo4p19o3PwlG8pV+kyrnosK5V55Er+1u7wbqQg50IRQTTt3+IFK
	ccH7pWJYy0IXNOvsjiMXXgIdMLPG2eqKbPx/i2e836C/wikIZeYhGeZyB0JiSgzN+yf
	QrsI6Rfv7+auBHqOHAkEk5laIDqaf2puTZ1Vszfw=
Content-Type: multipart/mixed; boundary="===============5063218077988610666=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.1.15.22 SUCCEEDED
Message-ID: <01010194c1abe14a-83b2de6f-8375-4bd2-9e83-98e6dd09fb8d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210545

--===============5063218077988610666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.1.15.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.10.21.16-2025.patch
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
From 7b283684b92a342f2243d9ef435c1ebc9e630e7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:41:18 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.10.21.16 ->
 2025.1.15.22

---
 ...24.10.21.16.bb => python3-trove-classifiers_2025.1.15.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.10.21.16.bb => python3-trove-classifiers_2025.1.15.22.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
index b63d39b784..eb7eb30554 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3"
+SRC_URI[sha256sum] = "90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.44.1


--===============5063218077988610666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.10.21.16.tar.gz;downloadfilename=trove_classifiers-2024.10.21.16.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.1.15.22.tar.gz;downloadfilename=trove_classifiers-2025.1.15.22.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.10.21.16" to "2025.1.15.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 92657 to 92988 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.10.21.16 [default] to 2025.1.15.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.10.21.16" to "2025.1.15.22"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed

--===============5063218077988610666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed

--===============5063218077988610666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.10.21.16-2025.patch"

RnJvbSA3YjI4MzY4NGI5MmEzNDJmMjI0M2Q5ZWY0MzVjMWViYzllNjMwZTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODo0MToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNC4xMC4yMS4xNiAtPgogMjAyNS4x
LjE1LjIyCgotLS0KIC4uLjI0LjEwLjIxLjE2LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS4xLjE1LjIyLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4xMC4yMS4xNi5iYiA9PiBweXRob24zLXRyb3Zl
LWNsYXNzaWZpZXJzXzIwMjUuMS4xNS4yMi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4xMC4y
MS4xNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFz
c2lmaWVyc18yMDI1LjEuMTUuMjIuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjQuMTAuMjEuMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjEuMTUuMjIuYmIKaW5kZXggYjYzZDM5Yjc4NC4u
ZWI3ZWIzMDU1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMTAuMjEuMTYuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMS4xNS4yMi5i
YgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJv
dmUtY2xhc3NpZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE3Y2JkMDU1ZDY3ZDVlOWQ5ZGU2MzI5M2E4NzMyOTQz
ZmFiYzIxNTc0ZTRjN2I3NGVkZjExMmI0OTI4Y2Y1ZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
OTBhZjc0MzU4ZDNhMDFiMzUzMmJjN2IzYzg4ZDhjNmEwOTRjMmZkNTBhNTYzZDEzZDk1NzYxNzkz
MjZkN2VkOSIKIAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogVVBTVFJFQU1f
Q0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDQuMQoK

--===============5063218077988610666==--

