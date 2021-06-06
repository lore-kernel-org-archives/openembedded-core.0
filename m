Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.25618.1623000257572232815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id C0BCA38C11E5
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:16 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.3 SUCCEEDED
Message-ID: <MADEUP.16860E22A6900F2C.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152700
Content-Type: multipart/mixed; boundary="===============5373143509506907162=="

--===============5373143509506907162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.2.1-1.3.patch
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

--===============5373143509506907162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 3041 to 4559 (+50%)

--===============5373143509506907162==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.2.1-1.3.patch"

From fde0569532953bd7cc79ea527dc58bc8abb3dc99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 06:44:39 +0000
Subject: [PATCH] erofs-utils: upgrade 1.2.1 -> 1.3

---
 .../erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_1.3.bb} (91%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
similarity index 91%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
index 6435fea68c..e95dd4bb5e 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "d1f4953edfcf4f51c71ba91586e21fc6ce9f6db9"
+SRCREV = "2cd522105ea771ec30b269cd4c57e2265a4d6349"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============5373143509506907162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 167228 to 182704 (+9%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 3041 to 4559 (+50%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 137380 to 148789 (+8%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 63276 to 67468 (+7%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PV changed from "1.2.1" to "1.3"
packages/core2-32-poky-linux/erofs-utils: PKGV changed from 1.2.1 [default] to 1.3 [default]
packages/core2-32-poky-linux/erofs-utils: PV changed from "1.2.1" to "1.3"

--===============5373143509506907162==--
