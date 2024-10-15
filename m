Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF0BD1D87C
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11860.1728994547108891899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bl9kDLux;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jbPdVJnI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b2aff-60de979e-108c-4641-9cc9-dad57fa9cdbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A3OK4F2wX3eustX2XfvEr7klPGKEjkFLuK9XDJpNLHQ=;
	b=bl9kDLuxCQzw3igKdaO7Y7ChHbCvpjDwog+ifJiOY6H5m06R6PaXI9eEcjwD8hlG
	l1wLBg/A+1RZqrVElnk9DkA98yNo2K0HTKSfUphD1PmWlZ3AznlZGA+wzi2dffQT3RZ
	91jXUI5Q34cQpvyP/Ni9e/dA/o/04YQt3JT1i87A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A3OK4F2wX3eustX2XfvEr7klPGKEjkFLuK9XDJpNLHQ=;
	b=jbPdVJnITL725qgiNeRUb5qUHJ32LEiVm0tDciehAiC01BohNYdNojaTjL1lA6L1
	SJayGYybg/+L00khU/QlYjswS7KbdVyRmp0DRatPYWrcz4uOf5v0T9vsHB1swSLMyoP
	I7n5VaXNzPyG+yx/Dtv6uCstMRoD+4Hz1R1cEmlw=
Content-Type: multipart/mixed; boundary="===============7323395848327953329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] i2c-tools: upgrading to 4.4 SUCCEEDED
Message-ID: <01010192901b2aff-60de979e-108c-4641-9cc9-dad57fa9cdbd-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205830

--===============7323395848327953329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *i2c-tools* to *4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-i2c-tools-upgrade-4.3-4.4.patch
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
From af5ab6f97bcaf0b3942b7a6c895a39264735072e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 07:34:46 +0000
Subject: [PATCH] i2c-tools: upgrade 4.3 -> 4.4

---
 .../i2c-tools/{i2c-tools_4.3.bb => i2c-tools_4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.3.bb => i2c-tools_4.4.bb} (95%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
similarity index 95%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
index 4e43c51496..f4881f3c2f 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d438148"
+SRC_URI[sha256sum] = "04d1e3b0cd88df8fb96e7709f374dd0b3561191b4c0363eaf873a074b8b7cb22"
 
 inherit update-alternatives
 
-- 
2.44.1


--===============7323395848327953329==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-i2c-tools-upgrade-4.3-4.4.patch"

RnJvbSBhZjVhYjZmOTdiY2FmMGIzOTQyYjdhNmM4OTVhMzkyNjQ3MzUwNzJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDc6MzQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
MmMtdG9vbHM6IHVwZ3JhZGUgNC4zIC0+IDQuNAoKLS0tCiAuLi4vaTJjLXRvb2xzL3tpMmMtdG9v
bHNfNC4zLmJiID0+IGkyYy10b29sc180LjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvaTJjLXRvb2xzL3tpMmMtdG9vbHNfNC4zLmJiID0+IGkyYy10b29sc180LjQu
YmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2kyYy10b29scy9p
MmMtdG9vbHNfNC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2kyYy10b29scy9pMmMtdG9v
bHNfNC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9pMmMtdG9vbHMvaTJjLXRvb2xzXzQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2kyYy10b29scy9pMmMtdG9vbHNfNC40LmJiCmluZGV4IDRlNDNjNTE0OTYuLmY0
ODgxZjNjMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9pMmMtdG9vbHMvaTJj
LXRvb2xzXzQuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvaTJjLXRvb2xzL2kyYy10
b29sc180LjQuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTc1MTQxOTI2MGFhOTU0NDk5ZjdhYmFhYmFhODgyYmJlIgogU1JDX1VSSSA9ICIk
e0tFUk5FTE9SR19NSVJST1J9L3NvZnR3YXJlL3V0aWxzL2kyYy10b29scy8ke0JQfS50YXIuZ3og
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWVjNDY0ZTQyMzAxZDkzNTg2Y2JlY2EzODQ1
ZWQ2MWJmZjQwZjU2MDY3MGU1YjM1YmFlYzU3MzAxZDQzODE0OCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwNGQxZTNiMGNkODhkZjhmYjk2ZTc3MDlmMzc0ZGQwYjM1NjExOTFiNGMwMzYzZWFmODcz
YTA3NGI4YjdjYjIyIgogCiBpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40NC4x
Cgo=

--===============7323395848327953329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/i2c-tools/i2c-tools-dbg: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-dbg: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-dbg: PKGSIZE changed from 276528 to 275016 (-1%)
packages/core2-64-poky-linux/i2c-tools/i2c-tools-dev: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-dev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-doc: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-doc: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-doc: PKGSIZE changed from 37016 to 36791 (-1%)
packages/core2-64-poky-linux/i2c-tools/i2c-tools-locale: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-locale: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-misc: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-misc: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-misc: PKGSIZE changed from 140435 to 139312 (-1%)
packages/core2-64-poky-linux/i2c-tools/i2c-tools-src: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-src: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools-src: PKGSIZE changed from 87280 to 84567 (-3%)
packages/core2-64-poky-linux/i2c-tools/i2c-tools-staticdev: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools-staticdev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools/i2c-tools: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-64-poky-linux/i2c-tools/i2c-tools: PKGSIZE changed from 174591 to 170495 (-2%)
packages/core2-64-poky-linux/i2c-tools: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/i2c-tools/i2c-tools-4.3.tar.gz" to "https://cdn.kernel.org/pub/software/utils/i2c-tools/i2c-tools-4.4.tar.gz"
packages/core2-64-poky-linux/i2c-tools: PV changed from "4.3" to "4.4"
packages/core2-64-poky-linux/i2c-tools: PKGV changed from 4.3 [default] to 4.4 [default]

--===============7323395848327953329==--

