Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.703.1610713823269131175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3C87138C1382
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] logrotate: upgrading to 3.18.0 SUCCEEDED
Message-ID: <MADEUP.165A67B03D7BD53B.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146777
Content-Type: multipart/mixed; boundary="===============7535443266085341360=="

--===============7535443266085341360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *logrotate* to *3.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-logrotate-upgrade-3.17.0-3.18.0.patch
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

--===============7535443266085341360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-logrotate-upgrade-3.17.0-3.18.0.patch"

From f9377ffa674a4a4ee55fcdf83be966c5d18cc9cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:39:01 +0000
Subject: [PATCH] logrotate: upgrade 3.17.0 -> 3.18.0

---
 .../logrotate/{logrotate_3.17.0.bb => logrotate_3.18.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.17.0.bb => logrotate_3.18.0.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.17.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.17.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.18.0.bb
index 08001f38e5..270052f46f 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.17.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[sha256sum] = "58cc2178ff57faa3c0490181cce041345aeca6cff18dba1c5cd1398bf1c19294"
+SRC_URI[sha256sum] = "841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.27.0


--===============7535443266085341360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/logrotate: SRC_URI changed from "https://github.com/logrotate/logrotate/releases/download/3.17.0/logrotate-3.17.0.tar.xz file://act-as-mv-when-rotate.patch file://0001-Update-the-manual.patch file://disable-check-different-filesystems.patch" to "https://github.com/logrotate/logrotate/releases/download/3.18.0/logrotate-3.18.0.tar.xz file://act-as-mv-when-rotate.patch file://0001-Update-the-manual.patch file://disable-check-different-filesystems.patch"
packages/core2-32-poky-linux/logrotate: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGSIZE changed from 168876 to 169484 (+0%)
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-dbg: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-dev: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-dev: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGSIZE changed from 26771 to 27069 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-doc: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-doc: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-locale: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-locale: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGSIZE changed from 182500 to 183434 (+1%)
packages/core2-32-poky-linux/logrotate/logrotate-src: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-src: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate-staticdev: PKGV changed from 3.17.0 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/logrotate/logrotate: PKGSIZE changed from 97610 to 97686 (+0%)
packages/core2-32-poky-linux/logrotate/logrotate: PV changed from "3.17.0" to "3.18.0"
packages/core2-32-poky-linux/logrotate/logrotate: PKGV changed from 3.17.0 [default] to 3.18.0 [default]

--===============7535443266085341360==--
