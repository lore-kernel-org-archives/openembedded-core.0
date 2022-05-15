Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E373DC4167E
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.18883.1652634912472232990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nkXWGDeh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180c8b786fc-79e057fe-74cf-4b17-bed3-c1416f25d103-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K3Hf3jZkebACvALIJcQaHYFxXMs8JYZO43CmpFJTT6Q=;
	b=nkXWGDehdFNrn3vWl8UEwJnz54fvpFBFkVwTuBQ9/UzqrCrbyVTF6QXovnEALtjc
	xSi1tzbtZU2UgENUQWRS4PV4xCShz9V5atzcZo40/bm6qEr4VWmYqApQwy4AJunMmve
	S8go3Uw60ltQaiZEJyfoKcOF5wyq8Vk3l4P50pEg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K3Hf3jZkebACvALIJcQaHYFxXMs8JYZO43CmpFJTT6Q=;
	b=cupoJqUe2hqBDwqH/r8dLTGV/ojZM6bX9gY/sTbWSmxhV8oEWM6V038Fi1JqX1V5
	B2aVQSyqxpbZEgMn/Cnm62Q3udVuiR+rU4oxf3zk9owdfSoIfjwhb3YK7BtjvFqIAJp
	2DgGJRTmOI98BmW9CY0q2bV4DvSFKHA8FYYVl1p0=
Content-Type: multipart/mixed; boundary="===============4740165615197761635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.14.3 SUCCEEDED
Message-ID: 
 <01010180c8b786fc-79e057fe-74cf-4b17-bed3-c1416f25d103-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165613

--===============4740165615197761635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.14.2-1.14.3.patch
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
--===============4740165615197761635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librepo: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-dbg: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-dev: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-dev: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-doc: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-doc: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-locale: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-locale: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-src: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-src: PKGSIZE changed from 705953 to 706181 (+0%)
packages/core2-32-poky-linux/librepo/librepo-src: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo-staticdev: PV changed from "1.14.2" to "1.14.3"
packages/core2-32-poky-linux/librepo/librepo: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-32-poky-linux/librepo/librepo: PV changed from "1.14.2" to "1.14.3"

--===============4740165615197761635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.14.2-1.14.3.patch"

From 53ac1d6c8528a68b5614147c9eeec5ddce7aea42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 07:43:01 +0000
Subject: [PATCH] librepo: upgrade 1.14.2 -> 1.14.3

---
 .../librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.3.bb
index 8dece946b4..2c8e592251 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
+SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


--===============4740165615197761635==--

