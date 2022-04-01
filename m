Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D80C35276
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10524.1648819420933909631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=8pKUrmOv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017fe54bbadc-50d11c66-77fa-49c6-bbc6-4bd347cd46c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ji4/fTplrRc9Sb2FDKRLU6Kf4GhV9q5jQ8swMcUYWxg=;
	b=8pKUrmOvQkjZkyrmiZU5WRb6ksxXJIBwFMlDjotNyoZ6t8Skx8Y/BxVWuRQ/ThfU
	I4s9n1qbtOo2w7pHY3tVpjYWhMmI58gHm17nFgij8pjzZxwp5fAkqcu/3wl2zlTerM4
	olADYvJ2Potx7fiVJLMlD3F/StajKrrvr9PQlNho=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ji4/fTplrRc9Sb2FDKRLU6Kf4GhV9q5jQ8swMcUYWxg=;
	b=fkpRA3wkWfedU2ji/qiSfAaErbehGWxMCToleh7tlSAxXh4xU4Omr14RpE2B7kmV
	b9F7iPWnFzqvvlNfMbDHiwktscUusDCq1TtsOZQZd5vg3iRvXxdUQyVTVrEFP0CCh+a
	G0k7LKbGiXH35WrO5dcaL2WeR7axy1iEDcRfsixw=
Content-Type: multipart/mixed; boundary="===============1377765669488046512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.3.2 SUCCEEDED
Message-ID: 
 <0101017fe54bbadc-50d11c66-77fa-49c6-bbc6-4bd347cd46c5-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163903

--===============1377765669488046512==
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
--===============1377765669488046512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 213457 (+23%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info, added "/usr/bin/dtb2py /usr/bin/dt-extract-props /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc /usr/lib/python3.10/site-packages/dtschema/dtb.py"
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

--===============1377765669488046512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.1-2022.3.2.patch"

From 0dbd9246644b3466d2d1cb919099b136081dbd42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 07:32:26 +0000
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


--===============1377765669488046512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.3.2.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.1" to "2022.3.2"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.2.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/dtb.py /usr/bin/dt-extract-props /usr/bin/dtb2py /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 173534 to 213457 (+23%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.2 [default]
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

--===============1377765669488046512==--

