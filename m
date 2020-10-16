Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12219.1602843682980813705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6EDDC38C16CA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.0.1 SUCCEEDED
Message-ID: <MADEUP.163E71D706A6D5A4.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143478
Content-Type: multipart/mixed; boundary="===============5547230465985936674=="

--===============5547230465985936674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-0.10.0-1.0.1.patch
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

--===============5547230465985936674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 700124 to 1015060 (+45%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: RRECOMMENDS: added "wayland-dbg libxml2-dbg"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: RRECOMMENDS: added "libxml2-dev"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: FILELIST: added "/usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/bin/xkbcli /usr/libexec/xkbcommon/xkbcli-interactive-wayland /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/libexec/xkbcommon/xkbcli-list /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-how-to-type"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 0 to 6947 (+100%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: FILELIST: added "/usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/bin/xkbcli /usr/libexec/xkbcommon/xkbcli-interactive-wayland /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/libexec/xkbcommon/xkbcli-list /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-how-to-type"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: FILELIST: added "/usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/bin/xkbcli /usr/libexec/xkbcommon/xkbcli-interactive-wayland /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/libexec/xkbcommon/xkbcli-list /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-how-to-type"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1182821 to 1415265 (+20%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: FILELIST: added "/usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/bin/xkbcli /usr/libexec/xkbcommon/xkbcli-interactive-wayland /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/libexec/xkbcommon/xkbcli-list /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-how-to-type"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 318162 to 477317 (+50%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: RDEPENDS: added "libxml2 (['>= 2.9.10']) wayland (['>= 1.18.0'])"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: FILELIST: added "/usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/bin/xkbcli /usr/libexec/xkbcommon/xkbcli-interactive-wayland /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/libexec/xkbcommon/xkbcli-list /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-how-to-type"
Changes to packages/core2-32-poky-linux/libxkbcommon (sysroot):
  /usr/include/xkbcommon/xkbregistry.h was added
  /usr/lib/libxkbregistry.so.0.0.0 was added
  /usr/lib/libxkbregistry.so.0 was added
  /usr/lib/libxkbregistry.so was added
  /usr/lib/pkgconfig/xkbregistry.pc was added
  /usr/share was added

--===============5547230465985936674==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-0.10.0-1.0.1.patch"

From a4b24d27a8a3d1bb41b8a17af5b8fd136ed2f00a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:11:58 +0000
Subject: [PATCH] libxkbcommon: upgrade 0.10.0 -> 1.0.1

---
 .../xorg-lib/{libxkbcommon_0.10.0.bb => libxkbcommon_1.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.10.0.bb => libxkbcommon_1.0.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
index 16d9c36eae..4ef20b0721 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
@@ -9,8 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2d9ad3a46b317138b5e72a91cf105451"
-SRC_URI[sha256sum] = "57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2"
+SRC_URI[sha256sum] = "ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.18.4


--===============5547230465985936674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxkbcommon: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: RRECOMMENDS: added "wayland-dbg libxml2-dbg"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 700124 to 1015060 (+45%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: RRECOMMENDS: added "libxml2-dev"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 307316 to 335062 (+9%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 0 to 6947 (+100%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1182821 to 1415265 (+20%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PV changed from "0.10.0" to "1.0.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: RDEPENDS: added "libxml2 (['>= 2.9.10']) wayland (['>= 1.18.0'])"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-list /usr/libexec/xkbcommon/xkbcli-interactive-evdev /usr/libexec/xkbcommon/xkbcli-compile-keymap /usr/libexec/xkbcommon/xkbcli-how-to-type /usr/bin/xkbcli /usr/lib/libxkbregistry.so.0.0.0 /usr/libexec/xkbcommon/xkbcli-interactive-x11 /usr/lib/libxkbregistry.so.0 /usr/libexec/xkbcommon/xkbcli-interactive-wayland"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 318162 to 477317 (+50%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 0.10.0 [default] to 1.0.1 [default]
Changes to packages/core2-32-poky-linux/libxkbcommon (sysroot):
  /usr/include/xkbcommon/xkbregistry.h was added
  /usr/lib/libxkbregistry.so.0.0.0 was added
  /usr/lib/libxkbregistry.so.0 was added
  /usr/lib/libxkbregistry.so was added
  /usr/lib/pkgconfig/xkbregistry.pc was added
  /usr/share was added

--===============5547230465985936674==--
