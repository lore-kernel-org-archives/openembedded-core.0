Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.5110.1613463848635394653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6732538C1288
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:12 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 20.3.4 SUCCEEDED
Message-ID: <MADEUP.16642CD34F7482D8.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148141
Content-Type: multipart/mixed; boundary="===============0622756867953138959=="

--===============0622756867953138959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *20.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-20.3.2-20.3.4.patch
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

--===============0622756867953138959==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-20.3.2-20.3.4.patch"

From b4d50f293246afa0d5f3ecc4e141a96ca66bba7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 02:41:19 +0000
Subject: [PATCH] mesa: upgrade 20.3.2 -> 20.3.4

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.3.2.bb => mesa_20.3.4.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_20.3.2.bb => mesa_20.3.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cb075a8b89..9f8ec112cf 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
-SRC_URI[sha256sum] = "cce001b685d23afb976b04138714906abcf7e7f996da6355e6a43e5ca486533d"
+SRC_URI[sha256sum] = "dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.3.2.bb b/meta/recipes-graphics/mesa/mesa_20.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.3.2.bb
rename to meta/recipes-graphics/mesa/mesa_20.3.4.bb
-- 
2.17.1


--===============0622756867953138959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-20.3.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch" to "https://mesa.freedesktop.org/archive/mesa-20.3.4.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch"
packages/core2-32-poky-linux/mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 188520560 to 188634060 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 22695476 to 22691450 (-0%)
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 76098811 to 76086420 (-0%)
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 7243374 to 7241326 (-0%)
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 20.3.2 [default] to 20.3.4 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "20.3.2" to "20.3.4"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 20.3.2 [default] to 20.3.4 [default]

--===============0622756867953138959==--
