Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12417.1602843682690462538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id DB24338C1633
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 9.3.1 SUCCEEDED
Message-ID: <MADEUP.163E71D659232686.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143406
Content-Type: multipart/mixed; boundary="===============3482283088169374490=="

--===============3482283088169374490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *9.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-9.2.0-9.3.1.patch
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

--===============3482283088169374490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-9.2.0-9.3.1.patch"

From ea23b38daeaf13e4a79fa23ca4abd6a2836fc59c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Oct 2020 22:55:04 +0000
Subject: [PATCH] dhcpcd: upgrade 9.2.0 -> 9.3.1

---
 .../dhcpcd/{dhcpcd_9.2.0.bb => dhcpcd_9.3.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.2.0.bb => dhcpcd_9.3.1.bb} (94%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
similarity index 94%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
index 4344841b54..286f28c1ad 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://dhcpcd@.service \
            "
 
-SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2cb9666"
+SRC_URI[sha256sum] = "a0843233fdaecee971c38ceda53ad1450bb7b83aefbf1fa9642213224a9c415e"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.18.4


--===============3482283088169374490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1106208 to 1115796 (+1%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 62488 to 62216 (-0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1056625 to 1069496 (+1%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 464759 to 465495 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGV changed from 9.2.0 [default] to 9.3.1 [default]
packages/core2-32-poky-linux/dhcpcd: PV changed from "9.2.0" to "9.3.1"
packages/core2-32-poky-linux/dhcpcd: PKGV changed from 9.2.0 [default] to 9.3.1 [default]

--===============3482283088169374490==--
