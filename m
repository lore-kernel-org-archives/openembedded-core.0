Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E0FC4707A
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.10405.1647349734989351785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=g7kf5BVX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f8db21a76-9a514c46-7110-4d3a-b276-0fea2b2478d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wv9ZtCuA3M7b6fYI+YgNbBDlPQzs72YnLwX8SSoLJ3Y=;
	b=g7kf5BVXAvqk3cnp28FAqH4v4RFAYKoPh1UKuV7CIi4hkaxtj9MkJaZ7igHi+fEd
	EgELwNDTnuhRsdaxcn1y1+76zRbgamb6l/raBw67yVilvW0ZUMteeFLZp5PBr3eMhIq
	jEZgDZlnq1gv405h2m51VsBKTCPoHoJ3Rt3lpPJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wv9ZtCuA3M7b6fYI+YgNbBDlPQzs72YnLwX8SSoLJ3Y=;
	b=DyCBR7j3T6Y/42dvaKS2+KUzGhbTVlO8F3+eIRiPpM9xxTkDUgtedqBq+vkL1PMA
	iJoZLXg62lAUMU8doP9by0ZtbD1So9qgH86SZXTsCpKV+7GS33kuJqgwCq5A+XM88uW
	Km6Gs/Epc8Uw9nso+HNN0zO87jsxLvwYTnrTllsE=
Content-Type: multipart/mixed; boundary="===============7425368197871998122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.3.1 SUCCEEDED
Message-ID: 
 <0101017f8db21a76-9a514c46-7110-4d3a-b276-0fea2b2478d1-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163255

--===============7425368197871998122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.1-2022.3.1.patch
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
--===============7425368197871998122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.3.1.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 182388 to 224520 (+23%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.1 [default] to 2022.3.1 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.1" to "2022.3.1"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info, added "/usr/bin/__pycache__/dtb2pycpython-310.pyc /usr/bin/__pycache__/dt-extract-propscpython-310.pyc /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc /usr/bin/dtb2py /usr/bin/dt-extract-props /usr/lib/python3.10/site-packages/dtschema/dtb.py"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/REQUESTED was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/INSTALLER was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/REQUESTED was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/WHEEL was removed

--===============7425368197871998122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 182388 to 224520 (+23%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info, added "/usr/bin/dt-extract-props /usr/bin/__pycache__/dtb2pycpython-310.pyc /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc /usr/bin/dtb2py /usr/lib/python3.10/site-packages/dtschema/dtb.py /usr/bin/__pycache__/dt-extract-propscpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/REQUESTED was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.3.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema/dtb.py was added
  /usr/lib/python3.10/site-packages/dtschema/__pycache__/dtb.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/INSTALLER was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/REQUESTED was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.1.dist-info/WHEEL was removed

--===============7425368197871998122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.1-2022.3.1.patch"

From 300172a81e41bb93be53a6c07106fdfa7b085001 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:42:38 +0000
Subject: [PATCH] python3-dtschema: upgrade 2022.1 -> 2022.3.1

---
 ...{python3-dtschema_2022.1.bb => python3-dtschema_2022.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.1.bb => python3-dtschema_2022.3.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb b/meta/recipes-devtools/python/python3-dtschema_2022.3.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.3.1.bb
index d73e5810b8..d6dce99024 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.3.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1b92b3b9a31b6e4b8b2be70dbf3065775530bc4c52e991955b67be19741114c5"
+SRC_URI[sha256sum] = "62d858b78c23a36441537c6e066b8cafa1bfd9e0402ed60118c27ed9d45ce58f"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.27.0


--===============7425368197871998122==--

