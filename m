Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25B6C48BE6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.11564.1650052687170910961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=oSlgtnRd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecdec3f-7aab1677-4f9b-46c5-964e-15b239b5c511-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oDwJS2nR52ecNuHM6xhDZ51wCO3O5rwGBD77tGAnAdI=;
	b=oSlgtnRdMemG5SNCj4IBp1IJl1IM28t76qULfQ54oBcq5xSOtHLY59D8jc9N1lTn
	cwZsnEfLU+q934o9anGqEFZTr4sInSvKafMOD5bwAxQEJITaqIHyDgwp0AaaxBVUuyP
	sNrqYce77yjToBN+X5/6A8jCXxn1Jj3KhGAescXQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oDwJS2nR52ecNuHM6xhDZ51wCO3O5rwGBD77tGAnAdI=;
	b=R/NRQvVgyKTSdcWuutIF7g8KE1rSj2b094/0qTm4aOeMc9xuEOFtbtDIouul09cT
	5X9KeCyCx4P88aSUWY17USdp6oivimYVPgQOViYnJjIN2pIO+bjb6Sio9Cpg86VHMr+
	MqiTPjIdAm0cnW2y7HqDrNCgwp4qvZ5eUVmx2q1U=
Content-Type: multipart/mixed; boundary="===============4833478439238349792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2022.04.08 SUCCEEDED
Message-ID: 
 <010101802ecdec3f-7aab1677-4f9b-46c5-964e-15b239b5c511-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164504

--===============4833478439238349792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2022.04.08* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2022.02.18-2022.04.08.patch
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
--===============4833478439238349792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2022.02.18-2022.04.08.patch"

From 41922b6e0cf0c1066ee521fda90b08cc028e1ba1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 18:09:47 +0000
Subject: [PATCH] wireless-regdb: upgrade 2022.02.18 -> 2022.04.08

---
 ...ireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
index 801a6f0584..cd42039680 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
+SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
 
 inherit bin_package allarch
 
-- 
2.27.0


--===============4833478439238349792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.02.18.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.04.08.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2022.02.18" to "2022.04.08"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2022.02.18 [default] to 2022.04.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2022.02.18" to "2022.04.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2022.02.18 [default] to 2022.04.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2022.02.18" to "2022.04.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5514 to 5570 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2022.02.18 [default] to 2022.04.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2022.02.18" to "2022.04.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6463 to 6523 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2022.02.18 [default] to 2022.04.08 [default]

--===============4833478439238349792==--

