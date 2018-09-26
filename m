Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 49691793C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id DC0416E8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:53 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:35 +0200
Message-Id: <20180926174244.20989-3-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 03/12] gstreamer1.0-plugin-good: upgrade to version 1.14.3
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
 ...ins-good_1.14.2.bb => gstreamer1.0-plugins-good_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.14.2.bb => gstreamer1.0-plugins-good_1.14.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb
index e035cc0cba..77ccb4cc18 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
-SRC_URI[md5sum] = "5b83b2828e31ce5b4a5c03c71e707ae7"
-SRC_URI[sha256sum] = "c0575e2811860bfff59b865b8d125153859a01f0615fa41e279b64d88d25caad"
+SRC_URI[md5sum] = "01904b7f000cfa6a8e96de0fa1b3ceca"
+SRC_URI[sha256sum] = "5112bce6af0be62760687ca47873c90ce4d65d3fe920a3adf8145db7b07bff5d"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.17.1


