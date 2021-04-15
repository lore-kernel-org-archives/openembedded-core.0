Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1291.1618510600040293984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3118638C125B
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 21.0.2 SUCCEEDED
Message-ID: <MADEUP.16761AD1530D6203.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150555
Content-Type: multipart/mixed; boundary="===============0360997798279814487=="

--===============0360997798279814487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *21.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-21.0.1-21.0.2.patch
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

--===============0360997798279814487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-21.0.1-21.0.2.patch"

From 34856f903713a3fc4af1aaa7157387e01d020d8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:50:22 +0000
Subject: [PATCH] mesa: upgrade 21.0.1 -> 21.0.2

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (99%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index caf3c62ad8..5705ae0f08 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
+SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
similarity index 99%
rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
index 8c584d8e9f..1993d6cbd0 100644
--- a/meta/recipes-graphics/mesa/mesa_21.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
@@ -2,3 +2,4 @@ require ${BPN}.inc
 
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
+
-- 
2.27.0


--===============0360997798279814487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-21.0.1.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch" to "https://mesa.freedesktop.org/archive/mesa-21.0.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch"
packages/core2-32-poky-linux/mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 193995252 to 194019416 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 78160562 to 78163348 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 7372458 to 7376554 (+0%)
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "21.0.1" to "21.0.2"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 21.0.1 [default] to 21.0.2 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "21.0.1" to "21.0.2"

--===============0360997798279814487==--
