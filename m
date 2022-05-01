Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0B8C4167E
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.2253.1651434542481934482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=sX1kHwTN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180812b524f-67576e65-a19e-4763-baaa-5a1ea3990e57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uR9s2g1O1mjr1Ij+XB+X51OttzjMf/LrB8eGRA+2EwM=;
	b=sX1kHwTNDoaV2AGHWQtAJuZfq8jtZ28VcWDEptW/qU71ilbGmnMV4CoifKjdPnNG
	xfOq14uDVXjXh+XPq4mE4gtySYN8X9nZcPzkMJFsxPZOiKescsJ73V8CyBm3cMGWMSX
	7j/qllyZEZG/N5bOi7Go85oiABec8lh/m4vXZd1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uR9s2g1O1mjr1Ij+XB+X51OttzjMf/LrB8eGRA+2EwM=;
	b=ZSm41DI84SXwvYoksHwDA/BHg8z/10JAqcCdFxZ8DPj6sOcG2QDjCK82MLqmXOSu
	3BbhOMPP5le2R22d7DSrTME1NkkZfR/0+2pdKUxT0MHJUXJLHUwudSvs0cJtunB/0wv
	MDaUIzYrMwuxLuIAvFQmGOSJE+xT/pkLAe7Oeh44=
Content-Type: multipart/mixed; boundary="===============2216914030112231777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 250.5 SUCCEEDED
Message-ID: 
 <01010180812b524f-67576e65-a19e-4763-baaa-5a1ea3990e57-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165097

--===============2216914030112231777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *250.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-250.4-250.5.patch
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
--===============2216914030112231777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-250.4-250.5.patch"

From 5450e3823b2bd190038e0516555b7d97bd8ac3fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 08:07:36 +0000
Subject: [PATCH] systemd-boot: upgrade 250.4 -> 250.5

---
 .../systemd/{systemd-boot_250.4.bb => systemd-boot_250.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.4.bb => systemd-boot_250.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.4.bb b/meta/recipes-core/systemd/systemd-boot_250.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.4.bb
rename to meta/recipes-core/systemd/systemd-boot_250.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ac454b8afd..309105290f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c3aead556847dd2694d559620123b65ff16afe8c"
+SRCREV = "4a31fa2fb040005b73253da75cf84949b8485175"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.27.0


--===============2216914030112231777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 250.4 [default] to 250.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "250.4" to "250.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 250.4 [default] to 250.5 [default]

--===============2216914030112231777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============2216914030112231777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============2216914030112231777==--

