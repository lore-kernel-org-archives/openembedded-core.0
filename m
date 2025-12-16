Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E5CD5E131
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17181.1765872135681406811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ex/twTD6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q4XwjQbz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b262ea3bf-f7309984-3717-49b3-b37b-20508faa2330-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dX3R4B54KXQOsb+5v4pNPAxu69DTgRTTZb61TZAh9ao=;
	b=ex/twTD6xw+N7BnbOKc+91RnTw17Zh43aAB21mZ5wsNDnW9y313DfQNMYo53Dbnf
	j0dpsexgiiwTu1HNo89hWPXikf6C/CkRHxzy0pwfXOlULAEMrq7hw6A2+zHaPrh7XLR
	E+yQJVcdEiA8QeH8doBB2hzd8Gv+ECPzyscB0HOo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dX3R4B54KXQOsb+5v4pNPAxu69DTgRTTZb61TZAh9ao=;
	b=Q4XwjQbzM3ZO542R8ZI49cZm/ALm1eRPwroyy4ciOq+x0lx+97gyhD2RbvzBAcMt
	fkQvo6ZJ1otbXZlosHiwd8QnJFiuGlGqKsRQKpys7Ye/A5yMp48WszU5M4tV5lFGgeZ
	HQsThqA54EG+QvLNknVoKHdVMVAAIRo9Tei5gQ7Q=
Content-Type: multipart/mixed; boundary="===============8399009293951630653=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.6.2 SUCCEEDED
Message-ID: <0101019b262ea3bf-f7309984-3717-49b3-b37b-20508faa2330-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227830

--===============8399009293951630653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.5.0-2.6.2.patch
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
From 612512dccd5b4313be2b08d88b2164ea579e48ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:35:41 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.5.0 -> 2.6.2

---
 .../{python3-urllib3_2.5.0.bb => python3-urllib3_2.6.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.5.0.bb => python3-urllib3_2.6.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
index 62fdf8e345..3957818f6f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
+SRC_URI[sha256sum] = "016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8399009293951630653==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.5.0-2.6.2.patch"

RnJvbSA2MTI1MTJkY2NkNWI0MzEzYmUyYjA4ZDg4YjIxNjRlYTU3OWU0OGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MzU6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi41LjAgLT4gMi42LjIKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi41LjAuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuNi4yLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuNS4wLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjYuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjUuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNi4yLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjYuMi5iYgppbmRleCA2MmZkZjhlMzQ1Li4zOTU3ODE4ZjZmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjUu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjYuMi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBlY2RhIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiM2ZjNDc3MzNjN2U0MTlkNGJjM2Y2YjNkYzJiNGY4OTBiYjc0
MzkwNmEzMGQ1NmJhNGE1YmZhNGJiZmY5Mjc2MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMTZm
OWM5OGJiN2U5ODA4NWNiMmI0YjE3Yjg3ZDJjNzAyOTc1NjY0ZTRmMDYwYzY1MzJlNjRkMWMxYTVl
Nzk3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============8399009293951630653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info -> /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed

--===============8399009293951630653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-urllib3: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.5.0.tar.gz;downloadfilename=urllib3-2.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.6.2.tar.gz;downloadfilename=urllib3-2.6.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.5.0 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.5.0" to "2.6.2"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info -> /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 858521 to 871860 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.5.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed

--===============8399009293951630653==--

