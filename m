Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4567.1621074783434697778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0548238C125F
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.12.1 SUCCEEDED
Message-ID: <MADEUP.167F36ED52BFB659.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151792
Content-Type: multipart/mixed; boundary="===============1208470362959631049=="

--===============1208470362959631049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.12.0-2.12.1.patch
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

--===============1208470362959631049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.12.0 to libmodulemd.so.2.12.1
  /usr/lib/libmodulemd.so.2.12.0 moved to /usr/lib/libmodulemd.so.2.12.1

--===============1208470362959631049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1206344 to 1206292 (-0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1180339 to 1180875 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.12.0" to "2.12.1"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.12.0 to libmodulemd.so.2.12.1
  /usr/lib/libmodulemd.so.2.12.0 moved to /usr/lib/libmodulemd.so.2.12.1

--===============1208470362959631049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.12.0-2.12.1.patch"

From 72454f68def7966de6a3413eca9f907396814a95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 04:22:51 +0000
Subject: [PATCH] libmodulemd: upgrade 2.12.0 -> 2.12.1

---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 2f60ce8e02..771b2c094f 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.12.0"
-SRCREV = "aaed38c899a958a88a6a368a70510e350ebe336c"
+PV = "2.12.1"
+SRCREV = "c0897fa0e9d7d1305fd4813b1010c1d4cca42346"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============1208470362959631049==--
