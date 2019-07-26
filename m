Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC377D265
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:30:25 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id BF4ED102EF1;
	Fri, 26 Jul 2019 15:30:26 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 17:30:19 +0200
Message-Id: <20190726153019.30593-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libdrm: Move amdgpu.ids file into libdrm-amdgpu package.
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
X-List-Received-Date: Fri, 26 Jul 2019 15:30:26 -0000
Content-Transfer-Encoding: 8bit

There is no point in shipping it in main libdrm package.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta/recipes-graphics/drm/libdrm_2.4.99.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.99.bb b/meta/recipes-graphics/drm/libdrm_2.4.99.bb
index 3cb30a4173..fa3eb08f40 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.99.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.99.bb
@@ -54,7 +54,7 @@ FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
 FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
 FILES_${PN}-kms = "${libdir}/libkms*.so.*"
 FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
-FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
+FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.* ${datadir}/${PN}/amdgpu.ids"
 FILES_${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


