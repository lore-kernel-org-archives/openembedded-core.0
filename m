Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6527E258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id A30D3502C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234525; bh=Nc/96m8Who5U58P
	zyOCIqgyTOVrox3J0xucZ27GkI1k=; b=la6xGB2kATHZw8I3jrCmgQcNr6A28+O
	wR0Dl1HCStANEaOWSy/fxJuMB9FctGSXtdJNPpjvs6rN7hbLNJXUiYTJzqUZyyMv
	SOGhWwRN3fbLsOgzQwjX4XhnvL4WA6K2jtCbyNbgL1mLJuI6tpYwyCgpzGn0ayzY
	pVtAikm9aUK3VYPz4VjX5n2qZmUL1haNLgqeQA1/zbAwei4nhrDaoh1Ep8mXUQTM
	EFQ8KKp1DM11ckA+o/rwCJwsdq3vV2mD/sKD0DPyh9vA8YBhKAc9IphF91hYOGpG
	WO9m8TWHK+FIAtWT8PjQhA8JJJXtI/w/FJ91EsObKqrBeCbLeID8TGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234530; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=TjLFZglE2NqPisJEjOH3Db7NJKqne2T8JRlXkMXTT7w=;
	b=kjI2CDU/qzaxyhQwuBGruI/vTFVUKjlFuFcGaf936HHPP5jzB+BsJEIFfRH7KH5hrxsJxn
	wAgmEsY9KM/XMIh/x4NS0BgvJv3m7Y+M14hUr6jA5scP7vBUS0ZEI5C2J/yLBCR01jSJZL
	NyYBQ11JpaHYol3ABsS8NLGwq06VOjzaCqQMme6OCxILENUYPXrhuDqsmAC7agnMLv/1aJ
	oK+EMJekqTMsPiFEqgTG7lmvkv+ryzb5fMl9ZOpO1smFUpejAx2yHoM7ylWbCbwZxiSGKe
	DChNdT73rocfrqsA4mV8+LvyQWa2jIXeGJI59huP4OLx1dHFo/zGLb8iYCyuxw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
	[80.241.56.115]) (amavisd-new, port 10030) with ESMTP id h-Qz1_6j6v2G
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:05 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:41 +0200
Message-Id: <20190530164150.27038-2-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 02/11] gstreamer1.0-plugins-base: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:10 -0000

* 0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
  Removed since the https://bugzilla.gnome.org/show_bug.cgi?id=726571
  fix is included in 1.16.0

* 0005-viv-fb-Make-sure-config.h-is-included.patch
  Added to prevent build errors due to missing config.h #include

* 0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
* 0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
  Removed since these are included in 1.16.0

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...t-hardcode-libtool-name-when-running.patch | 167 ------------------
 ...ix-calls-to-pkg-config-with-PKG_CONF.patch |  35 ++--
 ...ect-reference-to-gstreamer-sdp-in-Ma.patch |   4 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  32 ++++
 ...009-glimagesink-Downrank-to-marginal.patch |   2 +-
 ...r-explicitely-enabling-disabling-GBM.patch |  70 --------
 ...for-explicitely-enabling-disabling-P.patch | 109 ------------
 .../link-with-libvchostif.patch               |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.16.0.bb} |  11 +-
 9 files changed, 54 insertions(+), 378 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.14.4.bb => gstreamer1.0-plugins-base_1.16.0.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
