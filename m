Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540D9CED24E
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12121.1763224723505291008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rdM7kJC+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Zg9pO9Mc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a88621db2-d96e3673-34ed-47ff-b208-2d565edf88cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hzoa12F247x0TSGUblCEB4jPDEtIVB2WoHF1gGfqolc=;
	b=rdM7kJC+4UXyEqhexMXbnrwAYLL6ppcVvc+F18B9+HuYwbU3SmHmRbh0jLa16MXw
	Lihpmdue1XdE1eEj2TgpD2Sp0rSgpRBEmxX1Ad0+Xj0582v8xLYBXPxfQKThAODXIMW
	/ciKCSs8RURvrPtxFnxFba7/w7HqJ4ue2G1i6g1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hzoa12F247x0TSGUblCEB4jPDEtIVB2WoHF1gGfqolc=;
	b=Zg9pO9McAhYUgLwHhlq+btyQOMPtrPwrTu5wgT/0IlPvVnvZc/LWp/W9idJsVCxC
	z2Q1qgF5OxS5L0tbSZUApZ+Pw+PerbcRSTkKHBDBVMyBN27q0djpBBckeErF15BNZC9
	3Xb8YzMebPARIilMPiYmJ36Rk1h29FtbE4H7yMfc=
Content-Type: multipart/mixed; boundary="===============1126174472349477054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-calver: upgrading to 2025.10.20 SUCCEEDED
Message-ID: <0101019a88621db2-d96e3673-34ed-47ff-b208-2d565edf88cb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226349

--===============1126174472349477054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-calver* to *2025.10.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-calver-upgrade-2025.04.17-2025.10.20.patch
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
From b1ce90435c0e0e9dfa250469ebdbbce46ef910d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:57:57 +0000
Subject: [PATCH] python3-calver: upgrade 2025.04.17 -> 2025.10.20

---
 ...ython3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.17.bb
rename to meta/recipes-devtools/python/python3-calver_2025.10.20.bb
index 85ad18701c..0aa468e05a 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
+SRCREV = "36c6977d6e2d9b9912c2afb83b4e36bb1289dbdd"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============1126174472349477054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-calver: SRC_URI changed from "git://github.com/di/calver;branch=master;protocol=https;tag=2025.04.17" to "git://github.com/di/calver;branch=master;protocol=https;tag=2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dbg: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dbg: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dev: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-dev: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-doc: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-doc: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-locale: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-locale: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PKGSIZE changed from 2955 to 2987 (+1%)
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-ptest: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-src: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-src: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-staticdev: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver-staticdev: PV changed from "2025.04.17" to "2025.10.20"
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PKGSIZE changed from 18417 to 18418 (+0%)
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PKGV changed from 2025.04.17 [default] to 2025.10.20 [default]
packages/x86-64-v3-poky-linux/python3-calver/python3-calver: PV changed from "2025.04.17" to "2025.10.20"
Changes to packages/x86-64-v3-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed

--===============1126174472349477054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-calver (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-calver-native (sysroot):
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/calver-2025.10.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/calver-2025.4.17.dist-info/WHEEL was removed

--===============1126174472349477054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-calver-upgrade-2025.04.17-2025.10.20.patch"

RnJvbSBiMWNlOTA0MzVjMGUwZTlkZmEyNTA0NjllYmRiYmNlNDZlZjkxMGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6NTc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNhbHZlcjogdXBncmFkZSAyMDI1LjA0LjE3IC0+IDIwMjUuMTAuMjAKCi0tLQogLi4u
eXRob24zLWNhbHZlcl8yMDI1LjA0LjE3LmJiID0+IHB5dGhvbjMtY2FsdmVyXzIwMjUuMTAuMjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jYWx2ZXJfMjAy
NS4wNC4xNy5iYiA9PiBweXRob24zLWNhbHZlcl8yMDI1LjEwLjIwLmJifSAoODklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4w
NC4xNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAy
NS4xMC4yMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjUuMDQuMTcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAyNS4xMC4yMC5iYgpp
bmRleCA4NWFkMTg3MDFjLi4wYWE0NjhlMDVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjUuMDQuMTcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDI1LjEwLjIwLmJiCkBAIC00LDcg
KzQsNyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2RpL2NhbHZlcjticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0
dHBzO3RhZz0ke1BWfSIKLVNSQ1JFViA9ICIzYjc0YmRjZTM1ZjI4MTRlYjJiNjVkYjM5YTEzM2Q1
Yzg0OWRkZWE3IgorU1JDUkVWID0gIjM2YzY5NzdkNmUyZDliOTkxMmMyYWZiODNiNGUzNmJiMTI4
OWRiZGQiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRo
b24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============1126174472349477054==--

