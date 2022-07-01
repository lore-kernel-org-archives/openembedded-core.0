Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9D9CCA499
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.39737.1656687063712023887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DMqmkFpm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181ba3e6da2-e2bb55dc-d3ce-4c07-8fa6-b153266d725e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aycTA3mZqfmNW09d0SyswB4lyn2+Gl/YL8ILuQxz5Xc=;
	b=DMqmkFpmLUojsJDXMox68NGGAPFaaE1wRQuovWwAN2ij0eCiPm8JJe1quPUvYG0A
	NWCebaUIu2ZdzkMnKX8nqmDsTsw+GCS2Net60aH48YYrUdcYioeWOhHwcmNy7DQZoOa
	WPyn+gpKP7OLyKvL/q069otlclwjfIKoYOKOl+AQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aycTA3mZqfmNW09d0SyswB4lyn2+Gl/YL8ILuQxz5Xc=;
	b=bdNN40eAqUEmTTuVNvmKVau2XE4WNzJbu2NX+Tyqzy2syAZ+ZdBAZAbbGDQGL8lL
	pak9UY70m2ulBja+2LdyOxmamd1ssFRsHZJmauDwRx0MJb21wGAxEwLPGf2wsHNyssr
	V+j8nFPiPqLePNM5kRvKZiUtfrh/vn+u1Nff0jXk=
Content-Type: multipart/mixed; boundary="===============2054025173379762063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.28.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6da2-e2bb55dc-d3ce-4c07-8fa6-b153266d725e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167503

--===============2054025173379762063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.28.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.28.0-2.28.1.patch
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
--===============2054025173379762063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.1.tar.gz"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.28.0 [default] to 2.28.1 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.28.0" to "2.28.1"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 342567 to 342517 (-0%)
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.10/site-packages/requests-2.28.0.dist-info moved to /usr/lib/python3.10/site-packages/requests-2.28.1.dist-info

--===============2054025173379762063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.28.0-2.28.1.patch"

From a4089fd7a2c134202c1a6a1c7af2c98bce2bfb87 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:56:55 +0000
Subject: [PATCH] python3-requests: upgrade 2.28.0 -> 2.28.1

---
 .../{python3-requests_2.28.0.bb => python3-requests_2.28.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.28.0.bb => python3-requests_2.28.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.0.bb b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-requests_2.28.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.28.1.bb
index f71763565d..ac8a570160 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "d568723a7ebd25875d8d1eaf5dfa068cd2fc8194b2e483d7b1f7c81918dbec6b"
+SRC_URI[sha256sum] = "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
 
 inherit pypi setuptools3
 
-- 
2.31.1


--===============2054025173379762063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.10/site-packages/requests-2.28.0.dist-info moved to /usr/lib/python3.10/site-packages/requests-2.28.1.dist-info

--===============2054025173379762063==--

