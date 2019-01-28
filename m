Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 69CC67C479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so13750209wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nWdx6acJkzZgwgWHe7Df0fM1GzSY0TTKZI1mDZZLByY=;
	b=gziTE9oc/6TvcbvW2VW3a8FFjccSyh2VHcRjK7Rw1Qp6GROx9+WlHzJEohBGxfS9qo
	RWJxpp52XRacSVflTXIWxifQDCZ84zGvdYxHxusSouOtgJ0US6k1JZZutNeJAswH9VFU
	TC2tp9eC++99G4V2rAEr3zM7MlCwgGmZuiVo8iGS6y47O07CIJ8m8e+j2Jc4JZuNEfUC
	yBSgcg8yHFAcF/G84QTvTLS5DvBZmcxRBnbRWFtZuP2YF2lIrhX2Xebt8sI9wFa0si9i
	CIbLi4O40J83hrqqb+Pmq3/HnfuqvdQVIzB07WS02ODNiMbagijblWMPRTaHj1BCAkjf
	4KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nWdx6acJkzZgwgWHe7Df0fM1GzSY0TTKZI1mDZZLByY=;
	b=lY7Lhw94cP962IrHiYgxKHkJY4LQS0vwAvcUXkXkV4FhwKt8WGB64o1Uy/Y6ZmLKXb
	vHHQWDifIvsG32aZh9ZyWDj+dkounv9gqRxFdVFp0pRb0JrLWUsJEGmQwSwsGacSyhZd
	udq0MfPvitYGq6pi1SBGQh6vbl6Ms95ZH9M4kJcRZJAQCQb5UjxUV/e0iu8PlodFm0jP
	uw+QOTEUBlgoGe+DPP4BAoDSDxqoOx+a/RSM0gsUeC+1Qim+jhSM3EP4qv/zmP4/J3nE
	GKpXpZkqiEM4iYYA2Jo0vRGCYJ3uswtclnIesh1Jfrm+738IQb4Ib0M0KFKExT5Kkd4L
	OfxA==
X-Gm-Message-State: AJcUukdb2JIYOu+PMWdD5ZB4KVZVqpasQSAyrwB9NC8ad+M35XissIdu
	H2F9Z+fwL5DN6LAYr0MQndMc9l4R
X-Google-Smtp-Source: ALg8bN5fwhL7youZSR4B4C9uaUlkSCd+9Hym2jUPFKpQnNAGDPJTU6oqXCh9hZ+0MYBVcsntOgx3gg==
X-Received: by 2002:a1c:9cce:: with SMTP id
	f197mr17068678wme.135.1548679634786; 
	Mon, 28 Jan 2019 04:47:14 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:38 +0100
Message-Id: <d66973189dbe77babb66160f19bed7193c38d357.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 07/24] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:14 -0000

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


