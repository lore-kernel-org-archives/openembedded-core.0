Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 31E5D6A593
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:39 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id m46so1350710wev.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YMvslrZ0BJqNxV8MTDyZE08oSs/pbGAGwQLIFxKii+M=;
	b=pY4i5Gx/gRE45Mz2Y/Sz9k6D7BFjLmnAwJv/DJmYB0oOuHyluByKnIUsj7hxEuyCyv
	2t1JRVjVfy6PddVgNk+QHCWPhPK/rp6RDaHV/ABgyYExx1PNvDDO+WzdWsMuLOigHIkx
	RbVf4mqSKuZG0rYJJfTO25iKpkwXPT3fBH3Z5ckuP3nmSzivjSOkaKQiPYLEQCnZqWk2
	R7+NXL0wfL0XLzrOU4iUo3ZBXLuPl1GJWTiagmU2yKazSipJ4RU0RnN/DrRrjmV6aMUK
	V4x0Ql8CzQxqH/N81ubu7asuh+Dd7iEYEeRvorzp7PL7geMQRRtkdcSjD0Gkpk+CFN+l
	Abkw==
X-Received: by 10.180.206.77 with SMTP id lm13mr3746777wic.18.1370013099968;
	Fri, 31 May 2013 08:11:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:10 +0100
Message-Id: <299fde808fbdca44b396fc35f0df196cad73dec9.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk7fcAbTZ0zPMqrKhnKhNuA9KvLbcU/6bef2WTDMFrUDs57BAWD6z7iQZm6lJ3EuGtnPBE1
Subject: [PATCH 7/7] weston: update to 1.1.0
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
X-List-Received-Date: Fri, 31 May 2013 15:11:39 -0000

Upgrade to 1.1.0, and disable the RaspberryPi and RDP compositors.  Hopefully
the RPi community can send a patch to add a PACKAGECONFIG for them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{weston_1.0.6.bb => weston_1.1.0.bb}        |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_1.0.6.bb => weston_1.1.0.bb} (82%)

diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
similarity index 82%
rename from meta/recipes-graphics/wayland/weston_1.0.6.bb
rename to meta/recipes-graphics/wayland/weston_1.1.0.bb
index 9d5d626..026f136 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -9,8 +9,9 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://install-examples.patch \
            file://weston.png \
            file://weston.desktop"
-SRC_URI[md5sum] = "63202129d66d5514e572814da5dfa1f7"
-SRC_URI[sha256sum] = "c833bc4dc8667561d2639b57220541531c039aa9332ce2a7022a3c466eb894f1"
+SRC_URI[md5sum] = "dd9f3043fc5228c6bc4e99873fae2254"
+SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa53618b4"
+
 
 inherit autotools pkgconfig useradd
 
@@ -23,7 +24,11 @@ EXTRA_OECONF = "--disable-android-compositor \
                 --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
-                --disable-simple-egl-clients"
+                --disable-simple-egl-clients \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor"
+
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
@@ -38,6 +43,10 @@ PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-d
 PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
 
 # Use cairo-gl or cairo-glesv2
 PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
-- 
1.7.10.4


