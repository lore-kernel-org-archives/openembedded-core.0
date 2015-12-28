Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6369D60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7EqPj024178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:52 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:13 -0800
Message-ID: <9b21563448c2616792bfc411a8f2b9bb48e38a78.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/40] gstreamer1.0-plugins-{base, good}: update PACKAGECONFIGs
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:51 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

* there are new libavc1394, libiec61883, libraw1394, cdparanoia recipes in meta-multimedia

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    7 +++----
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    6 +-----
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
1.7.9.5


