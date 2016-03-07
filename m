Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 00B0073192
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 23:06:33 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so5466093wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 15:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mAKrWTJ2IWEQXSIGY6UStYnEc6QZkKVx6Hu6H32376k=;
	b=L6v0N4s6/EWbx5UYIZhJO98Ihozl4XKz4mi0KHIwWXqHHz8Ni/WzOprkD0PhqOOCnY
	ra/K0glLb8jQCIxWm9GwcoFk0o7ysUCL3xgUOvVQO5fBQdU5H5q1vwqH6zVBvryxpzPq
	pfJNCdoJw/fGqpBBR4kXB1srWaz4pfuImCibCkVWRen7VETyT3LQaHVbuiy3Hx0/OJBx
	j1y7VNbtrKvHCNrPvm7UaMfxKkqKYgacezYz/YNStFrzF/d1hgosfjhbR/X0NDMSNt1w
	i34mwRmOsQykeEqwECr/pVaWpHP0m+WgAWYPB3eXb5uoMtNopfWBQJf6qCZsppsT9hCu
	kmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mAKrWTJ2IWEQXSIGY6UStYnEc6QZkKVx6Hu6H32376k=;
	b=l+5pdOt9VH6gmrKZ6hVoitJBvwfRSnHTJldp3swHXms0PfCsuZIb8aGiIxr2TcWoJi
	d+VZnMup1qYadZ4JWAH5zFqS+MSPASSP84d5nqb7+kzq8H5e6IzEjmkbpqlwIMu0EDuJ
	Wiu2BJz6/NXpizPeURZ9+gCIS1g3dG51MF7SEZv5HUE43TV1oygUEMLxmWRINS7kAY/0
	DLMcFInn0PjMiKhIYFwDpvGb4czT8ATMxv7lc0RBWliyEkJEk1JqsODO2QRAUf8Hcf9A
	pdsgFB02nynPdCM2hwfvHoTwqVoJgRJQoQ85qQrCKPOj7+z8QUZ40F5lxnBP7bLGFx/4
	E7fA==
X-Gm-Message-State: AD7BkJISLzpNE4Y+ZpNymvgdPGVf6fZ1SPMUrnCHdK5sIayyTQPZ124Uky6by6Z39Hb21g==
X-Received: by 10.28.187.134 with SMTP id l128mr15233863wmf.61.1457391993797; 
	Mon, 07 Mar 2016 15:06:33 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	jf6sm20182412wjb.2.2016.03.07.15.06.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 15:06:33 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 00:06:28 +0100
Message-Id: <1457391988-18419-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [Patch v2][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 23:06:36 -0000

v2: Fixed file mode of patch file.

This fixes the check of the libdrm version in the configure script.

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../0002-modesetting_libdrm_requirements.patch     | 29 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.17.2.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch
new file mode 100644
index 0000000..22b7e6f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch
@@ -0,0 +1,29 @@
+From bf23db42a4e5943129501223a47b48884cdeb62f Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Wed, 27 Jan 2016 11:50:13 -0500
+Subject: modesetting: Require sufficiently new libdrm
+
+Bugzilla: https://bugs.freedesktop.org/93883
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: Backport
+
+diff --git a/configure.ac b/configure.ac
+index ac3bb64..312fc69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2035,8 +2035,7 @@ if test "x$XORG" = xyes; then
+ 
+ 	if test "x$DRM" = xyes; then
+ 		dnl 2.4.46 is required for cursor hotspot support.
+-		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
+-		XORG_DRIVER_MODESETTING=yes
++		PKG_CHECK_EXISTS(libdrm >= 2.4.46, XORG_DRIVER_MODESETTING=yes, XORG_DRIVER_MODESETTING=no)
+ 	fi
+ 
+ 	AC_SUBST([XORG_LIBS])
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
index 3039d30..f087ecb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
@@ -1,6 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
+	    file://0002-modesetting_libdrm_requirements.patch \
            "
 SRC_URI[md5sum] = "397e405566651150490ff493e463f1ad"
 SRC_URI[sha256sum] = "f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993"
-- 
2.7.2


