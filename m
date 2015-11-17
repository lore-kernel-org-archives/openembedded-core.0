Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A65C46010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:03 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22309910wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sSYSCq44uUmfu/8t+is8w0LO+QU7WJpj5CSfwPBdSDs=;
	b=BLW3k8e5H8AT4FiBXO2m0KCAxOMi8uwFyH+EMtgFDprx4BS6BZAACP6CqwTGooWzrh
	maJYiZwA+CbQuX0qhnPE6xaxQ4AcNfAnEawwxpJuAzPIPtIWch9ylMwe5CjK0oDXHUsy
	udPF4P0Ibnbl8+f8kUZaHdxoJAzuaqlErSLGLs1rE81vkTs9WP74UEqaqeC4XqoDdcKl
	O9xWiHNfc9jCwHtkPQlJo9/TPGRres1qXzYGbjn0d7s97lh6GGgWNrgQzXzqa2oxDv4u
	LXQEh+GsPglZPgg4PNLPCzllBDyCnCf6npFQnFTlAFJoRd4JGlPAOQqTsyw5bdXQsbqj
	NSDQ==
X-Received: by 10.194.92.138 with SMTP id cm10mr43298675wjb.6.1447761483989;
	Tue, 17 Nov 2015 03:58:03 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bk2sm39601794wjc.3.2015.11.17.03.58.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:57 +0100
Message-Id: <6a54f7a749de45840ee4e94635a7da0303589bc8.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 05/16] gstreamer1.0-plugins-base: add PACKAGECONFIG for libvisual
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 2135ae1..e5bfc08 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -26,14 +26,13 @@ PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
 PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
 PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
+# libvisual do not seem to exist anywhere in OE
+PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
 PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
 
-
-# libvisual does not seem to exist anywhere in OE
 EXTRA_OECONF += " \
     --enable-zlib \
     --disable-freetypetest \
-    --disable-libvisual \
 "
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
-- 
2.6.3


