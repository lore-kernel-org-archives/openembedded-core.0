Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 584F7762B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 00:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4220220DFF;
	Wed, 11 Jul 2018 00:50:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YGeIRr6jHAxS; Wed, 11 Jul 2018 00:50:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C02420DE7;
	Wed, 11 Jul 2018 00:50:30 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9036C1634E5;
	Tue, 10 Jul 2018 20:50:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 20:50:28 -0400
Message-Id: <1531270228-52629-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade 1.14 -> 1.15
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
X-List-Received-Date: Wed, 11 Jul 2018 00:50:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.14.bb => wayland-protocols_1.15.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.14.bb => wayland-protocols_1.15.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.15.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.15.bb
index 873fcf1..85e35f5 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.15.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "5d32eaf0f5d6b7da7f5ad0959e2551e6"
-SRC_URI[sha256sum] = "9648896b2462b49b15a69b60f44656593c170c0e73121c890eb16d0c1d9376f6"
+SRC_URI[md5sum] = "d75ec11e8443946b4795e4be1cf22db8"
+SRC_URI[sha256sum] = "dabb727a4b64e87bfa8c025c1d63919ce12100b49fdeded31857644a59729ee2"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


