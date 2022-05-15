Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D2DC433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.18882.1652634912243368546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Lot/cTmF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180c8b781fa-d6c94253-2fb3-46b6-bed8-e8cdc63a7e20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cZfKdD6vV+i7sAHB+wD+qrCOz8M7IqSgCqBdOjhHC6U=;
	b=Lot/cTmFSJLAB2DabVxJ1rU05oLyi6DzSTkF5WaD2t6WJx5D7untjo45WY+r/F02
	bNEhnhrV3qf2xc5rtkfGQFebFwaIDKW8jXZq15oKk+IuFT7EYAVARs6/NBNgpZ/zc0V
	UN+b5R8cWuy/yvy7K0b2n9p020ZZGUwGZHGT7R24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cZfKdD6vV+i7sAHB+wD+qrCOz8M7IqSgCqBdOjhHC6U=;
	b=M/hB4q3MSRi8/175uSx5zCQbHS7eduveMS45CJMGv30/KWzHoQSQoj7E1DyEoEab
	ntAO2mWUJCPiuZOTiAUIWjNg4Zvldq4S8PpngALkdv6WoVh5jNvs5/t7liljt8f6Y+f
	AitdFT8KSNOazVsKzip8vXLSjEF4H9JE9NVY2yKc=
Content-Type: multipart/mixed; boundary="===============1948857933860800690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2022.04 FAILED
Message-ID: 
 <01010180c8b781fa-d6c94253-2fb3-46b6-bed8-e8cdc63a7e20-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:11 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165606

--===============1948857933860800690==
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
--===============1948857933860800690==
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
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 699379 to 711059 (+2%)
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.01-r0.bin", added "/boot/u-boot-qemux86-2022.04-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2022.01 [default] to 2022.04 [default]
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2022.01" to "2022.04"

--===============1948857933860800690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

--===============1948857933860800690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.01-r0", added "/etc/u-boot-initial-env-qemux86-2022.04-r0"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.01-r0.bin", added "/boot/u-boot-qemux86-2022.04-r0.bin"

--===============1948857933860800690==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2022.01-2022.04.patch"

From df5b87be76539dcb30b49550dae6ef406b9527d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 05:56:37 +0000
Subject: [PATCH] u-boot: upgrade 2022.01 -> 2022.04

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../recipes-bsp/u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d366f10398..8fc33608d0 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
+SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.04.bb
-- 
2.31.1


--===============1948857933860800690==--

