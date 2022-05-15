Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FF6C38A2D
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18726.1652634914041348515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nim2ydP0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b788cf-821bb1ff-c35c-4c95-928c-c46447264744-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=usXjhcyXCASEuuH5AS41fTl1RHQQfTmECrFaUhozvPE=;
	b=Nim2ydP0rVIzgZLgAoz2jmGRvc1Te2Z6dfDFQ2p98gXF+hLpLb/gABx59YtYbjda
	fRg2BymUUBoj7qe+xQ778KlWxWubIH311y05+KPOPiZd6PE+GzZeiuSbx+cqe8CUCGP
	0CKLfO2qODMs/QVA+/ZcobJv5gLwbhGC9NOdQ1E0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=usXjhcyXCASEuuH5AS41fTl1RHQQfTmECrFaUhozvPE=;
	b=Y4vbWYPrkzzFa+XyAGryrOucq5DcW/abgF5QIP3LCKp6wyDFvDlj8h3pfj1xnGUd
	N2U7lx9eJZPyGx+IaSs841akMB7u2wEfTgsFCSYbjxcm/5sf3DLcDHUvdw35jP81aOp
	8qUcb1D0H7Vl3VRH39xY/klqfyJaanBFWd2CrTiY=
Content-Type: multipart/mixed; boundary="===============0143226088298373474=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.25 SUCCEEDED
Message-ID: 
 <01010180c8b788cf-821bb1ff-c35c-4c95-928c-c46447264744-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165629

--===============0143226088298373474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.24.1-2.25.patch
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
--===============0143226088298373474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.24.1 [default] to 2.25 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.24.1" to "2.25"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.24.1 [default] to 2.25 [default]

--===============0143226088298373474==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.24.1-2.25.patch"

From a671671b731c4c99fb033cc77961548c8d4c90f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:19:02 +0000
Subject: [PATCH] repo: upgrade 2.24.1 -> 2.25

---
 meta/recipes-devtools/repo/{repo_2.24.1.bb => repo_2.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.24.1.bb => repo_2.25.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.24.1.bb b/meta/recipes-devtools/repo/repo_2.25.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.24.1.bb
rename to meta/recipes-devtools/repo/repo_2.25.bb
index f6e1ce730b..b7332515c8 100644
--- a/meta/recipes-devtools/repo/repo_2.24.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.25.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "0de4fc3001b36db7e107e61586296ca25bbf6d6d"
+SRCREV = "501733c2abb1180679f25b2f78970d73a2f8d413"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.31.1


--===============0143226088298373474==--

