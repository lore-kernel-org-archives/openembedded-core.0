Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0C24C7CA97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:15:57 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id w4so26916448qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=giLkBZK8XwNFOcUncDWZYCEnSJJe83SpyxJFajRfhyw=;
	b=OxxDNSmH14D9bgl0HrGFOgtwJPIOHgAhkz+sRcqHZ0KQgtDraRSF5A1w7u9Yfto9t0
	8/iQn8pi8Tz402JR+oGLj76FELoVwMJF3tewmV+W8wg7M9bEhPKWx6vzXOCNHpIOGAub
	PVhi9CtcH946pyXsE1VSu+J6ta8hVnJpO0dynxlokaZimP5kCTpO8E1azwNQQqrglSc+
	w05CtaqcXEGEujXaIPf8VfI69Oynls/lp/FZA4xm97R1xLGjOguI7YDNwM/jmLDsahO8
	dp1YygltQw0ROWklmQs7sKxBWFLXnDCd+PBoD0HqTmIHsQLvJl6qo6+xq8zQjVytfQFz
	7JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=giLkBZK8XwNFOcUncDWZYCEnSJJe83SpyxJFajRfhyw=;
	b=fWe6riTBvN9tb0sd7cW41Aj2QNtxCSRJDwGqnfrBQ5yu4cp8k7LULGTxjLyCsyhhIJ
	iCtHF4OpfrhB2KCX2zT5q8eALfoWWxGKcB72KkzdPO+/5SM/XCv5PVf6QkTUBokvkS6Z
	VQxIpDesZZbrZBOhCDPlZ4XOSGEqMBrGWmfqRkTTTgG5u5VV0zCowDBI2D86efCgqUEG
	YfMfradblEJyH3O7JL7GMGfJuREwubBiIaY0PPeUvCfdyzbFfSudw8qGIwzYbeoaIE8Y
	Pv++O2K7Fu+4R9qO23joa6+Kk8+b8Qk4HZ8E6ncYbUNgO4sZmTvc2h3L5mYwuqOKt0Yd
	toqg==
X-Gm-Message-State: AHQUAuagp/GsbkGqkXdZeUoWT3V9g6nOZz9892owr5/e5tQNM/lfubPQ
	Y5F87VuKlFHuGeD7bjgKdjoV6WlXvhgNyQ==
X-Google-Smtp-Source: AHgI3IaRivplBLfiAFkPCOGeo6wuipxKMSb7C+CFascK104ChatzyZpsz1p5rydHQWE9wzpCzHsPJA==
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr25444363qvj.228.1550664958865;
	Wed, 20 Feb 2019 04:15:58 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	z190sm10839681qkb.9.2019.02.20.04.15.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 04:15:58 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 09:15:43 -0300
Message-Id: <20190220121544.9462-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v3 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 12:15:58 -0000
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
 meta/recipes-graphics/mesa/mesa.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b9870eb6ad..4c902b8156 100644
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
-DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.20.1