deleted file mode 100644
index bcada34c40..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 7022b87353a37b78bae7cf0106a4e47913bb5c97 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 5 Apr 2018 10:15:08 +0800
-Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
- introspection tools
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- gst-libs/gst/allocators/Makefile.am | 2 +-
- gst-libs/gst/app/Makefile.am        | 2 +-
- gst-libs/gst/audio/Makefile.am      | 2 +-
- gst-libs/gst/gl/Makefile.am         | 2 +-
- gst-libs/gst/pbutils/Makefile.am    | 2 +-
- gst-libs/gst/riff/Makefile.am       | 2 +-
- gst-libs/gst/rtp/Makefile.am        | 2 +-
- gst-libs/gst/rtsp/Makefile.am       | 2 +-
- gst-libs/gst/sdp/Makefile.am        | 2 +-
- gst-libs/gst/tag/Makefile.am        | 2 +-
- gst-libs/gst/video/Makefile.am      | 2 +-
- 11 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
-index 1957d28..1ecc950 100644
---- a/gst-libs/gst/allocators/Makefile.am
-+++ b/gst-libs/gst/allocators/Makefile.am
-@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
- 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstallocators-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-allocators-@GST_API_VERSION@ \
- 		--output $@ \
-diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
-index 52f6ad3..5bfd606 100644
---- a/gst-libs/gst/app/Makefile.am
-+++ b/gst-libs/gst/app/Makefile.am
-@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
- 		--library=libgstapp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-app-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
-index 2922245..7fb65f2 100644
---- a/gst-libs/gst/audio/Makefile.am
-+++ b/gst-libs/gst/audio/Makefile.am
-@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
- 		--include=GstTag-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-audio-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index 4e77e8c..3276d7f 100644
---- a/gst-libs/gst/gl/Makefile.am
-+++ b/gst-libs/gst/gl/Makefile.am
-@@ -193,7 +193,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
- 		--include=GstVideo-@GST_API_VERSION@ \
--		--libtool="${LIBTOOL}" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg gstreamer-video-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
-index ae51993..35a6e44 100644
---- a/gst-libs/gst/pbutils/Makefile.am
-+++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
- 		--include=GstTag-@GST_API_VERSION@ \
- 		--include=GstVideo-@GST_API_VERSION@ \
- 		--include=GstAudio-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-tag-@GST_API_VERSION@ \
- 		--pkg gstreamer-video-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
-index fb53f06..e66ef4f 100644
---- a/gst-libs/gst/riff/Makefile.am
-+++ b/gst-libs/gst/riff/Makefile.am
-@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--include=GstAudio-@GST_API_VERSION@ \
- #		--include=GstTag-@GST_API_VERSION@ \
- #		--include=Gst-@GST_API_VERSION@ \
--#		--libtool="$(top_builddir)/libtool" \
-+#		--libtool="$(LIBTOOL)" \
- #		--pkg gstreamer-@GST_API_VERSION@ \
- #		--pkg gstreamer-tag-@GST_API_VERSION@ \
- #		--pkg gstreamer-audio-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
-index a6f971d..77ebeeb 100644
---- a/gst-libs/gst/rtp/Makefile.am
-+++ b/gst-libs/gst/rtp/Makefile.am
-@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
- 		--library=libgstrtp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-rtp-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
-index ceb07f4..db9d0fd 100644
---- a/gst-libs/gst/rtsp/Makefile.am
-+++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
- 		--include=Gio-2.0 \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstSdp-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gio-2.0 \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-sdp-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
-index e197e9b..6e05cc7 100644
---- a/gst-libs/gst/sdp/Makefile.am
-+++ b/gst-libs/gst/sdp/Makefile.am
-@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
- 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstsdp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-sdp-@GST_API_VERSION@ \
- 		--output $@ \
-diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
-index 0247c33..c86515b 100644
---- a/gst-libs/gst/tag/Makefile.am
-+++ b/gst-libs/gst/tag/Makefile.am
-@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
- 		--library=libgsttag-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-tag-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
-index 9fc1ccf..0f8455f 100644
---- a/gst-libs/gst/video/Makefile.am
-+++ b/gst-libs/gst/video/Makefile.am
-@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
- 		--library=libgstvideo-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-video-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
index 2e1190ba01..08cbfb7c2a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -34,7 +34,7 @@ index 1ecc950..d6417ac 100644
 +		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
  		--library=libgstallocators-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
+ 		--libtool="${LIBTOOL}" \
 @@ -63,7 +63,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
@@ -63,7 +63,7 @@ diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
 index 7fb65f2..5379f79 100644
 --- a/gst-libs/gst/audio/Makefile.am
 +++ b/gst-libs/gst/audio/Makefile.am
-@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+@@ -176,12 +176,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
  		--c-include "gst/audio/audio.h" \
@@ -80,7 +80,7 @@ index 7fb65f2..5379f79 100644
  		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -208,8 +208,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -210,8 +210,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
@@ -95,7 +95,7 @@ diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
 index 3276d7f..0cdfe26 100644
 --- a/gst-libs/gst/gl/Makefile.am
 +++ b/gst-libs/gst/gl/Makefile.am
-@@ -186,9 +186,9 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+@@ -209,9 +209,9 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		$(GST_PLUGINS_BASE_CFLAGS) \
  		$(GL_CFLAGS) \
  		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
