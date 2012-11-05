Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TVWRE-0003Ex-3s
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 00:50:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so3211256eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 15:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jgChAAE/bac6Il3YuHA+Tm2+qDjiFY3SoZrBJp3KYrA=;
	b=GaQTFsBcmw8oRAfTkacRXkLNFqiN+3WWEG+r2HD5bFH58kVSdv06M+gHROSMAUQ7Yj
	BCBoc2dqdi65UI8LWlB/OWs1F3rWYugeO1RLyh18ApRBEShGP3grdBGq5VwnIV6SQBZE
	QKq69gjKcEwfeVrPV1ubteHX7pmzDbMUZGzszkSXpIUCfhn/8CtlOaW+6pRC/a4bwZ82
	+Z4fXGo0u4nzFKuUhED0/JwYk4v6O5Y2wWS2WjF52d+sKGMunXzwCv2UBq7ekIqPKtb+
	708t4BerDAmkWI5jrN7Zv4bqi74FFV7JrAaePyVKJWBHt9mZOc51R73Cc6dwG2E0fjWk
	3Lrg==
Received: by 10.14.214.2 with SMTP id b2mr42039844eep.32.1352158615752;
	Mon, 05 Nov 2012 15:36:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g47sm51728572eeo.6.2012.11.05.15.36.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Nov 2012 15:36:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Nov 2012 00:36:47 +0100
Message-Id: <1352158607-7197-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <20121105170957.GG30165@jama.jama.net>
References: <20121105170957.GG30165@jama.jama.net>
Subject: [PATCH] qt4: remove -lGLU from QMAKE_LIBS_OPENGL in our linux.conf
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
X-List-Received-Date: Mon, 05 Nov 2012 23:50:40 -0000

upstream does not need GLU since:
commit e7eed096a0c33607a7a37baaf06e5952dc9d556b
Author: Bj<C3><B8>rn Erik Nilsen <bjorn.nilsen@nokia.com>
Date:   Mon Aug 9 14:07:01 2010 +0200

    Remove dependency of OpenGL Utility Library (GLU).

    GLU is not part of standard OpenGL and is not used internally in Qt,
    so we should not depend on it.

    Task-number: QT-12227
    Reviewed-by: kim

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.1/linux.conf | 2 +-
 meta/recipes-qt/qt4/qt4-4.8.3/linux.conf | 2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc     | 2 +-
 meta/recipes-qt/qt4/qt4-native.inc       | 2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
index a541355..8670381 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
@@ -29,7 +29,7 @@ QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
 QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
 QMAKE_LIBS_NIS        = -lnsl
 QMAKE_LIBS_EGL        = -lEGL
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
+QMAKE_LIBS_OPENGL     = -lGL
 QMAKE_LIBS_OPENGL_QT  = -lGL
 QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
 QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
index a541355..8670381 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
@@ -29,7 +29,7 @@ QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
 QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
 QMAKE_LIBS_NIS        = -lnsl
 QMAKE_LIBS_EGL        = -lEGL
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
+QMAKE_LIBS_OPENGL     = -lGL
 QMAKE_LIBS_OPENGL_QT  = -lGL
 QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
 QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index afca7f8..fbd8c28 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r49"
+INC_PR = "r50"
 
 QT4EDEPENDS = ""
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 5f0fce1..ad20723 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 inherit native
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 20ad30c..a50b0c7 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -7,7 +7,7 @@ DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender li
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
-INC_PR = "r47"
+INC_PR = "r48"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.8.0



