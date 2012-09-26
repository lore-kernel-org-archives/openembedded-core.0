Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0HF-0005lV-RR
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:21 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2348888wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=onULszwELBkGGgL3/pRLOWv6maSGvcoR7in6obPLFVo=;
	b=rPO1ZLEI7r8127gNSyobMmngAiaDx7Vq2HrIRfOYIdtP8uOxxcAaHxEdBAAWY5ilAx
	yu1WnhuV3tmlfhd1APD45oBHXYT92w9ZRDyns3rlH6poEBUzec+KcFnZAR5C2kC0DsWG
	VjiHTcRSUZesbVrgqBBZMIcm4FwPkRh/NzS0fNEKRwSl4O0uyMxK2rZ5xFBTWoJDG81Q
	lA2P615DAcSf9K7Sr9AW0h1GKLoehDGUyACmhAZ5YntlH/hw37Hmbbqc6L5tH18srtjz
	Cmp7ZMzb7EolFRkZzr2PrDAbXIlS+nl8Yu/nmw4hgs0jVhAdqdAEGlFvwyPf5Zb0YKc/
	mA5w==
Received: by 10.180.79.103 with SMTP id i7mr4058311wix.13.1348698453136;
	Wed, 26 Sep 2012 15:27:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm9497350wib.10.2012.09.26.15.27.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:08 +0200
Message-Id: <06ab8bbd3f3f0c290191880339018172d33351b4.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/10] qt4: rename qt-4.8.1 to qt4-4.8.1 to match other .inc and .bb
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc                             | 2 +-
 meta/recipes-qt/qt4/{qt-4.8.1.inc => qt4-4.8.1.inc}                     | 2 +-
 .../0001-Added-Openembedded-crossarch-option.patch                      | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/configure-lflags.patch      | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/configure_oe_compiler.patch | 0
 .../recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/disable-fuse-gold-flag.patch | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/fix-translations.patch      | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/fix_conflicting_types.patch | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/g++.conf                    | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/gcc47-fix.patch             | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/gcc47-fix2.patch            | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/hack-out-pg2-4.7.0.patch    | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/linux.conf                  | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/pulseaudio-config.patch     | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/qmake_cxx_eval.patch        | 0
 meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/qmake_pri_fixes.patch       | 0
 meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb                               | 2 +-
 meta/recipes-qt/qt4/qt4-native_4.8.1.bb                                 | 2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb                               | 2 +-
 19 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-qt/qt4/{qt-4.8.1.inc => qt4-4.8.1.inc} (98%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/0001-Added-Openembedded-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/configure-lflags.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/configure_oe_compiler.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/disable-fuse-gold-flag.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/fix-translations.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/fix_conflicting_types.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/gcc47-fix.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/gcc47-fix2.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/hack-out-pg2-4.7.0.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/pulseaudio-config.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/qmake_cxx_eval.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.1}/qmake_pri_fixes.patch (100%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 0228b56..542f395 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1 | GPLv3"
 
 INC_PR = "r11"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
 inherit nativesdk qmake2
 
diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt4-4.8.1.inc
similarity index 98%
rename from meta/recipes-qt/qt4/qt-4.8.1.inc
rename to meta/recipes-qt/qt4/qt4-4.8.1.inc
index aa18301..ace665f 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.1.inc
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
 SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0004-no-qmake.patch \
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0001-Added-Openembedded-crossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0001-Added-Openembedded-crossarch-option.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch b/meta/recipes-qt/qt4/qt4-4.8.1/configure-lflags.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/configure-lflags.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch b/meta/recipes-qt/qt4/qt4-4.8.1/configure_oe_compiler.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/configure_oe_compiler.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.1/disable-fuse-gold-flag.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/disable-fuse-gold-flag.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch b/meta/recipes-qt/qt4/qt4-4.8.1/fix-translations.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/fix-translations.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch b/meta/recipes-qt/qt4/qt4-4.8.1/fix_conflicting_types.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/fix_conflicting_types.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/g++.conf
rename to meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch b/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch b/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix2.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix2.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt4-4.8.1/hack-out-pg2-4.7.0.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/hack-out-pg2-4.7.0.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/linux.conf
rename to meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch b/meta/recipes-qt/qt4/qt4-4.8.1/pulseaudio-config.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/pulseaudio-config.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch b/meta/recipes-qt/qt4/qt4-4.8.1/qmake_cxx_eval.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/qmake_cxx_eval.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch b/meta/recipes-qt/qt4/qt4-4.8.1/qmake_pri_fixes.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/qmake_pri_fixes.patch
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
index 668565e..5a3dc65 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
@@ -1,4 +1,4 @@
-require qt-${PV}.inc
+require qt4-${PV}.inc
 require qt4-embedded.inc
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
index a2a1dbd..c09e6df 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
@@ -3,7 +3,7 @@ require qt4-native.inc
 PR = "${INC_PR}.1"
 
 # Find the g++.conf/linux.conf in the right directory.
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
index 6978053..9b03ff2 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
@@ -1,5 +1,5 @@
 require qt4-x11-free.inc
-require qt-${PV}.inc
+require qt4-${PV}.inc
 
 PR = "${INC_PR}.1"
 
-- 
1.7.12



