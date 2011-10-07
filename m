Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE09-0006Dj-Ia
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:25 +0200
Received: by gyg8 with SMTP id 8so3933033gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wzdSM4Ooj/VG4e/3HNojFGy6kFIGsPILbi1XcXgKcpE=;
	b=frkxvTVn2f/i2bdk8GQzqD7618uc8dCqGXScEa9Mnm/CbMfz1rZjK1jTSOrJVmU/re
	T/pWxyyfCVf7CLRfqkr/bi8U0kYU2id80zgjZDCoUQ4P5Vy110cl18mDlkkOpNyF+LLN
	WIWOBs0Rwh6GW1zHg5I9/SqFGixGkb+U73TQM=
Received: by 10.223.85.134 with SMTP id o6mr11919991fal.8.1318007324867;
	Fri, 07 Oct 2011 10:08:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm13625235fai.8.2011.10.07.10.08.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:19 +0200
Message-Id: <18cfb90ed6c47b913d7c250fa21af429c4178ed0.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 24/31] libx11: remove older 1.3.4
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
X-List-Received-Date: Fri, 07 Oct 2011 17:14:25 -0000

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



