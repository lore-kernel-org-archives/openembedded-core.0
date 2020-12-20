Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24453.1608473714068775212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id D2EA538C1416
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.11.1 SUCCEEDED
Message-ID: <MADEUP.1652725245533BEC.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145928
Content-Type: multipart/mixed; boundary="===============7233563113981534867=="

--===============7233563113981534867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.9.4-2.11.1.patch
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

--===============7233563113981534867==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.9.4-2.11.1.patch"

From c30c6b36b730aab6011f8678c1148a3d71146671 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 23:49:02 +0000
Subject: [PATCH] libmodulemd: upgrade 2.9.4 -> 2.11.1

---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 10204acf23..b9a64f00e7 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.9.4"
-SRCREV = "c7254db07b21495fc9bd247c5b17ee20149c05e3"
+PV = "2.11.1"
+SRCREV = "0ead09d0a35b9095e1a01afd540abd7217b31fba"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============7233563113981534867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1116892 to 1369416 (+23%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 770668 to 958081 (+24%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 951828 to 1176016 (+24%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGSIZE changed from 540468 to 663721 (+23%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.9.4" to "2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.9.4 [default] to 2.11.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.9.4 to libmodulemd.so.2.11.1
  /usr/include/modulemd-2.0/modulemd-build-config.h was added
  /usr/include/modulemd-2.0/modulemd-obsoletes.h was added
  /usr/include/modulemd-2.0/modulemd-packager-v3.h was added
  /usr/lib/libmodulemd.so.2.11.1 was added
  /usr/lib/libmodulemd.so.2.9.4 was removed

--===============7233563113981534867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1116892 to 1369416 (+23%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 770668 to 958081 (+24%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 951828 to 1176016 (+24%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGSIZE changed from 540468 to 663721 (+23%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.9.4", added "/usr/lib/libmodulemd.so.2.11.1"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.9.4 to libmodulemd.so.2.11.1
  /usr/include/modulemd-2.0/modulemd-build-config.h was added
  /usr/include/modulemd-2.0/modulemd-obsoletes.h was added
  /usr/include/modulemd-2.0/modulemd-packager-v3.h was added
  /usr/lib/libmodulemd.so.2.11.1 was added
  /usr/lib/libmodulemd.so.2.9.4 was removed

--===============7233563113981534867==--
