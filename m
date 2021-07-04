Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7653.1625391858540673363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id C369938C1258
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.107 SUCCEEDED
Message-ID: <MADEUP.168E8D48A5135D09.4199@lists.openembedded.org>
X-Groupsio-MsgNum: 153530
Content-Type: multipart/mixed; boundary="===============0211117690265064347=="

--===============0211117690265064347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.107* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.106-2.4.107.patch
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

--===============0211117690265064347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdrm: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.106.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.107.tar.xz"
packages/core2-32-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 56659 to 56941 (+0%)
packages/core2-32-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1438016 to 1449476 (+1%)
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 640498 to 640774 (+0%)
packages/core2-32-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-kms: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-kms: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-src: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1650624 to 1665702 (+1%)
packages/core2-32-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.106 [default] to 2.4.107 [default]
packages/core2-32-poky-linux/libdrm/libdrm: PV changed from "2.4.106" to "2.4.107"
packages/core2-32-poky-linux/libdrm/libdrm: PKGSIZE changed from 87387 to 95579 (+9%)
packages/core2-32-poky-linux/libdrm/libdrm: PKGV changed from 2.4.106 [default] to 2.4.107 [default]

--===============0211117690265064347==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.106-2.4.107.patch"

From e949102f8f99eb7ea99e0fa12f280500305fe260 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 08:03:57 +0000
Subject: [PATCH] libdrm: upgrade 2.4.106 -> 2.4.107

---
 .../drm/{libdrm_2.4.106.bb => libdrm_2.4.107.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.106.bb => libdrm_2.4.107.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.106.bb b/meta/recipes-graphics/drm/libdrm_2.4.107.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.106.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.107.bb
index 2f63489021..1dd07046f7 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.106.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.107.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4"
+SRC_URI[sha256sum] = "c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888"
 
 inherit meson pkgconfig manpages
 
-- 
2.20.1


--===============0211117690265064347==--
