Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.16420.1623585061223990420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id C086138C13C3
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnss-mdns: upgrading to 0.15.1 SUCCEEDED
Message-ID: <MADEUP.16882202DBEA5B3F.12353@lists.openembedded.org>
X-Groupsio-MsgNum: 152883
Content-Type: multipart/mixed; boundary="===============3519907093870479684=="

--===============3519907093870479684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnss-mdns* to *0.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnss-mdns-upgrade-0.15-0.15.1.patch
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

--===============3519907093870479684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 41 skipped, 0 masked, 0 errors.
Removing 141 recipes from the core2-32 sysroot...done.
Removing 145 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'libnss-mdns'
libnss-mdns was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============3519907093870479684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnss-mdns: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PKGSIZE changed from 218608 to 218624 (+0%)
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dev: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dev: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-doc: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-doc: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-locale: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-locale: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-src: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-src: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-staticdev: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-staticdev: PV changed from "0.15" to "0.15.1"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns: PKGV changed from 0.15 [default] to 0.15.1 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns: PV changed from "0.15" to "0.15.1"

--===============3519907093870479684==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libnss-mdns-upgrade-0.15-0.15.1.patch"

From 907b60ee921a0bf2e39d7a8ef9807375bd236caa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 08:25:32 +0000
Subject: [PATCH] libnss-mdns: upgrade 0.15 -> 0.15.1

---
 .../libnss-mdns/{libnss-mdns_0.15.bb => libnss-mdns_0.15.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libnss-mdns/{libnss-mdns_0.15.bb => libnss-mdns_0.15.1.bb} (95%)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
similarity index 95%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
rename to meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
index 75e8ba06d9..f3b64174c4 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "avahi"
 SRC_URI = "git://github.com/lathiat/nss-mdns \
            "
 
-SRCREV = "65ad25563937682ab2770c36d56667a754837102"
+SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============3519907093870479684==--
