Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 171746057A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:40:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so43351151wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hGbLP9YznEzKnEIOIsJrrnjGXovINEDYIXxVswzjD5Y=;
	b=gmhgtoDNV+DyNKjqZglqUfvB8yBUrx3z9dILrjuLWD5nIUGtn849HgAUzwYs5ASz9h
	yPTAML6OZ9kTvvQ6OLUnuYyKaF8y2I2+FnBqEVofR7PhN2TM33cjtVBQTXqkLa5WpVdX
	cu6sRNU5XIU4XrZjMf9IuHWMAEbB/CO/xB3m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hGbLP9YznEzKnEIOIsJrrnjGXovINEDYIXxVswzjD5Y=;
	b=Ng1wrmD3jyE1ghOFZtw8wCpgktQeK9pT+preOdCidYX5BXwP1T1Su3cF9jCUUOUOMs
	C0uOrM3fhMM45PV5Ebd3K69/i0bK8aZhE82PLaLQV55Nfox1yqpU8DTnHFATjXsaavo+
	1DD4rbllLkhpGov5FeUF/aV8kwx/AKIurlbTwIVWXQOZ3SXzaETY+eCMGcY6Pjua7tFX
	IfkQixeHjEPGjIDsrJ5woOEcJM6Ji742LcdPFhm8T9RiaT0RvSJLdSasGi5Vy5LqTTFQ
	SOx9o3fw72onDlmy4cYukhNwCWfhamggaUWlLYczGLqtOmswibuaU40B9wHgEsWME5VV
	1FXQ==
X-Gm-Message-State: AG10YOSPLYNqAI+rQG3J+FzYznqSz570L6QFGvQ2gketw64LAtuYolE7f8Wny8Aw1W3Ht0I1
X-Received: by 10.194.117.134 with SMTP id ke6mr18013513wjb.94.1454704817934; 
	Fri, 05 Feb 2016 12:40:17 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	os7sm17465236wjc.18.2016.02.05.12.40.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 12:40:17 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 20:40:04 +0000
Message-Id: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 20:40:22 -0000

* update SRC_URI and checksum.
* use libcrypto for sha1 functions. In upstream commit a24bdce4, support for
  SHA-1 was copied from xserver repo, so let's use the same default for
  --with-sha1 option that we use in xserver recipe in OE core.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb} | 0
 meta/recipes-graphics/mesa/mesa.inc                                 | 6 ++++--
 meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb}       | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb} (66%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9b316e1..1ad4400 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3d
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev openssl"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
@@ -22,7 +22,9 @@ inherit autotools pkgconfig pythonnative gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--enable-shared-glapi"
+EXTRA_OECONF = "--enable-shared-glapi \
+                --with-sha1=libcrypto \
+"
 
 PACKAGECONFIG ??= "egl gles dri \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
diff --git a/meta/recipes-graphics/mesa/mesa_10.6.3.bb b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
similarity index 66%
rename from meta/recipes-graphics/mesa/mesa_10.6.3.bb
rename to meta/recipes-graphics/mesa/mesa_11.1.1.bb
index 5da56ad..5d73feb 100644
--- a/meta/recipes-graphics/mesa/mesa_10.6.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
@@ -1,9 +1,9 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/older-versions/10.x/${PV}/mesa-${PV}.tar.xz"
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
-SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
+SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
+SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.7.0


