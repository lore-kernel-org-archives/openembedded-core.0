Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0426E60068
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 18:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C28DE209A4;
	Wed,  2 Aug 2017 18:22:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PBU9p_OOe7Ru; Wed,  2 Aug 2017 18:22:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A2229207BD;
	Wed,  2 Aug 2017 18:22:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 204A3162549;
	Wed,  2 Aug 2017 14:22:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 14:22:42 -0400
Message-Id: <1501698162-111362-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade to 1.10
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
X-List-Received-Date: Wed, 02 Aug 2017 18:22:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.9.bb => wayland-protocols_1.10.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.9.bb => wayland-protocols_1.10.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.9.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.9.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
index bcb5095..4f9e9f3 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.9.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "d9a3c93aac1f423501a33e7a9804b3b3"
-SRC_URI[sha256sum] = "666b72de30ca3b70c2b54ccc9e8114cb520e76db224c816b5e23501099174f75"
+SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
+SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


