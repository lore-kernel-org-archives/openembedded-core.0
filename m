Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0HX-0005wg-9c
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:39 +0200
Received: by wiwc10 with SMTP id c10so7341wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rl/I2FgcOVpKPVwkjXstysAS1ijY8ct3ozpfUWdQuPs=;
	b=UW6OR9ijfwwsTNW2L8/CciASubzO4KdGdto57e72hKzNWcWZGTbqxxz9/N9z/dX7+w
	id0S/OZwn1fyjKlp+bfhMw/PeSKS9wne3zWXIj6ufS/3U0J9buxuuGe1jsjRi/UUFUsX
	RcbuI999B5JRzkg6NubgL6rP7DAnp+10Upfy4bRw9366ZbjmawSwMn21eweHsUOXFsPk
	qBJlfBePZd7xeh6RvR8lWoyGVNddQtdLh9hHfe+Avu13jFuCtI1dWkYV+x3lUsu0/Y2z
	ic7B3R2oCBDXn0GSB5idwLwZ+3Yzq0hUd4fp7PDXSBJaCY1R53gONLqpo9IsmJoi/U0o
	fmfA==
Received: by 10.216.194.148 with SMTP id m20mr383216wen.51.1348698468325;
	Wed, 26 Sep 2012 15:27:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm9500496wib.8.2012.09.26.15.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:10 +0200
Message-Id: <084b8031e2bfbae486018781fdfb59fb2fef6b1b.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/10] qt-mobility: move qt-mobility patches to separate dir
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-gstvideoconnector-fixed-buffers-allocation.patch                | 0
 .../0002-Remove-unnecessary-rpaths-from-qml_device-example.patch         | 0
 meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/gcc-scope.patch         | 0
 .../qt4/{files => qt-mobility-1.2.0}/qt-mobility-configure.patch         | 0
 .../qt4/{files => qt-mobility-1.2.0}/qt-mobility-no-opengl.patch         | 0
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                                | 1 +
 6 files changed, 1 insertion(+)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/0001-gstvideoconnector-fixed-buffers-allocation.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/gcc-scope.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/qt-mobility-configure.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/qt-mobility-no-opengl.patch (100%)

diff --git a/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-gstvideoconnector-fixed-buffers-allocation.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
rename to meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-gstvideoconnector-fixed-buffers-allocation.patch
diff --git a/meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
rename to meta/recipes-qt/qt4/qt-mobility-1.2.0/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
diff --git a/meta/recipes-qt/qt4/files/gcc-scope.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/gcc-scope.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/gcc-scope.patch
rename to meta/recipes-qt/qt4/qt-mobility-1.2.0/gcc-scope.patch
diff --git a/meta/recipes-qt/qt4/files/qt-mobility-configure.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-configure.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/qt-mobility-configure.patch
rename to meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-configure.patch
diff --git a/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-opengl.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
rename to meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-opengl.patch
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 7f0af9f..3dc12af 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -5,6 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-mobility-${PV}:"
 SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
            file://qt-mobility-configure.patch \
            file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
-- 
1.7.12



