Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQDeS-00023Q-QR
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 10:46:25 +0200
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 01:32:57 -0700
Received: by mail-wg0-f69.google.com with SMTP id 16so1762958wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 01:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=JLkx8joU5gsvRfsuyXqmbWXPS6cXsNrsWn853QlVOCg=;
	b=YVjr0hJek7qE6Vq27wbpme41jUErNGBNMxl7az1RVRWCFrVYXPhTw9sB3LODP4J//v
	IYQnXh0OpAkKRLbDVxilWsrw2ggpHmm+RV0JmDpKbnjYuRdJBwPvi+lfZ+65q4qq8gYa
	95tvPRaj6t7kPAUnpaLLGef5hvRPj4cKpDwzRWITxXwmjTNDsd2Sir2hWOgnqC8Bms+m
	ujjoOEmxuGkRTOeySm35b2vELw7vsjflK8ZcR5AV49YeeSw8aFYFxDor+uOkKBLBDlQY
	Z9Oci3BfFZ9+vVu9VCex83juJfQHHDXrugVn4Z8e7AP5+UZbnoUb5bMa85wjNjFQp0D1
	xk4g==
Received: by 10.180.99.36 with SMTP id en4mr4453237wib.8.1350894775734;
	Mon, 22 Oct 2012 01:32:55 -0700 (PDT)
Received: by 10.180.99.36 with SMTP id en4mr4453217wib.8.1350894775556;
	Mon, 22 Oct 2012 01:32:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p4sm20709412wix.0.2012.10.22.01.32.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 01:32:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 09:31:43 +0100
Message-Id: <1350894704-12289-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlK2ljvYeCx+D8oRbS3k+OQvRUPsyHd8/DhiBQ3h/BA4p6cTx1e8YQwqgnfVTp+naWxj8SP9UU+vlULgaiKFcjVUDf+XBa/FLLYFz/xQ+op9sn+gseGFsUCmPxKdgfQHCyfnsQ+APNrTYFf8e8RAfbsyTbDgPJNlZLI5XqfmzxadpEIWQQ7/GJeBG47Cbwild4aYLmo
Subject: [PATCH] xorg: remove XF86 BigFont extension
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 08:46:25 -0000

This has been disabled by default upstream since 2007, nothing uses it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc            |    9 ++++-----
 .../xorg-proto/xf86bigfontproto_1.2.0.bb             |   18 ------------------
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc  |    2 +-
 3 files changed, 5 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 97bd1c2..71e74f7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r9"
+INC_PR = "r10"
 
 PROVIDES = "virtual/libx11"
 
@@ -22,14 +22,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
 DEPENDS += "xproto-native"
 
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
 
-# Let people with incredibly archaic requirements enable Xcms and BigFont, but
-# disable them by default.
+# Let people with incredibly archaic requirements enable Xcms, but disable it by
+# default.
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
-PACKAGECONFIG[bigfont] = "--enable-xf86bigfont,--disable-xf86bigfont,xf86bigfontproto"
 
 # src/util/makekeys needs to be compiled natively, so tell it what compiler to
 # use.
diff --git a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb b/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
deleted file mode 100644
index 969fc91..0000000
--- a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFree86-BIGFONT: XFree86 Big Font extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XFree86 \
-Big Font extension.  This extension makes larger font requests \
-possible."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
-
-PR = "r1"
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "120e226ede5a4687b25dd357cc9b8efe"
-SRC_URI[sha256sum] = "ba9220e2c4475f5ed2ddaa7287426b30089e4d29bd58d35fad57ba5ea43e1648"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 772fa52..b45cb44 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -23,7 +23,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
-- 
1.7.10



