Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7743CA0EEE
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.88822.1754057290654614052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PWyO4LK0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mmgoE5di;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019865f631a2-46f55e52-5bd4-4423-b34d-b5317b52a2df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gHzMjcbe7TdulQgYyeOUWlR0HjUVBhLpinQaRe7pYUQ=;
	b=PWyO4LK0N8ekHyS06iNVBcNh3VxCOKU4ZcCZFAYybK7NTU0OiTnJTabGlkH02q6J
	flz2/oirItxwuMtyd25NHfy45fKevROPzJPQlnFreovoxrIYtKQzGrPWpHtgGSks411
	3Vo9r0pMdifwUYCfAVOH7ikqowoCqaeAEJaMatfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gHzMjcbe7TdulQgYyeOUWlR0HjUVBhLpinQaRe7pYUQ=;
	b=mmgoE5diHe0w8PkBn9lVUwcXuKpwgDpUOLtrSqkCdwzMET7DxGPmoAlwnyUhc6fx
	+1KL6CPfLZnAq8j5fzYv49wynAqbADhRsXGnPNu/OrAWoxCKrypA0G9ri8AuTIcw99q
	HTSO3thdVnxQwsTToTwX15nP2PD87qyaeXOKjp3o=
Content-Type: multipart/mixed; boundary="===============1396510202260271924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.23.2 SUCCEEDED
Message-ID: <0101019865f631a2-46f55e52-5bd4-4423-b34d-b5317b52a2df-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221336

--===============1396510202260271924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.23.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.23.1-5.23.2.patch
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
From 7bf3f94e9d7f656a24251e10b7aeba54937cd04a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 13:35:56 +0000
Subject: [PATCH] debianutils: upgrade 5.23.1 -> 5.23.2

---
 .../{debianutils_5.23.1.bb => debianutils_5.23.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.23.1.bb => debianutils_5.23.2.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.23.1.bb b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.23.1.bb
rename to meta/recipes-support/debianutils/debianutils_5.23.2.bb
index 96ea9063bf..b2e984f7dc 100644
--- a/meta/recipes-support/debianutils/debianutils_5.23.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "ab0eaf33b783ba578773af2557753d2b973ba5bb"
+SRCREV = "b999bb0969471d302f1db85e58f17dcb64f274c2"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============1396510202260271924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.23.1-5.23.2.patch"

RnJvbSA3YmYzZjk0ZTlkN2Y2NTZhMjQyNTFlMTBiN2FlYmE1NDkzN2NkMDRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMzozNTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuMjMuMSAtPiA1LjIzLjIKCi0tLQogLi4uL3tkZWJpYW51dGls
c181LjIzLjEuYmIgPT4gZGViaWFudXRpbHNfNS4yMy4yLmJifSAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMjMuMS5iYiA9PiBk
ZWJpYW51dGlsc181LjIzLjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMy4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0
aWxzXzUuMjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMv
ZGViaWFudXRpbHNfNS4yMy4yLmJiCmluZGV4IDk2ZWE5MDYzYmYuLmIyZTk4NGY3ZGMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjMu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjIzLjIuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZGVi
aWFuL2NvcHlyaWdodDttZDU9NGI2NjdmMzA0MTFkMjFiYzhmZDdkYjg1ZDUwMmE4ZTkKIFNSQ19V
UkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kZWJpYW4vZGViaWFudXRpbHMuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPWRlYmlhbi8ke1BWfSBcCiAgICAgICAgICAgICIK
IAotU1JDUkVWID0gImFiMGVhZjMzYjc4M2JhNTc4NzczYWYyNTU3NzUzZDJiOTczYmE1YmIiCitT
UkNSRVYgPSAiYjk5OWJiMDk2OTQ3MWQzMDJmMWRiODVlNThmMTdkY2I2NGYyNzRjMiIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============1396510202260271924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 93936 to 93632 (-0%)
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.23.1" to "5.23.2"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.23.1 [default] to 5.23.2 [default]
packages/core2-64-poky-linux/debianutils: SRC_URI changed from "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.23.1" to "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.23.2"

--===============1396510202260271924==--

