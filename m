Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36CBC4321E
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18723.1652634912674414110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iWmSb9an;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180c8b78733-6fa336bb-8e41-483a-8dd6-b3c652e0fbdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D5/W50QfvvY8iPM4ijM+vjlXIF4e4uAOxjdQH4+V8jU=;
	b=iWmSb9anoTfUPqIylBUzEr2BKWGqesHdYJigU6qNCJelcmqjyn0ZFpkGvCl8MIOk
	S/9eMiNCBxQTzSZ88RARekXP7zrHlzo3CAOplVq5Ss6wuDHCcZnyG/dGS/X2w1WoZmR
	RtVHSfavqRU48Hrc/WaqEwtzSkksuMSOH1wf0j9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D5/W50QfvvY8iPM4ijM+vjlXIF4e4uAOxjdQH4+V8jU=;
	b=TELF3oeocF8qr8RafVijuu5Xjru9F+GJ5RMW/DmEkxZvZLNQHwuwKryRV3iqmi+J
	dfmBOlo/OZAhsEHypd02ZlGNqUNTetUKbuT6G0V1ovr84VoUqPCxAEhNXQ+R9NTvjHD
	A6K3uhftsn+U11dvZykX8Im4Odxye7J52Q+A3uQ0=
Content-Type: multipart/mixed; boundary="===============0401112703264006697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.5.1 SUCCEEDED
Message-ID: 
 <01010180c8b78733-6fa336bb-8e41-483a-8dd6-b3c652e0fbdc-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165612

--===============0401112703264006697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.4.0-4.5.1.patch
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
--===============0401112703264006697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.5.1.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 564670 to 566752 (+0%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.4.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.5.1.dist-info

--===============0401112703264006697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.4.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.5.1.dist-info

--===============0401112703264006697==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.4.0-4.5.1.patch"

From 64e74bdd56b6a8adaaeadb068d811faa810a3dc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:49:29 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.4.0 -> 4.5.1

---
 ...{python3-jsonschema_4.4.0.bb => python3-jsonschema_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.4.0.bb => python3-jsonschema_4.5.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
index 10b39e76b2..9f8719870c 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "636694eb41b3535ed608fe04129f26542b59ed99808b4f688aa32dcf55317a83"
+SRC_URI[sha256sum] = "7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.31.1


--===============0401112703264006697==--

