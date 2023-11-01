Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D61C072A4
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8640.1698848702617669836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QHtFJCTv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=egQeSDZm;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460c14-cba085fe-5d8c-45c7-aa79-43f89236f76e-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s9XwdiLpslBRtgcTS/8D/ejoC9Rj/gztIjrogZ5dmDw=;
	b=QHtFJCTvUJlWxdnFF486/5atrPYG/3kL1q57fZ65qT/SULOU5+UKnKFIsAtoDAHH
	rkIB+ZmD0OkLhGgix6Z2AX1FgWL0kh07hRM4bHgoTG3iGULkym1V8WHvHpuTnjnCeNV
	zn80ZVposSsq5geM/EP2M+k02E8YC53FLhCsoVJ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s9XwdiLpslBRtgcTS/8D/ejoC9Rj/gztIjrogZ5dmDw=;
	b=egQeSDZmsPaLtL6O1HCqWxOXX8Y7falF0QBKWtmp9Wcbn76jzWRqMDsysASpM2t8
	eoinOiqIntCh50yG/uds/JPvTrEIrTK5nqaiIDTWRCfULQZOEN++EcNwqmR/3P4zQwH
	E6GiTAY4J/2IIRXeSIat6/llbrLYV6PkqDtdSJA0=
Content-Type: multipart/mixed; boundary="===============7819690536798598882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.7 SUCCEEDED
Message-ID: <0101018b8b460c14-cba085fe-5d8c-45c7-aa79-43f89236f76e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190009

--===============7819690536798598882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.6-2023.7.patch
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
From f374f7ca696e82cc2d56b0c7b329f0cb738f98dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:59:42 +0000
Subject: [PATCH] shaderc: upgrade 2023.6 -> 2023.7

---
 .../shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.6.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.7.bb
index 5afdec5ce9..e4555af6d5 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9547789ecfa1be140327057e766ba80666b66e21"
+SRCREV = "23cc2d78fd4f866b6ab527886a396bec36948605"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.39.2


--===============7819690536798598882==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.6-2023.7.patch"

RnJvbSBmMzc0ZjdjYTY5NmU4MmNjMmQ1NmIwYzdiMzI5ZjBjYjczOGY5OGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjo1OTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMy42IC0+IDIwMjMuNwoKLS0tCiAuLi4vc2hhZGVyYy97c2hhZGVy
Y18yMDIzLjYuYmIgPT4gc2hhZGVyY18yMDIzLjcuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDIzLjYuYmIgPT4gc2hhZGVyY18yMDIz
LjcuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
c2hhZGVyY18yMDIzLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJj
XzIwMjMuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjMuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjcuYmIKaW5kZXggNWFmZGVjNWNlOS4uZTQ1
NTVhZjZkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIzLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDIzLjcuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Igog
Ci1TUkNSRVYgPSAiOTU0Nzc4OWVjZmExYmUxNDAzMjcwNTdlNzY2YmE4MDY2NmI2NmUyMSIKK1NS
Q1JFViA9ICIyM2NjMmQ3OGZkNGY4NjZiNmFiNTI3ODg2YTM5NmJlYzM2OTQ4NjA1IgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRp
bmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwK
LS0gCjIuMzkuMgoK

--===============7819690536798598882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 7026904 to 7245600 (+3%)
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.6" to "2023.7"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 4267336 to 4363592 (+2%)
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2023.6 [default] to 2023.7 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2023.6" to "2023.7"

--===============7819690536798598882==--

