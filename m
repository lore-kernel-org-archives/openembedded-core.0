Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF39C47085
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2284.1651434543177238935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=6kKHIHb+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5516-17944d0c-2bef-437b-805e-7a608e437555-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TjfZtQkViGTpfSM+/Fm0bJJHk477xbNhmT7wnjTRHoA=;
	b=6kKHIHb+NC6OGt5TmPXsmYFnShuP1lak+Ny8QAGWcMXQSHw6AXnsyb2+L1LyZivB
	+7ooSPaXjhqG0J+IPDLawaGvjZJPFzI1uED3pdZ5esyQYvQfGOFepoyYBfwR1FO2SmF
	bVVo7A5eEG/hhHsglOVtXBD5oy6C83JSYiG0Nki0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TjfZtQkViGTpfSM+/Fm0bJJHk477xbNhmT7wnjTRHoA=;
	b=WViV/ctFJrykvU+ygfEVwWNEMM/RmW3Bw6+PrQcKstOnEURhr+LoL1VS07zq3bxL
	I5snti9RTKEB5k+h1I7yNpWOsny1v3K9hEIteBhyMIDTTeighB2wFEttDHBvF7pDLYD
	LBo1PdnWwHFGBBM4oXypYGEZ1mWGKImaX/gdSe4M=
Content-Type: multipart/mixed; boundary="===============5233245941059381974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.4 SUCCEEDED
Message-ID: 
 <01010180812b5516-17944d0c-2bef-437b-805e-7a608e437555-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165111

--===============5233245941059381974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.1-2022.4.patch
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
--===============5233245941059381974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 214427 (+24%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc /usr/bin/dt-extract-props /usr/bin/dtb2py /usr/lib/python3.10/site-packages/dtschema/dtb.py"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added

--===============5233245941059381974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.4.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.1" to "2022.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info, added "/usr/bin/dtb2py /usr/lib/python3.10/site-packages/dtschema/dtb.py /usr/bin/dt-extract-props /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 214427 (+24%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.1" to "2022.4"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added

--===============5233245941059381974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.1-2022.4.patch"

From 6555ca3ec00184bfb780593dd593dd3b95c7af12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:15:50 +0000
Subject: [PATCH] python3-dtschema: upgrade 2022.1 -> 2022.4

---
 .../{python3-dtschema_2022.1.bb => python3-dtschema_2022.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.1.bb => python3-dtschema_2022.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb b/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.4.bb
index d73e5810b8..7bc89c844c 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1b92b3b9a31b6e4b8b2be70dbf3065775530bc4c52e991955b67be19741114c5"
+SRC_URI[sha256sum] = "c70a644e0100b5bacd44839a2316291d8eee91f6535a8419459de59fd0fcf6ce"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.27.0


--===============5233245941059381974==--

