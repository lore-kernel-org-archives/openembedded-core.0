Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0436076A45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:55:14 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id D25B837A77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:54:57 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:54:50 +0200
Message-Id: <1440075290-1216-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440075290-1216-1-git-send-email-dv@pseudoterminal.org>
References: <1440075290-1216-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 2/2] gstreamer1.0-plugins-*: Remove unused GSTREAMER_1_0_ORC variable
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
X-List-Received-Date: Thu, 20 Aug 2015 12:55:15 -0000

Nobody sets this. The orc packageconfig already does everything we need.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 1 -
 4 files changed, 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d34aca5..cdedb60 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -126,7 +126,6 @@ EXTRA_OECONF += " \
     --disable-winscreencap \
     --disable-xvid \
     --disable-zbar \
-    ${GSTREAMER_1_0_ORC} \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
     "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 6d293c4..47f3f40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -32,7 +32,6 @@ EXTRA_OECONF += " \
     --disable-freetypetest \
     --disable-cdparanoia \
     --disable-libvisual \
-    ${GSTREAMER_1_0_ORC} \
 "
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 37217f0..6e316de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -52,7 +52,6 @@ EXTRA_OECONF += " \
     --disable-shout2 \
     --disable-examples \
     --disable-dv1394 \
-    ${GSTREAMER_1_0_ORC} \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 0dd011b..63ba316 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -26,6 +26,5 @@ EXTRA_OECONF += " \
     --disable-amrwb \
     --disable-sidplay \
     --disable-twolame \
-    ${GSTREAMER_1_0_ORC} \
     "
 
-- 
1.9.1


