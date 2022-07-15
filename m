Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FFACCA49C
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.941.1657900668511507213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IayWtHr5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182029491ef-7928d8cf-d313-4f81-8901-8ff5d9bce9aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d3VZQHHI6z1Yq88Eaa4ki/qtZ9bH2UmOeyVesEwIltg=;
	b=IayWtHr5wANdHP9sO6pcfzNcUua88uGYrkmm/eq96m6QR2Fpmj9K3OBTYAxXd6Sc
	oMefUZed/FaKUuuFjvXkNhSEVFGfRcnflkg53OT1er+WK0paXn0HZUyOA6WJQr+rjyv
	VsrIJhoRJ/x9qNBJWpP3RL7OZ5fKAKv6b2W82ECk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d3VZQHHI6z1Yq88Eaa4ki/qtZ9bH2UmOeyVesEwIltg=;
	b=ezggBnWGftxxcr/g4lc87qOYg0NkbLjhDatlITVxMBUlyCV737gLtfB9595eiguM
	vnw1//pFsBrzFUhIXZhFs3edBouP0kc8WOIiYw5D/R4cy8PMmEMv/t6YYFN0T2FetbT
	67M6nINHCimP9lTvscGvInz+/0qLSwNseEWduLe0=
Content-Type: multipart/mixed; boundary="===============7867388730279800236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.7.2 SUCCEEDED
Message-ID: 
 <01010182029491ef-7928d8cf-d313-4f81-8901-8ff5d9bce9aa-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168086

--===============7867388730279800236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.7.1-4.7.2.patch
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
--===============7867388730279800236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.7.1.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.7.2.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.7.1" to "4.7.2"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.7.1 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 690656 to 692410 (+0%)
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.7.1.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.7.2.dist-info

--===============7867388730279800236==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.7.1-4.7.2.patch"

From b5ee3302ab342aeb1df0f82110e2665d5b744e74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:58:23 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.7.1 -> 4.7.2

---
 ...{python3-jsonschema_4.7.1.bb => python3-jsonschema_4.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.7.1.bb => python3-jsonschema_4.7.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
index f17f28a57f..e488793313 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "25203dbebd62a1179f810f14339f7a638baaf279b5cc3b738a58c3744af56d65"
+SRC_URI[sha256sum] = "73764f461d61eb97a057c929368610a134d1d1fffd858acfe88864ee94f1f1d3"
 
 inherit pypi python_hatchling
 
-- 
2.31.1


--===============7867388730279800236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.7.1.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.7.2.dist-info

--===============7867388730279800236==--

