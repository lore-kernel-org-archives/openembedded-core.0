Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD300C352A8
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11654.1650052687524038794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=vk2j8rOM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecde49a-ff52621c-e491-44f1-a36e-a665196f2ea7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LtycrL+KOXzFpz1FY8q35eZKYs8GwwlR9SZeeCkwWqo=;
	b=vk2j8rOMkXlSSDWfAzurVRsRPdsmTie0Qc7nv/HYRYq4lmmLldeVWpaLP0Q+uJdS
	fHV/E4iGJvW487P2GMikXcWh93Fb4XCadDzBtbYqxGLsGs+Xr3p+Q9csVzhxYW+XE1k
	BFPWGcQkZTGWtyoWaf7OzDglJz0TxCOeG09IN+m0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LtycrL+KOXzFpz1FY8q35eZKYs8GwwlR9SZeeCkwWqo=;
	b=OJZtUoU6DyO6v0n5e0zM2MbCbaW7ScUc0SS9O83acKJtdrDnbep6MbbeNN5vEbN3
	+b7RkXj4sLb/s4eZ9wR0G/pe7LNZxY6gad93rs8knwvdP4p1jSoAac5PQI39LK1hD22
	TQZ1HAE8EZAYVhXS6Mc92PYzg3aNdLOe/O5untKM=
Content-Type: multipart/mixed; boundary="===============3006004355570057943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 2.3 SUCCEEDED
Message-ID: 
 <010101802ecde49a-ff52621c-e491-44f1-a36e-a665196f2ea7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164453

--===============3006004355570057943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonpointer* to *2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-2.2-2.3.patch
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
--===============3006004355570057943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-2.2-2.3.patch"

From d16b1417d2138f9edb27164f3fe069559f517fa1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:15:41 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 2.2 -> 2.3

---
 .../{python3-jsonpointer_2.2.bb => python3-jsonpointer_2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_2.2.bb => python3-jsonpointer_2.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
index 225fde7556..16d5cab4cf 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085e360fe6feb6a48bf"
+SRC_URI[sha256sum] = "97cba51526c829282218feb99dab1b1e6bdf8efd1c43dc9d57be093c0d69c99a"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.27.0


--===============3006004355570057943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 10424 to 13630 (+31%)
Changes to packages/core2-32-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.10/site-packages/jsonpointer-2.2.dist-info moved to /usr/lib/python3.10/site-packages/jsonpointer-2.3.dist-info

--===============3006004355570057943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonpointer: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-2.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-2.3.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-jsonpointer: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 10424 to 13630 (+31%)
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "2.2" to "2.3"
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 2.2 [default] to 2.3 [default]
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 25959 to 27995 (+8%)
packages/core2-32-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "2.2" to "2.3"
Changes to packages/core2-32-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.10/site-packages/jsonpointer-2.2.dist-info moved to /usr/lib/python3.10/site-packages/jsonpointer-2.3.dist-info

--===============3006004355570057943==--

