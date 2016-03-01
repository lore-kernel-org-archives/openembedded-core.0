Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9264671951
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 20:13:06 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p65so49632932wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 12:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=n0NgpcxSF3e7rXOEgM+XDwfaTL703GxYvxtNUixc2CE=;
	b=wlFSTJpzx8XU3XPCqlx7dw5EjIXkS+KoiAseOuJuYGpJTYFvFryHyp8C8nTGSCWe/2
	iAC7xZfQc6Y9vVBKrIRnKuE4OCbtFHKVT7yl+ootHq4FLIbqaqEIF4+M6JGyQjQ1qldu
	oj3xKuJ77Ymjh3fK6X0J0r2LmCDaYLAbBkoYbNV+8Zo5O2CWne1msryyaKlDe6VMTQKQ
	XHrjHbTueRB/u9eizx2GjOv1LHbUojf6nehuEScYQPUC8rxvrx65xAahh49bmOGDgvQJ
	jmaZ2YPyWSzw5Xi61W1vv18joxuqLQzFfX0PgIJlhFoHutRXbyjXZC+i5tKJrVo3c/0d
	NHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=n0NgpcxSF3e7rXOEgM+XDwfaTL703GxYvxtNUixc2CE=;
	b=lXzMALHtSEzwdt/cKgb7HXWI+TdcSAUhb/ppQEbSHmGdAFZdFSNl7hvHjCRCObxP9j
	/HjHFNs9Tblw/7w8HfZAHgoemsofhXdbUrOP7hmV6MpO25/hcdbdhVFL058LAeh3y/M4
	EzR8jsvX3mvNkFOuvgMFSWgl2TL0CXmNIJRJ/M5hFUX68YZ0TS1wldb8ju3gEdXVyW3P
	+pU8sxyYQUbOppLqJwwuhYLiS8+JzwiMWt4oGMT9CGCzo4PHtMpGixkCSO7rR9rp8/92
	z7TpTK+lmvyBPMh+0mxcPrVwUqVf9fN6SA2TBU/vgj52z18NVj/5xciGqE9RqnV9ImCL
	lUNw==
X-Gm-Message-State: AD7BkJKhgaH55b1vVZ2Rmr62hLN30yyTYHKqcXhfroyJpzdgv7nEvh3TyHygDuhuNg9dfg==
X-Received: by 10.194.200.194 with SMTP id ju2mr14367773wjc.63.1456863186534; 
	Tue, 01 Mar 2016 12:13:06 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	v66sm726881wmb.18.2016.03.01.12.13.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 12:13:05 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 21:12:17 +0100
Message-Id: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [Patch][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Tue, 01 Mar 2016 20:13:09 -0000

This fixes the check of the libdrm version in the configure script.

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../0002-modesetting_libdrm_requirements.patch     | 29 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.17.2.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100755 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-modesetting_libdrm_requirements.patch
new file mode 100755
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


