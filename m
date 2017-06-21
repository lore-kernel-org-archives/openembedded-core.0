Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id CF52B77E66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C8D120ABA;
	Wed, 21 Jun 2017 15:36:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8FWqGsUD5yWa; Wed, 21 Jun 2017 15:36:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A128204E0;
	Wed, 21 Jun 2017 15:36:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E351E1624E5;
	Wed, 21 Jun 2017 11:36:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 11:36:46 -0400
Message-Id: <1498059406-95702-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade to 1.8
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
X-List-Received-Date: Wed, 21 Jun 2017 15:36:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.7.bb => wayland-protocols_1.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.7.bb => wayland-protocols_1.8.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.7.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.8.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.7.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.8.bb
index 1d2f0db..264af21 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.7.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.8.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "9acfc9556f7cfedc44d97af60da66a5f"
-SRC_URI[sha256sum] = "635f2a937d318f1fecb97b54074ca211486e38af943868dd0fa82ea38d091c1f"
+SRC_URI[md5sum] = "769f93b312b1323a8012565c3973cf7d"
+SRC_URI[sha256sum] = "e3fa5f2812cfec3c1c2573bd34adfe37d4d8950dba572d9ec6c52adcc5fe4b9a"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


