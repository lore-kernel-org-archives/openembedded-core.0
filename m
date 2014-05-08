Return-Path: <drew@moseleynet.net>
X-Greylist: delayed 894 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 20:32:38 UTC
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB9C605B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 20:32:38 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WiUlE-0007FU-W2 from drew@moseleynet.net 
	for openembedded-core@lists.openembedded.org;
	Thu, 08 May 2014 13:17:45 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 8 May 2014 13:17:44 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 May 2014 13:17:44 -0700
From: Drew Moseley <drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 16:17:41 -0400
Message-Id: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 08 May 2014 20:17:44.0741 (UTC)
	FILETIME=[9263B550:01CF6AFA]
Subject: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Thu, 08 May 2014 20:32:39 -0000

From: Drew Moseley <drew_moseley@mentor.com>

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-demos/glut.patch |    2 +-
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/glut.patch b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
index 84b6d4f..2ca5a93 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/glut.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
@@ -27,7 +27,7 @@ Index: mesa-demos-8.0.1/configure.ac
 -		[glutInit],
 -		[],
 -		[glut_enabled=no])
-+	 GLUT_LIBS="-L$withval/lib -lglut"],
++	 GLUT_LIBS="-L$withval -lglut"],
 +	[GLUT_CFLAGS=""
 +	 GLUT_LIBS="-lglut"]
 +        )
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index d6e6fbc..211df3b 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
 PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut,--without-glut,"
+PACKAGECONFIG[glut] = "--with-glut=${STAGING_LIBDIR},--without-glut,"
 PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
 PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-- 
1.7.9.5


