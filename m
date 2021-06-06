Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.25620.1623000257881773383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1F31C38C125B
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-topology-conf: upgrading to 1.2.5 SUCCEEDED
Message-ID: <MADEUP.16860E22D021167F.29797@lists.openembedded.org>
X-Groupsio-MsgNum: 152727
Content-Type: multipart/mixed; boundary="===============6028412845480768332=="

--===============6028412845480768332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-topology-conf* to *1.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-topology-conf-upgrade-1.2.4-1.2.5.patch
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

--===============6028412845480768332==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-alsa-topology-conf-upgrade-1.2.4-1.2.5.patch"

From b8e1868dfdf2269354029862fe6df59a5116b5af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:36:50 +0000
Subject: [PATCH] alsa-topology-conf: upgrade 1.2.4 -> 1.2.5

---
 ...alsa-topology-conf_1.2.4.bb => alsa-topology-conf_1.2.5.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.4.bb => alsa-topology-conf_1.2.5.bb} (82%)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
similarity index 82%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
index 26542fbbbc..816f98f350 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "55e0e6e42eca4cc7656c257af2440cdc65b83689dca49fc60ca0194db079ed07"
+SRC_URI[sha256sum] = "8bfa8306ca63e1d0cbe80be984660273b91bd5b7dd0800a6c5aa71dd8c8d775c"
 
 inherit allarch
 
@@ -17,6 +17,7 @@ do_install() {
         cp -r "${S}/topology" "${D}${datadir}/alsa"
 }
 
+S = "${WORKDIR}/alsa-topology-conf-1.2.4.2.g15998"
 PACKAGES = "${PN}"
 
 FILES_${PN} = "*"
-- 
2.17.1


--===============6028412845480768332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-topology-conf/alsa-topology-conf-src: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-topology-conf/alsa-topology-conf-src: PV changed from "1.2.4" to "1.2.5"
packages/all-poky-linux/alsa-topology-conf/alsa-topology-conf: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-topology-conf/alsa-topology-conf: PV changed from "1.2.4" to "1.2.5"
packages/all-poky-linux/alsa-topology-conf: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-topology-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-topology-conf-1.2.4.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-topology-conf-1.2.5.tar.bz2"
packages/all-poky-linux/alsa-topology-conf: PV changed from "1.2.4" to "1.2.5"

--===============6028412845480768332==--
