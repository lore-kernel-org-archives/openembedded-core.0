Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9080474F4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 37D7720AF1;
	Wed,  9 May 2018 16:15:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id d4BrHAHY_h-1; Wed,  9 May 2018 16:15:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 141C32079D;
	Wed,  9 May 2018 16:15:32 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 75E5C163459;
	Wed,  9 May 2018 12:15:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 12:15:30 -0400
Message-Id: <1525882530-55742-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] mesa: ensure all libwayland-egl* files are removed
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
X-List-Received-Date: Wed, 09 May 2018 16:15:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Wayland 1.15+ now ships libwayland-egl by itself, so Mesa should remove
its instance. Previous commit 6e5952fcfc13ff4b63c9376bd41a1dbba957f425
only removed .so libraries, but left .la, which resulted in conflict.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 354271e..314d327 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -135,7 +135,7 @@ do_install_append () {
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
-    rm -f ${D}${libdir}/libwayland-egl.so*
+    rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
 
-- 
2.7.4


