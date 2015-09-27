Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C4C2077005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 21:48:22 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 10F9C2089B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:48:22 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Sep 2015 23:48:09 +0200
Message-Id: <1443390491-23728-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 5/7] gstreamer1.0-plugins-ugly: upgrade to version 1.6.0
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
X-List-Received-Date: Sun, 27 Sep 2015 21:48:24 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 1 +
 ...er1.0-plugins-ugly_1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.5.bb => gstreamer1.0-plugins-ugly_1.6.0.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 63ba316..10362b5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -28,3 +28,4 @@ EXTRA_OECONF += " \
     --disable-twolame \
     "
 
+FILES_${PN}-x264 += "${datadir}/gstreamer-1.0/presets/GstX264Enc.prs"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.0.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.0.bb
index 25cb28c..10c6e8f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.0.bb
@@ -3,8 +3,8 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
 
-SRC_URI[md5sum] = "6954beed7bb9a93e426dee543ff46393"
-SRC_URI[sha256sum] = "5cd5e81cf618944f4dc935f1669b2125e8bb2fe9cc7dc8dc15b72237aca49067"
+SRC_URI[md5sum] = "7df6ab044d7754c1087375ce5f770be8"
+SRC_URI[sha256sum] = "91178dc0d687a83c083190a905681d3a66901374b1004fc52cd300b7802e5f06"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.9.1


