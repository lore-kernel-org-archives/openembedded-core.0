Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43442C54E92
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75740.1722536824022174707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=INRMnNf1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZR6V1Dmc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f323089-a2cdeded-4ed9-4b82-8667-92320aee3511-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EShBkDanIH2pwNbnuQ1OLQbm4G2QNMGvArxf1wt5Ihc=;
	b=INRMnNf1nXiQKag+7NFZgp8pZLvm93K5bDGoJ7jVum+8CK5LqK2xp5HL12if0n2B
	f0OixK1ew8Yr24tMCzDKaXntKSqHQ5QT6OdmR8tVyL5qxdElwIRUJLwOQUH4iM+pwkK
	CBSc0sk6aqgCq15CrqphGU/gDrfK+o+w78VrEYSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EShBkDanIH2pwNbnuQ1OLQbm4G2QNMGvArxf1wt5Ihc=;
	b=ZR6V1DmcDseEkIATq46uoPee7bvWBOX1nE04Ji1NjcZduzUPH4h36IgnKpAxA97p
	hXHbCxpwMbuZmeYQCTY94PM++uzA6rfHpn5kzEtjbkSUXQoENBX3h4yQg1Xch6kS3e2
	SArNIwLIed7+5l7Io8+0jiLkHoSAS11TBQV6X778=
Content-Type: multipart/mixed; boundary="===============2232705208401895623=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.290.0 SUCCEEDED
Message-ID: <010101910f323089-a2cdeded-4ed9-4b82-8667-92320aee3511-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202849

--===============2232705208401895623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.3.290.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.283.0-1.3.290.0.patch
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
From cdcdf36892416dbd46acd6aff8857eff3d0e4e97 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:13:46 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.283.0 -> 1.3.290.0

---
 ...{vulkan-headers_1.3.283.0.bb => vulkan-headers_1.3.290.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.283.0.bb => vulkan-headers_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
index 6423ef9df6..9f17ddc525 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "eaa319dade959cb61ed2229c8ea42e307cc8f8b3"
+SRCREV = "b379292b2ab6df5771ba9870d53cf8b2c9295daf"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============2232705208401895623==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSBjZGNkZjM2ODkyNDE2ZGJkNDZhY2Q2YWZmODg1N2VmZjNkMGU0ZTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDoxMzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yODMuMCAtPiAxLjMuMjkwLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yODMuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjkwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI4
My4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yOTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yODMuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI5MC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI4My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTAuMC5iYgppbmRleCA2NDIz
ZWY5ZGY2Li45ZjE3ZGRjNTI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yODMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTAuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiZWFhMzE5ZGFkZTk1OWNiNjFlZDIy
MjljOGVhNDJlMzA3Y2M4ZjhiMyIKK1NSQ1JFViA9ICJiMzc5MjkyYjJhYjZkZjU3NzFiYTk4NzBk
NTNjZjhiMmM5Mjk1ZGFmIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============2232705208401895623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 14904870 to 14997684 (+1%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12408381 to 12298344 (-1%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.283.0" to "1.3.290.0"

--===============2232705208401895623==--

