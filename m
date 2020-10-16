Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12223.1602843683395098785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4A60638C17C9
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.0.0 SUCCEEDED
Message-ID: <MADEUP.163E71D6F3FACFD9.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143461
Content-Type: multipart/mixed; boundary="===============0342324067657634572=="

--===============0342324067657634572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-0.0.13-1.0.0.patch
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

--===============0342324067657634572==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-0.0.13-1.0.0.patch"

From 9b77b359b886378c29dd951edb72f487a6aff761 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:38:59 +0000
Subject: [PATCH] libhandy: upgrade 0.0.13 -> 1.0.0

---
 meta/recipes-gnome/libhandy/libhandy_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_git.bb
index 9f74014640..01b932a528 100644
--- a/meta/recipes-gnome/libhandy/libhandy_git.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_git.bb
@@ -3,9 +3,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
+SRCREV = "94313c206258860b2428712e7ece1d02c5177857"
 S = "${WORKDIR}/git"
-PV = "0.0.13"
+PV = "1.0.0"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.18.4


--===============0342324067657634572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: removed "libhandy-locale", added "libhandy-locale-eu libhandy-locale-id libhandy-locale-es libhandy-locale-ro libhandy-locale-uk libhandy-locale-en-gb libhandy-locale-pl libhandy-locale-pt-br"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 1387136 to 1677792 (+21%)
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKG changed from libhandy-0.0-dbg to libhandy-1-dbg
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 423485 to 535650 (+26%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKG changed from libhandy-0.0-dev to libhandy-1-dev
packages/core2-32-poky-linux/libhandy/libhandy-doc: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKG changed from libhandy-0.0-doc to libhandy-1-doc
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGSIZE changed from 136632 to 271852 (+99%)
packages/core2-32-poky-linux/libhandy/libhandy-examples: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-examples: RDEPENDS: added "gdk-pixbuf (['>= 2.40.0'])"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKG changed from libhandy-0.0-examples to libhandy-1-examples
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 2601888 to 4142047 (+59%)
packages/core2-32-poky-linux/libhandy/libhandy-src: PKG changed from libhandy-0.0-src to libhandy-1-src
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKG changed from libhandy-0.0-staticdev to libhandy-1-staticdev
packages/core2-32-poky-linux/libhandy/libhandy: PKGSIZE changed from 502428 to 593716 (+18%)
packages/core2-32-poky-linux/libhandy/libhandy: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy: PKG changed from libhandy-0.0-0 to libhandy-1-0
Changes to packages/core2-32-poky-linux/libhandy (sysroot):
  /usr/include/libhandy-1 was added
  /usr/include/libhandy-1/handy.h was added
  /usr/include/libhandy-1/hdy-action-row.h was added
  /usr/include/libhandy-1/hdy-animation.h was added
  /usr/include/libhandy-1/hdy-application-window.h was added
  /usr/include/libhandy-1/hdy-avatar.h was added
  /usr/include/libhandy-1/hdy-carousel.h was added
  /usr/include/libhandy-1/hdy-carousel-indicator-dots.h was added
  /usr/include/libhandy-1/hdy-carousel-indicator-lines.h was added
  /usr/include/libhandy-1/hdy-clamp.h was added
  /usr/include/libhandy-1/hdy-combo-row.h was added
  /usr/include/libhandy-1/hdy-deck.h was added
  /usr/include/libhandy-1/hdy-deprecation-macros.h was added
  /usr/include/libhandy-1/hdy-enums.h was added
  /usr/include/libhandy-1/hdy-enum-value-object.h was added
  /usr/include/libhandy-1/hdy-expander-row.h was added
  /usr/include/libhandy-1/hdy-header-bar.h was added
  /usr/include/libhandy-1/hdy-header-group.h was added
  /usr/include/libhandy-1/hdy-keypad.h was added
  /usr/include/libhandy-1/hdy-leaflet.h was added
  /usr/include/libhandy-1/hdy-main.h was added
  /usr/include/libhandy-1/hdy-navigation-direction.h was added
  /usr/include/libhandy-1/hdy-preferences-group.h was added
  /usr/include/libhandy-1/hdy-preferences-page.h was added
  /usr/include/libhandy-1/hdy-preferences-row.h was added
  /usr/include/libhandy-1/hdy-preferences-window.h was added
  /usr/include/libhandy-1/hdy-search-bar.h was added
  /usr/include/libhandy-1/hdy-squeezer.h was added
  /usr/include/libhandy-1/hdy-swipeable.h was added
  /usr/include/libhandy-1/hdy-swipe-group.h was added
  /usr/include/libhandy-1/hdy-swipe-tracker.h was added
  /usr/include/libhandy-1/hdy-title-bar.h was added
  /usr/include/libhandy-1/hdy-types.h was added
  /usr/include/libhandy-1/hdy-value-object.h was added
  /usr/include/libhandy-1/hdy-version.h was added
  /usr/include/libhandy-1/hdy-view-switcher-bar.h was added
  /usr/include/libhandy-1/hdy-view-switcher.h was added
  /usr/include/libhandy-1/hdy-view-switcher-title.h was added
  /usr/include/libhandy-1/hdy-window.h was added
  /usr/include/libhandy-1/hdy-window-handle.h was added
  /usr/lib/girepository-1.0/Handy-1.typelib was added
  /usr/lib/libhandy-1.so.0 was added
  /usr/lib/libhandy-1.so was added
  /usr/lib/pkgconfig/libhandy-1.pc was added
  /usr/share/gir-1.0/Handy-1.gir was added
  /usr/share/vala/vapi/libhandy-1.deps was added
  /usr/share/vala/vapi/libhandy-1.vapi was added
  /usr/include/libhandy-0.0 was removed
  /usr/include/libhandy-0.0/handy.h was removed
  /usr/include/libhandy-0.0/hdy-action-row.h was removed
  /usr/include/libhandy-0.0/hdy-animation.h was removed
  /usr/include/libhandy-0.0/hdy-arrows.h was removed
  /usr/include/libhandy-0.0/hdy-column.h was removed
  /usr/include/libhandy-0.0/hdy-combo-row.h was removed
  /usr/include/libhandy-0.0/hdy-deprecation-macros.h was removed
  /usr/include/libhandy-0.0/hdy-dialer-button.h was removed
  /usr/include/libhandy-0.0/hdy-dialer-cycle-button.h was removed
  /usr/include/libhandy-0.0/hdy-dialer.h was removed
  /usr/include/libhandy-0.0/hdy-dialog.h was removed
  /usr/include/libhandy-0.0/hdy-enums.h was removed
  /usr/include/libhandy-0.0/hdy-enum-value-object.h was removed
  /usr/include/libhandy-0.0/hdy-expander-row.h was removed
  /usr/include/libhandy-0.0/hdy-fold.h was removed
  /usr/include/libhandy-0.0/hdy-header-bar.h was removed
  /usr/include/libhandy-0.0/hdy-header-group.h was removed
  /usr/include/libhandy-0.0/hdy-keypad.h was removed
  /usr/include/libhandy-0.0/hdy-leaflet.h was removed
  /usr/include/libhandy-0.0/hdy-list-box.h was removed
  /usr/include/libhandy-0.0/hdy-main.h was removed
  /usr/include/libhandy-0.0/hdy-paginator.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-group.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-page.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-row.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-window.h was removed
  /usr/include/libhandy-0.0/hdy-search-bar.h was removed
  /usr/include/libhandy-0.0/hdy-squeezer.h was removed
  /usr/include/libhandy-0.0/hdy-string-utf8.h was removed
  /usr/include/libhandy-0.0/hdy-swipeable.h was removed
  /usr/include/libhandy-0.0/hdy-swipe-group.h was removed
  /usr/include/libhandy-0.0/hdy-title-bar.h was removed
  /usr/include/libhandy-0.0/hdy-value-object.h was removed
  /usr/include/libhandy-0.0/hdy-version.h was removed
  /usr/include/libhandy-0.0/hdy-view-switcher-bar.h was removed
  /usr/include/libhandy-0.0/hdy-view-switcher.h was removed
  /usr/lib/girepository-1.0/Handy-0.0.typelib was removed
  /usr/lib/libhandy-0.0.so.0 was removed
  /usr/lib/libhandy-0.0.so was removed
  /usr/lib/pkgconfig/libhandy-0.0.pc was removed
  /usr/share/gir-1.0/Handy-0.0.gir was removed
  /usr/share/vala/vapi/libhandy-0.0.deps was removed
  /usr/share/vala/vapi/libhandy-0.0.vapi was removed

--===============0342324067657634572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: removed "libhandy-locale", added "libhandy-locale-ro libhandy-locale-uk libhandy-locale-en-gb libhandy-locale-pt-br libhandy-locale-pl libhandy-locale-es libhandy-locale-id libhandy-locale-eu"
packages/core2-32-poky-linux/libhandy: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 1387136 to 1677792 (+21%)
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKG changed from libhandy-0.0-dbg to libhandy-1-dbg
packages/core2-32-poky-linux/libhandy/libhandy-dbg: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 423485 to 535650 (+26%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKG changed from libhandy-0.0-dev to libhandy-1-dev
packages/core2-32-poky-linux/libhandy/libhandy-dev: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKG changed from libhandy-0.0-doc to libhandy-1-doc
packages/core2-32-poky-linux/libhandy/libhandy-doc: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-examples: RDEPENDS: added "gdk-pixbuf (['>= 2.40.0'])"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGSIZE changed from 136632 to 271852 (+99%)
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKG changed from libhandy-0.0-examples to libhandy-1-examples
packages/core2-32-poky-linux/libhandy/libhandy-examples: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 2601888 to 4142047 (+59%)
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKG changed from libhandy-0.0-src to libhandy-1-src
packages/core2-32-poky-linux/libhandy/libhandy-src: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKG changed from libhandy-0.0-staticdev to libhandy-1-staticdev
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 0.0.13 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PKGSIZE changed from 502428 to 593716 (+18%)
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "0.0.13" to "1.0.0"
packages/core2-32-poky-linux/libhandy/libhandy: PKG changed from libhandy-0.0-0 to libhandy-1-0
packages/core2-32-poky-linux/libhandy/libhandy: FILELIST: removed "/usr/lib/girepository-1.0/Handy-0.0.typelib /usr/lib/libhandy-0.0.so.0", added "/usr/share/locale/uk/LC_MESSAGES/libhandy.mo"
Changes to packages/core2-32-poky-linux/libhandy (sysroot):
  /usr/include/libhandy-1 was added
  /usr/include/libhandy-1/handy.h was added
  /usr/include/libhandy-1/hdy-action-row.h was added
  /usr/include/libhandy-1/hdy-animation.h was added
  /usr/include/libhandy-1/hdy-application-window.h was added
  /usr/include/libhandy-1/hdy-avatar.h was added
  /usr/include/libhandy-1/hdy-carousel.h was added
  /usr/include/libhandy-1/hdy-carousel-indicator-dots.h was added
  /usr/include/libhandy-1/hdy-carousel-indicator-lines.h was added
  /usr/include/libhandy-1/hdy-clamp.h was added
  /usr/include/libhandy-1/hdy-combo-row.h was added
  /usr/include/libhandy-1/hdy-deck.h was added
  /usr/include/libhandy-1/hdy-deprecation-macros.h was added
  /usr/include/libhandy-1/hdy-enums.h was added
  /usr/include/libhandy-1/hdy-enum-value-object.h was added
  /usr/include/libhandy-1/hdy-expander-row.h was added
  /usr/include/libhandy-1/hdy-header-bar.h was added
  /usr/include/libhandy-1/hdy-header-group.h was added
  /usr/include/libhandy-1/hdy-keypad.h was added
  /usr/include/libhandy-1/hdy-leaflet.h was added
  /usr/include/libhandy-1/hdy-main.h was added
  /usr/include/libhandy-1/hdy-navigation-direction.h was added
  /usr/include/libhandy-1/hdy-preferences-group.h was added
  /usr/include/libhandy-1/hdy-preferences-page.h was added
  /usr/include/libhandy-1/hdy-preferences-row.h was added
  /usr/include/libhandy-1/hdy-preferences-window.h was added
  /usr/include/libhandy-1/hdy-search-bar.h was added
  /usr/include/libhandy-1/hdy-squeezer.h was added
  /usr/include/libhandy-1/hdy-swipeable.h was added
  /usr/include/libhandy-1/hdy-swipe-group.h was added
  /usr/include/libhandy-1/hdy-swipe-tracker.h was added
  /usr/include/libhandy-1/hdy-title-bar.h was added
  /usr/include/libhandy-1/hdy-types.h was added
  /usr/include/libhandy-1/hdy-value-object.h was added
  /usr/include/libhandy-1/hdy-version.h was added
  /usr/include/libhandy-1/hdy-view-switcher-bar.h was added
  /usr/include/libhandy-1/hdy-view-switcher.h was added
  /usr/include/libhandy-1/hdy-view-switcher-title.h was added
  /usr/include/libhandy-1/hdy-window.h was added
  /usr/include/libhandy-1/hdy-window-handle.h was added
  /usr/lib/girepository-1.0/Handy-1.typelib was added
  /usr/lib/libhandy-1.so.0 was added
  /usr/lib/libhandy-1.so was added
  /usr/lib/pkgconfig/libhandy-1.pc was added
  /usr/share/gir-1.0/Handy-1.gir was added
  /usr/share/vala/vapi/libhandy-1.deps was added
  /usr/share/vala/vapi/libhandy-1.vapi was added
  /usr/include/libhandy-0.0 was removed
  /usr/include/libhandy-0.0/handy.h was removed
  /usr/include/libhandy-0.0/hdy-action-row.h was removed
  /usr/include/libhandy-0.0/hdy-animation.h was removed
  /usr/include/libhandy-0.0/hdy-arrows.h was removed
  /usr/include/libhandy-0.0/hdy-column.h was removed
  /usr/include/libhandy-0.0/hdy-combo-row.h was removed
  /usr/include/libhandy-0.0/hdy-deprecation-macros.h was removed
  /usr/include/libhandy-0.0/hdy-dialer-button.h was removed
  /usr/include/libhandy-0.0/hdy-dialer-cycle-button.h was removed
  /usr/include/libhandy-0.0/hdy-dialer.h was removed
  /usr/include/libhandy-0.0/hdy-dialog.h was removed
  /usr/include/libhandy-0.0/hdy-enums.h was removed
  /usr/include/libhandy-0.0/hdy-enum-value-object.h was removed
  /usr/include/libhandy-0.0/hdy-expander-row.h was removed
  /usr/include/libhandy-0.0/hdy-fold.h was removed
  /usr/include/libhandy-0.0/hdy-header-bar.h was removed
  /usr/include/libhandy-0.0/hdy-header-group.h was removed
  /usr/include/libhandy-0.0/hdy-keypad.h was removed
  /usr/include/libhandy-0.0/hdy-leaflet.h was removed
  /usr/include/libhandy-0.0/hdy-list-box.h was removed
  /usr/include/libhandy-0.0/hdy-main.h was removed
  /usr/include/libhandy-0.0/hdy-paginator.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-group.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-page.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-row.h was removed
  /usr/include/libhandy-0.0/hdy-preferences-window.h was removed
  /usr/include/libhandy-0.0/hdy-search-bar.h was removed
  /usr/include/libhandy-0.0/hdy-squeezer.h was removed
  /usr/include/libhandy-0.0/hdy-string-utf8.h was removed
  /usr/include/libhandy-0.0/hdy-swipeable.h was removed
  /usr/include/libhandy-0.0/hdy-swipe-group.h was removed
  /usr/include/libhandy-0.0/hdy-title-bar.h was removed
  /usr/include/libhandy-0.0/hdy-value-object.h was removed
  /usr/include/libhandy-0.0/hdy-version.h was removed
  /usr/include/libhandy-0.0/hdy-view-switcher-bar.h was removed
  /usr/include/libhandy-0.0/hdy-view-switcher.h was removed
  /usr/lib/girepository-1.0/Handy-0.0.typelib was removed
  /usr/lib/libhandy-0.0.so.0 was removed
  /usr/lib/libhandy-0.0.so was removed
  /usr/lib/pkgconfig/libhandy-0.0.pc was removed
  /usr/share/gir-1.0/Handy-0.0.gir was removed
  /usr/share/vala/vapi/libhandy-0.0.deps was removed
  /usr/share/vala/vapi/libhandy-0.0.vapi was removed

--===============0342324067657634572==--
