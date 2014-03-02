Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id AEF826F4B8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 02:53:39 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so2383019pad.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 18:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OIuAgsqGlkNW3Rv0QpbWl03EZ+k6ZfCgFDw+UXOO13Q=;
	b=YCjACKmU/FtupUghjepqg1eE/qJxgpb4NUmffQ9xKDZXNqNGjPgGyrYj6BTN2duz/J
	zcYcJJtzG8OBEMXlq4YpdGNdpoLPX14v5xn8JfaBQqhTjXKSiVtJDdToi0UPB4NiBlXj
	y6jo39iTP4ZnqTra388QMwjxyBGfqjg4xGzW7SlMbskFbBxfM7ODyeqsE8GsrVPgzWrH
	Hmr4/wsqO7YyVKyZjveLGeZBocnePTsgnvn4DhKKpiPAo7KgwfFa1jkAV7Yw6PAIroPB
	mof/BQ791B0UvNF29pg070FG0x+Ri1Foq9yi3wwQlY/HM9xAhdmd7T3+kqwUVbR8Rizk
	djaA==
X-Received: by 10.67.1.202 with SMTP id bi10mr12235655pad.68.1393728820630;
	Sat, 01 Mar 2014 18:53:40 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	eb5sm50853825pad.22.2014.03.01.18.53.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 18:53:39 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Mar 2014 13:58:11 +1100
Message-Id: <1393729091-12840-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393729091-12840-1-git-send-email-net147@gmail.com>
References: <1393729091-12840-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH v2 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 02:53:39 -0000

This adds the necessary target packages for development with all of the
Qt 5 modules.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 60 +++++++++++++++++-----
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 997df18..13cac33 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -11,30 +11,62 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 USE_RUBY = " \
     qtwebkit-mkspecs \
     qtwebkit-dev \
+    qtwebkit-qmlplugins \
+"
+
+# Requires X11 to work
+USE_X11 = " \
+    qtx11extras-dev \
+    qtx11extras-mkspecs \
 "
 
 RDEPENDS_${PN} += " \
     packagegroup-core-standalone-sdk-target \
     libsqlite3-dev \
-    qtbase-mkspecs \
-    qtscript-mkspecs \
-    qtxmlpatterns-mkspecs \
-    qtdeclarative-mkspecs \
-    qtsensors-mkspecs \
+    qt3d-dev \
     qt3d-mkspecs \
-    qtlocation-mkspecs \
-    qtsvg-mkspecs \
+    qt3d-qmlplugins \
     qtbase-dev \
+    qtbase-fonts \
+    qtbase-mkspecs \
+    qtbase-plugins \
+    qtbase-staticdev \
+    qtconnectivity-dev \
+    qtconnectivity-mkspecs \
+    qtconnectivity-qmlplugins \
     qtdeclarative-dev \
-    qtscript-dev \
-    qt3d-dev \
+    qtdeclarative-mkspecs \
+    qtdeclarative-plugins \
+    qtdeclarative-qmlplugins \
+    qtdeclarative-staticdev \
+    qtgraphicaleffects-qmlplugins \
+    qtimageformats-dev \
+    qtimageformats-plugins \
     qtlocation-dev \
+    qtlocation-mkspecs \
+    qtlocation-plugins \
+    qtlocation-qmlplugins \
+    qtquick1-dev \
+    qtquick1-mkspecs \
+    qtquick1-plugins \
+    qtquick1-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtscript-dev \
+    qtscript-mkspecs \
     qtsensors-dev \
+    qtsensors-mkspecs \
+    qtsensors-plugins \
+    qtsensors-qmlplugins \
+    qtserialport-dev \
+    qtserialport-mkspecs \
     qtsvg-dev \
-    qtxmlpatterns-dev \
-    qtdeclarative-dev \
-    qtdeclarative-plugins \
-    qtdeclarative-qmlplugins \
-    qtgraphicaleffects-dev \
+    qtsvg-mkspecs \
+    qtsvg-plugins \
+    qtsystems-dev \
+    qtsystems-mkspecs \
+    qtsystems-qmlplugins \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtxmlpatterns-dev \
+    qtxmlpatterns-mkspecs \
 "
-- 
1.9.0


