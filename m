Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68767C2BBF0
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.919.1657900667876003910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gHpcelYR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018202949115-2c9138c5-cc74-4cad-974c-3ec3ce0cfb70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nXHDZOt57kv/V6aODB5W364jufCLHZ6X0Hkw9S5CpjA=;
	b=gHpcelYRiXbYT4Rzrk7zYim91c+vOzP1fpQ4YfY5aijh15i/nLXaVz3pJbRqorFH
	rgirbGye+CKSrKMMjM5kuT831Bv3Ptd5UFXluo19RU3UJ9MRbGzMbpDCLMvRS4keKfn
	yM+ldwv6lbAyYMsQYbvkX1oua5cF0da6HZs/1BLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nXHDZOt57kv/V6aODB5W364jufCLHZ6X0Hkw9S5CpjA=;
	b=NS0nugc8Q/EtFzXGhccTVE4pk9nH+mM0FFNUb5JVLG4G904zJ76J/y52KrzMe7AM
	0leQwLcqiU5l/d71QQMR6KkeyxHK6tptEXHbv5uLgmk1DHM3BhI+46nqLyjRunlk5BU
	y04T9Ud4iIDTZOS1n3Pj1FVL3qogFMI+VVajxzVI=
Content-Type: multipart/mixed; boundary="===============4917164322743365257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 d7b343fd262880994f041ce2335442e7bd1071f5 SUCCEEDED
Message-ID: 
 <0101018202949115-2c9138c5-cc74-4cad-974c-3ec3ce0cfb70-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168072

--===============4917164322743365257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *d7b343fd262880994f041ce2335442e7bd1071f5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============4917164322743365257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

From 9416bd7d629584bb23e465bdb4367c35ec3aa5f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:44:05 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 3e611d1306..0bb94ab93a 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
+SRCREV = "d7b343fd262880994f041ce2335442e7bd1071f5"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.31.1


--===============4917164322743365257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+b7e4d5a6ae [default] to 0.1+gitAUTOINC+d7b343fd26 [default]
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 229644 to 229396 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 210092 to 210197 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+b7e4d5a6ae" to "0.1+gitAUTOINC+d7b343fd26"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26

--===============4917164322743365257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+b7e4d5a6ae to 0.1+git0+d7b343fd26

--===============4917164322743365257==--

