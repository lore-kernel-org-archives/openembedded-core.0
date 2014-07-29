Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 6C65F70181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:05:34 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 6B9F833137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:05:35 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 23:05:22 +0200
Message-Id: <1406667922-15716-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406667922-15716-1-git-send-email-dv@pseudoterminal.org>
References: <1406667922-15716-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 7/7] gstreamer1.0-omx: upgrade to 1.2.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:05:34 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-omx_1.0.0.bb => gstreamer1.0-omx_1.2.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.0.0.bb => gstreamer1.0-omx_1.2.0.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
index f5956c6..fe7c91c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bb34b5742223267298bcffc209104a92"
-SRC_URI[sha256sum] = "7a1d8d28d70dacc6bd3c7ee7d7e40df6d5a1d38d7c256d5c9c5c8ef15c005014"
+SRC_URI[md5sum] = "d24e8c0153c35dfefee3e26b1c2c35f8"
+SRC_URI[sha256sum] = "0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
1.8.3.2


