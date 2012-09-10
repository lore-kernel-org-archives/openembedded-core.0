Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB7ry-0003Mf-RG
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:33:59 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 10:21:23 -0700
Received: by wibhn17 with SMTP id hn17so2045140wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 10:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=LCvqYw7tysUCaTmMtzFgmGJ/NSu+0Ap1YXFOzIcb8fM=;
	b=gHD8ZeF4oXES1W5o/z5SG4OUxlFOgMHht0h8arWUrh8UiC+abF/kMRYyQPvpi5SXNP
	om0ap8wPGsccvcrNlvMMGA3exatQqbhbTymJFb5/Qmn7f6vgY6SNm/kvV8eyKUtHsHJa
	EVWmyp4RXXeUE0piEsvP0es7nfYfH08djCYNg8+lDrqF1bsUi4cCL0LOww0/vVU3qdI/
	CQavppfNIRZFxmcnrWO/BXimpynmZ7vGxkbPZ1rBpG5oPcnORaj+ejT93lQ5AXqraM4w
	HYnw7A2mn7OYK8Fh2WATzA8q2iT4h36VzLWSatllSr3yEMvf9TAqZDPKEVUax38E9TOA
	Inbg==
Received: by 10.180.105.6 with SMTP id gi6mr18605014wib.4.1347297688431;
	Mon, 10 Sep 2012 10:21:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id r9sm26684729wia.2.2012.09.10.10.21.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 10:21:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 18:20:32 +0100
Message-Id: <1347297632-16529-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlhDOVHwphBgiGu+2c1CdgriWIfeADr7m6aTR6WYQChbJ/pZ+E+rFkp4ee4onGZ10jNBP3d
Subject: [PATCH 4/4] libx11: re-arrange recipies to make comparisons easier
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
X-List-Received-Date: Mon, 10 Sep 2012 17:33:59 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    9 +++------
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    3 ---
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    4 ++--
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 4440a80..5b1e367 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -3,10 +3,11 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
 PR = "r3"
 
+DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
+
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
             file://keysymdef_include.patch \
@@ -20,11 +21,7 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
-
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
 EXTRA_OECONF += "--disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index c39b859..697fe66 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -2,9 +2,6 @@ require libx11.inc
 
 DESCRIPTION += " Support for XCMS is disabled in this version."
 
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
 PR = "r2"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index e78d707..dca220b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -5,8 +5,6 @@ PR = "r2"
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11"
-
 DEPENDS += "util-macros xtrans libxdmcp libxau \
             bigreqsproto xproto xextproto xcmiscproto \
             xf86bigfontproto kbproto inputproto libxcb \
@@ -19,3 +17,5 @@ SRC_URI += " file://keysymdef_include.patch \
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
+
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11"
-- 
1.7.10



