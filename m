Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E241BC47084
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2284.1651434542695814791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yW7Ocenr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5605-041d9857-eed7-44ed-9c66-efdb72154977-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qNyMq4qg9Nf7PBgDl7j7+obA55czil1O7VfTyQn+6KE=;
	b=yW7Ocenrjav19BayA/Bd0ExNHOyHAkcJGBdOX7R4iTuQ0Kw87U8A6fHspplJDzxA
	S+atBjtHr3hVXAvwUDJXlnsZxF2w2r/1AwJ25pvNKyUZK7jFb84aRoML0YF1YhC3VWR
	Jx8ZfsBv64ZZJlQj+OXf2+4JbVQKaOafsSFx8E7o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qNyMq4qg9Nf7PBgDl7j7+obA55czil1O7VfTyQn+6KE=;
	b=NPaAaaR93viAdLkU3WLSgJBjkJY35E8g/7kg8X/InSZxoEfArlnHdveHY4Eoi6TP
	qsOh5AmjXGXWhCH/uL9D/fJcweqvz2MGC6GaxYSVeh7DuX1GXFLarZIRJlOLhIdmOSW
	Tx4uYOFWsITLM29BzAohUniJsEe/DvUO7+RWyRqg=
Content-Type: multipart/mixed; boundary="===============2549928767219527752=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.1.2 SUCCEEDED
Message-ID: 
 <01010180812b5605-041d9857-eed7-44ed-9c66-efdb72154977-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165115

--===============2549928767219527752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.1.1-7.1.2.patch
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
--===============2549928767219527752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.10/site-packages/pytest-7.1.1.dist-info moved to /usr/lib/python3.10/site-packages/pytest-7.1.2.dist-info

--===============2549928767219527752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.1.2.tar.gz"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 1879998 to 1880068 (+0%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.1.1" to "7.1.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.10/site-packages/pytest-7.1.1.dist-info moved to /usr/lib/python3.10/site-packages/pytest-7.1.2.dist-info

--===============2549928767219527752==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.1.1-7.1.2.patch"

From 5313f34d01477731709202388d03f9fc7fee862b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:32:37 +0000
Subject: [PATCH] python3-pytest: upgrade 7.1.1 -> 7.1.2

---
 .../python/{python3-pytest_7.1.1.bb => python3-pytest_7.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.1.1.bb => python3-pytest_7.1.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.1.2.bb
index 1cb2fb01c0..c642d9a232 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "841132caef6b1ad17a9afde46dc4f6cfa59a05f9555aae5151f73bdf2820ca63"
+SRC_URI[sha256sum] = "a06a0425453864a270bc45e71f783330a7428defb4230fb5e6a731fde06ecd45"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.27.0


--===============2549928767219527752==--

