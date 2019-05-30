Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 726EE7E413
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 5C9C6A1051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234526; bh=oBT1+WDizSdu4m0
	5Q06dx5F/J2XxlZIKSdH6O2aaivU=; b=odqBRVxylewCO4C5IeaRzPjtDMPFXuy
	UUnSNjHw9mLVVA2sqBAoxyATGRAf1J7rEV/ncQ+fMIaC83iy8/aClcZkiwDwsIwr
	WnlvoGDfLhnOd62lm1DlbxLdWs/9MHAF4V+odPOGqehdrID91yoRJk4MBeUz/5hE
	TrEBVGkqvjNHh52ulJ+sbIUMUkhIYALBW1tMMK8bNfSqlsXdxN3XBwgaAvOn+nh2
	1mTyKyriZ34TLECs4b+NjVzPJ7SjfEWWdSly3uv/mtuZtPuqkrLCi9t3syjgIgNo
	hiekVRiFHbjhBYzG4cgFL2sIeEsxStj+0v62ItGovXuyo2Iej7rG2tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234534; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=E83We3C2MsGSihs29922bdyeW8jWmh/mQ1z8VtdJuY4=;
	b=xmeV1/LEHjjluAHGLUmsJ46NoRj0q6sUfsq5VFGBPcfxCY/5mi7pl/OmaGglR2J4ffVh32
	lkrkkz6UmIBJd3/7rpJkl/qvjd22aoXdfN6Y9dPMsVRA/Co2+LPW5kfRUHNhx4mq3j7VTr
	+RJPWPN8CsqQyYh7EO2bueyAcUAPVtbjbnlgByOVy4+qg6+PAvQhveVXd0wuOTzGjrFNu9
	xdAZ6sWJulr9cZ5xv4KoNr35hdOYF0vAxEH+Lsn50YSLBMRFuM+vYBpcP5u7k9SGn21muR
	hOpnRazyq+jgACoSJ9a/o1/obM0l7P6+R6Exyg6fvr15PB0ogU6+wkFw2arttg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id hSlH2OBwhJKj
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:06 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:48 +0200
Message-Id: <20190530164150.27038-9-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 09/11] gstreamer1.0-rtsp-server: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:14 -0000

From: Philippe Normand <philn@igalia.com>

* 0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
  Removed since this was fixed in 1.16.0 similarly to the fixes to
  -base and -bad in https://bugzilla.gnome.org/show_bug.cgi?id=726571

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ibtool-name-when-using-introspection.patch | 27 -------------------
 ....bb => gstreamer1.0-rtsp-server_1.16.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.4.bb => gstreamer1.0-rtsp-server_1.16.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
deleted file mode 100644
index 89d6384adb..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4a12569e5ae5be63cd92a9b178860026a99746b1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 27 Oct 2015 16:55:45 +0200
-Subject: [PATCH] Don't hardcode libtool name when using introspection
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gst/rtsp-server/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/rtsp-server/Makefile.am b/gst/rtsp-server/Makefile.am
-index 4fcd366..c67f5ab 100644
---- a/gst/rtsp-server/Makefile.am
-+++ b/gst/rtsp-server/Makefile.am
-@@ -87,7 +87,7 @@ GstRtspServer-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtspserver-@
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstRtsp-@GST_API_VERSION@ \
- 		--include=GstNet-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-rtsp-@GST_API_VERSION@ \
- 		--pkg gstreamer-net-@GST_API_VERSION@ \
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
index 7efc1b3534..042938b88e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
@@ -9,13 +9,12 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 PNREAL = "gst-rtsp-server"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "ab0fb5c829266a500e14b46b7bdf06bf"
-SRC_URI[sha256sum] = "3d0ece2afdcd601c175ece24e32a30bc19247b454f4eafd3deeec2533c6884f1"
+SRC_URI[md5sum] = "adc4460239ec2eccf58ad9752ce53bfd"
+SRC_URI[sha256sum] = "198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.1


