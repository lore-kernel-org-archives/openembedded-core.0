Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E740BC2BBE9
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.39617.1656687063090204984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WJGGqQMy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181ba3e6be4-8608ae2c-3f67-4deb-9357-607186d51783-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tK9NZvXYiyB0EvP5uFQwtBkY+cXlXIVgdgIZa1uHYos=;
	b=WJGGqQMyMfddjO+4aGFAVJuS372fV+xuZHGbuXXgJukxyTNWivReFr+gpmBQZ+Gk
	9xmr8XWEeZD1RkbAcIeCaSx7hwQXfFqlubffdtCCE4IFuFgrPTfQG3dWyLEexsLETpm
	e32qXtveSBnMq+alnndLQ8pJ5MH7CC4vpv9+dUY4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tK9NZvXYiyB0EvP5uFQwtBkY+cXlXIVgdgIZa1uHYos=;
	b=BFiKeLHrkY1K95KOeF2abcGCnEgyQuoYOXPbguf5sKs9dh6u3uW5xxMT2u8ClYiB
	YG+cRYTdmwXKB/ogSVGfvc6ApP1NLgi1YrD8DC/KpYNO5j5q+g+r7wLIYJXJPVhGy9U
	ARBImfuqqs5uOXvLW/SoX5NB5kT0jGq1un5O4GKc=
Content-Type: multipart/mixed; boundary="===============3571988543054888958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.3.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6be4-8608ae2c-3f67-4deb-9357-607186d51783-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167489

--===============3571988543054888958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.3.0-1.3.1.patch
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
--===============3571988543054888958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.3.1.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 411822 to 412059 (+0%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.3.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.3.1.dist-info

--===============3571988543054888958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.3.0-1.3.1.patch"

From d8d00610feaf80b2fcd764c08b98e17dd97e33ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:39:12 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.3.0 -> 1.3.1

---
 .../{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
index 6e7ccd743f..fd76a28fb1 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
+SRC_URI[sha256sum] = "aaa63019c9d666053d9ff318097335e766123844547c52940155c0401c3c142f"
 
 # Until we have a proper tool to invoke PEP517 builds, hatchling can't
 # bootstrap itself automatically.
-- 
2.31.1


--===============3571988543054888958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.3.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.3.1.dist-info

--===============3571988543054888958==--

