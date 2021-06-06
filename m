Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.25896.1623000257591749114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7EEC038C11C7
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 21.1.2 SUCCEEDED
Message-ID: <MADEUP.16860E22C115D09D.22991@lists.openembedded.org>
X-Groupsio-MsgNum: 152717
Content-Type: multipart/mixed; boundary="===============5694852451809646442=="

--===============5694852451809646442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *21.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-21.1.1-21.1.2.patch
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

--===============5694852451809646442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-21.1.1.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch" to "https://mesa.freedesktop.org/archive/mesa-21.1.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch"
packages/core2-32-poky-linux/mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 178022596 to 178034244 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 25706596 to 25706338 (-0%)
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 95879053 to 95871494 (-0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 9249458 to 9249106 (-0%)
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 21.1.1 [default] to 21.1.2 [default]

--===============5694852451809646442==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-21.1.1-21.1.2.patch"

From 36954e0e6ab0db7062e56ae29a2ccb0d59a29b44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 14:03:35 +0000
Subject: [PATCH] mesa: upgrade 21.1.1 -> 21.1.2

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.1.bb => mesa_21.1.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.1.1.bb => mesa_21.1.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 32cc997c9e..5700cc9673 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2"
+SRC_URI[sha256sum] = "23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.1.bb b/meta/recipes-graphics/mesa/mesa_21.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.2.bb
-- 
2.17.1


--===============5694852451809646442==--
