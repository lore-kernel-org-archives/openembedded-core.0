Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABF9C19F56
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4446.1655298221255889541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UidmKZtc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101816776619a-70427ccb-9d85-4ade-a7ad-b590fed75650-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dlbbb8Vw/nYIKxzHxeIR2WvB/FVRA/Q7T1PyBGshBBA=;
	b=UidmKZtcOqiHKO1in0rRtVXq1XT53EbZLqQtxGe6duaH3+s6CVXrIUEXpNnM9Q7H
	4cUk+/TYA+Fs3/D9L8BtDB57mCHUw219yje/tFQuT+voOeCuDSB0KSOIpfqcB8rZ1N3
	J8pU/LHcfVn6q8YJe278OajoTYd8V6tQGVi6t8U0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dlbbb8Vw/nYIKxzHxeIR2WvB/FVRA/Q7T1PyBGshBBA=;
	b=gQtVHHbHjAyWL18PlhkBUvFIJdeOqjChff/952hWETAW120T3PDVZjm6vpmuGHrj
	UXu8GK8FUUT85+kC7/X72DrzoKTAtCr+YCfm6JbMEOPKkpNo0BoVx4HxNHwbQGAcyDJ
	e5/GlChU6xjioNxaTivD7qebr9PIdwVJTp0AmKSY=
Content-Type: multipart/mixed; boundary="===============7374373859973433547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.10.2 SUCCEEDED
Message-ID: 
 <010101816776619a-70427ccb-9d85-4ade-a7ad-b590fed75650-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166942

--===============7374373859973433547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-babel* to *2.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.10.1-2.10.2.patch
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
--===============7374373859973433547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.10.1-2.10.2.patch"

From 369463f2ca0028fb485711a01dad6064f13ddde3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:50:19 +0000
Subject: [PATCH] python3-babel: upgrade 2.10.1 -> 2.10.2

---
 .../python/{python3-babel_2.10.1.bb => python3-babel_2.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.10.1.bb => python3-babel_2.10.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.10.1.bb b/meta/recipes-devtools/python/python3-babel_2.10.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-babel_2.10.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.10.2.bb
index d06eb2bf5c..a236851a18 100644
--- a/meta/recipes-devtools/python/python3-babel_2.10.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.10.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1b3f4650099e6d6a73e5a7fc8774ff18"
 
-SRC_URI[sha256sum] = "98aeaca086133efb3e1e2aad0396987490c8425929ddbcfe0550184fdc54cd13"
+SRC_URI[sha256sum] = "7aed055f0c04c9e7f51a2f75261e41e1c804efa724cb65b60a970dd4448d469d"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.31.1


--===============7374373859973433547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-babel: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.10.2.tar.gz"
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGV changed from 2.10.1 [default] to 2.10.2 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel: PV changed from "2.10.1" to "2.10.2"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 30302571 to 30304465 (+0%)
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info moved to /usr/lib/python3.10/site-packages/Babel-2.10.2.dist-info

--===============7374373859973433547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info moved to /usr/lib/python3.10/site-packages/Babel-2.10.2.dist-info

--===============7374373859973433547==--

