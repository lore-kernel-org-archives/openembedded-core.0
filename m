Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308E2C2BBE5
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.983.1657900668145343549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZzVHLf8h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182029493b1-2211711a-e671-41ff-8954-0ffa790e91b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a0KwEwg8dqFqDfHzTugI1A02DyamB0tlamLLFAqoD+s=;
	b=ZzVHLf8hZkKRcIcAY7Ibkpg4XNKQy6nqWmUdpBV8QZJqJDDeNl7wLSfr6qeX4lyb
	5BeW3dkPhGJuuQ73mESwxuX/xvxFSflokYJAGR9uPswCqdlOdtTdNoXbpEVhybNXG+T
	1z7AKnfkKBDsdTvG36IJiPLzcTNczdZOg8wG5wT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a0KwEwg8dqFqDfHzTugI1A02DyamB0tlamLLFAqoD+s=;
	b=b2SprLYy5+EkgvXZsL1WbVhhn+01HCQtbhyG7orIUUYK85nYAZr81hk2k0HWz6CT
	5j6Uo1/Dhb/EKxIrPNxNzMGetWa0fbQBz43VvLKa+2UHSc6Pn2hZGobDd0FL8HHzzHC
	RjdWu3RY/K6vRtYmb5QErlo9lnLWPd92y69jsLBk=
Content-Type: multipart/mixed; boundary="===============8708137499851517655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hdparm: upgrading to 9.64 SUCCEEDED
Message-ID: 
 <01010182029493b1-2211711a-e671-41ff-8954-0ffa790e91b2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168085

--===============8708137499851517655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hdparm* to *9.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hdparm-upgrade-9.63-9.64.patch
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
--===============8708137499851517655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hdparm/hdparm-dbg: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-dbg: PKGSIZE changed from 300816 to 300828 (+0%)
packages/core2-32-poky-linux/hdparm/hdparm-dbg: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm-dev: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-dev: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm-doc: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-doc: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm-locale: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-locale: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm-src: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-src: PKGSIZE changed from 229462 to 229528 (+0%)
packages/core2-32-poky-linux/hdparm/hdparm-src: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm-staticdev: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm-staticdev: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/hdparm: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/hdparm: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm: SRC_URI changed from "https://downloads.sourceforge.net/hdparm/hdparm-9.63.tar.gz file://wiper.sh-fix-stat-path.patch" to "https://downloads.sourceforge.net/hdparm/hdparm-9.64.tar.gz file://wiper.sh-fix-stat-path.patch"
packages/core2-32-poky-linux/hdparm: PV changed from "9.63" to "9.64"
packages/core2-32-poky-linux/hdparm/wiper: PKGV changed from 9.63 [default] to 9.64 [default]
packages/core2-32-poky-linux/hdparm/wiper: PV changed from "9.63" to "9.64"

--===============8708137499851517655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-hdparm-upgrade-9.63-9.64.patch"

From 268f12decacd0a01726b2b24d6f63adcc7371b8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 09:13:40 +0000
Subject: [PATCH] hdparm: upgrade 9.63 -> 9.64

---
 meta/recipes-extended/hdparm/{hdparm_9.63.bb => hdparm_9.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.63.bb => hdparm_9.64.bb} (94%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.63.bb b/meta/recipes-extended/hdparm/hdparm_9.64.bb
similarity index 94%
rename from meta/recipes-extended/hdparm/hdparm_9.63.bb
rename to meta/recipes-extended/hdparm/hdparm_9.64.bb
index 7900a310a3..558dd53f8f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.63.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.64.bb
@@ -26,7 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[sha256sum] = "70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691"
+SRC_URI[sha256sum] = "315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.31.1


--===============8708137499851517655==--

