Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AE88B6E660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8846320AD5;
	Thu, 12 Oct 2017 19:35:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c2Q_Xx_BvK1m; Thu, 12 Oct 2017 19:35:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67789204B1;
	Thu, 12 Oct 2017 19:35:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E843A1626E6;
	Thu, 12 Oct 2017 15:35:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 15:35:33 -0400
Message-Id: <1507836933-142066-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Thu, 12 Oct 2017 19:35:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.10.bb => wayland-protocols_1.11.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.10.bb => wayland-protocols_1.11.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
index 4f9e9f3..26b0094 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
-SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
+SRC_URI[md5sum] = "8d0338556d77ad86d7fca84ff086af88"
+SRC_URI[sha256sum] = "3afcee1d51c5b1d70b59da790c9830b354236324b19b2b7af9683bd3b7be6804"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


