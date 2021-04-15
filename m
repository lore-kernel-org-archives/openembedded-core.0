Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1290.1618510599610507745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 88CC238C1409
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cronie: upgrading to 1.5.7 SUCCEEDED
Message-ID: <MADEUP.16761AD116BC2A88.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150536
Content-Type: multipart/mixed; boundary="===============5649083430530408676=="

--===============5649083430530408676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cronie* to *1.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cronie-upgrade-1.5.5-1.5.7.patch
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

--===============5649083430530408676==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cronie-upgrade-1.5.5-1.5.7.patch"

From aacfdba6bd6ae3817eabfc29a51551931557e7ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 08:23:07 +0000
Subject: [PATCH] cronie: upgrade 1.5.5 -> 1.5.7

---
 .../cronie/{cronie_1.5.5.bb => cronie_1.5.7.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.5.bb => cronie_1.5.7.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.5.bb b/meta/recipes-extended/cronie/cronie_1.5.7.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.5.5.bb
rename to meta/recipes-extended/cronie/cronie_1.5.7.bb
index 0def4a187d..d0abdd8398 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.5.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.7.bb
@@ -25,8 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
-SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
+SRC_URI[sha256sum] = "538bcfaf2e986e5ae1edf6d1472a77ea8271d6a9005aee2497a9ed6e13320eb3"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.27.0


--===============5649083430530408676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cronie/cronie-dbg: PKGSIZE changed from 370664 to 377888 (+2%)
packages/core2-32-poky-linux/cronie/cronie-dbg: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-dbg: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie-dev: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-dev: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie-doc: PKGSIZE changed from 29398 to 30141 (+3%)
packages/core2-32-poky-linux/cronie/cronie-doc: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-doc: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie-locale: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-locale: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie-src: PKGSIZE changed from 175279 to 182150 (+4%)
packages/core2-32-poky-linux/cronie/cronie-src: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-src: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie-staticdev: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie-staticdev: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie/cronie: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie/cronie: PKGV changed from 1.5.5 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/cronie: PV changed from "1.5.5" to "1.5.7"
packages/core2-32-poky-linux/cronie: SRC_URI changed from "https://github.com/cronie-crond/cronie/releases/download/cronie-1.5.5/cronie-1.5.5.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch" to "https://github.com/cronie-crond/cronie/releases/download/cronie-1.5.7/cronie-1.5.7.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch"
packages/core2-32-poky-linux/cronie: PKGV changed from 1.5.5 [default] to 1.5.7 [default]

--===============5649083430530408676==--
