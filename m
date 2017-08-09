Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A837377D48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:19:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 123so6004609pga.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUoeSrikBeQHwsee4+tZYDpmlhpvx0mlGb6FHZznKU4=;
	b=VGMYUTxv+KY+Kf+B0jbkJYMyZbWwjdI8CICZNdQSL2k6JH3ie/dpE4ymv1d5BMi+AZ
	2tq/onLpA0A7O2khTJKWW3jFNOrUUjOKDDssK/oR/+ItCL2DU3c8emKjNSCAA6Z0jB1H
	a+az4+ITGEZrxP8bZPgLC0ljsSDXGkRk14F6up5g7c+/bsXekDnqlFSIxl01v06vBeKv
	QVpk7XY2MLqSejR8hs7KzGLeLjrka+4G3BFrGfU7c2RE5eiuxetr1IwwGFaWR9jjqu1e
	qkHMGTsxaWQmKr9+XWFLtvf889CL1RG0Ya8PV3rNZuPnX2Dw1zjhUwz3CANa14ONznxE
	iJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUoeSrikBeQHwsee4+tZYDpmlhpvx0mlGb6FHZznKU4=;
	b=cOrY4IIDjen48z31wYBN7MQ3zpcaroqHQP5H8NGnGS2XBNkLfvIp9xSm7uwDw5ziVt
	T1bCF+s5GxEwmvfHV1QQ9F6fch3vl1WNvQv7c91fiP77mj45QHTUmAjhG/yMtMr5tNbc
	bW8D3NQp1BznD4WrPjcnpvUNAyocoB2CS2HEdMdwlk5R07SnLkuEkH3xp+O+iGIlWasP
	P49hOxwMy7pCwUK0bXBhclSX5UU2ILFQOZjZcnPSMhwtFcjeu3ZiF5BO1IEC2GIpoQWH
	lTmmDj2opGGlHhiB/BQ0YddwmML8mtS/2oHTkCps/pMm/2GxKp/VpOotRYtRAevPFwJz
	ILaQ==
X-Gm-Message-State: AHYfb5h74VRCmqCd1LwrAnULI1/OuNEi0QehipVanXvBEmZeZDviZCzp
	9A7YyMavR2t0pc3I
X-Received: by 10.98.113.9 with SMTP id m9mr8281431pfc.263.1502288375610;
	Wed, 09 Aug 2017 07:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	s89sm9342832pfe.155.2017.08.09.07.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:19:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 07:19:22 -0700
Message-Id: <20170809141922.2603-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170809141922.2603-1-raj.khem@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
Subject: [PATCH 4/4] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Wed, 09 Aug 2017 14:19:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 8e1e2e1b88..fd376951bd 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
+           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
@@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
+PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-- 
2.14.0


