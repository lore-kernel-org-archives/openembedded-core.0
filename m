Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12416.1602843682685989393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id DF9C738C1637
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iw: upgrading to 5.9 SUCCEEDED
Message-ID: <MADEUP.163E71D659619A2D.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143407
Content-Type: multipart/mixed; boundary="===============2906025446495245243=="

--===============2906025446495245243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iw* to *5.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iw-upgrade-5.8-5.9.patch
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

--===============2906025446495245243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-iw-upgrade-5.8-5.9.patch"

From 14a4c0edc2186aef753dc82715adcfac05fca141 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Oct 2020 22:58:51 +0000
Subject: [PATCH] iw: upgrade 5.8 -> 5.9

---
 meta/recipes-connectivity/iw/{iw_5.8.bb => iw_5.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.8.bb => iw_5.9.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw_5.8.bb b/meta/recipes-connectivity/iw/iw_5.9.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.8.bb
rename to meta/recipes-connectivity/iw/iw_5.9.bb
index 97ca66d66f..4ccda97045 100644
--- a/meta/recipes-connectivity/iw/iw_5.8.bb
+++ b/meta/recipes-connectivity/iw/iw_5.9.bb
@@ -14,8 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "98129d64212bdbb408f009c56ed5c62a"
-SRC_URI[sha256sum] = "cd9125c7e560926d66b09977fe0f75e5365ffd05a15df67d86a421dc76f96a96"
+SRC_URI[sha256sum] = "6e7d3c9f8b4ee68e412f20fe229c9854c2dba383e3e650ce6af8eb8dbd12efc3"
 
 inherit pkgconfig
 
-- 
2.18.4


--===============2906025446495245243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iw/iw-dbg: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-dbg: PKGSIZE changed from 818128 to 829620 (+1%)
packages/core2-32-poky-linux/iw/iw-dbg: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw-dev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-dev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw-doc: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-doc: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw-locale: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-locale: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw-src: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-src: PKGSIZE changed from 709727 to 722271 (+2%)
packages/core2-32-poky-linux/iw/iw-src: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw-staticdev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw-staticdev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw/iw: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw/iw: PKGSIZE changed from 304628 to 304692 (+0%)
packages/core2-32-poky-linux/iw/iw: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/iw: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/iw: PV changed from "5.8" to "5.9"

--===============2906025446495245243==--
