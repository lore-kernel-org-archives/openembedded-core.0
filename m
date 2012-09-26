Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0I1-0005vP-Qg
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:41:09 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so279267wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/Kw+SqwnWDURT+8euNKN0jzegHRTFzBRjneDqFvE2Cc=;
	b=zHIB/kXwo8u45nZ5Jq125bqvQ5WfMgMcUZRkopXbqxSM41W1D4AIVyuGfDdK6SydId
	91kZCCUbUmJj9LPvf7AKCZpdMM6TwwavKT1iU47STY2wqqQnZmhJH0TY5JcuD1B00w1L
	L3swmJpmB4kscb18FOZDHHRELXlzUIkAyUwUFGU7fVMF/H0AylPsi4JfTnYXj9QJm8Zz
	Qt5xkb4xqsI5O2xv3bLdwz53MsW7SLLUir8h+3ai1BO+uyh7qzsUK98Cla6ijJB8LLdq
	m0eq8CK7j0h2ZvLCUTSnWjB0/EQfgCz2RmshdRn2RTwtWgss4h15DClZW4s4S0X9Ekt2
	EZ6A==
Received: by 10.180.76.69 with SMTP id i5mr4085947wiw.9.1348698501182;
	Wed, 26 Sep 2012 15:28:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm9503282wib.8.2012.09.26.15.28.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:14 +0200
Message-Id: <4d985a296498b6651d914265d473c823eb239d9a.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/10] qt4: PR bumps
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
X-List-Received-Date: Wed, 26 Sep 2012 22:41:09 -0000

* sofar only formal changes, but to test that everything still builds the same

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc   | 2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc        | 2 +-
 meta/recipes-qt/qt4/qt4-native.inc          | 2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 2330853..1199a8a 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 3dc12af..7778630 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -17,7 +17,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r6"
+PR = "r7"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 53eb652..c060634 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r48"
+INC_PR = "r49"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 9500d4b..5f0fce1 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 inherit native
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 0ae74f7..68b3078 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -6,7 +6,7 @@ SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 PROVIDES += "qt4-x11"
 
-INC_PR = "r46"
+INC_PR = "r47"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.12



