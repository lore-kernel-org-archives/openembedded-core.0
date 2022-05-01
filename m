Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ED2C4708B
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2288.1651434543439322571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rfv0aIlh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b5649-ed7df6f0-2c96-431c-862f-58e7fa411e69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AIjmZ6MDtpqcyfz2yBYM/C0kl1atK7sqryOJzqgnVFM=;
	b=Rfv0aIlh3Sdl+Ddm5YWRFbOgOQJYSXkGxEB3ffDJILfLaYEI6ZV3d4rUkj2t7bxh
	nOwLXO8pg7rjRI8u34Zr5ZUB12dW5B/VuDa30dbm1xtCttW+NJpmey4iZ5CDATIijPp
	xM0v2MPYK83/QuZjyST3L/pALihNhPqKOD5jYQxA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AIjmZ6MDtpqcyfz2yBYM/C0kl1atK7sqryOJzqgnVFM=;
	b=R1erXIl0LdknY96QEzrcjMXtSjIObTiySIkdGIITL9kcMhB5tutIWv7QcnhyBDmR
	v5lxx0VabnjnVw6pHdvxxU5lCz2mSWyVoB+YpLgfIZLUOGbNFYjyhs4fWkuF6RMdN8t
	WzWiSbAz9rXNPnmbGJ0TFH2BcF68x/Bblc0BwwQQ=
Content-Type: multipart/mixed; boundary="===============6268240137207547836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.24.1 SUCCEEDED
Message-ID: 
 <01010180812b5649-ed7df6f0-2c96-431c-862f-58e7fa411e69-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165123

--===============6268240137207547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.23-2.24.1.patch
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
--===============6268240137207547836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.23-2.24.1.patch"

From 13cfc62df0e9e075e041cf1e5f600a66c7b44d4d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:48:01 +0000
Subject: [PATCH] repo: upgrade 2.23 -> 2.24.1

---
 meta/recipes-devtools/repo/{repo_2.23.bb => repo_2.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.23.bb => repo_2.24.1.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.23.bb b/meta/recipes-devtools/repo/repo_2.24.1.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.23.bb
rename to meta/recipes-devtools/repo/repo_2.24.1.bb
index 0b4e9743a6..f6e1ce730b 100644
--- a/meta/recipes-devtools/repo/repo_2.23.bb
+++ b/meta/recipes-devtools/repo/repo_2.24.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "d56e2eb4216827284220fcc35af42e60b4faaea6"
+SRCREV = "0de4fc3001b36db7e107e61586296ca25bbf6d6d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.27.0


--===============6268240137207547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.23 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.23" to "2.24.1"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.23 [default] to 2.24.1 [default]

--===============6268240137207547836==--

