Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAihl-0005Ww-42
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:37:13 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wzdSM4Ooj/VG4e/3HNojFGy6kFIGsPILbi1XcXgKcpE=;
	b=Shj3FkSnYN4PcFXnTKhp+LMwHn1mJsdz7lodh5VJM3s7Tqv47IXtAN1MwJ4Vsxxu8Z
	gMCancAzn6zLwpVyt4AgPj3cYzNoLzEs36LJTIIv9DPfNmYDayij1dcj+ucwiNGH7of/
	T2FDhlXHkvBJ/npvltYakno8B3g6utbcez3n4=
Received: by 10.204.142.91 with SMTP id p27mr6222296bku.169.1317648703090;
	Mon, 03 Oct 2011 06:31:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm13241852bks.3.2011.10.03.06.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:51 +0200
Message-Id: <25e40079a0f4f49475d62fe92e3a59b9cdff1c3f.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 20/30] libx11: remove older 1.3.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 13:43:00 -0000

* libx11-1.3.4 directory is kept for libx11-trim_1.3.4.bb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   35 ------------------------
 1 files changed, 0 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
deleted file mode 100644
index ffec7d1..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require libx11.inc
-inherit gettext
-
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
-
-PE = "1"
-PR = "r4"
-
-SRC_URI += "file://x11_disable_makekeys.patch \
-            file://nodolt.patch \
-            file://include_fix.patch \
-	    file://makekeys_crosscompile.patch"
-
-SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
-SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
-
-DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native libxcb"
-
-DEPENDS_virtclass-native += "bigreqsproto-native xextproto-native \
-            xtrans-native libxau-native xcmiscproto-native \
-            libxdmcp-native xf86bigfontproto-native kbproto-native \
-            inputproto-native xproto-native"
-
-DEPENDS_virtclass-nativesdk += "bigreqsproto xproto xextproto \
-            xtrans libxau xcmiscproto libxdmcp xf86bigfontproto kbproto \
-            inputproto xproto-native"
-
-XCB = "--with-xcb"
-XCB_virtclass-native = "--without-xcb"
-XCB_virtclass-nativesdk = "--without-xcb"
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h ${XCB}"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.7



