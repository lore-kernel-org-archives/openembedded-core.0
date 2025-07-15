Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B089C87FCC
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12164.1752594932763452332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k4EoPvWf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bG58LC5d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980ecc7931-a2baf230-1ff2-4b02-8990-3c9f90af0555-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=10C8OTXnKeNQF1ddAl5vr23ecqtmEUbzd5ORoFA0B58=;
	b=k4EoPvWfNDp7T2lJnnejkzDtvGtgQMTSDuvt/NRxlPKTm/MpcF33orQ2swsT6Hbd
	WI08FbdX7xwS0neweERXzQBH+xW8EamurhFC03ik4+LiD1CDLCPGW7K4BGOjoIVwc1M
	Uldl5LKxzhtDff6tq6Mnm3ngdRATtyJjU87J/JE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=10C8OTXnKeNQF1ddAl5vr23ecqtmEUbzd5ORoFA0B58=;
	b=bG58LC5d3BEzpnOJ+SSbGS5UzCOcELN/xB4ivD+pqH1jNCE5c27yFaTo8SQsut4K
	Qk70ol0J7idC6Vjfpk2Il9gDXWH+XU5j9Sj23GGCQpDrQ8IjoIs2Eo3K+2kef6eOSHe
	oluudo6oyqqFGut0F1SuLrXeNDl5xxJywqF0lEOE=
Content-Type: multipart/mixed; boundary="===============8338836177933236822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.10 SUCCEEDED
Message-ID: <010101980ecc7931-a2baf230-1ff2-4b02-8990-3c9f90af0555-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220332

--===============8338836177933236822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.5-1.8.10.patch
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
From a96f2ffa1243988febd1c0e6558f21836a4ecbb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:31:22 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.5 -> 1.8.10

---
 .../erofs-utils/{erofs-utils_1.8.5.bb => erofs-utils_1.8.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.5.bb => erofs-utils_1.8.10.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
index 2bedd6e16b..3964ed8f5a 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "7bc147fafd53a2a9ff7c22399491079e5bfffafc"
+SRCREV = "51b5939b5f783221310d25146e6a2019ba8129b6"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============8338836177933236822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.5-1.8.10.patch"

RnJvbSBhOTZmMmZmYTEyNDM5ODhmZWJkMWMwZTY1NThmMjE4MzZhNGVjYmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6MzE6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjguNSAtPiAxLjguMTAKCi0tLQogLi4uL2Vyb2ZzLXV0aWxz
L3tlcm9mcy11dGlsc18xLjguNS5iYiA9PiBlcm9mcy11dGlsc18xLjguMTAuYmJ9IHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL3tlcm9mcy11dGlsc18xLjguNS5iYiA9PiBl
cm9mcy11dGlsc18xLjguMTAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOC41LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOC4xMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMt
dXRpbHNfMS44LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGls
cy9lcm9mcy11dGlsc18xLjguMTAuYmIKaW5kZXggMmJlZGQ2ZTE2Yi4uMzk2NGVkOGY1YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGls
c18xLjguMTAuYmIKQEAgLTUsNyArNSw3IEBAIFNFQ1RJT04gPSAiYmFzZSIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTczMDAxZDgwNGVhMWUzZDg0MzY1ZjY1MjI0MmNj
YTIwIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0L3RyZWUvUkVBRE1FIgogCi1TUkNSRVYgPSAi
N2JjMTQ3ZmFmZDUzYTJhOWZmN2MyMjM5OTQ5MTA3OWU1YmZmZmFmYyIKK1NSQ1JFViA9ICI1MWI1
OTM5YjVmNzgzMjIxMzEwZDI1MTQ2ZTZhMjAxOWJhODEyOWI2IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMu
Z2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRB
R1JFR0VYID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKLS0gCjIuNDcuMQoK

--===============8338836177933236822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2070064 to 2158752 (+4%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 13129 to 13532 (+3%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.5 [default] to 1.8.10 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 546344 to 571048 (+5%)
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.8.5" to "1.8.10"
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.8.5 [default] to 1.8.10 [default]

--===============8338836177933236822==--

