Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id ABA5572E77
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:50 +0000 (UTC)
Received: by pdev10 with SMTP id v10so8551681pde.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=t+wY6XWGrAkYTX7/D9elME7Hm0xBf5PZT20zERzGYIY=;
	b=VhPPUNuxlQvnkEJSakyGnCZYaJqIAFk+DQbCbav1F+58Nhyr+CfvEOb1A/C7wMBS3R
	3XbQEQ9H/xs+Ikz1ONHmlMq8iGE0d0C9LaMcDlboOLkbfYTIXjSRhg3upTwsL9ve+tUg
	w9bwxvSuTRL84mKeBHoSZL6VcZMDicVbCyfHywnnRt1RjH+bIZEpzF8XIuvx20/YjV2P
	G2Jsab/VVLvbcKhsJnAjnkNX6AYCUjS+QR6yAcWu+r9gbokTuIw7hvyL1jfkzl1HvtnV
	3R82dNyjMtDpI1LTD72Eii+tHfz08lO6D+e5xxUwU6UdE+tDch45hh3juOoNGbaTSPl6
	2xnw==
X-Received: by 10.66.156.229 with SMTP id wh5mr6588074pab.119.1423152352082;
	Thu, 05 Feb 2015 08:05:52 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:57 -0800
Message-Id: <50e0fdcf83b2d1ebd28c8cb4b639807ae411e7f8.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 49/61] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:50 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

(From OE-Core rev: 1cf0245344ce272e7330cfe1b04a0ed7bd18e8f5)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 5 ++++-
 meta/recipes-graphics/xorg-app/xprop_1.2.2.bb      | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
index 96ea030..84d0cb8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
 SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
 
-DEPENDS += " virtual/libx11 libxau libxt libxext libxmu libxrender"
+DEPENDS += "libxau libxt libxext libxmu libxrender"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 524a2d3..59a04fa 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -5,12 +5,15 @@ SECTION = "x11/apps"
 LICENSE = "MIT-X"
 DEPENDS = "util-macros-native virtual/libx11"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
index efbb1b3..d78bf04 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
@@ -10,7 +10,7 @@ formatting information."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e226ab8db88ac0bc0391673be40c9f91"
 
-DEPENDS += " libxmu virtual/libx11"
+DEPENDS += "libxmu"
 
 PE = "1"
 
-- 
1.9.1


