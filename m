Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 180F46057B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:05 +0000 (UTC)
Received: by wmec201 with SMTP id c201so223560944wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fYR0uy6gn1gCnCWZXca5pqRfBu9yWic8jTih/0cN1is=;
	b=Ej1oUJeMEbFzsj2vNTJO+6kZlGAo3KafII2STBVRAurlK2cqnB4qqULQzlDj68dAzD
	FiORH21/GLde56S2kWUB7KJPhpDsaUwhQk1kkpTHTBzzsOLRMflKUoCQYpvOecjkNEor
	sdDAo0/0VTF9xqh5j0HIwK50Ge9evbV1M+o3gOaZLBCzlpMlZpR2249iU3ZemH0AOvrv
	+HUTfxmUwP/TOE1FUQJtQF1SP79aCUPJnjxDqa/blNugBX2KB7DgybSGBSfYU8ksjBdx
	YinZdtD40EXMm741X7yWoExWfORp8iDRDPv6sw+pOjzH9J5nX0b6Vb9leLXgMC2Nv1O2
	NBrw==
X-Received: by 10.28.52.12 with SMTP id b12mr2160960wma.16.1447761486336;
	Tue, 17 Nov 2015 03:58:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	an7sm4801254wjc.44.2015.11.17.03.58.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:59 +0100
Message-Id: <ec29713b1461de3b8dbcfaa19b8263ad959bcf7c.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 07/16] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:08 -0000

* WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libcap, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on zlib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 1119e10..eca00d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2\
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -20,7 +20,8 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
+PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,libv4l2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
@@ -30,13 +31,13 @@ PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
+PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
 
 EXTRA_OECONF += " \
     --enable-oss \
-    --enable-gst_v4l2 \
     --enable-zlib \
     --enable-bz2 \
-    --without-libv4l2 \
+    --enable-oss \
     --disable-directsound \
     --disable-waveform \
     --disable-oss4 \
-- 
2.6.3