@@ -107,7 +107,7 @@ index 3276d7f..0cdfe26 100644
  		--library=libgstgl-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -218,8 +218,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -241,8 +241,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir="$(top_builddir)/gst-libs/gst/video/" \
@@ -117,7 +117,7 @@ index 3276d7f..0cdfe26 100644
 +		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
 diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
 index 35a6e44..49d6894 100644
 --- a/gst-libs/gst/pbutils/Makefile.am
@@ -182,7 +182,7 @@ diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
 index 77ebeeb..9aee788 100644
 --- a/gst-libs/gst/rtp/Makefile.am
 +++ b/gst-libs/gst/rtp/Makefile.am
-@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+@@ -66,8 +66,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
  		--c-include "gst/rtp/rtp.h" \
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
@@ -193,7 +193,7 @@ index 77ebeeb..9aee788 100644
  		--library=libgstrtp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -92,8 +92,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -94,8 +94,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -208,24 +208,17 @@ diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
 index db9d0fd..79027cb 100644
 --- a/gst-libs/gst/rtsp/Makefile.am
 +++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+@@ -71,8 +71,8 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
  		--add-include-path=$(builddir)/../sdp \
 -		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
 +		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
  		--library=libgstrtsp-@GST_API_VERSION@.la \
  		--include=Gio-2.0 \
  		--include=Gst-@GST_API_VERSION@ \
-@@ -101,7 +101,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
- 		--includedir=$(builddir)/../sdp \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
 diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
 index 6e05cc7..c7cf514 100644
 --- a/gst-libs/gst/sdp/Makefile.am
@@ -238,7 +231,7 @@ index 6e05cc7..c7cf514 100644
 +		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
  		--library=libgstsdp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="$(LIBTOOL)" \
+ 		--libtool="${LIBTOOL}" \
 @@ -55,7 +55,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
@@ -278,7 +271,7 @@ diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
 index 0f8455f..8c9955c 100644
 --- a/gst-libs/gst/video/Makefile.am
 +++ b/gst-libs/gst/video/Makefile.am
-@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+@@ -124,8 +124,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
  		--c-include "gst/video/video.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -289,7 +282,7 @@ index 0f8455f..8c9955c 100644
  		--library=libgstvideo-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -147,8 +147,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -152,8 +152,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
index aaeb611fec..97a0d68cfb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -15,10 +15,10 @@ diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
 index 79027cb..2987e23 100644
 --- a/gst-libs/gst/rtsp/Makefile.am
 +++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
- 		--libtool="$(LIBTOOL)" \
+@@ -82,7 +82,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
  		--pkg gio-2.0 \
  		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
 -		--pkg gstreamer-sdp-@GST_API_VERSION@ \
  		--pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
  		--add-init-section="$(INTROSPECTION_INIT)" \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch
new file mode 100644
index 0000000000..6e53d2e8b5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch
@@ -0,0 +1,32 @@
+From bec38a0c2e2958927c42b2f9ae939969b7c4a326 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Tue, 21 May 2019 14:01:11 +0200
+Subject: [PATCH] viv-fb: Make sure config.h is included
+
+This prevents build errors due to missing GST_API_* symbols
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ gst-libs/gst/gl/gl-prelude.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
+index 05e1f6229..96ce5e685 100644
+--- a/gst-libs/gst/gl/gl-prelude.h
++++ b/gst-libs/gst/gl/gl-prelude.h
+@@ -22,6 +22,10 @@
+ #ifndef __GST_GL_PRELUDE_H__
+ #define __GST_GL_PRELUDE_H__
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
+ #include <gst/gst.h>
+ 
+ #ifdef BUILDING_GST_GL
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
index c81fb0f6aa..e8094f459e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
@@ -18,7 +18,7 @@ diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
 index a4b2540..0ccaacd 100644
 --- a/ext/gl/gstopengl.c
 +++ b/ext/gl/gstopengl.c
