Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1291.1618510600040293984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 122D738C13C1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.10.0 SUCCEEDED
Message-ID: <MADEUP.16761AD1840C84CA.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150575
Content-Type: multipart/mixed; boundary="===============1952305236748042098=="

--===============1952305236748042098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.8.0-1.10.0.patch
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

--===============1952305236748042098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.4.3 to libwpe-1.0.so.1.5.1
  /usr/lib/libwpe-1.0.so.1.4.3 moved to /usr/lib/libwpe-1.0.so.1.5.1
  /usr/include/wpe-1.0/wpe/libwpe-version.h was added

--===============1952305236748042098==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.8.0-1.10.0.patch"

From 3beb3f1b6c57ec606b60125f496e007cbd40702b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 16:01:56 +0000
Subject: [PATCH] libwpe: upgrade 1.8.0 -> 1.10.0

---
 meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.10.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.8.0.bb b/meta/recipes-sato/webkit/libwpe_1.10.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/libwpe_1.8.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.10.0.bb
index 164831be39..d90557e3af 100644
--- a/meta/recipes-sato/webkit/libwpe_1.8.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.0.bb
@@ -14,7 +14,7 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2"
+SRC_URI[sha256sum] = "2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.27.0


--===============1952305236748042098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.8.0.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.10.0.tar.xz"
packages/core2-32-poky-linux/libwpe: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 234132 to 234448 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGSIZE changed from 235931 to 236343 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 209199 to 209620 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-src: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.8.0" to "1.10.0"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.5.1"
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.8.0 [default] to 1.10.0 [default]
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.4.3 to libwpe-1.0.so.1.5.1
  /usr/lib/libwpe-1.0.so.1.4.3 moved to /usr/lib/libwpe-1.0.so.1.5.1
  /usr/include/wpe-1.0/wpe/libwpe-version.h was added

--===============1952305236748042098==--
