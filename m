Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.702.1610713822889946820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 115DF38C128A
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.11.2 SUCCEEDED
Message-ID: <MADEUP.165A67B026A990A1.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146760
Content-Type: multipart/mixed; boundary="===============4656269555870833340=="

--===============4656269555870833340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.11.1-2.11.2.patch
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

--===============4656269555870833340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.11.1 to libmodulemd.so.2.11.2
  /usr/lib/libmodulemd.so.2.11.1 moved to /usr/lib/libmodulemd.so.2.11.2

--===============4656269555870833340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.11.1-2.11.2.patch"

From e1e18da5c899f0fd04e3c5563313f51260a96e46 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 04:33:22 +0000
Subject: [PATCH] libmodulemd: upgrade 2.11.1 -> 2.11.2

---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index b9a64f00e7..5664df051e 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.11.1"
-SRCREV = "0ead09d0a35b9095e1a01afd540abd7217b31fba"
+PV = "2.11.2"
+SRCREV = "169136d708eb4df10e76247c5cc6189f0de0c13e"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============4656269555870833340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1369416 to 1370056 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 958081 to 966245 (+1%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1176016 to 1180828 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.11.1", added "/usr/lib/libmodulemd.so.2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGSIZE changed from 663721 to 667889 (+1%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.11.1 to libmodulemd.so.2.11.2
  /usr/lib/libmodulemd.so.2.11.1 moved to /usr/lib/libmodulemd.so.2.11.2

--===============4656269555870833340==--
