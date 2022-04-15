Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC7EC352B6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11655.1650052687585773264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=6dmk92P4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101802ecde3f1-43c2eada-eae0-4bc8-af36-fd6cd6eb8fd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kbzsyQuE9Lp9poiqkpuyjqLz2+HLu8Is3HNMwWgquKo=;
	b=6dmk92P4tZHKd8sOB546MtMNfaPzXcKygiMuDb/iAuipqldXiv9zA1G5tjY8P/qb
	tK4plHKDgqJLVSiKLCQ0PZVn19/GgPmedrdnVB60a+0aicoFHKyt1clc601WKmHV9bk
	izyo8E4SdmkJ8YkkZarMOrTKzZWiY1vfCd2i56Zo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kbzsyQuE9Lp9poiqkpuyjqLz2+HLu8Is3HNMwWgquKo=;
	b=F+JEa7BBVru1JujJWCsQ24LJE61AhCkDqLyFUpum3ZdcQyg4TMGkx/YFyn800O1f
	aO8mfkc0U6RunHbUeys69RpkldAPPZeiQ48nV7+PwmnZtgyB59wJRnt+05niqNHTnjm
	WxNvwrHqYmtpdkdm/nDHwzMWO8ls1Fk1nHzRCTtg=
Content-Type: multipart/mixed; boundary="===============0611607740478245788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.3.2 SUCCEEDED
Message-ID: 
 <010101802ecde3f1-43c2eada-eae0-4bc8-af36-fd6cd6eb8fd8-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164459

--===============0611607740478245788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.1-2022.3.2.patch
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
--===============0611607740478245788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/dtb.py /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc /usr/bin/dtb2py /usr/bin/dt-extract-props"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 213457 (+23%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/WHEEL was removed

--===============0611607740478245788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.1-2022.3.2.patch"

From fc2eb8c1a908bcf17c3ee2a0ace61a44e4363440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:10:09 +0000
Subject: [PATCH] python3-dtschema: upgrade 2022.1 -> 2022.3.2

---
 ...{python3-dtschema_2022.1.bb => python3-dtschema_2022.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.1.bb => python3-dtschema_2022.3.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb b/meta/recipes-devtools/python/python3-dtschema_2022.3.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.3.2.bb
index d73e5810b8..beaa72c45d 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.3.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1b92b3b9a31b6e4b8b2be70dbf3065775530bc4c52e991955b67be19741114c5"
+SRC_URI[sha256sum] = "5ab039e632b430df490c2649fe318d694c116c5ec3725c6f88fa43832aac2320"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.27.0


--===============0611607740478245788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.3.2.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 213457 (+23%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info, added "/usr/bin/dtb2py /usr/lib/python3.10/site-packages/dtschema/dtb.py /usr/bin/dt-extract-props /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.1" to "2022.3.2"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/WHEEL was removed

--===============0611607740478245788==--

