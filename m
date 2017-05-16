Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C59CE77D42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:26 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id AB23146E05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:27 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:16 +0200
Message-Id: <1494933979-5139-6-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 6/9] gstreamer1.0-libav: upgrade to version 1.12.0
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
X-List-Received-Date: Tue, 16 May 2017 11:26:27 -0000

* Updated version numbers in patches from 0.10.x to 1.12.0

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch         | 6 +++---
 .../{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.0.bb}  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.0.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
index 7a0b448..3a7f79d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
@@ -13,10 +13,10 @@ failed to merge target specific data of file
 -Khem
 Upstream-Status: Inappropriate [OE-Specific]
 
-Index: gst-libav-1.10.1/gst-libs/ext/libav/configure
+Index: gst-libav-1.12.0/gst-libs/ext/libav/configure
 ===================================================================
---- gst-libav-1.10.1.orig/gst-libs/ext/libav/configure
-+++ gst-libav-1.10.1/gst-libs/ext/libav/configure
+--- gst-libav-1.12.0.orig/gst-libs/ext/libav/configure
++++ gst-libav-1.12.0/gst-libs/ext/libav/configure
 @@ -5269,12 +5269,9 @@ elif enabled mips; then
  
      # Enable minimum ISA based on selected options
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.0.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.0.bb
index e4bb477..dd8a3ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            "
-SRC_URI[md5sum] = "e2bdd9fde6ca3ff7efffb93df121f4fd"
-SRC_URI[sha256sum] = "6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b"
+SRC_URI[md5sum] = "f9c4593947f8484b237c5d9782939ec3"
+SRC_URI[sha256sum] = "39d1477f642ee980b008e78d716b16801eec9a6e5958c5a6cdc0cb04ab0750c4"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.7.4


