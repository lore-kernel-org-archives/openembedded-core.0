Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B14CD13BC
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.44645.1711994601572504973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FOK0nnjH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sBteu8l2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad47dca-bf1d771b-3379-4c34-9286-28fede8aa5ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zCIHYHkFkhXDG4jMAo4u+GpSewnUjM/OtqQiE4Ldp5M=;
	b=FOK0nnjHbDudeKner3LMYQWNnuracBUe4EaiTcqWdp9SuGJYGQxhT4hRKgocShUn
	PYeyOhsNKIztvuRbogmR1sqqz4pOUGeDeHrQGqgTRKnYtxwiNW+8lfr0LNLLYX/LHzY
	Aw13lKzKneo98Iy6tl/zCmqPSJx8Bqtr0O7gFbQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zCIHYHkFkhXDG4jMAo4u+GpSewnUjM/OtqQiE4Ldp5M=;
	b=sBteu8l2Z0I2o8MApEcdZ8UN4H71VAchzgd7HuNn9dBvo9p/XsZf7AmWSPNwW/c5
	En6f+CcCLOfSKq3dir750JJyZb0sx4OGwhaf1SDtPOin1XblE3CUmWB/yl8zQnzR7eZ
	Ra9JFZaOK2cnAAW/Bwiea1sAIocVcfBzU25jwMTU=
Content-Type: multipart/mixed; boundary="===============2923021902295026770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018e9ad47dca-bf1d771b-3379-4c34-9286-28fede8aa5ec-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197718

--===============2923021902295026770==
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
From ffbca5e7297864f24a65e2e9b74cbf8ddc0881f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:27:23 +0000
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


--===============2923021902295026770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.6-2.2.0.patch"

RnJvbSBmZmJjYTVlNzI5Nzg2NGYyNGE2NWUyZTliNzRjYmY4ZGRjMDg4MWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzoyNzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
ZC11dGlsczogdXBncmFkZSAyLjEuNiAtPiAyLjIuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRkL210ZC11dGlsc19naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQt
dXRpbHNfZ2l0LmJiCmluZGV4IDRiMjc1MjhmNjQuLmE0MGQ3OWM4NjQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKQEAgLTExLDkgKzExLDkgQEAgaW5oZXJp
dCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIERFUEVORFMgPSAiemxp
YiBlMmZzcHJvZ3MgdXRpbC1saW51eCIKIFJERVBFTkRTOm10ZC11dGlscy10ZXN0cyArPSAiYmFz
aCIKIAotUFYgPSAiMi4xLjYiCitQViA9ICIyLjIuMCIKIAotU1JDUkVWID0gIjIxOWU3NDFmNDBm
NDgwMWJhZTI2M2UwYjU4MWI2NDg4OGQ4ODdiNGEiCitTUkNSRVYgPSAiMzFlOTkwYzU2YWJhNzU4
NGNkZTMxMDY4NWQ2NjNiYjEyMmYxNjAwMyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmluZnJhZGVh
ZC5vcmcvbXRkLXV0aWxzLmdpdDticmFuY2g9bWFzdGVyIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0
IgotLSAKMi40Mi4wCgo=

--===============2923021902295026770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtd-utils: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 8344640 to 8350176 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGSIZE changed from 38317 to 38489 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PKGSIZE changed from 120944 to 120912 (-0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1436676 to 1440713 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGSIZE changed from 366572 to 366732 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.6" to "2.2.0"
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.6 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.6" to "2.2.0"

--===============2923021902295026770==--

