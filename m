Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4B633793D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 8AB0F6E8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:54 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:39 +0200
Message-Id: <20180926174244.20989-7-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 07/12] gstreamer1.0-rtsp-server: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:42 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...sp-server_1.14.2.bb => gstreamer1.0-rtsp-server_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.2.bb => gstreamer1.0-rtsp-server_1.14.3.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb
index 6766e252ef..7e75f62c28 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "c26b59dd2ea8b1a4a25e9f7e0f57a50e"
-SRC_URI[sha256sum] = "f7387755cf6ac5f334d4610f1f5aa7da4ff396a487dd5b789bb707f160222c98"
+SRC_URI[md5sum] = "3da1cd1011d3b826df87c96dbfbb1174"
+SRC_URI[sha256sum] = "1f654c7617af15d13b67bf833f4c81d086ecbfd8cce7f2bf65fe5c1c3519f4e6"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.1


