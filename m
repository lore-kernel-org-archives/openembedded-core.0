Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D4F486AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:57 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c201so33858607wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0VEQlmp/WYX4F0iSKmUtM5N6DFKjK/UvrgFBE5QUdA0=;
	b=lRfRjsbBwEldgkKrMFTzroQMY0gVEf1qn9xrqLoOx27uJCX2hEXR9X/781WXNRCKRv
	y85H+UyqJBpw8KoGrgMa7RBton8nWT0f+LKTIuTmScN7BJO0k5aSG5NePgtpfgdvd2dZ
	sdnn4TbVyNGUUBZBMEouHyAiFmNtXyS5FAhtrGIT7w/PFUY+Lrzmowu7VuBYwNN6PPof
	fiUa7l0E7Ld8Av3rk/x2thvVQ5T33V0Gl0i/A9uzZ01vEHvUILCpkWO6ip8aOZ/2Qql1
	/T8JeJjLiMmTPLyFeEZaGxxHMfsc0CXucFaijG9jLW89rjiMQYlvAP875lwrJS4JL1w9
	d2dg==
X-Received: by 10.28.100.69 with SMTP id y66mr42432283wmb.98.1449755218083;
	Thu, 10 Dec 2015 05:46:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n127sm915936wmf.12.2015.12.10.05.46.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:26 +0100
Message-Id: <1449755316-17611-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/11] gstreamer1.0-plugins-{base, good}: update PACKAGECONFIGs
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:58 -0000

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


