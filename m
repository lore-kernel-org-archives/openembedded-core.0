Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E1AEA6D915
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:00:22 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so8024317wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 03:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uHOFOTArET70Nw3C26v9+ZN4tEVNNZd1bX04+7+1SCk=;
	b=dbImDIJQn4FAQvaA3128Th2PH/93XwNmI7Joz5OZiWKla4uVD7Fa53XVfjQ2llo68w
	vX8QeQAPKy6fxXqic1WoIMNAmZjcVRzZ4gJlezFzO99UwKC1SqezGAy/UqbhRa05lSmN
	zNLkkm9v+5jkDiGTNVfOxmcx77x/OgYWVUXujtphEBPgb7BQJh9TPaKtPG0FBAsvhnhq
	JpUX6rG1TNxh5c2+hoMNoVainkLruOSaQRPsm2HM0OpQVJ0HQl1jVLoEDUsmw6/NWURe
	JxP5z6fXaIcTci2gbWIfb84xlhIhSaiDXccMNQJ9fQmN89J3KFtCnoM/p70GON9RYkaV
	x4Gw==
X-Gm-Message-State: ALoCoQlgC2svDzoHDZdl16zGlwx6f1h5TJdc6ANxPX8x3k0VsZ44evlBZhgMrv03ruARGEKfwMW4
X-Received: by 10.180.73.70 with SMTP id j6mr6605707wiv.47.1386154822063;
	Wed, 04 Dec 2013 03:00:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu1sm5836207wib.8.2013.12.04.03.00.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 03:00:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 11:00:15 +0000
Message-Id: <1386154815-18982-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386154815-18982-1-git-send-email-ross.burton@intel.com>
References: <1386154815-18982-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-bad: add PACKAGECONFIG for librsvg
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
X-List-Received-Date: Wed, 04 Dec 2013 11:00:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 718c6ff..08440a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -17,7 +17,6 @@ PACKAGECONFIG ??= " \
     orc curl uvch264 neon \
     hls sbc dash bz2 smoothstreaming \
     "
-# rsvg plugin requires librsvg >= 2.36
 # dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
@@ -43,7 +42,7 @@ PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluid
 PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
 PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
-
+PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 
 # these plugins have not been ported to 1.0 (yet):
 #   directdraw vcd apexsink cdaudio dc1394 lv2 linsys musepack mythtv
@@ -92,7 +91,6 @@ EXTRA_OECONF += " \
     --disable-pvr \
     --disable-quicktime \
     --disable-resindvd \
-    --disable-rsvg \
     --disable-rtmp \
     --disable-sdl \
     --disable-sdltest \
-- 
1.7.10.4


