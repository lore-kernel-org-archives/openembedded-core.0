Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C178E794D8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 513BB20C29;
	Sat, 25 Aug 2018 17:09:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Libp2jz6IMyV; Sat, 25 Aug 2018 17:09:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 186672014B;
	Sat, 25 Aug 2018 17:09:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 89E631635CB;
	Sat, 25 Aug 2018 13:08:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Aug 2018 13:08:58 -0400
Message-Id: <1535216938-3765-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535216938-3765-1-git-send-email-denis@denix.org>
References: <1535216938-3765-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] weston: upgrade to 5.0.0
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
X-List-Received-Date: Sat, 25 Aug 2018 17:09:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

License checksum for compositor.c has changed due to extra copyright line
and year being updated - the license itself hasn't changed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/{weston_4.0.0.bb => weston_5.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_4.0.0.bb => weston_5.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/weston_4.0.0.bb b/meta/recipes-graphics/wayland/weston_5.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/weston_4.0.0.bb
rename to meta/recipes-graphics/wayland/weston_5.0.0.bb
index 3d192cf..299408b 100644
--- a/meta/recipes-graphics/wayland/weston_4.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_5.0.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://libweston/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
+                    file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
@@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "33709aa4d5916f89643fca0fc0064b39"
-SRC_URI[sha256sum] = "a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58"
+SRC_URI[md5sum] = "752a04ce3c65af4884cfac4e57231bdb"
+SRC_URI[sha256sum] = "15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


