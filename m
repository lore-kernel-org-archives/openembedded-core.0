Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.16337.1623585061597892311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 144A338C13DA
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.10.1 SUCCEEDED
Message-ID: <MADEUP.16882203119541F2.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152910
Content-Type: multipart/mixed; boundary="===============7839785975625411201=="

--===============7839785975625411201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.10.0-1.10.1.patch
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

--===============7839785975625411201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.10.0.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.10.1.tar.xz"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 221928 to 221980 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.5.1 to libwpe-1.0.so.1.5.2
  /usr/lib/libwpe-1.0.so.1.5.1 moved to /usr/lib/libwpe-1.0.so.1.5.2

--===============7839785975625411201==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.10.0-1.10.1.patch"

From 1495b0cd52fd3831426dc8a7a2d2326a96706bea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 11:34:12 +0000
Subject: [PATCH] libwpe: upgrade 1.10.0 -> 1.10.1

---
 meta/recipes-sato/webkit/{libwpe_1.10.0.bb => libwpe_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.10.0.bb => libwpe_1.10.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.10.0.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/libwpe_1.10.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.10.1.bb
index d90557e3af..4680c1e95e 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
@@ -14,7 +14,7 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d"
+SRC_URI[sha256sum] = "a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.17.1


--===============7839785975625411201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.5.1", added "/usr/lib/libwpe-1.0.so.1.5.2"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.5.1 to libwpe-1.0.so.1.5.2
  /usr/lib/libwpe-1.0.so.1.5.1 moved to /usr/lib/libwpe-1.0.so.1.5.2

--===============7839785975625411201==--
