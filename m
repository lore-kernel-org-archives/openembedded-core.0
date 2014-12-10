Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 31A3D72341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:18:40 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so3763824wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aHsBQKHF2IOCjb6rNnYjDoZp6soNOiXcvxsxroa9zWU=;
	b=dVWoixrcaARqfd0DlNVUGNp7kJJVJ/fPaw+ICa0j3W5AQOVDH5jKsMRX0QdoAoBQIP
	mYybjfpZt0D6BqSnwnUkoh/qLMp+zOru+IY3qv/phRZK0PiOlWrl6kcTUBWWO2L+7wPH
	3A+rJQTgHXob+GG02fYEpBgtlVOYw2ppchXka/nXBUgcWKl9Q8RLTeqe3/BD+mYUuffQ
	Zu2a+tHygHWzAGxWxpvRFL6Sx+1gg3+mmAfBCsOGkJSrcKu1MPHuvrUNxNJoCATWPA4l
	MjAmw4TY7Ir0rQ6y37X0P30Y5U3kpWD02RekelZwRTL7Rp2D6E6IJvQ7tbZsRPVCCiXE
	EqHg==
X-Received: by 10.194.161.202 with SMTP id xu10mr7424829wjb.4.1418221120942;
	Wed, 10 Dec 2014 06:18:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei5sm15776373wid.2.2014.12.10.06.18.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:18:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:18:34 +0100
Message-Id: <1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <20141111171344.GA2453@jama>
References: <20141111171344.GA2453@jama>
Subject: [PATCHv2 1/4] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Wed, 10 Dec 2014 14:18:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.1.3


