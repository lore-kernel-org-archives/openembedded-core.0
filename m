Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8135DC2BBF5
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.984.1657900668221831147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MDG8W+t2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018202949178-8963cbca-7334-4e12-ba6f-8cd86cbf2c70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LJkCnowv5xHlyRmL+xwEDjbX0ZyZaTCMKwl2MKINliI=;
	b=MDG8W+t2Lw0hREInWtBbXmfHsagSYOIcCeV+iKpaFQGkor/EVwUD0CxeFnz2yVj3
	MeHehZwfP7iwD93A+h88A9Xs2ZzJffQZ1U/2rGmww+7Fo8AMDm9DLHpUfEAM2QVslae
	+rYf6+CaCwfxxCtNFCJrni2n5s3Yb7GJKfaQR1kY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LJkCnowv5xHlyRmL+xwEDjbX0ZyZaTCMKwl2MKINliI=;
	b=OakdjvnAvIHU32KM7A+4U7GjdoiNyR/cpHeHRwXd2iGSpxNNmIqFMW+nnxqfgG/m
	dJlxcxsFhMeITgXc0HA3thgkjoNt/tLqM8eT33fVwdwlRaKdV6irAhx6k22nTE9Hk6F
	CyWpLcx/ACWM0UGbNUydQq1GIE2OwGGTew0BampY=
Content-Type: multipart/mixed; boundary="===============2633761527605684166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.7 SUCCEEDED
Message-ID: 
 <0101018202949178-8963cbca-7334-4e12-ba6f-8cd86cbf2c70-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168079

--===============2633761527605684166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.5-2022.7.patch
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
--===============2633761527605684166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.5.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.7.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.5 [default] to 2022.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.5" to "2022.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 218918 to 226184 (+3%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info

--===============2633761527605684166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info

--===============2633761527605684166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.5-2022.7.patch"

From 2027b43ac7cc1315d3f7338ed5b5a76f4795ac70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:50:26 +0000
Subject: [PATCH] python3-dtschema: upgrade 2022.5 -> 2022.7

---
 .../{python3-dtschema_2022.5.bb => python3-dtschema_2022.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.5.bb => python3-dtschema_2022.7.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.5.bb b/meta/recipes-devtools/python/python3-dtschema_2022.7.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.5.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.7.bb
index 0520dd76aa..dd9092f449 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "147ff18bf446131d3ba14bc751febd84f4fdedf06130f53e193d3370052dfe3f"
+SRC_URI[sha256sum] = "2238753fa16bee7b26841cced75d745af777b896190f40aff5802992335201bb"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.31.1


--===============2633761527605684166==--