-@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
+@@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)
  #endif
  
    if (!gst_element_register (plugin, "glimagesink",
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
deleted file mode 100644
index 45ba50750d..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a1b59ca6b1781442f37ffc1b697635db126b3a22 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Thu, 19 Jul 2018 10:30:54 +0200
-Subject: [PATCH] gl: Add switch for explicitely enabling/disabling GBM support
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=796833]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- m4/gst-gl.m4 | 30 ++++++++++++++++++++++++++++--
- 1 file changed, 28 insertions(+), 2 deletions(-)
-
-diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
-index 1e9724094..aca5295cc 100644
---- a/m4/gst-gl.m4
-+++ b/m4/gst-gl.m4
-@@ -117,6 +117,15 @@ AC_ARG_ENABLE([dispmanx],
-        *) AC_MSG_ERROR([bad value ${enableval} for --enable-dispmanx]) ;;
-      esac],[NEED_DISPMANX=auto])
- 
-+AC_ARG_ENABLE([gbm],
-+     [  --enable-gbm        Enable Mesa3D GBM support (requires EGL) @<:@default=auto@:>@],
-+     [case "${enableval}" in
-+       yes)  NEED_GBM=yes ;;
-+       no)   NEED_GBM=no ;;
-+       auto) NEED_GBM=auto ;;
-+       *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
-+     esac],[NEED_GBM=auto])
-+
- AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
- save_CPPFLAGS="$CPPFLAGS"
- save_LIBS="$LIBS"
-@@ -172,15 +181,32 @@ case $host in
-         AC_CHECK_LIB([EGL], [fbGetDisplay], [HAVE_VIV_FB_EGL=yes])
-     fi
- 
--    if test "x$HAVE_EGL" = "xyes"; then
-+    if test "x$NEED_GBM" != "xno"; then
-+      if test "x$HAVE_EGL" = "xyes"; then
-         PKG_CHECK_MODULES(DRM, libdrm >= 2.4.55, HAVE_DRM=yes, HAVE_DRM=no)
-         AC_SUBST(DRM_CFLAGS)
-         AC_SUBST(DRM_LIBS)
-+        if test "x$NEED_GBM" = "xyes"; then
-+          if test "x$HAVE_DRM" = "xno"; then
-+            AC_MSG_ERROR([GBM support requested but libdrm is not available])
-+          fi
-+          if test "x$HAVE_GUDEV" = "xno"; then
-+            AC_MSG_ERROR([GBM support requested but gudev is not available])
-+          fi
-+        fi
-         if test "x$HAVE_DRM" = "xyes" -a "x$HAVE_GUDEV" = "xyes"; then
-           PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=yes, HAVE_GBM_EGL=no)
-+          if test "x$HAVE_GBM_EGL" = "xno" -a "x$NEED_GBM" = "xyes"; then
-+            AC_MSG_ERROR([GBM support requested but gbm library is not available])
-+          fi
-           AC_SUBST(GBM_CFLAGS)
-           AC_SUBST(GBM_LIBS)
--       fi
-+        fi
-+      elif test "x$NEED_GBM" = "xyes"; then
-+        AC_MSG_ERROR([GBM support requested but EGL is not available])
-+      else
-+        AC_MSG_NOTICE([GBM support requested but EGL is not available; not enabling GBM support])
-+      fi
-     fi
- 
-     dnl FIXME: Mali EGL depends on GLESv1 or GLESv2
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
deleted file mode 100644
index 65d191a396..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 092aadfc1df69c46d920b0cd39f98d363d6988b3 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Thu, 19 Jul 2018 11:16:05 +0200
-Subject: [PATCH] gl: Add switches for explicitely enabling/disabling PNG and
- JPEG support
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=796833]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- m4/gst-gl.m4 | 66 ++++++++++++++++++++++++++++++++++++----------------
- 1 file changed, 46 insertions(+), 20 deletions(-)
-
-diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
-index 20b2233de..f8809981c 100644
---- a/m4/gst-gl.m4
-+++ b/m4/gst-gl.m4
-@@ -126,6 +126,24 @@ AC_ARG_ENABLE([gbm],
-        *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
-      esac],[NEED_GBM=auto])
- 
-+AC_ARG_ENABLE([png],
-+     [  --enable-png        Enable libpng support @<:@default=auto@:>@],
-+     [case "${enableval}" in
-+       yes)  NEED_PNG=yes ;;
-+       no)   NEED_PNG=no ;;
-+       auto) NEED_PNG=auto ;;
-+       *) AC_MSG_ERROR([bad value ${enableval} for --enable-png]) ;;
-+     esac],[NEED_PNG=auto])
-+
-+AC_ARG_ENABLE([jpeg],
-+     [  --enable-jpeg        Enable libjpeg support @<:@default=auto@:>@],
-+     [case "${enableval}" in
-+       yes)  NEED_JPEG=yes ;;
-+       no)   NEED_JPEG=no ;;
-+       auto) NEED_JPEG=auto ;;
-+       *) AC_MSG_ERROR([bad value ${enableval} for --enable-jpeg]) ;;
-+     esac],[NEED_JPEG=auto])
-+
- AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
- save_CPPFLAGS="$CPPFLAGS"
- save_LIBS="$LIBS"
-@@ -1043,9 +1061,13 @@ dnl Needed by plugins that use g_module_*() API
- PKG_CHECK_MODULES(GMODULE_NO_EXPORT, gmodule-no-export-2.0)
- 
- dnl libpng is optional
--PKG_CHECK_MODULES(LIBPNG, libpng >= 1.0, HAVE_PNG=yes, HAVE_PNG=no)
--if test "x$HAVE_PNG" = "xyes"; then
--  AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
-+if test "x$NEED_PNG" != "xno"; then
-+  PKG_CHECK_MODULES(LIBPNG, libpng >= 1.0, HAVE_PNG=yes, HAVE_PNG=no)
-+  if test "x$HAVE_PNG" = "xyes"; then
-+    AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
-+  elif test "x$NEED_PNG" = "xyes"; then
-+    AC_MSG_ERROR([libpng support requested but libpng is not available])
-+  fi
- fi
- AC_SUBST(HAVE_PNG)
- AC_SUBST(LIBPNG_LIBS)
-@@ -1053,25 +1075,29 @@ AC_SUBST(LIBPNG_CFLAGS)
- 
- dnl libjpeg is optional
- AC_ARG_WITH(jpeg-mmx, [  --with-jpeg-mmx, path to MMX'ified JPEG library])
--OLD_LIBS="$LIBS"
--if test x$with_jpeg_mmx != x; then
--  LIBS="$LIBS -L$with_jpeg_mmx"
--fi
--AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
--JPEG_LIBS="$LIBS -ljpeg-mmx"
--LIBS="$OLD_LIBS"
--if test x$HAVE_JPEG != xyes; then
--  JPEG_LIBS="-ljpeg"
--  AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
--fi
-+if test "x$NEED_JPEG" != "xno"; then
-+  OLD_LIBS="$LIBS"
-+  if test x$with_jpeg_mmx != x; then
-+    LIBS="$LIBS -L$with_jpeg_mmx"
-+  fi
-+  AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
-+  JPEG_LIBS="$LIBS -ljpeg-mmx"
-+  LIBS="$OLD_LIBS"
-+  if test x$HAVE_JPEG != xyes; then
-+    JPEG_LIBS="-ljpeg"
-+    AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
-+  fi
- 
--if test x$HAVE_JPEG = xyes; then
--  AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
--else
--  JPEG_LIBS=
-+  if test x$HAVE_JPEG = xyes; then
-+    AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
-+  elif test "x$NEED_JPEG" = "xyes"; then
-+    AC_MSG_ERROR([libjpeg support requested but libjpeg is not available])
-+  else
-+    JPEG_LIBS=
-+  fi
-+  AC_SUBST(JPEG_LIBS)
-+  AC_SUBST(HAVE_JPEG)
- fi
--AC_SUBST(JPEG_LIBS)
--AC_SUBST(HAVE_JPEG)
- ])
- 
- dnl --------------------------------------------------------------------------
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
index d5a7f6bdc2..34f7c2284f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
@@ -31,7 +31,7 @@ diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
 index 1e97240..ab7774c 100644
 --- a/m4/gst-gl.m4
 +++ b/m4/gst-gl.m4
-@@ -231,7 +231,7 @@ case $host in
+@@ -275,7 +275,7 @@ case $host in
                              HAVE_EGL=yes
                              HAVE_GLES2=yes
                              HAVE_EGL_RPI=yes
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
index f3e6daf564..1d6f15e9c1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
@@ -1,8 +1,7 @@
 require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRC_URI = " \
@@ -11,18 +10,16 @@ SRC_URI = " \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://make-gio_unix_2_0-dependency-configurable.patch \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-            file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
             file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
             file://0003-riff-add-missing-include-directories-when-calling-in.patch \
             file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
+            file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-            file://0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch \
-            file://0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "4dbe20c1bf44191c2b8833234df5cb2a"
-SRC_URI[sha256sum] = "ca6139490e48863e7706d870ff4e8ac9f417b56f3b9e4b3ce490c13b09a77461"
+SRC_URI[md5sum] = "41dde92930710c75cdb49169c5cc6dfc"
+SRC_URI[sha256sum] = "4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.17.1


