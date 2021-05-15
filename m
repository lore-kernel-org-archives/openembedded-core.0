Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4493.1621074783518376599
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id BA9BF38C13FD
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.21 SUCCEEDED
Message-ID: <MADEUP.167F36EDD1A02B25.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151837
Content-Type: multipart/mixed; boundary="===============6716618387314614142=="

--===============6716618387314614142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.20-1.21.patch
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

--===============6716618387314614142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging was added
  /usr/share/wayland-protocols/staging/xdg-activation was added
  /usr/share/wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml"

--===============6716618387314614142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.20" to "1.21"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.20 [default] to 1.21 [default]
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://wayland.freedesktop.org/releases/wayland-protocols-1.20.tar.xz" to "https://wayland.freedesktop.org/releases/wayland-protocols-1.21.tar.xz"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging was added
  /usr/share/wayland-protocols/staging/xdg-activation was added
  /usr/share/wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.20" to "1.21"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.20 [default] to 1.21 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.20" to "1.21"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.20 [default] to 1.21 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 417001 to 428338 (+3%)

--===============6716618387314614142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.20-1.21.patch"

From 7c484049bf721c094bc9423a5ae6f74e192af33d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:28:27 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.20 -> 1.21

---
 .../{wayland-protocols_1.20.bb => wayland-protocols_1.21.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.20.bb => wayland-protocols_1.21.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
index 3fb78f658c..16452f86e6 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "b0836533a3f2dc6585b1dae00341157f"
-SRC_URI[sha256sum] = "9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7"
+SRC_URI[sha256sum] = "b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.27.0


--===============6716618387314614142==--
