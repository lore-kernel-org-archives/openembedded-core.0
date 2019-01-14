Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB517C078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p6so9166256wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ilJNqvImTlUTeR9XwNqyvbEo4FeDLuNWVthg2aUvItc=;
	b=HC8U0PI6xf+PWjGalZXe+Z1YwIrakiFajlVxS0XcxjKjVxJYxly4ABTxDjNVIcKSk9
	694sbiv1atZSDxCZD214Gv8W7ARKWCIA6JUeOUbtV+ppN/u7VoOBcygTGaAVLj+KF0/a
	rGS/xHbFVuIIbJiGMyOV+L38DVxV6T0qgRxxpcbA2WBm1DdtoPPiVkiA1DDEaE8QdYaH
	d5Cow0UKxEDNB11gYA4TQrh4Ay+vM2QInyhhATfUHSnDRqSYdiyeOnASh81E9r8WkJGa
	pOMw27bN2S0iKLy/flEPEYBlBbj+WvmTcgIYIa5OVZfDIquCaQIxZirdXJKs4bjoA4PK
	F8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ilJNqvImTlUTeR9XwNqyvbEo4FeDLuNWVthg2aUvItc=;
	b=F623KdP5Vsb/ItVgYmRkU80BChxhP9ZxvuAf40L7Nz6xo5eJwlXt2QMCaubnIwLVkO
	Kvwye6GKeKp6ZflGt4uyti6wMcAw6DQGOY3drif0hEzlN3+is2ADKlEZwd3GmhWJomqp
	FR/WHHo+cb2/88pU9KPYB7Ii+6MRB/x3ZD3RTit9uamBRzL9Ia9M2eQOsfNxZQ2W6CBi
	EfX5xss7VvBBBvCepIwYhMkycXGiLu2r//fGCT+M2hHeJzI1YfRHcdeVvh1phoMSglGO
	idk45cdHDz1ec5NjJqCNk1uIdQIXKKpJMLmZeE8BgkOh0pnNY3j3fms0kwYJjNA4VxNC
	yc3g==
X-Gm-Message-State: AJcUukef2G0w8hDEFAt5/NBijvYKp4cIhfRzDN+rTYTTP80m5p9zy6JH
	DJMgmvGORgzm4fNtiXI3VkqYJdUA
X-Google-Smtp-Source: ALg8bN7vvLTyktNDtXDSUrXFSSKaKI4rEfGkgrMO8swEM4BWUjPcmSlv+oviHctCvEPEFMGpG0+KGg==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr12285701wmh.101.1547478212740;
	Mon, 14 Jan 2019 07:03:32 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:04 +0100
Message-Id: <699c3aa571ce454e98d6fb405e1375a56aab1c3e.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 08/23] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:32 -0000

Note that only the most minimal necessary subset of mesa is built;
particularly we don't build any drivers as that is offloaded
to the GL implementation provided by the host.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0cc0a82de49..37ca5e39c2d 100644
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
@@ -62,6 +66,8 @@ DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
+# On the native builds we use host's dri drivers
+PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.17.1


