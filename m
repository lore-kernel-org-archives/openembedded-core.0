Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8812C30659
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13421.1713248037012121393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O/ercovJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dNnfloPZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a6ca8-b94fd846-f50e-42ad-b2a7-30c35fba002d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1TjaLcB5wq1qPQWnlT9XwDRXYafXsmCVfO9P1MZ0JKc=;
	b=O/ercovJfI8+mr+2pdpDU8/asKeQmY7UA4gvap45wyjl4Nnz1w/QZQpeWQCwWb92
	JWdVAGrNSugHib8AUAEkqih9GKhI1e/clHasiDQMNGGpyrj5eXxy8mLh2uFuN4balBg
	TGV/YK3gbKZMCxi44USc0b3U6XaWQtw0xQi8jgPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1TjaLcB5wq1qPQWnlT9XwDRXYafXsmCVfO9P1MZ0JKc=;
	b=dNnfloPZRVjXiuXgpD7/N++PGWVnxophUGX+vAOD7pjIxIzwJcIGt5gOOQAkeKwK
	qs22gNKCp+KEMPt/KhR5hW+apQB7v63dkJvQeX0w6ptsoA6nkRHTbvtfn7JOIAOVyKB
	kmgWRTEHP0y+LiP36FyEW5GYcN9MtN1kKvzcK73M=
Content-Type: multipart/mixed; boundary="===============5918999488395004109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018ee58a6ca8-b94fd846-f50e-42ad-b2a7-30c35fba002d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198268

--===============5918999488395004109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtd-utils* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.1.6-2.2.0.patch
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
From 6560c0e756ee957c4699c12d0ba200e72ffdcba7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:42:08 +0000
Subject: [PATCH] mtd-utils: upgrade 2.1.6 -> 2.2.0

---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 4b27528f64..a40d79c864 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.6"
+PV = "2.2.0"
 
-SRCREV = "219e741f40f4801bae263e0b581b64888d887b4a"
+SRCREV = "31e990c56aba7584cde310685d663bb122f16003"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============5918999488395004109==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.6-2.2.0.patch"

RnJvbSA2NTYwYzBlNzU2ZWU5NTdjNDY5OWMxMmQwYmEyMDBlNzJmZmRjYmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NDI6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dGQtdXRpbHM6IHVwZ3JhZGUgMi4xLjYgLT4gMi4yLjAKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRk
LXV0aWxzX2dpdC5iYgppbmRleCA0YjI3NTI4ZjY0Li5hNDBkNzljODY0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiCkBAIC0xMSw5ICsxMSw5IEBAIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiBERVBFTkRTID0gInps
aWIgZTJmc3Byb2dzIHV0aWwtbGludXgiCiBSREVQRU5EUzptdGQtdXRpbHMtdGVzdHMgKz0gImJh
c2giCiAKLVBWID0gIjIuMS42IgorUFYgPSAiMi4yLjAiCiAKLVNSQ1JFViA9ICIyMTllNzQxZjQw
ZjQ4MDFiYWUyNjNlMGI1ODFiNjQ4ODhkODg3YjRhIgorU1JDUkVWID0gIjMxZTk5MGM1NmFiYTc1
ODRjZGUzMTA2ODVkNjYzYmIxMjJmMTYwMDMiCiBTUkNfVVJJID0gImdpdDovL2dpdC5pbmZyYWRl
YWQub3JnL210ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKLS0gCjIuNDIuMAoK

--===============5918999488395004109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtd-utils: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 8344640 to 8350176 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGSIZE changed from 38317 to 38489 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PKGSIZE changed from 120944 to 120912 (-0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1436676 to 1440713 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGSIZE changed from 366572 to 366732 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.6" to "2.2.0"

--===============5918999488395004109==--

