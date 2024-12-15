Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A32FC02180
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.33343.1734254982070621269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hSpEV0mC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PFD9nGsF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a6f0e4-17281e34-18cb-4439-9e86-e01a7d86a1af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eg2eRAmjdUN7rdrKhF+YZtpU7MkHVj+g4AAfDElcmOs=;
	b=hSpEV0mCmVtEDVCz9JWuOkyVlt4lgfacCSGTV5FkdyNCOpIiUYL9XQwSuu9Qmgbq
	J3N3MnHATfuIYCa8+8mKPihutKDTOe92BVPqrkT9IIUECs58lU9doWxzW0BNm1r1Fpv
	kSvdQl4XSI8psiQlyPPrfShl8LwXJ4cRidLa7gfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eg2eRAmjdUN7rdrKhF+YZtpU7MkHVj+g4AAfDElcmOs=;
	b=PFD9nGsFW77FbieqfOshIzGaB7UZmJB6KdYyKzIZ//T+QUkhMmSSU2agFYp/vF6E
	pNnp66x72uMh9Gf4NXpK0GDwvdMlCkwYS64YnImoGCmkO6mBwRq8VUNIdRS48WeoaZ+
	UCp3Hb0EjiVyqLlqrgmYk1PbLHjkftjhMuAc2XRw=
Content-Type: multipart/mixed; boundary="===============0922919941654885892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.3 SUCCEEDED
Message-ID: <01010193c9a6f0e4-17281e34-18cb-4439-9e86-e01a7d86a1af-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208712

--===============0922919941654885892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.2-1.8.3.patch
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
From c4d6cf0dc9cb2ce38c29c857cc3cfbf05ece458f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:10:37 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.2 -> 1.8.3

---
 .../erofs-utils/{erofs-utils_1.8.2.bb => erofs-utils_1.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.2.bb => erofs-utils_1.8.3.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
index 4d8689f87c..996303c7f0 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "8bedd862edfbb9a5e54dd37abede29020dd8fdfb"
+SRCREV = "8d6c5d48615e23cd47cf9eb793904aedbb93ff4e"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.44.1


--===============0922919941654885892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1647592 to 1656952 (+1%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 12187 to 12349 (+1%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 558629 to 559989 (+0%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 455992 to 460120 (+1%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.8.2 [default] to 1.8.3 [default]

--===============0922919941654885892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.2-1.8.3.patch"

RnJvbSBjNGQ2Y2YwZGM5Y2IyY2UzOGMyOWM4NTdjYzNjZmJmMDVlY2U0NThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6MTA6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjguMiAtPiAxLjguMwoKLS0tCiAuLi4vZXJvZnMtdXRpbHMv
e2Vyb2ZzLXV0aWxzXzEuOC4yLmJiID0+IGVyb2ZzLXV0aWxzXzEuOC4zLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuOC4yLmJiID0+IGVy
b2ZzLXV0aWxzXzEuOC4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHNfMS44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9l
cm9mcy11dGlsc18xLjguMy5iYgppbmRleCA0ZDg2ODlmODdjLi45OTYzMDNjN2YwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS44LjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC4zLmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT03MzAwMWQ4MDRlYTFlM2Q4NDM2NWY2NTIyNDJjY2EyMCIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gIjhiZWRk
ODYyZWRmYmI5YTVlNTRkZDM3YWJlZGUyOTAyMGRkOGZkZmIiCitTUkNSRVYgPSAiOGQ2YzVkNDg2
MTVlMjNjZDQ3Y2Y5ZWI3OTM5MDRhZWRiYjkzZmY0ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdF
WCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCi0tIAoyLjQ0LjEKCg==

--===============0922919941654885892==--

