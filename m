Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 512F9785D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:28:30 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8B53F4CB5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:28:30 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:28:17 +0200
Message-Id: <1502486900-16180-8-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
References: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 07/10] gstreamer1.0-omx: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:28:30 -0000

From: Maxin John <maxin.john@intel.com>

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.2.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb
index dfeefa5..a1d4576 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "cedb230f1c47d0cf4b575d70dff66ff2"
-SRC_URI[sha256sum] = "45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2"
+SRC_URI[md5sum] = "4a1404a20b72e4ab6e826500218ec308"
+SRC_URI[sha256sum] = "1b22398f45a027e977d2b5309625ec91cdcaf0da8751cbc7f596d639a45ba298"
 
 S = "${WORKDIR}/gst-omx-${PV}"
-- 
2.7.4


