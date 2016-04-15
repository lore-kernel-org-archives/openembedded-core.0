Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 405 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Apr 2016 09:58:45 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 44C16731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id BA76B38ACA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 11:52:00 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 11:51:47 +0200
Message-Id: <1460713909-5823-6-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
References: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 6/8] gstreamer1.0-plugins-ugly: upgrade to version 1.8.0
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
X-List-Received-Date: Fri, 15 Apr 2016 09:58:47 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 1 +
 ...er1.0-plugins-ugly_1.6.3.bb => gstreamer1.0-plugins-ugly_1.8.0.bb} | 4 ++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb    | 4 ----
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.6.3.bb => gstreamer1.0-plugins-ugly_1.8.0.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index aff2230..4582e5b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -20,6 +20,7 @@ PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
 PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[mpg123]   = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
 
 EXTRA_OECONF += " \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.0.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.0.bb
index 7edfb81..a4d2e3e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.0.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "dbd92afb3816cbfa90ab1f197144a2e2"
-SRC_URI[sha256sum] = "2fecf7b7c7882f8f62f1900048f4013f98c214fb3d3303d8d812245bb41fd064"
+SRC_URI[md5sum] = "d9daccca9dffdbcef4373cde81f9ae2c"
+SRC_URI[sha256sum] = "53657ffb7d49ddc4ae40e3f52e56165db4c06eb016891debe2b6c0e9f134eb8c"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 69afe4c..0c9bc23 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -20,10 +20,6 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
-# The mpg123 plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/commit/?id=43bd45ba991ef3247957ca37cdcb52f4b8c0acb1
-PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
-
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
2.5.0


