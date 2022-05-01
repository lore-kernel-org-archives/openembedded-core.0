Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F098C38A2E
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.2325.1651434543197444419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rs6oVAT4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180812b5b38-0d409eec-a727-4772-bb76-9f42725a787a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=IMQwA+bS5y7lRb+7x2R7GCODEV4D5rF0Aw8tKd8eoJU=;
	b=Rs6oVAT49KWk2PcwL3eRixOUiAGIG0dzJ5xlt5TXomSDcxmtl0SQVcDTBkcAfBOg
	CYpeWkzkcaSr+tapGBN/R/ghsk+2GmhxO/lSfDQnA0bhefUmGz8zmtA03PFF3qxfiKc
	PIU9aguXcQjMr/6oTekPAJefDyEYjin7DFlA4D10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=IMQwA+bS5y7lRb+7x2R7GCODEV4D5rF0Aw8tKd8eoJU=;
	b=DC+5kyswjr+WlPgZ42ZQ0jz1BuqDay+ri/TUgkLps+x0OD59cUUCSY+SHQmnmmXU
	be5BeC7ezZ9P7dYNdSvWt6ZDNI/ednPxpK0esk8hRT6lssXlyY3gR077i9gTkrndRe0
	qVulmmODprohaez0AOihTIJIVKt3daDpeWJRqSSA=
Content-Type: multipart/mixed; boundary="===============4578755094899154041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.8 SUCCEEDED
Message-ID: 
 <01010180812b5b38-0d409eec-a727-4772-bb76-9f42725a787a-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165136

--===============4578755094899154041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.7.5-1.8.patch
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
--===============4578755094899154041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.7.5-1.8.patch"

From 431500687332925a26f2ff321ef735996c32ef64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:32:03 +0000
Subject: [PATCH] libx11: upgrade 1.7.5 -> 1.8

---
 .../xorg-lib/{libx11_1.7.5.bb => libx11_1.8.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.5.bb => libx11_1.8.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.bb
index 2a6f66957c..6d5a8626d6 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "5a1847e2e2c248e1a203a24a1338a5586d6f48472eac58f6f08539110a965151"
+SRC_URI[sha256sum] = "081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.27.0


--===============4578755094899154041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.7.5.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.8.tar.xz file://disable_tests.patch"
packages/core2-32-poky-linux/libx11: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 10926172 to 10925296 (-0%)
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PKGSIZE changed from 253616 to 251569 (-1%)
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1996643 to 1995971 (-0%)
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1182207 to 1182441 (+0%)
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PKGSIZE changed from 5437116 to 5435125 (-0%)
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.7.5" to "1.8"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.7.5 [default] to 1.8 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.7.5" to "1.8"

--===============4578755094899154041==--

