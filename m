Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.24431.1608473714742252705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id D770838C143F
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.10.2 SUCCEEDED
Message-ID: <MADEUP.16527252540BC79E.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145938
Content-Type: multipart/mixed; boundary="===============8362702546412574710=="

--===============8362702546412574710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ninja* to *1.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.10.1-1.10.2.patch
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

--===============8362702546412574710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ninja: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 5842388 to 5842500 (+0%)
packages/core2-32-poky-linux/ninja/ninja-dbg: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-dev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-dev: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-doc: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-doc: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-locale: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-locale: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-src: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-src: PKGSIZE changed from 366669 to 368711 (+1%)
packages/core2-32-poky-linux/ninja/ninja-src: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja-staticdev: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/ninja/ninja: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/ninja/ninja: PV changed from "1.10.1" to "1.10.2"

--===============8362702546412574710==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.10.1-1.10.2.patch"

From eac7a4e0dd71ca05b95128309bfe7baa0aea0e8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 00:15:51 +0000
Subject: [PATCH] ninja: upgrade 1.10.1 -> 1.10.2

---
 .../recipes-devtools/ninja/{ninja_1.10.1.bb => ninja_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.10.1.bb => ninja_1.10.2.bb} (92%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.1.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
similarity index 92%
rename from meta/recipes-devtools/ninja/ninja_1.10.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.10.2.bb
index ecb0566f37..88ff843409 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "a1f879b29c9aafe6a2bc0ba885701f8f4f19f772"
+SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.20.1


--===============8362702546412574710==--
