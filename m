Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B8FC4167B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.11559.1650052686015644738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iKIQNgvc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101802ecddbd4-8c93c6c1-7f46-49cb-be2e-bfe0e24604f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mk2NidbKx9c9lCQRs/VoZH6iqFu83zsD5L76sm3hm9E=;
	b=iKIQNgvcnDHjEudcOiUGBm52rG4/lqWaDiHjdJ/kvj4Lbv52PLUcytxwz8S2Kpil
	/yEWAxp8/uwlEjWDoWO/7jsXO4jKjSgeaaQfoNuu8uta8WHK0BiDj5HIzZzEo/ZY0o6
	iRDeHbG6KWblIP3Eik0NH/EOEczwJJ5pRd93WZGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mk2NidbKx9c9lCQRs/VoZH6iqFu83zsD5L76sm3hm9E=;
	b=SoH3p/DUwOTmrpLXppuP3/5FCyA90Kq0bN5N7hJNKDB7RzzWZbtYsRFC4U1/S9Qd
	G8Uz1X7ydHFB2tmWE8gZ3kaZFXNymBZ81zRUqV1pmnNEbmuF1f/5vF/khpUlZNQHOqb
	3VHxsP8vIZRoNwB0ZOL4fLpc+mvp3UrcKHT6JqEU=
Content-Type: multipart/mixed; boundary="===============8943784493842273265=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2022.04 FAILED
Message-ID: 
 <010101802ecddbd4-8c93c6c1-7f46-49cb-be2e-bfe0e24604f0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:05 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164433

--===============8943784493842273265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2022.04* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2022.01-2022.04.patch
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
--===============8943784493842273265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.01-r0", added "/etc/u-boot-initial-env-qemux86-2022.04-r0"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.01-r0.bin", added "/boot/u-boot-qemux86-2022.04-r0.bin"

--===============8943784493842273265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

--===============8943784493842273265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/u-boot: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dev: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-doc: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.01-r0", added "/etc/u-boot-initial-env-qemux86-2022.04-r0"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-locale: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-src: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-src: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PV changed from "2022.01" to "2022.04"
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 699547 to 711227 (+2%)
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.01-r0.bin", added "/boot/u-boot-qemux86-2022.04-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2022.01" to "2022.04"

--===============8943784493842273265==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2022.01-2022.04.patch"

From 2c29528ea377893f8a037fa8f3a4683ac77eadf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 05:48:52 +0000
Subject: [PATCH] u-boot: upgrade 2022.01 -> 2022.04

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../recipes-bsp/u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8e78ea4a75..af9f07035a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
+SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.04.bb
-- 
2.27.0


--===============8943784493842273265==--

