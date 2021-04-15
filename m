Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1291.1618510600040293984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 204CA38C1238
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 1.7.4 SUCCEEDED
Message-ID: <MADEUP.16761AD0DE443548.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150513
Content-Type: multipart/mixed; boundary="===============0554907903403382128=="

--===============0554907903403382128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *1.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.7.3-1.7.4.patch
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

--===============0554907903403382128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.7.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.7.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 218144 to 218576 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 22683 to 22759 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 26893 to 27272 (+1%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 238567 to 239605 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.7.3 [default] to 1.7.4 [default]

--===============0554907903403382128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.7.3-1.7.4.patch"

From 7b02594156e0c96b0ac239c787294efc70448dd2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 05:27:26 +0000
Subject: [PATCH] pkgconf: upgrade 1.7.3 -> 1.7.4

---
 .../pkgconf/{pkgconf_1.7.3.bb => pkgconf_1.7.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.7.3.bb => pkgconf_1.7.4.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
index 12496c3849..93832105f0 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "b846aea51cf696c3392a0ae58bef93e2e72f8e7073ca6ad1ed8b01c85871f9c0"
+SRC_URI[sha256sum] = "d73f32c248a4591139a6b17777c80d4deab6b414ec2b3d21d0a24be348c476ab"
 
 inherit autotools
 
-- 
2.27.0


--===============0554907903403382128==--
