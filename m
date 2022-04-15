Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31A5C38A02
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.11725.1650052687724032489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=vUkw3Eih;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101802ecde3ae-0e1fd247-585b-46c6-ba26-ea229acd8c79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AEi5dHtg09tPzZQ3g2t2AohB/rZCGcy8s7EWVGnxQng=;
	b=vUkw3EihKwNcpLuVjta42OgbxsTCQzwoaHWnWW1pNog5h1AyJMUx6zPlaZGIGcVf
	dPmZ1mITPwlg7IcxQw7+oaKrTUc5TntgrF3StzQzg70h82oRjAIVpGzT2yAsF/epot3
	MzctKxUWKDoxOlr+xD2Q+rRV4w6y7Mj6Wl1S2OlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AEi5dHtg09tPzZQ3g2t2AohB/rZCGcy8s7EWVGnxQng=;
	b=Jz/PthYFZA90sG/aMJCE7nl264iswuvwo5wVKHMuyx45M3Fc1rF5pI2Tl7JEo2N8
	aD3Dz7/Ral/tDyWXAuTPSUePa0E9x4TaFJ7zNQ50hNCKZzPzNsVKMC/lFDKPCPDOSWQ
	2ZsLssE/OyXvQtyzpAfvbZ1dg69t8o+oNdrWNYEI=
Content-Type: multipart/mixed; boundary="===============2044856174817336660=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.27.5 SUCCEEDED
Message-ID: 
 <010101802ecde3ae-0e1fd247-585b-46c6-ba26-ea229acd8c79-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164463

--===============2044856174817336660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.27.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.27.3-0.27.5.patch
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
--===============2044856174817336660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.10/site-packages/python_dbusmock-0.27.3.dist-info moved to /usr/lib/python3.10/site-packages/python_dbusmock-0.27.5.dist-info

--===============2044856174817336660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.27.3-0.27.5.patch"

From b30c4d7bc4c95f3911d0538c613fb1c80512977b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:07:15 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.27.3 -> 0.27.5

---
 .../{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
index 5febdae1bd..852d1555be 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "24feaa524e0631854a7f0529ef757c1e4c542adef89cf04e1d4248bc512a006f"
+SRC_URI[sha256sum] = "0bff30d8d01e7eef491f75d359c87765abba7001307fa8fed19cb59f06ed3c2a"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.27.0


--===============2044856174817336660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.27.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.27.5.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.27.3 [default] to 0.27.5 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.27.3" to "0.27.5"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 365340 to 366219 (+0%)
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.10/site-packages/python_dbusmock-0.27.3.dist-info moved to /usr/lib/python3.10/site-packages/python_dbusmock-0.27.5.dist-info

--===============2044856174817336660==--

