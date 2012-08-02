Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymM-0006J8-H3
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:42 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:03 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so5542447wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=jxti2qLIPWo+Qz8nJTV3o7vgy9MFGW4aIDfkG8Z1prY=;
	b=bkjEic283d/zps1kqa3ZqswXqUhMC/xi3WP8ue/qiNI/zE1BXqOErieFP8uChg9Qtw
	Br4AqU5tjyppQPesI/d4tRrBe2kaxQx8lnd0vDNfz8dFIZyWz/qNZUp6jVNi166uO6Xx
	SfhOwkxYLF1Kcg4lsYg1L72EYf9f4k37bPi2wTrXfz3dhwSM46KJ+yexr0zRgLCY6/fE
	QP82gjHNfQwMpXRRE4ZDZltxo8Bzzh0etSM6tmRpkN/XlbcNDvvU0ipM+2pOpVuWkSEq
	pdQ71bxT2cA0lng9+SrR6ckYn27XRCvFBQukIJAZOQ85DOwiMRyEmxt6pFXrLKq3Ks/r
	A+OA==
Received: by 10.180.105.130 with SMTP id gm2mr6200383wib.6.1343926203880;
	Thu, 02 Aug 2012 09:50:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.50.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:50:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:03 +0100
Message-Id: <15b93c424f133767ab36ee2cb77a45ffcf021090.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnBB2dN32gVvRcbl5yzaVd19K4AYLMGO1RqIB+sZI1yQyWNlfLUpyLutdlBoExjw8zPjXcx
Subject: [PATCH V3 09/11] mesa-demos: fix GLES2 build
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:42 -0000

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



