Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12223.1602843683395098785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id ABC8F38C168A
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 4.11.2 SUCCEEDED
Message-ID: <MADEUP.163E71D7507DD571.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143501
Content-Type: multipart/mixed; boundary="===============4373143304077249075=="

--===============4373143304077249075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *4.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-4.11.1-4.11.2.patch
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

--===============4373143304077249075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-4.11.1-4.11.2.patch"

From 9313568f93e3535210c4694688fdf84cf9823926 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 10:00:32 +0000
Subject: [PATCH] debianutils: upgrade 4.11.1 -> 4.11.2

---
 .../{debianutils_4.11.1.bb => debianutils_4.11.2.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_4.11.1.bb => debianutils_4.11.2.bb} (94%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.1.bb b/meta/recipes-support/debianutils/debianutils_4.11.2.bb
similarity index 94%
rename from meta/recipes-support/debianutils/debianutils_4.11.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.11.2.bb
index 3b1767e5ed..0eeb2954f7 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.2.bb
@@ -8,10 +8,11 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20200929T025235Z/pool/main/
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[sha256sum] = "8be869f19c55c18d53d9f0414b68bb966a068b2154e9fbbfc6193827d6af983c"
+SRC_URI[sha256sum] = "3b680e81709b740387335fac8f8806d71611dcf60874e1a792e862e48a1650de"
 
 inherit autotools update-alternatives
 
+S = "${WORKDIR}/debianutils"
 do_configure_prepend() {
     sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
 }
-- 
2.18.4


--===============4373143304077249075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 71796 to 72228 (+1%)
packages/core2-32-poky-linux/debianutils/debianutils-dev: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dev: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-doc: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 125061 to 125341 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-locale: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-locale: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-src: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 29549 to 29533 (-0%)
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils/debianutils: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils/debianutils: PV changed from "4.11.1" to "4.11.2"
packages/core2-32-poky-linux/debianutils: PKGV changed from 4.11.1 [default] to 4.11.2 [default]
packages/core2-32-poky-linux/debianutils: PV changed from "4.11.1" to "4.11.2"

--===============4373143304077249075==--
