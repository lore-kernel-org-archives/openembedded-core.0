Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 448096FFD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 077C020BAB;
	Wed, 15 Nov 2017 16:59:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bgFF2eKHjsbA; Wed, 15 Nov 2017 16:59:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DACBD20B9E;
	Wed, 15 Nov 2017 16:59:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 60A66162723;
	Wed, 15 Nov 2017 11:59:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 11:59:45 -0500
Message-Id: <1510765185-45865-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] libinput: update to 1.8.4
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
X-List-Received-Date: Wed, 15 Nov 2017 16:59:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/{libinput_1.8.3.bb => libinput_1.8.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.8.3.bb => libinput_1.8.4.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.8.3.bb b/meta/recipes-graphics/wayland/libinput_1.8.4.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.8.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.8.4.bb
index 3a02c4b..aea2348 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.4.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "5265244853ad7cf41232b0d3ee805ab9"
-SRC_URI[sha256sum] = "2fe2e2f52f0971a9c43541b8f26582ca8df6ed4bb9050e85eb40d4ff6b13142d"
+SRC_URI[md5sum] = "aeeb79bfe1b1cb64c939098468d350b3"
+SRC_URI[sha256sum] = "5ad95c8db75d59f1662199df748f912b150c3294d33cd4dd592aeb1908fe9d7f"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.7.4


