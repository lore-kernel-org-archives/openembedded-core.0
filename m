Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5197C7C1F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:32 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b20so8272148lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EAn4a0eOdjBNPh7ilqhHIS1pEIqw1lkWbylGfjTujDA=;
	b=EQ5S//9lGEGq7Y79lOdvUOtZiZlCvPuTmV/DPs0dXcf6tZz+eEQEQMzlAZ6qCQpGIm
	ZGKmbXgOeGpudWzYSj9aFzoljyYl0Lt5y0S6GftFZ8iQePk/yIaPs7mNO6XSCYZMSZRF
	FbRhlDGp0mDo5rY1Oshiq/6+bC1NN8D/0UHSbuk4rTEovAUGRjrg2O/yCn/VfIk/f5UP
	CfVuZgSYxu+jslQWtOVFgWvuURD9/f2UiZb5URSUcteCmEMNBduUe+bzFT8goWBp1cJs
	7evpzHaOPrHsd+IhdK3SlxIsZBmGRW8CA4/yoXLCriV8wV5mq9pADDhTFmBzja/Tk6qr
	whmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EAn4a0eOdjBNPh7ilqhHIS1pEIqw1lkWbylGfjTujDA=;
	b=orljdlUqCVsMDoNu4aofDjbPPtLHqHCbBjDCUR8OiViZy4w3j45OtLsGrb4itqodhV
	XGVzEz4CHqGmbvUsmLhmQdegBj/7Z0mrKrmWiBFaD+XKUvNKICx0NPMD6fO89Xcnf62e
	53G3TTK2txNtc41T5hJUgSFi6aBfoUKMnJva0o8A85qGuWtPPYUVb1rrirqRxVw0R8KH
	ZX04ErRUIZWET2A2l6yE09biDK1bPsk990L2KpXpp7HZHEZa+Zl2ZEi83nO/5fubzU8f
	fO5reqxgUBtax5Oa+hNN+oRPS/ASKsvAkaCOEO6Y7fMg/fK/vWPbi+GvRIIflmXaE36i
	Q22g==
X-Gm-Message-State: AJcUukcg7iug/yizTuA58tdUIURyvWHnX33wM84XfKv7Atru+NEo0aRY
	QnDgx26XLPRSXLWVJoHrzSb8GC9e
X-Google-Smtp-Source: ALg8bN4qJ7ZrfhDcoW1urEJ92PfyU7zEE9PJ3FyiAZ/e2g6FQpM0hf69+No/So5juuDlrL733B4hRg==
X-Received: by 2002:a19:e01e:: with SMTP id x30mr10485178lfg.89.1547743232573; 
	Thu, 17 Jan 2019 08:40:32 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:52 +0100
Message-Id: <59a87676ce059776c9e14498b0a0dfaed4d8ddff.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 07/27] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:32 -0000

Note that only the most minimal necessary subset of mesa is built;
particularly we don't build any drivers as that is offloaded
to the GL implementation provided by the host.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 06c47e6dd41..ea72d78a32c 100644
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


