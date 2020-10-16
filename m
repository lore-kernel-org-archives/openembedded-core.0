Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12223.1602843683395098785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3DB7538C170A
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 3.7.12 SUCCEEDED
Message-ID: <MADEUP.163E71D68A062F17.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143429
Content-Type: multipart/mixed; boundary="===============1793963091466676348=="

--===============1793963091466676348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *3.7.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-3.7.11-3.7.12.patch
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

--===============1793963091466676348==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-3.7.11-3.7.12.patch"

From 94c3540cd1b523b5ddb115d63886fc53aa163ce2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:15:22 +0000
Subject: [PATCH] ccache: upgrade 3.7.11 -> 3.7.12

---
 .../ccache/{ccache_3.7.11.bb => ccache_3.7.12.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_3.7.11.bb => ccache_3.7.12.bb} (91%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.11.bb b/meta/recipes-devtools/ccache/ccache_3.7.12.bb
similarity index 91%
rename from meta/recipes-devtools/ccache/ccache_3.7.11.bb
rename to meta/recipes-devtools/ccache/ccache_3.7.12.bb
index fd004f4c9b..fe3c9bb978 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.11.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.7.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
 DEPENDS = "zlib"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "34309a59d4b6b6b33756366aa9d3144a4655587be9f914476b4c0e2d36365f01"
+SRC_URI[sha256sum] = "d2abe88d4c283ce960e233583061127b156ffb027c6da3cf10770fc0c7244194"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.18.4


--===============1793963091466676348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 351740 to 352448 (+0%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGSIZE changed from 64463 to 64839 (+1%)
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 356907 to 357395 (+0%)
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "3.7.11" to "3.7.12"
packages/core2-32-poky-linux/ccache: PKGV changed from 3.7.11 [default] to 3.7.12 [default]
packages/core2-32-poky-linux/ccache: PV changed from "3.7.11" to "3.7.12"

--===============1793963091466676348==--
