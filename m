Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4567.1621074783434697778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5AEC738C12A1
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.20 SUCCEEDED
Message-ID: <MADEUP.167F36ED43E59E53.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151780
Content-Type: multipart/mixed; boundary="===============4374290625275197345=="

--===============4374290625275197345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.19-4.4.20.patch
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

--===============4374290625275197345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.19" to "4.4.20"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.19 [default] to 4.4.20 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.19" to "4.4.20"

--===============4374290625275197345==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.19-4.4.20.patch"

From 66ffe84286bd38c167af29550cf76dd45e90d11f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 03:51:20 +0000
Subject: [PATCH] libxcrypt-compat: upgrade 4.4.19 -> 4.4.20

---
 .../libxcrypt/files/fix_cflags_handling.patch   | 17 +++++++++++++----
 ...pat_4.4.19.bb => libxcrypt-compat_4.4.20.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc       |  2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.19.bb => libxcrypt-compat_4.4.20.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 5448fe0fa6..0772998c72 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,3 +1,8 @@
+From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 30 Apr 2021 10:35:02 +0100
+Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
+
 If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
 gcc to try and open a file called " ". This results in a confusing error message
 like:
@@ -9,8 +14,12 @@ Avoid this by stripping empty elements out of CFLAGS.
 Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: a/build-aux/compute-symver-floor
-===================================================================
+---
+ build-aux/compute-symver-floor | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
+index 4ec82e1..8117342 100644
 --- a/build-aux/compute-symver-floor
 +++ b/build-aux/compute-symver-floor
 @@ -36,6 +36,8 @@ sub preprocessor_check {
@@ -20,5 +29,5 @@ Index: a/build-aux/compute-symver-floor
 +        # Remove empty elements, particularly leading ones which cause issues with popen below
 +        @CFLAGS = grep {$_} @CFLAGS;
  
-         # We call ensure_C_locale here, not from the main section,
-         # because this sub might not get called at all, in which
+         # Remove empty elements, particularly leading ones which
+         # cause issues with popen below.
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 694e55546f..c16068c161 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "c79119414d7e30017d7b49566e7e4ea35112bdc8"
+SRCREV = "e73ff0137de5152e69e8abb0bd260541804dfe5a"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.27.0


--===============4374290625275197345==--
