Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B8BCCA487
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.4464.1655298222386645369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GqQnssXJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181677665d7-66d4b729-f703-4364-9594-78724acf758e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mTbwxvHdcjjwbGeBhdDfS7DS0nmicW11V4jjHKpV67o=;
	b=GqQnssXJyTT+JhTcnnYkRF+7XJGejV2PpQavPXRQZySRBxdPdSh7WUwQdNWkQvkj
	QwMfuInW79rd1hD0Gf9Rox4ua1eocuA2WZGcwfe8393iseRf1cXAd4aCTcUWwe0p3/r
	0Slto9QXl7bzhSyCCaJiyqpQ3slAPz8G+3p4FRmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mTbwxvHdcjjwbGeBhdDfS7DS0nmicW11V4jjHKpV67o=;
	b=SsiNpjfbFgpIlH+cIWIRuasQav1CsKz7rP79uQsWIYZgtmXbdRMc6gPnNx+xbHay
	KQS5Uxnz58To0LOn+AGnzb29A0yVpKHG8g2UTwy5Dwek6NSjuwd7MUVIO4EAL+fLNHz
	DtXP2gdXppHyymC73bJ7kxbV/9tT7tiVmN94pOjA=
Content-Type: multipart/mixed; boundary="===============7850952477893800225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.216.0 SUCCEEDED
Message-ID: 
 <01010181677665d7-66d4b729-f703-4364-9594-78724acf758e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166973

--===============7850952477893800225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.216.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.211.0-1.3.216.0.patch
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
--===============7850952477893800225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.211.0-1.3.216.0.patch"

From b9639167a3a8eabe416db1aca86261fcbe3f7031 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:19:42 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.211.0 -> 1.3.216.0

---
 ...{vulkan-headers_1.3.211.0.bb => vulkan-headers_1.3.216.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.211.0.bb => vulkan-headers_1.3.216.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
index c74eb4cf5b..5f7917ae82 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8"
+SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


--===============7850952477893800225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 10878424 to 11054975 (+2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6410246 to 6519647 (+2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.211.0" to "1.3.216.0"

--===============7850952477893800225==--

