Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.6807.1622200976485801277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 72EAA38C13A4
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.48.5 SUCCEEDED
Message-ID: <MADEUP.16833731859016E4.3006@lists.openembedded.org>
X-Groupsio-MsgNum: 152355
Content-Type: multipart/mixed; boundary="===============1410108558162139836=="

--===============1410108558162139836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.48.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.48.4-1.48.5.patch
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

--===============1410108558162139836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.48.4-1.48.5.patch"

From 421c1dbc9211f7d2be81cee7c12afa29937f8c5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 09:23:43 +0000
Subject: [PATCH] pango: upgrade 1.48.4 -> 1.48.5

---
 .../recipes-graphics/pango/{pango_1.48.4.bb => pango_1.48.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.4.bb => pango_1.48.5.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.4.bb b/meta/recipes-graphics/pango/pango_1.48.5.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.4.bb
rename to meta/recipes-graphics/pango/pango_1.48.5.bb
index 9efde6577c..b29c3c2d96 100644
--- a/meta/recipes-graphics/pango/pango_1.48.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.5.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a"
+SRC_URI[archive.sha256sum] = "501e74496173c02dcd024ded7fbb3f09efd37e2a488e248aa40799424dbb3b2a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.27.0


--===============1410108558162139836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.4.tar.xz;name=archive file://run-ptest" to "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.5.tar.xz;name=archive file://run-ptest"
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 1873304 to 1862528 (-1%)
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-dev: PKGSIZE changed from 1434514 to 1435647 (+0%)
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-src: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 1859433 to 1861235 (+0%)
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.48.4" to "1.48.5"
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.48.4 [default] to 1.48.5 [default]
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango: PV changed from "1.48.4" to "1.48.5"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.4 to libpango-1.0.so.0.4800.5
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.4 to libpangocairo-1.0.so.0.4800.5
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.4 to libpangoft2-1.0.so.0.4800.5
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.4 to libpangoxft-1.0.so.0.4800.5
  /usr/lib/libpango-1.0.so.0.4800.4 moved to /usr/lib/libpango-1.0.so.0.4800.5
  /usr/lib/libpangocairo-1.0.so.0.4800.4 moved to /usr/lib/libpangocairo-1.0.so.0.4800.5
  /usr/lib/libpangoft2-1.0.so.0.4800.4 moved to /usr/lib/libpangoft2-1.0.so.0.4800.5
  /usr/lib/libpangoxft-1.0.so.0.4800.4 moved to /usr/lib/libpangoxft-1.0.so.0.4800.5

--===============1410108558162139836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.4800.4 /usr/lib/libpangocairo-1.0.so.0.4800.4 /usr/lib/libpangoxft-1.0.so.0.4800.4 /usr/lib/libpango-1.0.so.0.4800.4", added "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.4 to libpango-1.0.so.0.4800.5
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.4 to libpangocairo-1.0.so.0.4800.5
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.4 to libpangoft2-1.0.so.0.4800.5
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.4 to libpangoxft-1.0.so.0.4800.5
  /usr/lib/libpango-1.0.so.0.4800.4 moved to /usr/lib/libpango-1.0.so.0.4800.5
  /usr/lib/libpangocairo-1.0.so.0.4800.4 moved to /usr/lib/libpangocairo-1.0.so.0.4800.5
  /usr/lib/libpangoft2-1.0.so.0.4800.4 moved to /usr/lib/libpangoft2-1.0.so.0.4800.5
  /usr/lib/libpangoxft-1.0.so.0.4800.4 moved to /usr/lib/libpangoxft-1.0.so.0.4800.5

--===============1410108558162139836==--
