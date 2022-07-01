Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5FBC2BBEB
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.39616.1656687062426210900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ln6sw49w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181ba3e6bc3-ea970ff0-ba8b-47c1-a6ca-e471669ecb86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=82mv4VKEML7g0l6rBFORYzDTc5wPcmLvVJnS8Dbt6SQ=;
	b=Ln6sw49wMvCsx/SICMQ5phyn7wvSXt7aQ6V7mT/vocOeVMf5nTp+nkkOVZPw3Lg6
	4sOIIlt0YGjwDhmRjSyFGfnoxdTJVxOaL6ZbF2d/iIBZlmQ4DuIl+m3VXROorMLPqmj
	J6FTju6DBM6JdkD/gFwlNwmKfFq7IRImt/mv5VW0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=82mv4VKEML7g0l6rBFORYzDTc5wPcmLvVJnS8Dbt6SQ=;
	b=XbZBGd7Y4fPrn5w4Xl/bQz9ULF/LiNrF7Tn6foTO4hBsR/JzBUFWPgD/J5en+h/j
	EPYKgGsCBvoAp97lICpvm6jRiRyDzxslT5dg1dDJanrKEDpig44PG2LnDZ7cyCa0QdJ
	XeqMR2aK6Z9AjbDk9pzk4k8Vnec1luGgFoxz1Wv4=
Content-Type: multipart/mixed; boundary="===============7954505844369201173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.6.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6bc3-ea970ff0-ba8b-47c1-a6ca-e471669ecb86-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167484

--===============7954505844369201173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.6.0-4.6.1.patch
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
--===============7954505844369201173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.6.1.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 685160 to 688418 (+0%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.6.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.6.1.dist-info

--===============7954505844369201173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.6.0-4.6.1.patch"

From ecf192bd33d5a5b23ab16c6d312be18c8972d923 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:45:14 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.6.0 -> 4.6.1

---
 ...{python3-jsonschema_4.6.0.bb => python3-jsonschema_4.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.6.0.bb => python3-jsonschema_4.6.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
index edd7fafc77..5a5c80c821 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "9d6397ba4a6c0bf0300736057f649e3e12ecbc07d3e81a0dacb72de4e9801957"
+SRC_URI[sha256sum] = "ec2802e6a37517f09d47d9ba107947589ae1d25ff557b925d83a321fc2aa5d3b"
 
 inherit pypi python_hatchling
 
-- 
2.31.1


--===============7954505844369201173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.6.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.6.1.dist-info

--===============7954505844369201173==--

