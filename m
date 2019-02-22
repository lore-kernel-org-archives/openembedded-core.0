Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9243E7CB6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:09:47 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id p15so1180809qkl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=NYnMRZoRxjvcMyjwBqlBGhaWb1QkBbRo96oCV5TgmPM=;
	b=oonsFpkW7gHxc+J54+baUT/0DOMliBiVsO2iVYlqF8w4B7BjHBOBWDdwTMpYHMM9g7
	YjE1RzSTn2eXGmpjjgAdnYveUx/Ak3xZ5+9Cp2vIaOG1tEsIADZCy0S433ZOqvHj+LKR
	LVgW9qDQCaezilZGWqcBuqcWt2BJUanbeAHNO3u+QNFYjWvNl+YpnGNRV7hOstbOztsl
	ex/kqs9Jg9kaG2jndV5c2TZH6B1vhX3Q15Bi/fAr0yZysGYIK4oWfugxPhJpkGAAgbcS
	dhfWwbatQxmkTM47MlSCN3DGl6DuKv1W5gH97GLSzfxMp7R0Pn5VwePOs1kXZcNsbdD0
	agrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=NYnMRZoRxjvcMyjwBqlBGhaWb1QkBbRo96oCV5TgmPM=;
	b=R1qPM5U+11QMbpsLyCXOIbGwmADMlQadsJb5iCI9UJRJWsumbO70hv8XuFcmzc2tL8
	B/q2ROcXiZcyOd7QXS8cpgcnz4y1uaWIfyAnPU/JlLS3x5quEoo0eH9rXMJLMZUL0XyP
	SUdcR31aH5tJZ6yOgJwO+LqmZsZ5LDdHQLMoapvELKGpQcd1XCl3K3jWV9/51KfBljXO
	uMjzAOZ0WPlmUk71oEFzPKpGddog2JvwkDUIw0GLir2aFVyVxCwhNelcVGPsmzhASaPx
	O2Ziz3dgV1x3BRhyTmAB5mO3zvkYL+t1RRRjxzSmrvDLibqwHNwPKwhpfSNq7upA2TZa
	s6xg==
X-Gm-Message-State: AHQUAuZyjEJMa6JSmmskkzi6BCUWc0QVuTBOTkzEnVgb5ltUiFVAna/O
	WrL/5oRZ0szPleWqcV3gvQC+f03+DmqIdg==
X-Google-Smtp-Source: AHgI3IZMG0ks6oEU9JLOJTY+KZeBb1eUjl95ve6GtVy/626+WbkV3V/owqfQ4RdXL7/CwsAXQnJ4SA==
X-Received: by 2002:a37:98d:: with SMTP id 135mr3142514qkj.333.1550844588445; 
	Fri, 22 Feb 2019 06:09:48 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id e65sm842867qtb.51.2019.02.22.06.09.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:09:47 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 11:09:30 -0300
Message-Id: <20190222140931.13247-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222140931.13247-1-fabio.berton@ossystems.com.br>
References: <20190222140931.13247-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v5 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Fri, 22 Feb 2019 14:09:48 -0000
Content-Transfer-Encoding: 8bit

Instead of using a native specific packageconfig option, we now set
the swrast as the supported driver.

Currently the native version does not build any dri drivers at all.
This is intentional: mesa-native is used only by virgl, so was made
the most minimal possible configuration for mesa-native so that a)
virgl works; and b) build time is as short as possible.

There are two swrast drivers, one dri-based, another gallium-based.
Autotools lets you build both, meson forces you to choose.
Thus DRIDRIVERS = "swrast" is only set for _native, as for _target
we get the gallium driver instead.

See discussion here [1]

Based on https://patchwork.openembedded.org/patch/158748/

[1] https://patchwork.openembedded.org/patch/158806/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0ce7e4d626..b2c6395a31 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri-native egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
@@ -61,13 +61,12 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS = "swrast"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
 DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.20.1


