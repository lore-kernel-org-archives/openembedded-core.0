Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id F3D756D4FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 20:28:58 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id y10so9866845wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 12:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SPRzSQt1ZzP3jgVEaLFM/KRCc5w/WsrBH7D++ID+PII=;
	b=LF1HMc0pM68MdNuykpLoaf8G7iHaKl+afdEUzpH17uTJteKxsDkkkU/v7T0YIbRlhb
	D0UxAhFbPSlWahMUMLdXV7Xj2E49j2NJZ+x6pTBSdXdPUd3d9csOiY1e6a02Lrde3U8q
	mdfLn4q7ZbEXZcodFCj7XeSLFk8IGZRU1mXbxJUq/zwF1V9sJ76DVQogEUvyE/SZUr44
	7juO5RXRz/80vyYKuGySC8NFCZZgjX0IwOcp0pCh44oIXO1ZAA/FcZswu5bsiG+YsVEA
	kfBms3rFeXgI2EbMP/7a1Iq55T2vaLiMWshrJUCPSK1gXFN/CU0ZuDZpuQLXFYQn3zg1
	HHXg==
X-Gm-Message-State: ALoCoQmSSLdQk5ecFUrLn+7AWqrWJWCQTKIIwu7vXwnxy4GAPR415Gt4915gbhqLRrU/D0UxEOcW
X-Received: by 10.180.211.49 with SMTP id mz17mr2892099wic.54.1384979339650;
	Wed, 20 Nov 2013 12:28:59 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	c10sm19666066wie.11.2013.11.20.12.28.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 12:28:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 20:28:55 +0000
Message-Id: <1384979336-4622-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] librsvg: move gdk-pixbuf-native dependency
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
X-List-Received-Date: Wed, 20 Nov 2013 20:29:00 -0000

This dependency is only needed by the gdk-pixbuf loader PACKAGECONFIG, so move
it there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
index 143d1ef..de262f0 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
 
 SECTION = "x11/utils"
-DEPENDS = "gdk-pixbuf-native cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
+DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-introspection --disable-vala"
 
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
-PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
+PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
 # GTK+ test application (rsvg-view)
 PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
 
-- 
1.7.10.4


