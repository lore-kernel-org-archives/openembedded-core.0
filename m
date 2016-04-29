Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04FE9731CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 21:00:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so7597777wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DGfYEQ1wz6g/9xX+ywaXOoi0L2SfSFGlK4qceBWggoI=;
	b=rOZVDAHbd0YzzLPKvyvEzeUkIwC13qGGECmfS0QIKlaRn03/l4u/UayxpWZQ43KKJW
	Z6bRZbnDhw7uekVZ3nmJnrcF1eAqKAFREzN2NMSrVkf6y4XLH10NVpTwZKtjpNlBBgCd
	IJwtmPhzf7EupdukhsSg1Qj9ubm2QpLzUGaqqlgaYwDXfbv9gZvVmOi87xFO8iJMOPCJ
	ebnsZ1F1zANYpvRwaqpu1kL9pBhI9ZT5EW7p/Xdr8nnmcL1w9bCPHfwdb3QcP0rT5gyA
	cFrvxo8jyn1aYS0XuqPuW5j2Rse/F6R5af9cbjWAQcSdG43wuUu99pSFdRmVYATd+y9T
	clFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DGfYEQ1wz6g/9xX+ywaXOoi0L2SfSFGlK4qceBWggoI=;
	b=MkpqS20zRgU8UjoQExNTj3cDJLPkjB9W05dk497dERv/ogVo168BI/IrdmaeFgA+QV
	6A9ShqD2Y02xMPqh+DvWL27N1Tn4kjFb+KrLspwxnkd2yG4aDr/PiLpoH+wYKZfzaMtc
	nxAevlphlLZ1jJbJXQj9NXY+zkKKP6vyuPzKNflNjS60IqDNJ/DxYB40B9bkfRt4H+tl
	hOctrl+M4+lopjXbW5+qPE7medTuBCR5RofN+8u3XhaYFV9oMh+OSbJg+Y8liSsK4R/A
	A69RD/7Vmat8UvPlww165AOlFkCojzJ4b2527ZOb/huluKv5WUY5zM00hWzcdn4SMlnj
	dxGg==
X-Gm-Message-State: AOPr4FXQXZDgvhKcs6JuKa+AbrY3ZnjOlnOEWzTr3dEiTnun/IC2kCK3JZLw2NU9037VcA==
X-Received: by 10.28.8.149 with SMTP id 143mr6561936wmi.2.1461963607942;
	Fri, 29 Apr 2016 14:00:07 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0596.dip0.t-ipconnect.de.
	[79.223.5.150]) by smtp.googlemail.com with ESMTPSA id
	w3sm16559054wjt.0.2016.04.29.14.00.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Apr 2016 14:00:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 22:59:46 +0200
Message-Id: <1461963586-25144-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: update 1.18.3 and add PACKAGECONFIG for glamor
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
X-List-Received-Date: Fri, 29 Apr 2016 21:00:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* drm-version patch was applied mainline
* libsystemd was solved similar to patch upstream
* glamor was enhanced twice by Eric Anholt and makes vc4 work on Raspberry Pi
* glamor does not link against libegl but won't work without libegl

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 +
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch | 50 ----------------------
 .../modesetting_libdrm_requirements.patch          | 30 -------------
 ...erver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} |  9 ++--
 4 files changed, 4 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f4c5469..30307bc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -131,6 +131,7 @@ PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 # DRI3 requires xshmfence to also be enabled
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,libegl"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
deleted file mode 100644
index cd30999..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0c2153d468229f56e6fef71d2f002e0cae14aa55 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 16 Nov 2015 16:18:40 +0200
-Subject: [PATCH] configure.ac: Use libsystemd in REQUIRED_LIBS check
-
-REQUIRED_LIBS needs to be set to the correct systemd library,
-otherwise the later check will either fail or use the wrong
-pc file.
-
-Upstream-Status: Submitted [xorg-devel@lists.x.org]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 96c0242..f63eca1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -837,9 +837,16 @@ AC_ARG_WITH([systemd-daemon],
- 		[support systemd socket activation (default: auto)]),
- 	[WITH_SYSTEMD_DAEMON=$withval], [WITH_SYSTEMD_DAEMON=auto])
- PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
--                  [HAVE_SYSTEMD_DAEMON=yes],
-+                  [REQUIRED_SYSTEMD_DAEMON=libsystemd-daemon],
-                   [PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd],
--                                     [HAVE_SYSTEMD_DAEMON=yes], [HAVE_SYSTEMD_DAEMON=no])])
-+                                     [REQUIRED_SYSTEMD_DAEMON=libsystemd],
-+                                     [REQUIRED_SYSTEMD_DAEMON=])])
-+if test "x$REQUIRED_SYSTEMD_DAEMON" = x; then
-+        HAVE_SYSTEMD_DAEMON=no
-+else
-+        HAVE_SYSTEMD_DAEMON=yes
-+fi
-+
- if test "x$WITH_SYSTEMD_DAEMON" = xauto; then
- 	WITH_SYSTEMD_DAEMON="$HAVE_SYSTEMD_DAEMON"
- fi
-@@ -848,7 +855,7 @@ if test "x$WITH_SYSTEMD_DAEMON" = xyes; then
- 		AC_MSG_ERROR([systemd support requested but no library has been found])
- 	fi
- 	AC_DEFINE(HAVE_SYSTEMD_DAEMON, 1, [Define to 1 if libsystemd-daemon is available])
--	REQUIRED_LIBS="$REQUIRED_LIBS libsystemd-daemon"
-+	REQUIRED_LIBS="$REQUIRED_LIBS $REQUIRED_SYSTEMD_DAEMON"
- fi
- AM_CONDITIONAL([HAVE_SYSTEMD_DAEMON], [test "x$HAVE_SYSTEMD_DAEMON" = "xyes"])
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
deleted file mode 100644
index 5f186cb..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bf23db42a4e5943129501223a47b48884cdeb62f Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Wed, 27 Jan 2016 11:50:13 -0500
-Subject: modesetting: Require sufficiently new libdrm
-
-Bugzilla: https://bugs.freedesktop.org/93883
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-
-Upstream-Status: Backport
-Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index ac3bb64..312fc69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2035,8 +2035,7 @@ if test "x$XORG" = xyes; then
- 
- 	if test "x$DRM" = xyes; then
- 		dnl 2.4.46 is required for cursor hotspot support.
--		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
--		XORG_DRIVER_MODESETTING=yes
-+		PKG_CHECK_EXISTS(libdrm >= 2.4.46, XORG_DRIVER_MODESETTING=yes, XORG_DRIVER_MODESETTING=no)
- 	fi
- 
- 	AC_SUBST([XORG_LIBS])
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
index eb79b40..27098f1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
@@ -1,11 +1,8 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch \
-            file://musl-arm-inb-outb.patch \
-            file://modesetting_libdrm_requirements.patch \
-           "
-SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
-SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
+SRC_URI += "file://musl-arm-inb-outb.patch"
+SRC_URI[md5sum] = "043d720bf2472a65bb8f0daa97f83dfa"
+SRC_URI[sha256sum] = "ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.5.5


