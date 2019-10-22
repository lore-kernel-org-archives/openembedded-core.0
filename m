Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 408 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Oct 2019 15:06:26 UTC
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 23CA57F72C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 99500A01CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756379; bh=3WBDPpuMR1NBlDW
	ffDc8ClfH0NbO2wJ1+TC2gmxPln4=; b=jHdbZrVvOb2/56/nf4dTg9QFO7TGsvU
	zBNlMXNrQkuOgKaHakQ8Y7wfRoo9MNx8h8zLVlHKtytbkpkwOsqlAqI6av+YtTYI
	7pC85s2aj3fzyky4VsqfI0g+eH/jLFXdnnKQE0q4qdvu/DweyO8jH2AQIyM5f+m/
	jHcagXF3ghqKMDPDTYkZSWfpu6c1KXTCE0XOEwRkGgueNt1DTFHOTp2QQZWVGTKs
	FQT/szqUAF9laTYTvst1KuTbWKD4DeK2r7DFUULFBE4OkX5tFfIHLH9F9VLkBjIp
	5r5h4aVwGX+Z6o+MQ6ujsh60jEXssaEO0WE/HTXndFEtDWgNYKpIT9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=bP2ZHmp8YpBgFIfl2LG+64Id3ELspuZsJ6tXoTkQeck=;
	b=Is+KYLrAGlHbJB+PzjTuQVRIDIXUNiD15sqr/mOXLEOI9XhCklzMPCOs8rX1gnqWDpagMk
	GRrZdq7ih3dUvFvKwDuxtqFkE6J+HHryb+iGv2NFz0FstUzIswmI6dWv6GPTMU55nNnKuZ
	NCnhPNZGIUMmyyKknSYhhSdGLavfgZdbatqQk3v/YKkg+MO4Cb6WFePy1vIwJlAH+ZQIVa
	cZ8wAvFcs16JoiZVD+QYi2CgTt5zfClLWfFbdcTbi15EdNVR5pl6V5XJWN7YV/aXtznVeN
	PXuf6zMYJkr3szd6yWc3P+o1Y0o9aUhnwKwcebfOjIaQkBKYTeJ/04arcsPFrQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id r5xieBC4Nv-v
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:21 +0200
Message-Id: <20191022145927.1241-6-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 06/12] gstreamer1.0-libav: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:26 -0000

Removed gtkdoc-no-tree.patch since its changes are now included in 1.16.1

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer1.0-libav/gtkdoc-no-tree.patch   | 35 -------------------
 ...1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
deleted file mode 100644
index a36fdc9a14..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 6f720cebe632d7dc187c6907857d67ce1f7313d6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 9 Sep 2019 22:48:49 +0100
-Subject: [PATCH] docs: don't include the type hierarchy
-
-gtk-doc can't generate a type hierarchy when scanning gst-libav, and gtk-doc
-1.30 onwards doesn't write a file if there is no type hierarchy (unlike previous
-releases, which wrote an empty file).  This results in the build failing with
-gtk-doc 1.30 onwards, so remove the type hierarchy section from the
-documentation as it doesn't serve any purpose.
-
-Fixes https://gitlab.freedesktop.org/gstreamer/gst-libav/issues/57
----
- docs/plugins/gst-libav-plugins-docs.sgml | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/docs/plugins/gst-libav-plugins-docs.sgml b/docs/plugins/gst-libav-plugins-docs.sgml
-index 75c68f4..f68d554 100644
---- a/docs/plugins/gst-libav-plugins-docs.sgml
-+++ b/docs/plugins/gst-libav-plugins-docs.sgml
-@@ -32,9 +32,4 @@
-     <title>gst-libav Plugins</title>
-     <xi:include href="xml/plugin-libav.xml" />
-   </chapter>
--
--  <chapter>
--    <title>Object Hierarchy</title>
--    <xi:include href="xml/tree_index.sgml" />
--  </chapter>
- </book>
--- 
-2.22.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d2629b506d..d3918cfcb8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -18,10 +18,9 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
-           file://gtkdoc-no-tree.patch \
            "
-SRC_URI[md5sum] = "e3a201a45985ddc1327cd496046ca818"
-SRC_URI[sha256sum] = "dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a"
+SRC_URI[md5sum] = "58023f4c71bbd711061e350fcd76c09d"
+SRC_URI[sha256sum] = "e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916548e9d4381ca61c4"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.1


