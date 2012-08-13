Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102p-0001X2-D7
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:19 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:27 -0700
Received: by mail-wi0-f172.google.com with SMTP id r5so2262744wic.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=jxti2qLIPWo+Qz8nJTV3o7vgy9MFGW4aIDfkG8Z1prY=;
	b=o+6Nc+Cb4619X+emMY7XXcVxPDfag9/pqTCJctEc1AnV9m5JpGnx/l+2LZNNT9TZMg
	ZGKIM5AfbxW5dJ8JQQKqlAH96FEHuI4GtHYrzaPxj5U1QZ/O6ItJNw057hWBZHa3lpez
	aX6Ms2pFceA9RWddB3SvDutDzRW/IBgs5Tvye2UiY8mkYoCaVcazDHQe3rHtnWDlybOq
	0187SfMS1r7lPd8cIC9Ox6hPgZBdMdiz4nReiSeU+94gf2avR6fxF5JZLdvE4q5n0E9p
	r987MKAmnVtDF2KoPbSqD026gmYKgtJDYrFXLXNan9fAE1TIYWesEEivp6pxfIjb8cd3
	jEaw==
Received: by 10.180.14.9 with SMTP id l9mr20661668wic.21.1344884366832;
	Mon, 13 Aug 2012 11:59:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:45 +0100
Message-Id: <59202b102c0c53d970e8ebde7b3235df56062d47.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkRyBEpbfpcm+FSA9ET6PdL40/7QotpssDp0oBOKigU/8DIk/2ksIVhwyh5Wu0l1EX3Xejx
Subject: [PATCH 6/8] mesa-demos: fix GLES2 build
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch |   15 +++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb         |    5 +++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch b/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
new file mode 100644
index 0000000..84a6fd6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
@@ -0,0 +1,15 @@
+Index: mesa-demos-8.0.1/src/egl/opengles2/es2_info.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/opengles2/es2_info.c	2010-07-07 18:57:15.000000000 +0100
++++ mesa-demos-8.0.1/src/egl/opengles2/es2_info.c	2012-08-01 13:14:59.000104115 +0100
+@@ -18,8 +18,8 @@
+ #include <X11/Xlib.h>
+ #include <X11/Xutil.h>
+ #include <X11/keysym.h>
+-#include <GLES/gl.h>
+-#include <GLES/glext.h>
++#include <GLES2/gl2.h>
++#include <GLES2/gl2ext.h>
+ #include <EGL/egl.h>
+ 
+ 
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
index bfc62c5..1d16bfc 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=9142
 
 DEPENDS = "virtual/libx11 virtual/libgl glew"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-	file://dso_linking_change_build_fix.patch"
+	file://dso_linking_change_build_fix.patch \
+	file://gles2-info.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.10



