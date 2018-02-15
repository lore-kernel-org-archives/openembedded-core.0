Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A10FA6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 03:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AF74120ACD;
	Thu, 15 Feb 2018 03:14:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jp6CWhPeaLPa; Thu, 15 Feb 2018 03:14:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8BC212017C;
	Thu, 15 Feb 2018 03:14:28 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 079DD1632A7;
	Wed, 14 Feb 2018 22:14:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2018 22:14:27 -0500
Message-Id: <1518664467-54633-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade to 1.13
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
X-List-Received-Date: Thu, 15 Feb 2018 03:14:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.12.bb => wayland-protocols_1.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.12.bb => wayland-protocols_1.13.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.12.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.13.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.12.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.13.bb
index ef1d857..1ef1ee1 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.12.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.13.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "ac83c4704003323b6bd5a1b91fb1be53"
-SRC_URI[sha256sum] = "3b19e8a9e1e19474756a7069db23b90ca9b8ebb438448c6063b4a7fc89b7c8b2"
+SRC_URI[md5sum] = "29312149dafcd4a0e739ba94995a574d"
+SRC_URI[sha256sum] = "0758bc8008d5332f431b2a84fea7de64d971ce270ed208206a098ff2ebc68f38"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


