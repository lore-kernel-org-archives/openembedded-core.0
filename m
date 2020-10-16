Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A5AED38C17CA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-atk: upgrading to 2.38.0 SUCCEEDED
Message-ID: <MADEUP.163E71D748AD034D.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143497
Content-Type: multipart/mixed; boundary="===============7649359763486813350=="

--===============7649359763486813350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at-spi2-atk* to *2.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-atk-upgrade-2.34.2-2.38.0.patch
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

--===============7649359763486813350==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-at-spi2-atk-upgrade-2.34.2-2.38.0.patch"

From 6f8840ee80b09831d125a5d65951a9babe697089 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:46:09 +0000
Subject: [PATCH] at-spi2-atk: upgrade 2.34.2 -> 2.38.0

---
 .../atk/{at-spi2-atk_2.34.2.bb => at-spi2-atk_2.38.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.34.2.bb => at-spi2-atk_2.38.0.bb} (77%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
similarity index 77%
rename from meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
index 02a4d4712c..fce14eecf3 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "58cd278574e101363b18d9a8b7053d67"
-SRC_URI[archive.sha256sum] = "901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0"
+SRC_URI[archive.sha256sum] = "cfa008a5af822b36ae6287f18182c40c91dd699c55faa38605881ed175ca464f"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.18.4


--===============7649359763486813350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-dbg: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-dbg: PKGSIZE changed from 459560 to 459576 (+0%)
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-dbg: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-dev: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-dev: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-doc: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-doc: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-gnome: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-gnome: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-gtk2: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-gtk2: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-locale: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-locale: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-src: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-src: PKGSIZE changed from 429366 to 429472 (+0%)
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-src: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-staticdev: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk-staticdev: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk/at-spi2-atk: PKGV changed from 2.34.2 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-atk: PV changed from "2.34.2" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-atk: PKGV changed from 2.34.2 [default] to 2.38.0 [default]

--===============7649359763486813350==--
