Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.16441.1623585062227655849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 25CE438C13EB
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.6.0 SUCCEEDED
Message-ID: <MADEUP.1688220316C18CC1.12353@lists.openembedded.org>
X-Groupsio-MsgNum: 152912
Content-Type: multipart/mixed; boundary="===============7763908166587709356=="

--===============7763908166587709356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libksba* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.5.1-1.6.0.patch
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

--===============7763908166587709356==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.5.1-1.6.0.patch"

From 3722fbc14fa556ec980f92605fe1e5fb94b749b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 11:44:07 +0000
Subject: [PATCH] libksba: upgrade 1.5.1 -> 1.6.0

---
 .../libksba/{libksba_1.5.1.bb => libksba_1.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.5.1.bb => libksba_1.6.0.bb} (93%)

diff --git a/meta/recipes-support/libksba/libksba_1.5.1.bb b/meta/recipes-support/libksba/libksba_1.6.0.bb
similarity index 93%
rename from meta/recipes-support/libksba/libksba_1.5.1.bb
rename to meta/recipes-support/libksba/libksba_1.6.0.bb
index aa296c6b9b..552007d6cc 100644
--- a/meta/recipes-support/libksba/libksba_1.5.1.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.0.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "b0f4c65e4e447d9a2349f6b8c0e77a28be9531e4548ba02c545d1f46dc7bf921"
+SRC_URI[sha256sum] = "dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.17.1


--===============7763908166587709356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libksba: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.5.1.tar.bz2 file://ksba-add-pkgconfig-support.patch" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.0.tar.bz2 file://ksba-add-pkgconfig-support.patch"
packages/core2-32-poky-linux/libksba: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 690556 to 708040 (+3%)
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-dbg: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-dev: PKGSIZE changed from 30076 to 30113 (+0%)
packages/core2-32-poky-linux/libksba/libksba-dev: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-dev: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-dev: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-doc: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-doc: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-doc: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-locale: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-locale: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-locale: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-src: PKGSIZE changed from 769973 to 783100 (+2%)
packages/core2-32-poky-linux/libksba/libksba-src: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-src: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-src: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba-staticdev: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba-staticdev: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba: PKGSIZE changed from 288165 to 292261 (+1%)
packages/core2-32-poky-linux/libksba/libksba: PKGV changed from 1.5.1 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/libksba/libksba: PV changed from "1.5.1" to "1.6.0"
packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.13.1 to libksba.so.8.14.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.13.1 to libksba.so.8.14.0
  /usr/lib/libksba.so.8.13.1 moved to /usr/lib/libksba.so.8.14.0

--===============7763908166587709356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libksba/libksba-dev: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-doc: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-locale: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba-staticdev: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.13.1", added "/usr/lib/libksba.so.8.14.0"
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.13.1 to libksba.so.8.14.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.13.1 to libksba.so.8.14.0
  /usr/lib/libksba.so.8.13.1 moved to /usr/lib/libksba.so.8.14.0

--===============7763908166587709356==--
