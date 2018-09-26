Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5FED374596
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 3355F6E95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:55 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:43 +0200
Message-Id: <20180926174244.20989-11-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 11/12] gst-validate: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:41 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gst-validate_1.14.2.bb => gst-validate_1.14.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.2.bb => gst-validate_1.14.3.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.14.3.bb
index f4438dc5a2..43cf944d10 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "f334102b0e706008505d00f7f5b5e023"
-SRC_URI[sha256sum] = "ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f"
+SRC_URI[md5sum] = "4a5a6a2551f26fafd377eb176b5fe06c"
+SRC_URI[sha256sum] = "0910f75de9028edb9f1ba0571470482365ff0c9e5373506780ea38ba0cc9f703"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1


