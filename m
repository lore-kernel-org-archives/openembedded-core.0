Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 48C4379368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id D5D216E90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:54 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:41 +0200
Message-Id: <20180926174244.20989-9-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 09/12] gstreamer1.0-omx: upgrade to version 1.14.3
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
 ...{gstreamer1.0-omx_1.14.2.bb => gstreamer1.0-omx_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.2.bb => gstreamer1.0-omx_1.14.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb
index 3f7bc8f0fc..a3b4902051 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d4fc97e3516befe04be3d1665a6f7bbe"
-SRC_URI[sha256sum] = "316dbb13693795383cad6ec4dbebd94a869cd1f9d59a393686cad0b77bf9b5a9"
+SRC_URI[md5sum] = "d5e4c0650a4de8f6a6301b7070367587"
+SRC_URI[sha256sum] = "6ba7dc5caabce092ea645b5c6de1a82d12ee086d18f692a8f31cbc359b708cb1"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1


