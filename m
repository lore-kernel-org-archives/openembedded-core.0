Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69FDC8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1437.1751386811076688731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QOXDAH3M;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JNo5mMWm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6c9e86b-994ca8fd-eb7e-450b-b0db-7df5e55cc3a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0lyGOdB0CaOIvRmxdYtsq+il2+hiUlhxb5P+qngKv8g=;
	b=QOXDAH3MyufTYXctI/6Xo0+XrZ3QHoLAnEidLuVtb0IujIHGQsYkC/l+eU7unfin
	OLMBmM5y45etfMbvwukGFHlCa+D0Hwtpw+/JbLc7j4QUFtE2vprbdpw9y90YpjrvP3E
	9M1620vqmOXE+CxIula05Wi18YucREcP+hoMY0Y8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0lyGOdB0CaOIvRmxdYtsq+il2+hiUlhxb5P+qngKv8g=;
	b=JNo5mMWmLC5r3qT0Jho8oCr8cNczqDKGq//eAHupIRNDPfxUwO8jeadAWj0Rs6om
	ZQEBNv8tJ+P2I7Wh9QSXRvT8sfrlserijENi/ZAZI8svRHz3fEL+8kn8B8wlcEAxvPF
	WEm3xWpK4I4pNRS9uMiYpiGoHGb3jg8L7uR+nHPM=
Content-Type: multipart/mixed; boundary="===============6057864919761846362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 d8a8358a7207bd81d0c38dca2cf27a48bf411341 SUCCEEDED
Message-ID: <01010197c6c9e86b-994ca8fd-eb7e-450b-b0db-7df5e55cc3a4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219624

--===============6057864919761846362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *d8a8358a7207bd81d0c38dca2cf27a48bf411341* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From 8e016bf9792d84560f1f52bebf116c66c35237f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:32:14 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index f3944aebf0..79ce796092 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
+SRCREV = "d8a8358a7207bd81d0c38dca2cf27a48bf411341"
 
 PV = "0.1+git"
 
-- 
2.47.1


--===============6057864919761846362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA4ZTAxNmJmOTc5MmQ4NDU2MGYxZjUyYmViZjExNmM2NmMzNTIzN2Y3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODozMjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IGYzOTQ0YWViZjAuLjc5Y2U3OTYwOTIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gImM1MTVlYTJlMWNlYmZiZjlkODFhYTZh
NWMxYmY2N2E3OWQyYTdlNTgiCitTUkNSRVYgPSAiZDhhODM1OGE3MjA3YmQ4MWQwYzM4ZGNhMmNm
MjdhNDhiZjQxMTM0MSIKIAogUFYgPSAiMC4xK2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============6057864919761846362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72

--===============6057864919761846362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 358872 to 354864 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 227386 to 225680 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 127984 to 127632 (-0%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+d8a8358a72

--===============6057864919761846362==--

