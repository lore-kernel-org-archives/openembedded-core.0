Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.701.1610713822866013454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6E2CB38C13D2
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 20.3.3 SUCCEEDED
Message-ID: <MADEUP.165A67B069A5CEDE.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146788
Content-Type: multipart/mixed; boundary="===============7440695596291246710=="

--===============7440695596291246710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *20.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-20.3.1-20.3.3.patch
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

--===============7440695596291246710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-20.3.1-20.3.3.patch"

From 1e630ca5b9d0ab6575dd0bc7d1568618f945e926 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 08:07:48 +0000
Subject: [PATCH] mesa: upgrade 20.3.1 -> 20.3.3

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.3.1.bb => mesa_20.3.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_20.3.1.bb => mesa_20.3.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 883c244471..9425a0ac4e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
-SRC_URI[sha256sum] = "af751b49bb2ab0264d58c31e73d869e80333de02b2d1becc93f1b28c67aa780f"
+SRC_URI[sha256sum] = "f74e212d4838e982a10c203ffa998817d1855c5cf448ae87b58f96edea61d156"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.3.1.bb b/meta/recipes-graphics/mesa/mesa_20.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_20.3.3.bb
-- 
2.27.0


--===============7440695596291246710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-20.3.1.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch" to "https://mesa.freedesktop.org/archive/mesa-20.3.3.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch"
packages/core2-32-poky-linux/mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 188519616 to 188559116 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 22691264 to 22695430 (+0%)
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 76092822 to 76079492 (-0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 7243318 to 7241270 (-0%)
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "20.3.1" to "20.3.3"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 20.3.1 [default] to 20.3.3 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "20.3.1" to "20.3.3"

--===============7440695596291246710==--
