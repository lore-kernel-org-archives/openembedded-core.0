Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19870.1597558923570617742
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F9DCE02036; Sat, 15 Aug 2020 23:22:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B2A2E02072
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:43 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] font-alias: upgrading to 1.0.4 SUCCEEDED
Message-Id: <20200816062203.6F9DCE02036@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:03 -0700 (PDT)
X-Groupsio-MsgNum: 141509
Content-Type: multipart/mixed; boundary="===============1202162961432247812=="

--===============1202162961432247812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *font-alias* to *1.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-font-alias-upgrade-1.0.3-1.0.4.patch
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

--===============1202162961432247812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/font-alias/font-alias-dbg: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-dbg: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-dbg: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-dbg: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias-dev: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-dev: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-dev: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-dev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias-doc: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-doc: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-doc: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-doc: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias-locale: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-locale: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-locale: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-locale: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias-src: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-src: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-src: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-src: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias-staticdev: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias-staticdev: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias-staticdev: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias-staticdev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias/font-alias: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias/font-alias: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias/font-alias: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/all-poky-linux/font-alias/font-alias: PKGSIZE changed from 15738 to 15663 (-0%)
packages/all-poky-linux/font-alias: PKGR changed from r3 [default] to r0 [default]
packages/all-poky-linux/font-alias: PR changed from "r3" to "r0"
packages/all-poky-linux/font-alias: PV changed from "1.0.3" to "1.0.4"
packages/all-poky-linux/font-alias: PKGV changed from 1.0.3 [default] to 1.0.4 [default]

--===============1202162961432247812==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-font-alias-upgrade-1.0.3-1.0.4.patch"

From df969681ff0ad12d09a91c88a826dca37325f3ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 02:01:40 +0000
Subject: [PATCH] font-alias: upgrade 1.0.3 -> 1.0.4

---
 .../nocompiler.patch                          | 24 +++++++----
 ...ont-alias_1.0.3.bb => font-alias_1.0.4.bb} | 40 ++++++++++++++++---
 2 files changed, 51 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-alias-1.0.3 => font-alias-1.0.4}/nocompiler.patch (52%)
 rename meta/recipes-graphics/xorg-font/{font-alias_1.0.3.bb => font-alias_1.0.4.bb} (25%)

diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
similarity index 52%
rename from meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
rename to meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
index 0b9fb8ccc0..e54eee4ea9 100644
--- a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
@@ -1,22 +1,32 @@
+From fa2bbd48a55d54bd2dae30edf7936e3ab7587c96 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 17 May 2011 23:03:02 +0000
+Subject: [PATCH] Improve handling of 'all' architecture recipes and their
+
 Upstream-Status: Inappropriate [configuration]
 
 XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
 
 XORG_CWARNFLAGS -> AC_PROG_CC_C99
 XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
-XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
+XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host
 
 each of which triggers the use of the host compiler. As an "all"
 architecture package, it shouldn't need a compiler (and doesn't).
 
 RP 17/5/2011
 
-diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
---- font-alias-1.0.3.orig//configure.ac	2011-05-18 21:29:18.378258643 +0200
-+++ font-alias-1.0.3/configure.ac	2011-05-18 21:32:06.865258593 +0200
-@@ -28,12 +28,12 @@
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3407c69..9fe1f89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,12 +27,12 @@ AC_INIT([font-alias], [1.0.4],
+         [font-alias])
  AM_INIT_AUTOMAKE([foreign dist-bzip2])
- AM_MAINTAINER_MODE
  
 -# Require xorg-macros: XORG_DEFAULT_OPTIONS
  m4_ifndef([XORG_MACROS_VERSION],
@@ -29,4 +39,4 @@ diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
 +XORG_INSTALL
  AC_PROG_INSTALL
  
- XORG_FONTROOTDIR
+ # Require X.Org's font util macros 1.2 or later
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
similarity index 25%
rename from meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
rename to meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
index c5990a9e44..4d87eebaa1 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
@@ -1,13 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- cyrillic/fonts.alias
+# +++ cyrillic/fonts.alias
+# @@ -6,8 +6,6 @@
+#  ! and these terms are retained. Under no circumstances is the author
+#  ! responsible for the proper functioning of this software, nor does
+#  ! the author assume any responsibility for damages incurred with its use.
+# -!
+# -! $XFree86$
+#  !
+#  fixed  -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-koi8-r
+#  variable -*-helvetica-bold-r-normal-*-*-120-*-*-*-*-koi8-r
+# --- misc/fonts.alias
+# +++ misc/fonts.alias
+# @@ -1,4 +1,3 @@
+# -! $Xorg: fonts.alias,v 1.3 2000/08/21 16:42:31 coskrey Exp $
+#  fixed        -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
+#  variable     -*-helvetica-bold-r-normal-*-*-120-*-*-*-*-iso8859-1
+#  5x7          -misc-fixed-medium-r-normal--7-70-75-75-c-50-iso8859-1
+# 
+#
+
 SUMMARY = "X font aliases"
 
 require xorg-font-common.inc
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
-                    file://cyrillic/fonts.alias;md5=f40795b0640d6785826aecd3b16f6124 \
+                    file://cyrillic/fonts.alias;md5=d27bc65a2655cacdbc2644b51c064c20 \
                     file://75dpi/fonts.alias;md5=6bc48023f2ae7f3bfc105db7b0ee6b49 \
-                    file://misc/fonts.alias;md5=a8ec05d528431d4c9703b55a7efd67a8 \
-                    file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb"
+                    file://misc/fonts.alias;md5=1bdafa7c31aa54f87f3531f2ef8ed5a6 \
+                    file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb \
+                    "
 
 SRC_URI += "file://nocompiler.patch"
 
@@ -18,7 +48,5 @@ RDEPENDS_${PN}_class-native = "font-util-native"
 inherit allarch
 
 PE = "1"
-PR = "r3"
 
-SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
-SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"
+SRC_URI[sha256sum] = "f3111ae8bf2e980f5f56af400e8eefe5fc9f4207f4a412ea79637fd66c945276"
-- 
2.17.1


--===============1202162961432247812==--
