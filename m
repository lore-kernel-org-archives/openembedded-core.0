Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA3C0606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:20:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so2795802wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 09:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=e0TVNY+8guecnbA+1Ex922Znyfg+PDbZ49lPSeZpWsI=;
	b=bWUIi2g4EkeJyLR7VAbYrrRKMdQ2ofuGHKuw7CwGN9cnF7gfG3zSfcoh2znGQX7k1T
	d5FN2XfebLbeusgIPgyTmNIPAbD1o+ERICR9nmZQWrKI/niNpk8zIld6o+0eyvcoTnoQ
	rZEy5TgdRiv/Q0O5+vROdGgWnZDfBerXHIb0XWElw76kVoI75bI0XoNWfZ42hJDo/K6y
	J02YigRX7eTQu4rNTKHt74cAqy9M6UIVXxrZkL6sDKFXTautY80kM1PmCOMzrHYNCb92
	QTdMmni9MoK362bhIfOipii6UCrVJ7OvPmVsTKFlfuIWAKI/7mjLt1R6fggDbGtVXJSu
	MiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e0TVNY+8guecnbA+1Ex922Znyfg+PDbZ49lPSeZpWsI=;
	b=lL6WVpOEjxq+CEcHUMsiLlADbllDcmek1dUlHlVyc6vVNRFnRTwtXI0mGD/sHM2vuV
	7KjrHYnT6Dx/W6W/r+65PqF8Ve3fxPGVh3tr4oV8v2ldVWIbmzcUTRkp5/TWrnE39SiR
	GxQmmhlZXVPC1DLvD8Jdo9+EkoxVxSS8RIKr/5SDVCqldrHXDAshXeWSdYnj7AwupQhe
	xeh08TfjnfbBA4/usSHNIsxJuMHj+5nnkJpHmV+8pA1nvob+VZohjwff8eGSy703iBLt
	OjKANgJNLmrz5tysEtDpB5oZvYyr+06qP74aIjl3e7AslHzxPwvfladF5BmzmPHmhziI
	nNNw==
X-Gm-Message-State: ALyK8tKgsh+UqgfD2YojLgaFQAhJ+JD9b7ajQnZvq9XlY3AAb9Q8o+JtLLGiDq9rouy8xQ==
X-Received: by 10.28.216.75 with SMTP id p72mr43565845wmg.67.1468599628650;
	Fri, 15 Jul 2016 09:20:28 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id u9sm1476941wjy.45.2016.07.15.09.20.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 09:20:27 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 17:20:26 +0100
Message-Id: <20160715162026.31179-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] recipes-graphics: Added native and nativesdk support for some libraries
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
X-List-Received-Date: Fri, 15 Jul 2016 16:20:29 -0000

These libraries are used in some recipes outside oe-core, so we should add
this class support to avoid duplication and bbappends on other layers.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-graphics/freetype/freetype_2.6.3.bb        | 2 +-
 meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb     | 2 +-
 meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb     | 2 ++
 meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.3.bb b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
index bcd50444cb83..c59376d66386 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
@@ -46,4 +46,4 @@ do_install_append() {
 
 BINCONFIG = "${bindir}/freetype-config"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
index a8e4f24b6ba9..17629047b7b7 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
@@ -12,7 +12,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
 
 DEPENDS += "libxrender libxfixes"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
index 027c8043d843..bb03f44e25ad 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
@@ -18,3 +18,5 @@ XORG_PN = "libXinerama"
 
 SRC_URI[md5sum] = "9336dc46ae3bf5f81c247f7131461efd"
 SRC_URI[sha256sum] = "7a45699f1773095a3f821e491cbd5e10c887c5a5fce5d8d3fced15c2ff7698e2"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
index d00774ece5dc..dde7e9db7aa8 100644
--- a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
@@ -15,3 +15,5 @@ PE = "1"
 
 SRC_URI[md5sum] = "9959fe0bfb22a0e7260433b8d199590a"
 SRC_URI[sha256sum] = "977574bb3dc192ecd9c55f59f991ec1dff340be3e31392c95deff423da52485b"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.0


