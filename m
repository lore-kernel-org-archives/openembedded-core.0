Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 74E2861308
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 00:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28F2C40C13;
	Mon,  2 Mar 2020 00:05:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id G6_3thbLApuB; Mon,  2 Mar 2020 00:05:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1353C40A13;
	Mon,  2 Mar 2020 00:05:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3C28616C449;
	Sun,  1 Mar 2020 19:05:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Mar 2020 19:05:10 -0500
Message-Id: <1583107510-32807-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland-protocols: upgrade 1.18 -> 1.20
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
X-List-Received-Date: Mon, 02 Mar 2020 00:05:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

wayland-protocols 1.20 is now available.

This release is a brown paper bag release adding the missing README.md,
GOVERNANCE.md and MEMBERS.md files to the tarball. Distributions that
distribute one or more of these files should ignore the 1.19 release and
move directly to 1.20.
https://lists.freedesktop.org/archives/wayland-devel/2020-February/041269.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.18.bb => wayland-protocols_1.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.18.bb => wayland-protocols_1.20.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.18.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.18.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
index c8bec66..3fb78f6 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.18.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "af38f22d8e233c2f2e00ddc8dcc94694"
-SRC_URI[sha256sum] = "3d73b7e7661763dc09d7d9107678400101ecff2b5b1e531674abfa81e04874b3"
+SRC_URI[md5sum] = "b0836533a3f2dc6585b1dae00341157f"
+SRC_URI[sha256sum] = "9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


