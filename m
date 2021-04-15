Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1309.1618510600331723659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0E56238C13C8
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.14.0 SUCCEEDED
Message-ID: <MADEUP.16761AD0EFEE3F31.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150516
Content-Type: multipart/mixed; boundary="===============3755573413769169490=="

--===============3755573413769169490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.13.0-1.14.0.patch
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

--===============3755573413769169490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.13.0-1.14.0.patch"

From 9ec2bc924525bcbcdcc6faa49b9e3af27c7c3f48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 05:03:23 +0000
Subject: [PATCH] librepo: upgrade 1.13.0 -> 1.14.0

---
 .../librepo/{librepo_1.13.0.bb => librepo_1.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.13.0.bb => librepo_1.14.0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.13.0.bb b/meta/recipes-devtools/librepo/librepo_1.14.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.13.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.0.bb
index 0a68e0ac4f..109b40ce3d 100644
--- a/meta/recipes-devtools/librepo/librepo_1.13.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "a244d78bab11510408fb9413f1c78c2f56c69fa5"
+SRCREV = "88b769eceefc1b151937e6b54d108b48f2177d87"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============3755573413769169490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librepo: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-dbg: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 672964 to 673968 (+0%)
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-dev: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-dev: PKGSIZE changed from 124273 to 124414 (+0%)
packages/core2-32-poky-linux/librepo/librepo-dev: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-doc: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-doc: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-locale: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-locale: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-src: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-src: PKGSIZE changed from 700333 to 701780 (+0%)
packages/core2-32-poky-linux/librepo/librepo-src: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo-staticdev: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.13.0 [default] to 1.14.0 [default]
packages/core2-32-poky-linux/librepo/librepo: PV changed from "1.13.0" to "1.14.0"
packages/core2-32-poky-linux/librepo/librepo: PKGSIZE changed from 310497 to 310496 (-0%)
packages/core2-32-poky-linux/librepo/librepo: PKGV changed from 1.13.0 [default] to 1.14.0 [default]

--===============3755573413769169490==--
