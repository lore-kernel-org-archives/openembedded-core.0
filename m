Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B4DC86116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:54:16 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so60964pde.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 18:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9m4LdU4GBKFt16BO7amiW+J0l7z2QFktm6GC/LCY3CI=;
	b=vAi3haezj8v6Vji4BJaf6pxCco14En+L4sYemLe7ZV50uRxpdRdpFVlwBZ7+G5tz4X
	a5W3lRg5ASE4w/paSrhZf+rbn3b1wi+k3iwxpKpNWKRvMP/zc6bmhjaP/Ha1VPHf+wy2
	PQ+22P0kXcdQil6VJZcmnhlsf+Ka9C2nm9Zkcf9ZLUzUpblWhAR+kExdojov5DTxRLiu
	42/GakRSUH+VZCx/11KaQrVoJzp6fcA8YeSs6kwpWKrHO98wecH0P/wuheAFa3nhB2Xn
	N6xIG6SmGxSgxI5FE+JlKjPvw4yiKl7uKetFOJZY8oXxPUv5DYxn8jsfx2mlaH4eXr53
	zRXQ==
X-Received: by 10.68.87.225 with SMTP id bb1mr13787064pbb.89.1411610058449;
	Wed, 24 Sep 2014 18:54:18 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id oz6sm520340pdb.38.2014.09.24.18.54.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 18:54:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 12:05:52 +1000
Message-Id: <1411610752-12283-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] meta-toolchain-qt: fix up old reference to Nokia and typo
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
X-List-Received-Date: Thu, 25 Sep 2014 01:54:17 -0000

The SDK is now called Qt SDK.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index c9bdeae..53e5322 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -26,7 +26,7 @@ toolchain_create_sdk_env_script_append() {
     echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
     echo 'export QT_CONF_PATH=${SDKPATHNATIVE}/${sysconfdir}/qt.conf' >> $script
 
-    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
-    # and QTCreator
+    # make a symbolic link to mkspecs for compatibility with Qt SDK
+    # and Qt Creator
     (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
2.1.0


