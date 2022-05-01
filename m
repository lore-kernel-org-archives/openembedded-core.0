Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F158CC47087
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2287.1651434543254692642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=5Eulc4t9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b54b4-45319b82-2604-4ae4-ade9-d5a0b610da2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cyzcJvfZW7P5eHwYdB66UHp1ApKHFyebonWKqo9YZmQ=;
	b=5Eulc4t9APRw1BzlOMwf/aZKahSQkzVOVcZjljIMWCI0hsZOXuuB/gR/zvxR32yT
	XGD3Kwxo9cP8dWfY2XChsfRIUGFAD5y8TPmRZ75LfIE521HMcD2uVTnv2pXFyPI8ZfC
	rxTJX/bUoDws1mpbK9an0KZ1KVGEdy8VPuySlLVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cyzcJvfZW7P5eHwYdB66UHp1ApKHFyebonWKqo9YZmQ=;
	b=X4Y0BhJpMZn4o0dunjENQlpeN08rkSgnqN92+Q+4bsaDBzDguWwg3XlB1g6ITCZ7
	cGD+MIA4ffXApbYZ7Vda3BXts3sOYZY2bzKDVqGqy+giQhj2b0No9YyympEtCbnLmUD
	WZcbKxZdTvwOCNXqcxWX91gmb9I2H48NHF88azlI=
Content-Type: multipart/mixed; boundary="===============8139701870167906328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 3.1.2 SUCCEEDED
Message-ID: 
 <01010180812b54b4-45319b82-2604-4ae4-ade9-d5a0b610da2b-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165116

--===============8139701870167906328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jinja2* to *3.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-3.1.1-3.1.2.patch
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
--===============8139701870167906328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-3.1.1-3.1.2.patch"

From a81009c56f54bcaa135146d3dc6b2721697756bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:21:40 +0000
Subject: [PATCH] python3-jinja2: upgrade 3.1.1 -> 3.1.2

---
 .../python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
index c38686a5c2..80e0b85670 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9"
+SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.27.0


--===============8139701870167906328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.10/site-packages/Jinja2-3.1.1.dist-info moved to /usr/lib/python3.10/site-packages/Jinja2-3.1.2.dist-info

--===============8139701870167906328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.1.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-jinja2: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 915074 to 917861 (+0%)
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.10/site-packages/Jinja2-3.1.1.dist-info moved to /usr/lib/python3.10/site-packages/Jinja2-3.1.2.dist-info

--===============8139701870167906328==--

