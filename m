Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0H2-0005mW-8j
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:08 +0200
Received: by wgbdq11 with SMTP id dq11so750146wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8hMsFdwiPDqCxOD/GQQQ58zwXyElIS1dh9NQOiCBnjw=;
	b=twXGpiPhHVCeOVc7dOE3Qrxkx3MwKQOb1MstL+f7X+LPiURyLxNPonBLYMe2OCPltm
	BmeThagMUL3pdRQ+oOKx1XWkwoEFzpZzJ9BFjlzjDGJMnOIqei31uB3gJ8Pl2kCY+Ncj
	h9boce1wRwhiZ6tNpoyITMm8q2Xj0hBPvCqUMEzpjViWOwaiNIGTQHqmpHFO6UCuefFO
	dbJ2fJ14hrpWOwMz+7KUgmDQ6VIa4c4pN3eOCJaBW9N2tePtrQQRhdbKpZaiYoeKLEGT
	/Awp60d/7o4yTDf1k6x9DJdaPG5sEFZNhzaopD2s+ler7x3cY6sQlHdFwyR6B/MgGbf1
	M6iQ==
Received: by 10.216.132.76 with SMTP id n54mr331398wei.135.1348698437462;
	Wed, 26 Sep 2012 15:27:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm9498356wib.8.2012.09.26.15.27.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:06 +0200
Message-Id: <93b0782be14c00569cbc4eb6e8d515b6cc8e6ae7.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/10] qt4-tools-nativesdk.inc: rename to nativesdk-qt4-tools.inc
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-qt/qt4/{qt4-tools-nativesdk.inc => nativesdk-qt4-tools.inc} | 0
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb                        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-qt/qt4/{qt4-tools-nativesdk.inc => nativesdk-qt4-tools.inc} (100%)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
rename to meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
index e17a8ad..42d2873 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
@@ -1,4 +1,4 @@
-require qt4-tools-nativesdk.inc
+require nativesdk-qt4-tools.inc
 
 PR = "${INC_PR}.1"
 
-- 
1.7.12



