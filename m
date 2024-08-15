Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542E2C5B559
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.131094.1723748333948332047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=flEuNqUv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZfG5M9v5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191576836d2-0444d248-3749-45b5-ae33-a21f4d6f2d1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cZhJZHz0xRdsNWo5rnUYFSbJPK3x6FwyszP8oLKXa+Q=;
	b=flEuNqUvrIVzQzCSzPm9eFD/Kv6woijUix7bYXeMszvZ0DwI0Fo1zHbcuQKA7JDg
	fFA6zLSBzeGBLG7yOncRuSfIbEq2QBAmBFcjr5bXtAW3LOlWrXU7bJwAMdRg84jUdTK
	WbxBm3vS1GA0etNxuZyrZbX/8LfyY4uOrhXsocKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cZhJZHz0xRdsNWo5rnUYFSbJPK3x6FwyszP8oLKXa+Q=;
	b=ZfG5M9v5RE6FTYYNe6lzWQDRB0bE1+DsUCQ9kKclxRh3z0ZgcgukZvQy54TYYsdX
	HQ+UQ6cvUnlv7Q32sjqBB6Q4m/5bhnt2kvPf4jWIDAWczboIKeNEbcSo5ZaEJEJW4Dq
	cP31/ztLKeVVdQxTeIohv+yrtb0vefIR0jxifNO4=
Content-Type: multipart/mixed; boundary="===============0469389530982699049=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.10.2 SUCCEEDED
Message-ID: <01010191576836d2-0444d248-3749-45b5-ae33-a21f4d6f2d1f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203355

--===============0469389530982699049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.10.1-4.10.2.patch
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
From a711e83f9bdba836cabb2076d39f2054b2f99bc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 09:35:17 +0000
Subject: [PATCH] ccache: upgrade 4.10.1 -> 4.10.2

---
 .../ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.1.bb b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.10.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.2.bb
index 6ae85af4f5..361c1643f9 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4"
+SRC_URI[sha256sum] = "108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87"
 
 inherit cmake github-releases
 
-- 
2.44.0


--===============0469389530982699049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.10.1/ccache-4.10.1.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.10.2/ccache-4.10.2.tar.gz"

--===============0469389530982699049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.10.1-4.10.2.patch"

RnJvbSBhNzExZTgzZjliZGJhODM2Y2FiYjIwNzZkMzlmMjA1NGIyZjk5YmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDk6MzU6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMC4xIC0+IDQuMTAuMgoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVf
NC4xMC4xLmJiID0+IGNjYWNoZV80LjEwLjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMC4xLmJiID0+IGNjYWNoZV80LjEwLjIu
YmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2Fj
aGVfNC4xMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMC4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jY2FjaGUvY2NhY2hlXzQuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMC4yLmJiCmluZGV4IDZhZTg1YWY0ZjUuLjM2MWMxNjQzZjkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTAuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEwLjIuYmIKQEAgLTE3
LDcgKzE3LDcgQEAgREVQRU5EUyA9ICJ6c3RkIGZtdCB4eGhhc2giCiAKIFNSQ19VUkkgPSAiJHtH
SVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI4ZjhhZDYwZDkzNjM4NTc4MTJhYThhZjNmYTdmYjcyYmU1ZWE1Y2YxOTNm
ODI0ZDE2ZDIzN2E4YTc5MjU2YmU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwODEwMDk2MGJi
N2U2NDU3M2VhOTI1YWYyZWU3NjExNzAxMjQxYWJiMzZjZTBhYWUzMzU0NTI4NDAzYTdkODciCiAK
IGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDQuMAoK

--===============0469389530982699049==--

