Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B81C54E74
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2104.1706810405762863899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aC1Qtf8J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LOvBmNcJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d65d3f034-c3c31c2e-8e6c-4876-9d86-9d08e2c53d58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9+dLVdJNfG6XHn37ApN+wWdjk1bZBwIucNRU1pwaeRc=;
	b=aC1Qtf8JW9St3Cr4iOANE4gBeZC0aXAKs1++cvtU+Zl1gKdh2ZVRHKw4JTzoJT53
	HXlByOrG072TTLyM3Ij7GdfmJvWP7WYm7cf5RYK/SQvEH1qzMRkd/xb9KLu8nKDzRVR
	ovgyRnOpzImfWirAzZAC1LtB3zKBQbx9+hUho/CQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9+dLVdJNfG6XHn37ApN+wWdjk1bZBwIucNRU1pwaeRc=;
	b=LOvBmNcJdSUaprLNmwF0OH2UZR72DNcAFT+LO/RIa+zEvpXwEnAgnFeMGPOjlPL6
	PjeWkt0pijepkhGOgfbJJXKfAPuQJB8YNJYkWp1m1qJApBKY+BI4i4d0ENyUkmioWsM
	/tsgU5rNE/CO8PZqDNruH6V7E9ZLnV642xjdZ3lM=
Content-Type: multipart/mixed; boundary="===============1627347745990060446=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.21.1 SUCCEEDED
Message-ID: <0101018d65d3f034-c3c31c2e-8e6c-4876-9d86-9d08e2c53d58-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194629

--===============1627347745990060446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.21.0-1.21.1.patch
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
From fdcc927526aa673829c1ed42e95433624fb9150c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:39:48 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.21.0 -> 1.21.1

---
 ...{python3-hatchling_1.21.0.bb => python3-hatchling_1.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.21.0.bb => python3-hatchling_1.21.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
index 494e609319..09d936aa7d 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "5c086772357a50723b825fd5da5278ac7e3697cdf7797d07541a6c90b6ff754c"
+SRC_URI[sha256sum] = "bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.42.0


--===============1627347745990060446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.0.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.0.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info

--===============1627347745990060446==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.21.0-1.21.1.patch"

RnJvbSBmZGNjOTI3NTI2YWE2NzM4MjljMWVkNDJlOTU0MzM2MjRmYjkxNTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzozOTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjEuMCAtPiAxLjIxLjEKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjEuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjIxLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yMS4w
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yMS4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYgppbmRleCA0OTRlNjA5
MzE5Li4wOWQ5MzZhYTdkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgogREVQ
RU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjMDg2NzcyMzU3YTUwNzIzYjgyNWZkNWRhNTI3OGFjN2Uz
Njk3Y2RmNzc5N2QwNzU0MWE2YzkwYjZmZjc1NGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJh
NDQwNDUzYTIyNGU3ZDQ0Nzg0NTdmYTJlOGQ4YzM2MzM3NjViYWZhMDI5NzVhNmI1M2I5YmY5MTc5
ODBiYyIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
YwotLSAKMi40Mi4wCgo=

--===============1627347745990060446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.21.0.tar.gz;downloadfilename=hatchling-1.21.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.21.1.tar.gz;downloadfilename=hatchling-1.21.1.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.21.0" to "1.21.1"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 654994 to 654724 (-0%)
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.0.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.0.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info

--===============1627347745990060446==--

