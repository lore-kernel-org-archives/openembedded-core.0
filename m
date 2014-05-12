Return-Path: <drew@moseleynet.net>
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CEB62606E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:33:49 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WjtAk-00025D-Tc from drew@moseleynet.net 
	for openembedded-core@lists.openembedded.org;
	Mon, 12 May 2014 09:33:50 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 12 May 2014 09:33:50 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 12 May 2014 09:33:50 -0700
From: Drew Moseley <drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 12:34:10 -0400
Message-Id: <1399912450-27861-1-git-send-email-drew@moseleynet.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
X-OriginalArrivalTime: 12 May 2014 16:33:50.0613 (UTC)
	FILETIME=[F4AD7450:01CF6DFF]
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
X-List-Received-Date: Mon, 12 May 2014 16:33:52 -0000

From: Drew Moseley <drew_moseley@mentor.com>

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index d6e6fbc..7cda19e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
 PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut,--without-glut,"
+PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
 PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
 PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-- 
1.7.9.5


