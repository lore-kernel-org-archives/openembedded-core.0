Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 22B0677D47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:28 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id E718D46E05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:28 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:18 +0200
Message-Id: <1494933979-5139-8-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 8/9] gstreamer1.0-omx: upgrade to version 1.12.0
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
X-List-Received-Date: Tue, 16 May 2017 11:26:28 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.0.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
index dfeefa5..73c5adb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "cedb230f1c47d0cf4b575d70dff66ff2"
-SRC_URI[sha256sum] = "45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2"
+SRC_URI[md5sum] = "eaf9505c7acb9b96215cb0ff775d278d"
+SRC_URI[sha256sum] = "acee8c8a88b995fb95601b7b43bf0c83f502d9026bca5705f9c0dc44a757997e"
 
 S = "${WORKDIR}/gst-omx-${PV}"
-- 
2.7.4


