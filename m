Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF3DC38A06
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.18887.1652634913677731025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L7Bh31GX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180c8b7891a-a7d7c2a3-9fe8-48cf-9e81-b3be0df8d81c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qhls7f9lfAfuvRCcGyWAVc8Hu8dbmeckQaEEcNarHh0=;
	b=L7Bh31GXqS4q+AeySdcp8poAWiJ0fpagUyT0bOaLemZQ7WDOfX0s4/V8dOSC9TFl
	4aDg/+NXzjlMD/F/mX0N92XUV8UgjCtBdAK3TjB+QgSDPQksAkiMjmfCuiPB0/g++60
	RBsDe92ZEX1WbQ4y1OmADfFVVIxReUkqVCeChms8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qhls7f9lfAfuvRCcGyWAVc8Hu8dbmeckQaEEcNarHh0=;
	b=kjqTFh/2FQG+oZc61hczYihj29POcQvxQVxptDYu5OcBWfZxUoRGR9UmXmLOf9xy
	jK5iPKhrgYLBxvj/J1SrtPgVOVq5kn29UWmJzou4RP4AO+1HWpEcC4XbEkG1i3jl+JH
	Y5/TQ34QKUl3gK+mw19IbO/dXmZtMMbdn9jb8Y10=
Content-Type: multipart/mixed; boundary="===============5046895781116179504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.0.9 SUCCEEDED
Message-ID: 
 <01010180c8b7891a-a7d7c2a3-9fe8-48cf-9e81-b3be0df8d81c-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165625

--===============5046895781116179504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyparsing* to *3.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.0.8-3.0.9.patch
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
--===============5046895781116179504==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.0.8-3.0.9.patch"

From e4432bf2cd8fc1e56b39e4f422429114cccebc3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:08:08 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.0.8 -> 3.0.9

---
 .../{python3-pyparsing_3.0.8.bb => python3-pyparsing_3.0.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.8.bb => python3-pyparsing_3.0.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
index 30be4bb87c..b858073c3b 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.8.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954"
+SRC_URI[sha256sum] = "2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.31.1


--===============5046895781116179504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyparsing: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.0.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.0.9.tar.gz"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.0.8" to "3.0.9"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pyparsing-3.0.8.dist-info -> /usr/lib/python3.10/site-packages/pyparsing-3.0.9.dist-info, removed "/usr/lib/python3.10/site-packages/pyparsing/diagram/template.jinja2"
packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 692336 to 693760 (+0%)
Changes to packages/core2-32-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.10/site-packages/pyparsing-3.0.8.dist-info moved to /usr/lib/python3.10/site-packages/pyparsing-3.0.9.dist-info
  /usr/lib/python3.10/site-packages/pyparsing/diagram/template.jinja2 was removed

--===============5046895781116179504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pyparsing-3.0.8.dist-info -> /usr/lib/python3.10/site-packages/pyparsing-3.0.9.dist-info, removed "/usr/lib/python3.10/site-packages/pyparsing/diagram/template.jinja2"
Changes to packages/core2-32-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.10/site-packages/pyparsing-3.0.8.dist-info moved to /usr/lib/python3.10/site-packages/pyparsing-3.0.9.dist-info
  /usr/lib/python3.10/site-packages/pyparsing/diagram/template.jinja2 was removed

--===============5046895781116179504==--

