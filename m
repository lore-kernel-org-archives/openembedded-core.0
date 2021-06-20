Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32456.1624189110656920381
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id A86A138C1262
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 21.1.3 SUCCEEDED
Message-ID: <MADEUP.168A47641421B4AA.1783@lists.openembedded.org>
X-Groupsio-MsgNum: 153114
Content-Type: multipart/mixed; boundary="===============8614739409355414706=="

--===============8614739409355414706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *21.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-21.1.2-21.1.3.patch
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

--===============8614739409355414706==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-21.1.2-21.1.3.patch"

From 43172c56bde6953dc39360ba02cff3c6c6e3f8bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 09:29:28 +0000
Subject: [PATCH] mesa: upgrade 21.1.2 -> 21.1.3

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.2.bb => mesa_21.1.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.1.2.bb => mesa_21.1.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5700cc9673..86a02047d1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f"
+SRC_URI[sha256sum] = "cbe221282670875ffd762247b6a2c95dcee91d0a34c29802c75ef761fc891e69"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.2.bb b/meta/recipes-graphics/mesa/mesa_21.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.2.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.3.bb
-- 
2.20.1


--===============8614739409355414706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-21.1.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch" to "https://mesa.freedesktop.org/archive/mesa-21.1.3.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch"
packages/core2-32-poky-linux/mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 178034244 to 178032024 (-0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 25706338 to 25706639 (+0%)
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 95871494 to 95872290 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "21.1.2" to "21.1.3"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 21.1.2 [default] to 21.1.3 [default]

--===============8614739409355414706==--
