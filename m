Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDyw-0005tt-U9
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:11 +0200
Received: by mail-gy0-f175.google.com with SMTP id 8so3931090gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=F3/aNeO9tNmqIEn34FqH2kJ0QBaGvz27IvU9b40sjKU=;
	b=C6DX+naYbe2KyFBTnG3JOmdMOrvCVKskQ5lUeHtHfrPRD8SrHAanoQLLNJMovADImO
	J9avfdWaCjlSLKxmJQA83xUry+7JG0bEZ0ErYTTH/V4FJ3wh789c4ObsUdImmCkhh17I
	y3KokI19yK47epBaQricxj3al6gPZzrSk5VbU=
Received: by 10.223.7.83 with SMTP id c19mr11972134fac.16.1318007251807;
	Fri, 07 Oct 2011 10:07:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l8sm13604888fai.16.2011.10.07.10.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:10 +0200
Message-Id: <05860621d8f87cf536259735218e2965fb456c58.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 15/31] xserver-xorg: remove old 1.10.1 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:13:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-lite_1.10.1.bb       |   12 ------------
 .../xorg-xserver/xserver-xorg_1.10.1.bb            |   20 --------------------
 2 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
deleted file mode 100644
index 63b2c38..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xserver-xorg-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PR = "r3"
-
-DEPENDS += "font-util"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
deleted file mode 100644
index 0194798..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xserver-xorg.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-PE = "1"
-PR = "r3"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
-
-SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
-SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2"
-- 
1.7.7



