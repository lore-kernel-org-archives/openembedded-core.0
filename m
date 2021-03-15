Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.325.1615826520797362708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7594D38C136F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.48.3 SUCCEEDED
Message-ID: <MADEUP.166C91A929ECB421.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149511
Content-Type: multipart/mixed; boundary="===============0999334713208915508=="

--===============0999334713208915508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.48.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.48.2-1.48.3.patch
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

--===============0999334713208915508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.2.tar.xz;name=archive" to "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.3.tar.xz;name=archive"
packages/core2-32-poky-linux/pango: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 1968392 to 1977188 (+0%)
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-dev: PKGSIZE changed from 1501222 to 1434514 (-4%)
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-ptest: PKGSIZE changed from 1292918 to 1293399 (+0%)
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 1848489 to 1858425 (+1%)
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-src: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango: PKGSIZE changed from 711179 to 708799 (-0%)
packages/core2-32-poky-linux/pango/pango: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpangoft2-1.0.so.0.4800.3"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.2 to libpango-1.0.so.0.4800.3
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.2 to libpangocairo-1.0.so.0.4800.3
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.2 to libpangoft2-1.0.so.0.4800.3
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.2 to libpangoxft-1.0.so.0.4800.3
  /usr/lib/libpango-1.0.so.0.4800.2 moved to /usr/lib/libpango-1.0.so.0.4800.3
  /usr/lib/libpangocairo-1.0.so.0.4800.2 moved to /usr/lib/libpangocairo-1.0.so.0.4800.3
  /usr/lib/libpangoft2-1.0.so.0.4800.2 moved to /usr/lib/libpangoft2-1.0.so.0.4800.3
  /usr/lib/libpangoxft-1.0.so.0.4800.2 moved to /usr/lib/libpangoxft-1.0.so.0.4800.3

--===============0999334713208915508==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.48.2-1.48.3.patch"

From b6dfdd2783e0d530aa7f3fff1ea645a0eba0c08c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 11:32:53 +0000
Subject: [PATCH] pango: upgrade 1.48.2 -> 1.48.3

---
 .../recipes-graphics/pango/{pango_1.48.2.bb => pango_1.48.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.2.bb => pango_1.48.3.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.2.bb b/meta/recipes-graphics/pango/pango_1.48.3.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.2.bb
rename to meta/recipes-graphics/pango/pango_1.48.3.bb
index 1dcb43b5e1..834400c78d 100644
--- a/meta/recipes-graphics/pango/pango_1.48.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.3.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "d21f8b30dc8abdfc55de25656ecb88dc1105eeeb315e5e2a980dcef8010c2c80"
+SRC_URI[archive.sha256sum] = "36ea145c82217c8efc954d02aa577391b1d9a5da205e0aef7ffe0461349b4b46"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.17.1


--===============0999334713208915508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.2 /usr/lib/libpango-1.0.so.0.4800.2 /usr/lib/libpangocairo-1.0.so.0.4800.2 /usr/lib/libpangoft2-1.0.so.0.4800.2", added "/usr/lib/libpangoft2-1.0.so.0.4800.3 /usr/lib/libpangoxft-1.0.so.0.4800.3 /usr/lib/libpangocairo-1.0.so.0.4800.3 /usr/lib/libpango-1.0.so.0.4800.3"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.2 to libpango-1.0.so.0.4800.3
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.2 to libpangocairo-1.0.so.0.4800.3
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.2 to libpangoft2-1.0.so.0.4800.3
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.2 to libpangoxft-1.0.so.0.4800.3
  /usr/lib/libpango-1.0.so.0.4800.2 moved to /usr/lib/libpango-1.0.so.0.4800.3
  /usr/lib/libpangocairo-1.0.so.0.4800.2 moved to /usr/lib/libpangocairo-1.0.so.0.4800.3
  /usr/lib/libpangoft2-1.0.so.0.4800.2 moved to /usr/lib/libpangoft2-1.0.so.0.4800.3
  /usr/lib/libpangoxft-1.0.so.0.4800.2 moved to /usr/lib/libpangoxft-1.0.so.0.4800.3

--===============0999334713208915508==--
