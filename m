Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4827F38C174F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgudev: upgrading to 234 SUCCEEDED
Message-ID: <MADEUP.163E71D6E394795C.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143455
Content-Type: multipart/mixed; boundary="===============5918753698618331586=="

--===============5918753698618331586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgudev* to *234* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgudev-upgrade-233-234.patch
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

--===============5918753698618331586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgudev/libgudev-dev: PKGSIZE changed from 107647 to 120529 (+12%)
packages/core2-32-poky-linux/libgudev/libgudev-dev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-doc: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-locale: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-src: PKGSIZE changed from 79449 to 89416 (+13%)
packages/core2-32-poky-linux/libgudev/libgudev-staticdev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
Changes to packages/core2-32-poky-linux/libgudev (sysroot):
  /usr/lib/libgudev-1.0.so.0 changed symlink target from libgudev-1.0.so.0.2.0 to libgudev-1.0.so.0.3.0
  /usr/lib/libgudev-1.0.so changed symlink target from libgudev-1.0.so.0.2.0 to libgudev-1.0.so.0.3.0
  /usr/lib/libgudev-1.0.so.0.2.0 moved to /usr/lib/libgudev-1.0.so.0.3.0

--===============5918753698618331586==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libgudev-upgrade-233-234.patch"

From 3da3f80a6e2278b8db2046421bc8867b7b553f4e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:35:16 +0000
Subject: [PATCH] libgudev: upgrade 233 -> 234

---
 .../libgudev/{libgudev_233.bb => libgudev_234.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libgudev/{libgudev_233.bb => libgudev_234.bb} (83%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_233.bb b/meta/recipes-gnome/libgudev/libgudev_234.bb
similarity index 83%
rename from meta/recipes-gnome/libgudev/libgudev_233.bb
rename to meta/recipes-gnome/libgudev/libgudev_234.bb
index 8bc379ff62..9cea36df5b 100644
--- a/meta/recipes-gnome/libgudev/libgudev_233.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_234.bb
@@ -5,8 +5,7 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03"
-SRC_URI[archive.md5sum] = "d59a317a40aaa02a2226056c0bb4d3e1"
+SRC_URI[archive.sha256sum] = "1baeacacf0db42fa073ad5183d1decce9317857416a2b0f82ce3370d711a2e37"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.18.4


--===============5918753698618331586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgudev: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-dbg: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-dbg: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-dbg: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-dbg: PKGSIZE changed from 83960 to 90984 (+8%)
packages/core2-32-poky-linux/libgudev/libgudev-dev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-dev: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-dev: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-dev: PKGSIZE changed from 107647 to 120529 (+12%)
packages/core2-32-poky-linux/libgudev/libgudev-doc: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-doc: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-doc: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-locale: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-locale: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-locale: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-src: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-src: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-src: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev-src: PKGSIZE changed from 79449 to 89416 (+13%)
packages/core2-32-poky-linux/libgudev/libgudev-staticdev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev-staticdev: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev-staticdev: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev: FILELIST: removed "/usr/lib/libgudev-1.0.so.0.2.0", added "/usr/lib/libgudev-1.0.so.0.3.0"
packages/core2-32-poky-linux/libgudev/libgudev: PV changed from "233" to "234"
packages/core2-32-poky-linux/libgudev/libgudev: PKGV changed from 233 [default] to 234 [default]
packages/core2-32-poky-linux/libgudev/libgudev: PKGSIZE changed from 53913 to 58861 (+9%)
Changes to packages/core2-32-poky-linux/libgudev (sysroot):
  /usr/lib/libgudev-1.0.so.0 changed symlink target from libgudev-1.0.so.0.2.0 to libgudev-1.0.so.0.3.0
  /usr/lib/libgudev-1.0.so changed symlink target from libgudev-1.0.so.0.2.0 to libgudev-1.0.so.0.3.0
  /usr/lib/libgudev-1.0.so.0.2.0 moved to /usr/lib/libgudev-1.0.so.0.3.0

--===============5918753698618331586==--
