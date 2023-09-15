Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E7FEEB59E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.29674.1694804393731585495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hHkXjKFl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lZCUdbai;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36bc46-d7e759db-1fc8-4926-b2f9-42a71aec16de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uOLwoBMbY6j7RoPH29b8nvSZOU/jq0RxUmpRaAHLcjc=;
	b=hHkXjKFlwpxjoibL+irLC+6PZ3bolQoxUdDDN2t63iTGxjjuFjSrawI4Y/DNspOI
	wcYYqevHg+cdQfXDY401qAV7457sZysWZcFdh9EbWCgxwVyS3Q8ps+UzyLDAVhEQYCh
	8aR7m8nIDzCuOPIAjbTsIdRE7+wNwlUO4X0ZAD7M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uOLwoBMbY6j7RoPH29b8nvSZOU/jq0RxUmpRaAHLcjc=;
	b=lZCUdbaiuxxECFJphmWk46Qls+QQ3hYhPZoOcIn7K6ONxMcqbGNmctUhsUufnX7g
	GcZn/gWympOSwDqJWDR5a9iMLP73RGuMneXASXDf7Lh9jOrUnVGY4mN5giwk6nvIjbr
	DmRocAVIJADA3Vn5UbNEmXDlKdZrd1lowfTpk9co=
Content-Type: multipart/mixed; boundary="===============6879941271690560801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.1.6 SUCCEEDED
Message-ID: <0101018a9a36bc46-d7e759db-1fc8-4926-b2f9-42a71aec16de-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187697

--===============6879941271690560801==
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
From 01f0189e7f610adc6cd13107a271b05a4d2d3ccf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 09:18:16 +0000
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


--===============6879941271690560801==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.1.5-2.1.6.patch"

RnJvbSAwMWYwMTg5ZTdmNjEwYWRjNmNkMTMxMDdhMjcxYjA1YTRkMmQzY2NmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDk6MTg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dGQtdXRpbHM6IHVwZ3JhZGUgMi4xLjUgLT4gMi4xLjYKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRk
LXV0aWxzX2dpdC5iYgppbmRleCBjZGNjNzY2NzQ4Li40YjI3NTI4ZjY0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiCkBAIC0xMSw5ICsxMSw5IEBAIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiBERVBFTkRTID0gInps
aWIgZTJmc3Byb2dzIHV0aWwtbGludXgiCiBSREVQRU5EUzptdGQtdXRpbHMtdGVzdHMgKz0gImJh
c2giCiAKLVBWID0gIjIuMS41IgorUFYgPSAiMi4xLjYiCiAKLVNSQ1JFViA9ICIzZjNiNGNjNmMz
MTIwMTA3ZTdhYWEyMWM2NDE1NzcyYTI1NWFjNDljIgorU1JDUkVWID0gIjIxOWU3NDFmNDBmNDgw
MWJhZTI2M2UwYjU4MWI2NDg4OGQ4ODdiNGEiCiBTUkNfVVJJID0gImdpdDovL2dpdC5pbmZyYWRl
YWQub3JnL210ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKLS0gCjIuMzkuMgoK

--===============6879941271690560801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtd-utils: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6453964 to 7389052 (+14%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-dev: PKGSIZE changed from 37919 to 38317 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1428194 to 1436676 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-staticdev: PKGSIZE changed from 229522 to 235864 (+3%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-tests: PKGSIZE changed from 1516749 to 1529041 (+1%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGSIZE changed from 640976 to 780240 (+22%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.1.5 [default] to 2.1.6 [default]
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PV changed from "2.1.5" to "2.1.6"
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGSIZE changed from 495351 to 675575 (+36%)

--===============6879941271690560801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 6453964 to 7389052 (+14%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils-ubifs: PKGSIZE changed from 640976 to 780240 (+22%)
packages/core2-32-poky-linux/mtd-utils/mtd-utils: PKGSIZE changed from 495351 to 675575 (+36%)

--===============6879941271690560801==--

