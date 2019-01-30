Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B1AF97C2D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t6so25492851wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nWdx6acJkzZgwgWHe7Df0fM1GzSY0TTKZI1mDZZLByY=;
	b=E4ONSspc9Ot+KNMHy7aLEW5plEiuedgXqSSjDRckLfp5uAfc0B1d1tcRdkXsZzlifQ
	7Tz9lyxc+ZE5zvpWfklDYOtHyyrs0aj+FRTfcqm7Vrm+jCwa5RARkpMytIf8DZNfEAym
	Z7XIgRjjZlB6aVztJUyfiJFFROxmSXQ9cruDMCdaLjtKMEGIOddnk+9/nFyVKDQO/Yy8
	JBUHrvoznmaECQ64WNUqMG08y9tNelY16Z2xOy9YXvvqiicrdxx8uWw5gaQDBaUHznnj
	JnrZxJMqYeux+NrtQpYppGPA/61RkxMAWDlrUDQ97ho+vf+TulWzKaRWBVVcHxkO8mPR
	VQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nWdx6acJkzZgwgWHe7Df0fM1GzSY0TTKZI1mDZZLByY=;
	b=r0w7UMrVjApFe9UGpUVJDjcDWKrVbVEyvw2F5tG1a9J382xLP2Z26tSNrvbj0w7pzX
	FXgtYer/801QfTFVzB60Fe6aRXGNu6K+S7+KwRFBAj/B11Pwv9r88W9TANjf2yLZMOfi
	9wwQfTgBP0I0nIMxJ3G3Kg76ez6TbjpJ8hneYAT3o5E2FrlERGnN1WSn0rFsYxE6DZhf
	0+oGBpTwoASFRkDoBD4BXYAIO89hIM+zXMWBYMVFgqkkEciRGUPFZQ9xY5NtASkxKTGX
	IUsqPGkUhAo8+xPqbeMKO5l8GWHTxCYhG7v5tzmf7OXKmnT8vvztEpJDx0LnQ4mOpKYW
	6nzQ==
X-Gm-Message-State: AJcUukdeuVP5tkJoJlZdOPzjaIVgHhajc3nUgC016i/XQzEX9KwnTcPs
	gJShJ4MChS6LTVu3W77wm3JcyEDo
X-Google-Smtp-Source: ALg8bN7uSRW1QlbqxuDB2p9MJC4UOZ0pGzmFOhbJBNilJiR7MVlBMK7pT7t+CKoG37I0dqlkeIWC8A==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr28813551wrv.161.1548845993000;
	Wed, 30 Jan 2019 02:59:53 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:26 +0100
Message-Id: <0a4f89bdace2e8b8eacbfa8aac88975b44262723.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/20] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:52 -0000

Note that only the most minimal necessary subset of mesa is built;
particularly we don't build any drivers as that is offloaded
to the GL implementation provided by the host.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d9e492e94e1..e96a12c1b97 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -26,7 +26,9 @@ PROVIDES = " \
 
 inherit autotools pkgconfig python3native gettext distro_features_check
 
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
+BBCLASSEXTEND = "native nativesdk"
+
+ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
@@ -42,11 +44,13 @@ EXTRA_OECONF = "--enable-shared-glapi \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri', '', d)} \
+PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
+PACKAGECONFIG_class-native ?= "gbm dri-native egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
@@ -58,17 +62,19 @@ PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
+# On the native builds we use host's dri drivers
+PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
 # radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS_append_x86 = ",intel"
-VULKAN_DRIVERS_append_x86-64 = ",intel"
+VULKAN_DRIVERS_append_x86_class-target = ",intel"
+VULKAN_DRIVERS_append_x86-64_class-target = ",intel"
 PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=${VULKAN_DRIVERS}, --without-vulkan-drivers, python3-mako-native"
 
 PACKAGECONFIG[opengl] = "--enable-opengl, --disable-opengl"
-- 
2.17.1


