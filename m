Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.690.1610713822970266237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id C0B9A38C13F8
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-base: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B0AC97D222.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146804
Content-Type: multipart/mixed; boundary="===============5134155670092988833=="

--===============5134155670092988833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-base* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-upgrade-1.18.2-1.18.3.patch
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

--===============5134155670092988833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.1802.0 to libgstallocators-1.0.so.0.1803.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.1802.0 to libgstapp-1.0.so.0.1803.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.1802.0 to libgstaudio-1.0.so.0.1803.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.1802.0 to libgstfft-1.0.so.0.1803.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.1802.0 to libgstgl-1.0.so.0.1803.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.1802.0 to libgstpbutils-1.0.so.0.1803.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.1802.0 to libgstriff-1.0.so.0.1803.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.1802.0 to libgstrtp-1.0.so.0.1803.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.1802.0 to libgstrtsp-1.0.so.0.1803.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.1802.0 to libgstsdp-1.0.so.0.1803.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.1802.0 to libgsttag-1.0.so.0.1803.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.1802.0 to libgstvideo-1.0.so.0.1803.0
  /usr/lib/libgstallocators-1.0.so.0.1802.0 moved to /usr/lib/libgstallocators-1.0.so.0.1803.0
  /usr/lib/libgstapp-1.0.so.0.1802.0 moved to /usr/lib/libgstapp-1.0.so.0.1803.0
  /usr/lib/libgstaudio-1.0.so.0.1802.0 moved to /usr/lib/libgstaudio-1.0.so.0.1803.0
  /usr/lib/libgstfft-1.0.so.0.1802.0 moved to /usr/lib/libgstfft-1.0.so.0.1803.0
  /usr/lib/libgstgl-1.0.so.0.1802.0 moved to /usr/lib/libgstgl-1.0.so.0.1803.0
  /usr/lib/libgstpbutils-1.0.so.0.1802.0 moved to /usr/lib/libgstpbutils-1.0.so.0.1803.0
  /usr/lib/libgstriff-1.0.so.0.1802.0 moved to /usr/lib/libgstriff-1.0.so.0.1803.0
  /usr/lib/libgstrtp-1.0.so.0.1802.0 moved to /usr/lib/libgstrtp-1.0.so.0.1803.0
  /usr/lib/libgstrtsp-1.0.so.0.1802.0 moved to /usr/lib/libgstrtsp-1.0.so.0.1803.0
  /usr/lib/libgstsdp-1.0.so.0.1802.0 moved to /usr/lib/libgstsdp-1.0.so.0.1803.0
  /usr/lib/libgsttag-1.0.so.0.1802.0 moved to /usr/lib/libgsttag-1.0.so.0.1803.0
  /usr/lib/libgstvideo-1.0.so.0.1802.0 moved to /usr/lib/libgstvideo-1.0.so.0.1803.0

--===============5134155670092988833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-upgrade-1.18.2-1.18.3.patch"

From 867f032598512bd7e56ae57555ff6bbce0923f88 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 10:52:41 +0000
Subject: [PATCH] gstreamer1.0-plugins-base: upgrade 1.18.2 -> 1.18.3

---
 ...ugins-base_1.18.2.bb => gstreamer1.0-plugins-base_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.2.bb => gstreamer1.0-plugins-base_1.18.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
index 531d577b0c..84602246c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "dd04fb1f7826e2f6d9b4d66fc22f19cc6a47c301e13041f0ee3d7f65c89b05ac"
+SRC_URI[sha256sum] = "dbfa20283848f0347a223dd8523dfb62e09e5220b21b1d157a8b0c8b67ba9f52"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.27.0


--===============5134155670092988833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 14675368 to 14676328 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 5398394 to 5403442 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 12949145 to 12952258 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvert: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvert: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoscale: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoscale: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGSIZE changed from 381420 to 381412 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.2.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch file://0004-glimagesink-Downrank-to-marginal.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.3.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch file://0004-glimagesink-Downrank-to-marginal.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.1802.0", added "/usr/lib/libgstallocators-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.1802.0", added "/usr/lib/libgstapp-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.1802.0", added "/usr/lib/libgstaudio-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.1802.0", added "/usr/lib/libgstfft-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.1802.0", added "/usr/lib/libgstgl-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.1802.0", added "/usr/lib/libgstpbutils-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.1802.0", added "/usr/lib/libgstriff-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.1802.0", added "/usr/lib/libgstrtp-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.1802.0", added "/usr/lib/libgstrtsp-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.1802.0", added "/usr/lib/libgstsdp-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.1802.0", added "/usr/lib/libgsttag-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.1802.0", added "/usr/lib/libgstvideo-1.0.so.0.1803.0"
packages/core2-32-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.18.2" to "1.18.3"
Changes to packages/core2-32-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.1802.0 to libgstallocators-1.0.so.0.1803.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.1802.0 to libgstapp-1.0.so.0.1803.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.1802.0 to libgstaudio-1.0.so.0.1803.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.1802.0 to libgstfft-1.0.so.0.1803.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.1802.0 to libgstgl-1.0.so.0.1803.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.1802.0 to libgstpbutils-1.0.so.0.1803.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.1802.0 to libgstriff-1.0.so.0.1803.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.1802.0 to libgstrtp-1.0.so.0.1803.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.1802.0 to libgstrtsp-1.0.so.0.1803.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.1802.0 to libgstsdp-1.0.so.0.1803.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.1802.0 to libgsttag-1.0.so.0.1803.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.1802.0 to libgstvideo-1.0.so.0.1803.0
  /usr/lib/libgstallocators-1.0.so.0.1802.0 moved to /usr/lib/libgstallocators-1.0.so.0.1803.0
  /usr/lib/libgstapp-1.0.so.0.1802.0 moved to /usr/lib/libgstapp-1.0.so.0.1803.0
  /usr/lib/libgstaudio-1.0.so.0.1802.0 moved to /usr/lib/libgstaudio-1.0.so.0.1803.0
  /usr/lib/libgstfft-1.0.so.0.1802.0 moved to /usr/lib/libgstfft-1.0.so.0.1803.0
  /usr/lib/libgstgl-1.0.so.0.1802.0 moved to /usr/lib/libgstgl-1.0.so.0.1803.0
  /usr/lib/libgstpbutils-1.0.so.0.1802.0 moved to /usr/lib/libgstpbutils-1.0.so.0.1803.0
  /usr/lib/libgstriff-1.0.so.0.1802.0 moved to /usr/lib/libgstriff-1.0.so.0.1803.0
  /usr/lib/libgstrtp-1.0.so.0.1802.0 moved to /usr/lib/libgstrtp-1.0.so.0.1803.0
  /usr/lib/libgstrtsp-1.0.so.0.1802.0 moved to /usr/lib/libgstrtsp-1.0.so.0.1803.0
  /usr/lib/libgstsdp-1.0.so.0.1802.0 moved to /usr/lib/libgstsdp-1.0.so.0.1803.0
  /usr/lib/libgsttag-1.0.so.0.1802.0 moved to /usr/lib/libgsttag-1.0.so.0.1803.0
  /usr/lib/libgstvideo-1.0.so.0.1802.0 moved to /usr/lib/libgstvideo-1.0.so.0.1803.0

--===============5134155670092988833==--
