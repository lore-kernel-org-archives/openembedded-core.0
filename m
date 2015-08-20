Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3973176B37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:55:09 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3094637A77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:54:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:54:49 +0200
Message-Id: <1440075290-1216-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] gstreamer1.0-plugins: Ensure the native OE orcc is used
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
X-List-Received-Date: Thu, 20 Aug 2015 12:55:12 -0000

Without this, gstreamer configure scripts may choose the host orcc instead

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 687aa2f..cef269d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -15,7 +15,10 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 LIBV = "1.0"
 require gst-plugins-package.inc
 
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc orc-native"
+
+ORCC = "${STAGING_DIR_NATIVE}${bindir}/orcc"
+export ORCC
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
-- 
1.9.1


