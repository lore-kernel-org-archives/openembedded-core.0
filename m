Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F33B4748A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31E9420BA8;
	Mon, 21 May 2018 23:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Yzm5JXLGvg8o; Mon, 21 May 2018 23:17:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E87EB20BAA;
	Mon, 21 May 2018 23:17:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 615EE163484;
	Mon, 21 May 2018 19:17:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 19:17:44 -0400
Message-Id: <332399c8210de01e353de42122108e4250bc6246.1526944475.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1526944475.git.denys@ti.com>
References: <cover.1526944475.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 4/4] wayland-protocols: upgrade 1.13 -> 1.14
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
X-List-Received-Date: Mon, 21 May 2018 23:17:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.13.bb => wayland-protocols_1.14.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.13.bb => wayland-protocols_1.14.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.13.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.13.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
index 1ef1ee1..3393a2c 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.13.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "29312149dafcd4a0e739ba94995a574d"
-SRC_URI[sha256sum] = "0758bc8008d5332f431b2a84fea7de64d971ce270ed208206a098ff2ebc68f38"
+SRC_URI[md5sum] = "5d32eaf0f5d6b7da7f5ad0959e2551e6"
+SRC_URI[sha256sum] = "9648896b2462b49b15a69b60f44656593c170c0e73121c890eb16d0c1d9376f6"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


