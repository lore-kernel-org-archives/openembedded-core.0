Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F5CCA48E
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.671.1654100324053003540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KGFc6+mk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200feb1e-be1e5f17-deb4-42db-96ef-a905aa3f0251-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9oi4aEAFguY4tjCLP6/m4gmPoDvW9mWUvRV40diceY4=;
	b=KGFc6+mkuyLXR8Qu/pgWikMKgMX4KGXoWr80NRg2p573ESEJbVCBNP+h2ossUyPs
	tgFmoIP6DEiGOU/ZxJo742y9scjAQY4E07Q3XTkWF790Lz0agDammQypb7RUdbNJkvY
	bSl3ErwLrWN0pPfzZnpoSBPj/Smm3k6s1CWHrCvs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9oi4aEAFguY4tjCLP6/m4gmPoDvW9mWUvRV40diceY4=;
	b=g9Muudav/kp0QgG1obwLKHyh5QtDhFnpYVZLmoKGHYwk2hV3op5XpziJ2sKO3hav
	RGWdextBq1OOLsWCpyab/aMH/ADvIAk5qPOydk2yzbvLr9OrZjaBHkFPJjv314Q2cjU
	4q11GNeNUByWDU/Qqpilt9GN2fODTysT7L/ioM7g=
Content-Type: multipart/mixed; boundary="===============1093016478079830226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 22.1.2 SUCCEEDED
Message-ID: 
 <01010181200feb1e-be1e5f17-deb4-42db-96ef-a905aa3f0251-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166407

--===============1093016478079830226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *22.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-22.1.1-22.1.2.patch
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
--===============1093016478079830226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-22.1.1.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-22.1.2.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch"
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 12541127 to 12541218 (+0%)
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "22.1.1" to "22.1.2"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.1.1.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.1.2.dist-info

--===============1093016478079830226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.1.1.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.1.2.dist-info

--===============1093016478079830226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-22.1.1-22.1.2.patch"

From 47677497b7b53111c1b028ad3359b52255a86bfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 08:39:31 +0000
Subject: [PATCH] python3-pip: upgrade 22.1.1 -> 22.1.2

---
 .../python/{python3-pip_22.1.1.bb => python3-pip_22.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.1.1.bb => python3-pip_22.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.1.1.bb b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_22.1.2.bb
index ad239e952a..0573db603d 100644
--- a/meta/recipes-devtools/python/python3-pip_22.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
@@ -37,7 +37,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "8dfb15d8a1c3d3085a4cbe11f29e19527dfaf2ba99354326fd62cec013eaee81"
+SRC_URI[sha256sum] = "6d55b27e10f506312894a87ccc59f280136bad9061719fac9101bdad5a6bce69"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.31.1


--===============1093016478079830226==--

