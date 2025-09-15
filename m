Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8542CAC5A7
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.30932.1757937284671270594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HwJPHuFT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A+n0CWk8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101994d3a33ca-b3465540-87d9-4778-acd2-bfd38218c855-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=04oGgEdslUnjkzlUMs2WQZcajXJm/13IEOzh9Kdy5pk=;
	b=HwJPHuFToIzpnG43zkoslYErunjEW/HVWZ1Nk9D9Jyryq8sKCfkyyuhgGF502glk
	dTfF3OgEtH2jRWtDpeg2YnXP/2MpAnrCzGyJAK6YeSOdzdX+Q6Rg+hU7fL86OmWmq4z
	ERy6fCqVo0Ju9B67DGG3UFEwZ26jrlmmWtvTXoQs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=04oGgEdslUnjkzlUMs2WQZcajXJm/13IEOzh9Kdy5pk=;
	b=A+n0CWk8EQmHhIQbKfRNI83BCelbmEw9eOHjBX8IuZ3cocvwXC7AWYl+1KxvgfKX
	ROu1d3vd6XK5SmaAlB+5jpyI30ZXVdtvfLKJ2sBcC8Y5d3FXQK0Qvqls9YAmhVblRwg
	8sPL+u9CIQ2SHK9Dd/krHK4wxY+cT0DMQI0Nd1yA=
Content-Type: multipart/mixed; boundary="===============2136609295239424020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.9.11.17 SUCCEEDED
Message-ID: <010101994d3a33ca-b3465540-87d9-4778-acd2-bfd38218c855-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223434

--===============2136609295239424020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.9.11.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.9.8.13-2025.9.patch
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
From 4b5d160e7782b6e0c54a44feb5ae81ff78865559 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:32:17 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.9.8.13 ->
 2025.9.11.17

---
 ...2025.9.8.13.bb => python3-trove-classifiers_2025.9.11.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.9.8.13.bb => python3-trove-classifiers_2025.9.11.17.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
index 8586eddc70..4bbdd243ef 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2de91c8f286b7fea55072061924f69e7f3bdf7a9cb63719c90090e41c6657d3a"
+SRC_URI[sha256sum] = "931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============2136609295239424020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.9.8.13.tar.gz;downloadfilename=trove_classifiers-2025.9.8.13.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.9.11.17.tar.gz;downloadfilename=trove_classifiers-2025.9.11.17.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.9.8.13" to "2025.9.11.17"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 95512 to 95627 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.9.8.13 [default] to 2025.9.11.17 [default]
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/WHEEL was removed

--===============2136609295239424020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.9.8.13-2025.9.patch"

RnJvbSA0YjVkMTYwZTc3ODJiNmUwYzU0YTQ0ZmViNWFlODFmZjc4ODY1NTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MzI6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuOS44LjEzIC0+CiAyMDI1Ljku
MTEuMTcKCi0tLQogLi4uMjAyNS45LjguMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjkuMTEuMTcuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjkuOC4xMy5iYiA9PiBweXRob24zLXRyb3ZlLWNs
YXNzaWZpZXJzXzIwMjUuOS4xMS4xNy5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS45LjguMTMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS45LjExLjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1Ljku
OC4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjUuOS4xMS4xNy5iYgppbmRleCA4NTg2ZWRkYzcwLi40YmJkZDI0
M2VmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNS45LjguMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuOS4xMS4xNy5iYgpAQCAtMyw3
ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3Np
ZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjJkZTkxYzhmMjg2YjdmZWE1NTA3MjA2MTkyNGY2OWU3ZjNiZGY3YTlj
YjYzNzE5YzkwMDkwZTQxYzY2NTdkM2EiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTMxY2E5ODQx
YTVlOWM5NDA4YmMyYWU2N2I1MGQyOGFjZjg1YmVmNTYyMTliNTY4NjA4NzZkZDFmMmQwMjRkZCIK
IAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogVVBTVFJFQU1fQ0hFQ0tfUFlQ
SV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDcuMQoK

--===============2136609295239424020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.8.13.dist-info/WHEEL was removed

--===============2136609295239424020==--

