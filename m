Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC67CCA492
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.4388.1655298221709382976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HPSZGnUZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101816776670f-59a24ba8-28c7-4425-836c-3516d43a66d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fH0xgwqnowuouePV/H2hcIthqi0fAjL8EjHSGNF4zBU=;
	b=HPSZGnUZ9Ne9GoYJKKO/YzJPJZSVXHauGpJd+9tj8xPvfOg6xClJCi94SuvIMYXc
	rdMJ1GMUCjMmikuvLWoWw1/x9NG364sVCn0gEWLBt5JH7TP5B962h2nq4C8zFrqE6kn
	edY+uqGMO4AAlkrEOJxrBxfgSa4c9paCYaff5p8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fH0xgwqnowuouePV/H2hcIthqi0fAjL8EjHSGNF4zBU=;
	b=YGEtB53O9w/x8Wk3vhpOhXlJ1sZZy8IejBeXZRs1ffE5wz5JM91JcIoPbV3g8Z+g
	lAkx1LxYiwD1GnrgDwmQI5sus1QsU0JxTNgwrawvTMM/bZabt5pWHcyU/w9hdPlsVaM
	mgtECKSl2mshtjBGLTURJPT2d0vtWaJayBFKbNGs=
Content-Type: multipart/mixed; boundary="===============4845956739818776086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2022.06.06 SUCCEEDED
Message-ID: 
 <010101816776670f-59a24ba8-28c7-4425-836c-3516d43a66d7-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166962

--===============4845956739818776086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2022.06.06* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2022.04.08-2022.06.06.patch
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
--===============4845956739818776086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PV changed from "2022.04.08" to "2022.06.06"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2022.04.08 [default] to 2022.06.06 [default]
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.04.08.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.06.06.tar.xz"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2022.04.08" to "2022.06.06"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2022.04.08 [default] to 2022.06.06 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2022.04.08" to "2022.06.06"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5570 to 5674 (+2%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2022.04.08 [default] to 2022.06.06 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2022.04.08" to "2022.06.06"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6523 to 6635 (+2%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2022.04.08 [default] to 2022.06.06 [default]

--===============4845956739818776086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2022.04.08-2022.06.06.patch"

From 8006fec2c5b617f575f308993ac1405e5e496847 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:43:14 +0000
Subject: [PATCH] wireless-regdb: upgrade 2022.04.08 -> 2022.06.06

---
 ...ireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
index cd42039680..2eba4f873b 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
+SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
 
 inherit bin_package allarch
 
-- 
2.31.1


--===============4845956739818776086==--

