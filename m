Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE9C2BBE7
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.902.1657900668336914378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LJGRLYuu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018202949302-c1234267-2409-4412-a0ea-860464cd8d0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gH4eMhEmKePzUSZ+bU1CamSFlti+vUlOMMOkGvaWaSs=;
	b=LJGRLYuu04Uc59b78rkgx6r6gxPI/rFuEbQAQzwnz2IdF9KCWmyqgxgzgLBZiGH8
	ccc2Za4QxJ9f39GJAoXjZulh0apMfWKmZevqdy4OCWAhfr5NNYuM7aerdlS236eUMp+
	1+iT2hSDWkm0WvBrBacu4bgVmyk32FMnD94hMSpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gH4eMhEmKePzUSZ+bU1CamSFlti+vUlOMMOkGvaWaSs=;
	b=aNyufObaC7wyObRsDjp1y+Zw6cspf+cncA87NblQ2HLGKn7EhhxE3nEVJFh5mjO4
	7jiXvYDOW0F2/VD+FLSQA1hLkuQkfC/CJHvuN1Vdl8UKGiqQa7Eo3uSAfxS/XGX5nwy
	GHs1a75w9tuINoMfuupH3CzdLPgUqOgEunLKZ4g0=
Content-Type: multipart/mixed; boundary="===============8126754893653971069=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.8.1 SUCCEEDED
Message-ID: 
 <0101018202949302-c1234267-2409-4412-a0ea-860464cd8d0a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168081

--===============8126754893653971069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.8.0-3.8.1.patch
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
--===============8126754893653971069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.8.1.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.8.0" to "3.8.1"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 22168 to 22959 (+4%)
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.8.0.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.8.1.dist-info

--===============8126754893653971069==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.8.0-3.8.1.patch"

From ead81f58e88d4ea40fce5411f078bd431b9c405e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 08:36:08 +0000
Subject: [PATCH] python3-zipp: upgrade 3.8.0 -> 3.8.1

---
 .../python/{python3-zipp_3.8.0.bb => python3-zipp_3.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.8.0.bb => python3-zipp_3.8.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.8.0.bb b/meta/recipes-devtools/python/python3-zipp_3.8.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.8.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.8.1.bb
index f1fd383842..fa2f7bcf90 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "56bf8aadb83c24db6c4b577e13de374ccfb67da2078beba1d037c17980bf43ad"
+SRC_URI[sha256sum] = "05b45f1ee8f807d0cc928485ca40a07cb491cf092ff587c0df9cb1fd154848d2"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.31.1


--===============8126754893653971069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.8.0.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.8.1.dist-info

--===============8126754893653971069==--

