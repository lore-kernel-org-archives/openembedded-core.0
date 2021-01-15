Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.723.1610713823079428216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 613C538C13BE
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.104 SUCCEEDED
Message-ID: <MADEUP.165A67B07DFDE86D.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146793
Content-Type: multipart/mixed; boundary="===============2770292343127608359=="

--===============2770292343127608359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.104* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.103-2.4.104.patch
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

--===============2770292343127608359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.103-2.4.104.patch"

From c09559f76f5736ae9ad1f1dcf71745181a4289fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:39:40 +0000
Subject: [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104

---
 .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
index 1028d618ae..90b7150835 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
@@ -12,7 +12,7 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
+SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
 
 inherit meson pkgconfig manpages
 
-- 
2.27.0


--===============2770292343127608359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.103.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.104.tar.xz"
packages/core2-32-poky-linux/libdrm: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1595552 to 1598160 (+0%)
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 617098 to 637284 (+3%)
packages/core2-32-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-kms: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-kms: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1642211 to 1643860 (+0%)
packages/core2-32-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-src: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.103" to "2.4.104"
packages/core2-32-poky-linux/libdrm/libdrm: PKGV changed from 2.4.103 [default] to 2.4.104 [default]
packages/core2-32-poky-linux/libdrm/libdrm: PV changed from "2.4.103" to "2.4.104"

--===============2770292343127608359==--
