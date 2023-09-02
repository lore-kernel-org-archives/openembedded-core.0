Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71174CA101B
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5663.1693650552017117638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TgeyeB5G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EPuUTpNK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a557086d7-b1b82bce-0905-4696-be16-56e08678bad8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7H2j8AtB7fyWwDyhaWJC+f2R+X1BxMZOQmr/pk322F8=;
	b=TgeyeB5G3MplB6V50tzu0xNj76H7pLWV+GRSvr2/2F9L+nsJ9RvMlGWH3ffFq6PO
	ZxW6JNY7yWDdBUauv0CC2WxlHFDLwQPlKCIxvquSjAD212+bulX0WXZngwSRdJFdT5a
	A99k03MqOaXTVZVowVbTtuzSGWp95p8hGtkK/0uE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7H2j8AtB7fyWwDyhaWJC+f2R+X1BxMZOQmr/pk322F8=;
	b=EPuUTpNKr1/sNcPb1mVJwEszcC6lQgfBHQ4APwAqh0t9JphWNL1WcHcp1PL/Yev0
	0n36cNQPoqhsyMnr7GZK3R6E2tKWGtkdZuFDIKlaPFcI/EGj4Q91n00RN6UaHzzG5PF
	JXAr2nUlnoU47+50wjjYtQSi7pCaQmAu2Y0b44i4=
Content-Type: multipart/mixed; boundary="===============1258285767710499672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.1.6 SUCCEEDED
Message-ID: <0101018a557086d7-b1b82bce-0905-4696-be16-56e08678bad8-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187057

--===============1258285767710499672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtd-utils* to *2.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.1.5-2.1.6.patch
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
From dfd084697e3cdda1421412ea911abab514897867 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 13:53:53 +0000
Subject: [PATCH] mtd-utils: upgrade 2.1.5 -> 2.1.6

---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index cdcc766748..4b27528f64 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.5"
+PV = "2.1.6"
 
-SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
+SRCREV = "219e741f40f4801bae263e0b581b64888d887b4a"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============1258285767710499672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtd-utils: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6450532 to 7385616 (+14%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGSIZE changed from 37919 to 38317 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1428194 to 1436676 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGSIZE changed from 229522 to 235864 (+3%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGSIZE changed from 1516749 to 1529041 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGSIZE changed from 640976 to 780240 (+22%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGSIZE changed from 495351 to 675575 (+36%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.5 [default] to 2.1.6 [default]

--===============1258285767710499672==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.5-2.1.6.patch"

RnJvbSBkZmQwODQ2OTdlM2NkZGExNDIxNDEyZWE5MTFhYmFiNTE0ODk3ODY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMzo1Mzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
ZC11dGlsczogdXBncmFkZSAyLjEuNSAtPiAyLjEuNgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRkL210ZC11dGlsc19naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210ZC9tdGQt
dXRpbHNfZ2l0LmJiCmluZGV4IGNkY2M3NjY3NDguLjRiMjc1MjhmNjQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKQEAgLTExLDkgKzExLDkgQEAgaW5oZXJp
dCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIERFUEVORFMgPSAiemxp
YiBlMmZzcHJvZ3MgdXRpbC1saW51eCIKIFJERVBFTkRTOm10ZC11dGlscy10ZXN0cyArPSAiYmFz
aCIKIAotUFYgPSAiMi4xLjUiCitQViA9ICIyLjEuNiIKIAotU1JDUkVWID0gIjNmM2I0Y2M2YzMx
MjAxMDdlN2FhYTIxYzY0MTU3NzJhMjU1YWM0OWMiCitTUkNSRVYgPSAiMjE5ZTc0MWY0MGY0ODAx
YmFlMjYzZTBiNTgxYjY0ODg4ZDg4N2I0YSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmluZnJhZGVh
ZC5vcmcvbXRkLXV0aWxzLmdpdDticmFuY2g9bWFzdGVyIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0
IgotLSAKMi4zOS4yCgo=

--===============1258285767710499672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6450532 to 7385616 (+14%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGSIZE changed from 640976 to 780240 (+22%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGSIZE changed from 495351 to 675575 (+36%)

--===============1258285767710499672==--

