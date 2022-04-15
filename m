Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D507DC352AA
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11827.1650052687485467724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IUtHrdpL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde38c-b733d042-7977-4704-bb2a-4d83c97ff5d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xYKxlZh/w9JliTE1FnfPDkp2H09Eyf+MlP3acJ8BGws=;
	b=IUtHrdpLAzvfDOD1URxZF4izB/tpAKi+SkO+oDPwtfD0EnqJ04rjcX+CkF8xzkn2
	qmeNWhkXmgm+K+sloE64Jur9dIMkHpBVrzxxdaMfxIiFLM4UhBHd07/yvZY8V9X1EUo
	tIUqaZdVyiMsrJ9djBeNbprtAozaqGJFdCpvGCJE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xYKxlZh/w9JliTE1FnfPDkp2H09Eyf+MlP3acJ8BGws=;
	b=EH7q/FT7D6B5PsxuCJoKwTpmzea0OQD8EWBtWg4bSdiPpl+cRcFCf5buD6Cm6LIm
	quXBKBwraZeUXtNUpgqD85H0ifn4yaE7cEYi3TkWzIWQWRz81YaU0Nmy+XfJfGeKKzl
	jcVtDQ5mM4c1Vekz5GFmwIAfQDDInC8ZeW1m/hqI=
Content-Type: multipart/mixed; boundary="===============7594803561765784318=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] help2man: upgrading to 1.49.2 SUCCEEDED
Message-ID: 
 <010101802ecde38c-b733d042-7977-4704-bb2a-4d83c97ff5d4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164455

--===============7594803561765784318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *help2man* to *1.49.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-help2man-upgrade-1.49.1-1.49.2.patch
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
--===============7594803561765784318==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-help2man-upgrade-1.49.1-1.49.2.patch"

From 17d1898d0afb44e469bf1453b45db1ca427686f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 08:04:35 +0000
Subject: [PATCH] help2man: upgrade 1.49.1 -> 1.49.2

---
 .../help2man/{help2man_1.49.1.bb => help2man_1.49.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.49.1.bb => help2man_1.49.2.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.49.1.bb b/meta/recipes-devtools/help2man/help2man_1.49.2.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.49.1.bb
rename to meta/recipes-devtools/help2man/help2man_1.49.2.bb
index 32c1b2fc06..62e1f67b55 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.1.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fd99a664ec4be9a86a0dd89719989f14f367a9c079d75d0e1d71e18a7bb51b03"
+SRC_URI[sha256sum] = "9e2e0e213a7e0a36244eed6204d902b6504602a578b6ecd15268b1454deadd36"
 
 inherit autotools
 
-- 
2.27.0


--===============7594803561765784318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/help2man/help2man-dbg: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-dbg: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man-dev: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-dev: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-doc: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGSIZE changed from 22173 to 22170 (-0%)
packages/core2-32-poky-linux/help2man/help2man-locale: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-locale: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man-src: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-src: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man-staticdev: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man-staticdev: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man/help2man: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man/help2man: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man: PKGV changed from 1.49.1 [default] to 1.49.2 [default]
packages/core2-32-poky-linux/help2man: PV changed from "1.49.1" to "1.49.2"
packages/core2-32-poky-linux/help2man: SRC_URI changed from "https://ftp.gnu.org/gnu/help2man/help2man-1.49.1.tar.xz" to "https://ftp.gnu.org/gnu/help2man/help2man-1.49.2.tar.xz"

--===============7594803561765784318==--

