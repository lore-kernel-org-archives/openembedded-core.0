Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2213A7F013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 23:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A577C40BCF;
	Thu, 25 Jul 2019 23:23:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OBhXFQPpxb2s; Thu, 25 Jul 2019 23:23:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 888A240B37;
	Thu, 25 Jul 2019 23:23:14 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 94DC217183F;
	Thu, 25 Jul 2019 19:23:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 19:22:58 -0400
Message-Id: <1564096979-19730-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] wayland-protocols: upgrade 1.17 -> 1.18
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
X-List-Received-Date: Thu, 25 Jul 2019 23:28:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

This version comes with documentational clarifications, bug fixes and minor
additions to existing protocols. See the commit log for details.
https://lists.freedesktop.org/archives/wayland-devel/2019-July/040756.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland-protocols_1.17.bb => wayland-protocols_1.18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.17.bb => wayland-protocols_1.18.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.17.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.18.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.17.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.18.bb
index ca8f06c..c8bec66 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.17.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.18.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "55ddd5fdb02b73b9de9559aaec267315"
-SRC_URI[sha256sum] = "df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f"
+SRC_URI[md5sum] = "af38f22d8e233c2f2e00ddc8dcc94694"
+SRC_URI[sha256sum] = "3d73b7e7661763dc09d7d9107678400101ecff2b5b1e531674abfa81e04874b3"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


