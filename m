Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 41AA07E4BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 19:13:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id CEDF04BD91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 21:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1559243580; bh=GFqHBDgNMLum1slqJOTG2uiWIv4CPsduP
	+qG2JU6hDw=; b=PVPtUmqJxZD6/ZCmUiGnF+KWc2gUXj2Pk5Juw9L/gZ+zypqfq
	AEjIewyytcyEkZb0Yqvx+AkBKTIRa0I4Eb3X9IdLPBjCoQgmCRiY68K5at/e9UOb
	K5f4oAhFiqVoV8D5WTN6/masM5cux8jxtKvAGDm0KPewrNZZzvKGd1HgErtdgFzF
	tTpKY1nhnAmDw6GBxOioogGV7898p3GqzfryTSJWvlidoRAN/rCv2V0TsJWAcuyi
	/n14onAn2wNhPM0ddOf+IROJ0fSMckMnLWu52kN4ckTo0kKwQK7dn2ZF8c8aYnCP
	eVR56Cn5vHvav6OJF5EIjsV1lkw+ILSZGOCGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559243587; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=kxJxtfEMJf2RzOGyVYwXENX7fr3hGbPZ3Fw7e4cXZd8=;
	b=uMKkdaZpuWXxRpGUQ2m6e/BGyUhTKH0ZWH5mi47sXi8NKDonZoCez7D2FFYh/fm68NBCGN
	2BvXxp/3I1V0CExN8be/MGOdL5gfvFWrIaecG9xcqrPXQnS12OxxCVCmpKlGmFeyfzxZQU
	PT3VMf432lQ4alGyrricGY8Gt9ou5MeZgmM5LuujYn1P2xeLxD8hdGFXyz+XrEQXK2Jshq
	KxTvBe9f0bUEhmtSNm7GqxbYCuROstbYFRsfw9FjS4BVCHRl5vcRKzEi906ivM9cU4/s2T
	bdWeX6Mp5DebRjvRpaXNfenoBH6cGeuL/9XNnVa8buHTrGHCcCn36KfN6nkTRA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id vYO_tLky3UvR
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 21:13:00 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 21:12:36 +0200
Message-Id: <20190530191236.12870-1-crg7475@mailbox.org>
Subject: [PATCH v3] gstreamer1.0-vaapi: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 19:13:07 -0000

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0001-vaapsink-downgrade-to-marginal.patch               | 4 ++--
 ...amer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
index c861f3bed2..7945a923c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
@@ -24,7 +24,7 @@ diff --git a/gst/vaapi/gstvaapi.c b/gst/vaapi/gstvaapi.c
 index 9a82454..4d94f2b 100644
 --- a/gst/vaapi/gstvaapi.c
 +++ b/gst/vaapi/gstvaapi.c
-@@ -210,7 +210,6 @@ plugin_init (GstPlugin * plugin)
+@@ -195,7 +195,6 @@ plugin_init (GstPlugin * plugin)
  {
    GstVaapiDisplay *display;
    GArray *decoders;
@@ -32,7 +32,7 @@ index 9a82454..4d94f2b 100644
  
    plugin_add_dependencies (plugin);
  
-@@ -235,10 +234,7 @@ plugin_init (GstPlugin * plugin)
+@@ -220,10 +219,7 @@ plugin_init (GstPlugin * plugin)
    gst_element_register (plugin, "vaapidecodebin",
        GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
index 3896434104..e5dfb61241 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
-SRC_URI[sha256sum] = "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
+SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
+SRC_URI[sha256sum] = "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= "drm \
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,udev libdrm"
 PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxrandr libxrender"
 
 FILES_${PN} += "${libdir}/gstreamer-*/*.so"
-- 
2.17.1


