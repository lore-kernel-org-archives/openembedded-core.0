Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0H7-0005mW-Uc
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:13 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so750146wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OvVYd60DCCYybr+RZUA0qrCzqxKqzx5n5v1Pp3wkkR8=;
	b=WWqgc5A6wKfq9Jp+dlLXon2sJEfBolMH85+S2YxesmmZc5vQbBuNjeu2yXkQVOJZjj
	YSKTpbSa/ZjnYQhLo2xkJU4+LJCkXB+tFOtATMnCCOGLR8fZzjRP7yWEWu0bIH1aOI/X
	xcNTyZwSIIiPR1QElvtdTxiGZgJnYc78S0rL8RyPfx00k6HGPwv/j4+R9mFY2KfV7KCh
	lJM1AprC6JMxmZc2QA0I6QuxNGxUeG/BQfLq5m6PZwsg8OwKXPpKx5jGBdUvcNiQMUgn
	pqoC3gnj5MT1ziP5Z/eFbset94zNqsBlDzgETNLKhjYcQnLwqBSibFEOLjeVFVDX4wvz
	DI3w==
Received: by 10.180.100.101 with SMTP id ex5mr28902189wib.16.1348698445318;
	Wed, 26 Sep 2012 15:27:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm9499436wiy.11.2012.09.26.15.27.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:07 +0200
Message-Id: <3e306bd32d5c68d90dff87774c135f679d66925c.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/10] qt4: use releases.qt-project.org instead of get.qt.nokia.com
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:14 -0000

* releases.qt-project.org has 4.8.1 as well as 4.8.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 2 +-
 meta/recipes-qt/qt4/qt-4.8.1.inc            | 2 +-
 meta/recipes-qt/qt4/qt4-native.inc          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index a1dd8df..0228b56 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -10,7 +10,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
 inherit nativesdk qmake2
 
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0004-no-qmake.patch \
            file://configure-lflags.patch \
            file://qt-config.patch \
diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
index b923e60..aa18301 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 
 FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
 
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0004-no-qmake.patch \
            file://hack-out-pg2-4.7.0.patch \
            file://0006-freetype-host-includes.patch \
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index e00a1f3..492a700 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -13,7 +13,7 @@ INC_PR = "r16"
 
 inherit native
 
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://qt-config.patch \
            file://g++.conf \
            file://linux.conf \
-- 
1.7.12



