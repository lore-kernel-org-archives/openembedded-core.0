Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB1077263
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:57:19 +0000 (UTC)
Received: by wmec201 with SMTP id c201so1855534wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0VEQlmp/WYX4F0iSKmUtM5N6DFKjK/UvrgFBE5QUdA0=;
	b=w3FNTCAI3ioMxUJgpFHMlVWBzD7S/hV7dJJiawAKLkxn5xEGZ+IZO3Tf0e4cWVXCUE
	5ROzusTVzZnmGyaJF/eixcZvQaRNXPKP7bXFmTwMD8r2WRwQbIGoGt+Vf+IU+Su666Yk
	mqTYBhtdTWSaK1uQC7c2dkShHY8ROlPTeMNzsxEdyndw+REpZqHZGehZYsJZylGRQq8l
	NanG0c6JSpFkz2COD2Ufxf+ct/GuZIsjzuBp7kX5eBTNJzBxRgmBfyHoqblC5gR2iT3k
	Cg7VMy4Iq0RhdWYZlU6TXcmYLf8iL7cMugYNOsDJHrpAJHEhVtOL+buuyUyzXYDZacHS
	7XHQ==
X-Received: by 10.194.201.202 with SMTP id kc10mr21197426wjc.84.1447358239506; 
	Thu, 12 Nov 2015 11:57:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t2sm240731wme.0.2015.11.12.11.57.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 11:57:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 20:57:31 +0100
Message-Id: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][master][jethro 1/4] gstreamer1.0-plugins-{base, good}: update PACKAGECONFIGs
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
X-List-Received-Date: Thu, 12 Nov 2015 19:57:22 -0000

* there are new libavc1394, libiec61883, libraw1394, cdparanoia recipes in meta-multimedia

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 7 +++----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 6 +-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 47f3f40..4909b10 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -25,13 +25,12 @@ PACKAGECONFIG[ogg]     = "--enable-ogg,--disable-ogg,libogg"
 PACKAGECONFIG[theora]  = "--enable-theora,--disable-theora,libtheora"
 PACKAGECONFIG[vorbis]  = "--enable-vorbis,--disable-vorbis,libvorbis"
 PACKAGECONFIG[pango]   = "--enable-pango,--disable-pango,pango"
+# libvisual do not seem to exist anywhere in OE
+PACKAGECONFIG[visual]  = "--enable-libvisual,--disable-libvisual,libvisual"
+PACKAGECONFIG[cdparanoia] = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
 
-
-# cdparanoia and libvisual do not seem to exist anywhere in OE
 EXTRA_OECONF += " \
     --disable-freetypetest \
-    --disable-cdparanoia \
-    --disable-libvisual \
 "
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 6e316de..0ce4b8f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -31,10 +31,7 @@ PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-
-# the 1394 plugins require both libraw1394 and libiec61883
-# the former is included in meta-oe, the latter isn't
-# -> disabled
+PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libraw1394 libiec61883 libavc1394"
 
 EXTRA_OECONF += " \
     --enable-oss \
@@ -51,7 +48,6 @@ EXTRA_OECONF += " \
     --disable-libdv \
     --disable-shout2 \
     --disable-examples \
-    --disable-dv1394 \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
-- 
2.6.3


