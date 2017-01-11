Return-Path: <christoph.settgast@methodpark.de>
X-Greylist: delayed 348 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Jan 2017 09:03:48 UTC
Received: from mail.methodpark.de (mail.methodpark.de [212.204.89.242])
	by mail.openembedded.org (Postfix) with ESMTP id 851676FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 09:03:48 +0000 (UTC)
Received: from localhost (virusgate [212.204.89.246])
	by mail.methodpark.de (Postfix) with ESMTP id 1441A2B95A2;
	Wed, 11 Jan 2017 09:58:02 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.6.6 (20110518) (Debian) at methodpark.de
Received: from mail.methodpark.de ([IPv6:::ffff:212.204.89.242])
	by localhost (virusgate.methodpark.de [::ffff:212.204.89.246])
	(amavisd-new, port 10024)
	with ESMTP id N-WANFXcs95m; Wed, 11 Jan 2017 09:57:59 +0100 (CET)
Received: from bob.er.methodpark.de (unknown [10.10.101.95])
	by mail.methodpark.de (Postfix) with ESMTP id F10E314A60B;
	Wed, 11 Jan 2017 09:58:00 +0100 (CET)
From: Christoph Settgast <christoph.settgast@methodpark.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 09:54:39 +0100
Message-Id: <1484124879-20734-1-git-send-email-christoph.settgast@methodpark.de>
X-Mailer: git-send-email 1.9.1
Cc: Christoph Settgast <christoph.settgast@methodpark.com>
Subject: [PATCH] libdrm: enable etnaviv experimental support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 09:03:50 -0000

From: Christoph Settgast <christoph.settgast@methodpark.com>

The etnaviv project is a free and open source linux driver for Vivante
2D/3D GPUs in i.MX SoCs.

Support for etnaviv in libdrm was added in 2.4.71.

Signed-off-by: Christoph Settgast <christoph.settgast@methodpark.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.74.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.74.bb b/meta/recipes-graphics/drm/libdrm_2.4.74.bb
index c67d356..06d7642 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.74.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.74.bb
@@ -24,6 +24,7 @@ inherit autotools pkgconfig manpages
 EXTRA_OECONF += "--disable-cairo-tests \
                  --without-cunit \
                  --enable-omap-experimental-api \
+                 --enable-etnaviv-experimental-api \
                  --enable-install-test-programs \
                  --disable-valgrind \
                 "
@@ -31,10 +32,12 @@ PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu"
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu \
+             ${PN}-etnaviv"
 
 RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu"
+                             ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu \
+                             ${PN}-etnaviv"
 
 FILES_${PN}-tests = "${bindir}/*"
 FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
@@ -45,3 +48,4 @@ FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
 FILES_${PN}-kms = "${libdir}/libkms*.so.*"
 FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
 FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
+FILES_${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
-- 
1.9.1


