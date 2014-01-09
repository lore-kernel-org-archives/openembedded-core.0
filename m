Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1F982610CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 13:53:29 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1W1G38-00038p-2B from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jan 2014 05:53:30 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 9 Jan 2014 05:53:29 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2014 18:52:53 +0500
Message-Id: <1389275573-45886-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 09 Jan 2014 13:53:29.0922 (UTC)
	FILETIME=[2D7D4220:01CF0D42]
Subject: [PATCH] mesa-demos: Fix application demo2
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
X-List-Received-Date: Thu, 09 Jan 2014 13:53:29 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Simple fix for demo2 application. Pass color array to glColorPointer.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../mesa/mesa-demos/fix-demo2-color.patch          |   13 +++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |    3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch b/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch
new file mode 100644
index 0000000..34e9994
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/fix-demo2-color.patch
@@ -0,0 +1,13 @@
+diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c
+index 71a1a31..505b474 100644
+--- a/src/egl/opengl/demo2.c
++++ b/src/egl/opengl/demo2.c
+@@ -35,7 +35,7 @@ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+    }
+ 
+    glVertexPointer(2, GL_FLOAT, 0, v);
+-   glColorPointer(4, GL_FLOAT, 0, v);
++   glColorPointer(4, GL_FLOAT, 0, c);
+    glEnableClientState(GL_VERTEX_ARRAY);
+    glEnableClientState(GL_COLOR_ARRAY);
+ 
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 4bb92f4..225d466 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -14,7 +14,8 @@ DEPENDS = "virtual/libgl glew"
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
         file://glut.patch \
         file://egl-mesa-screen-surface-build-fix.patch \
-        file://egl-mesa-screen-surface-query.patch"
+        file://egl-mesa-screen-surface-query.patch \
+	file://fix-demo2-color.patch"
 
 SRC_URI[md5sum] = "9df33ba69a26bbfbc7c8148602e59542"
 SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a87a828"
-- 
1.7.9.5


