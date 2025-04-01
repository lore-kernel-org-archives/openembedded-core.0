Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CE1C369CD
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18046.1743511393594764349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZkPugzdU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SnjNa80t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f160b945-87fa9b7a-3446-4af4-92f0-60f97d62fa92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jsaPB5Rkf7oczh6qypVt9igDUAathH/cCxxOFiIdWkA=;
	b=ZkPugzdUs1EfAC6lHRxbhNigIzW249UZKb2M6h03mIItzan40/MxaJS3OMKMb+Mg
	c85oH0bHw1DKmwUCTsKPW0vIabyQ/k0c9cYPqg12yOYLG3TY+TXbZ114pOuntnJ63NX
	x+UZWHIWipOSnTGAZ3xb8p0EjXMW9+QJYgcpQerM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jsaPB5Rkf7oczh6qypVt9igDUAathH/cCxxOFiIdWkA=;
	b=SnjNa80tApZGy/MJ8IVaDkYR30bfkkSfeE3fpJGy9WQEhnr5Tjod4L4ECRFx7MPJ
	T44MjRLDw9YjL8cQRIXJsTy4xqLm1IIH0DuSlP8zsFAIfSmV6VAq4VNbo3OaI1QjHAI
	Gqo50qRV8nyE43HJB484wqan/QugamoALS93hZ7k=
Content-Type: multipart/mixed; boundary="===============7952792129373651166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.21.1 SUCCEEDED
Message-ID: <01010195f160b945-87fa9b7a-3446-4af4-92f0-60f97d62fa92-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214083

--===============7952792129373651166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.21-1.21.1.patch
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
From 1e581078471e4e968d72fd811ec43a55b674cf7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:58:33 +0000
Subject: [PATCH] ed: upgrade 1.21 -> 1.21.1

---
 meta/recipes-extended/ed/{ed_1.21.bb => ed_1.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.21.bb => ed_1.21.1.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.21.bb b/meta/recipes-extended/ed/ed_1.21.1.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.21.bb
rename to meta/recipes-extended/ed/ed_1.21.1.bb
index 4308fac675..03a61c6d5f 100644
--- a/meta/recipes-extended/ed/ed_1.21.bb
+++ b/meta/recipes-extended/ed/ed_1.21.1.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75"
+SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============7952792129373651166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.21-1.21.1.patch"

RnJvbSAxZTU4MTA3ODQ3MWU0ZTk2OGQ3MmZkODExZWM0M2E1NWI2NzRjZjdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTo1ODozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVk
OiB1cGdyYWRlIDEuMjEgLT4gMS4yMS4xCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC97
ZWRfMS4yMS5iYiA9PiBlZF8xLjIxLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Vk
L3tlZF8xLjIxLmJiID0+IGVkXzEuMjEuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9l
ZF8xLjIxLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2VkL2VkXzEuMjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9l
ZC9lZF8xLjIxLjEuYmIKaW5kZXggNDMwOGZhYzY3NS4uMDNhNjFjNmQ1ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2VkL2VkXzEuMjEuMS5iYgpAQCAtMTksNyArMTksNyBAQCBiaW5kaXIgPSAiJHtiYXNl
X2JpbmRpcn0iCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvJHtCUH0udGFyLmx6IgogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gIiR7R05VX01JUlJPUn0vZWQvIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNjBlMjQ5OTg3MjdkNDUzYTVjZjAyYzU0NjY0Yjk3NTM2ZGU0NmEyYjM0Y2QxZjRmNjdj
MWMxYTYxYmJiYWQ3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNmQwYzcxOTJiMDJiMDUxOWM5
MDJhOTM3MTkwNTNlODY1YWRlNWE3ODRhM2IzMjdkOTNkODg4NDU3YjIzYzRiIgogCiBFWFRSQV9P
RU1BS0UgPSAiLWUgTUFLRUZMQUdTPSIKIAotLSAKMi40Ny4xCgo=

--===============7952792129373651166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 172096 to 172936 (+0%)
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 75706 to 75915 (+0%)
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 113401 to 114270 (+1%)
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.21 [default] to 1.21.1 [default]
packages/core2-64-poky-linux/ed/ed: PKGSIZE changed from 59993 to 60001 (+0%)
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.21.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.21.1.tar.lz"
packages/core2-64-poky-linux/ed: PV changed from "1.21" to "1.21.1"
packages/core2-64-poky-linux/ed: PKGV changed from 1.21 [default] to 1.21.1 [default]

--===============7952792129373651166==--

