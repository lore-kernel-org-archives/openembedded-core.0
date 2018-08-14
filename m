Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 41A9E78FF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:53:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r16-v6so16784846wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oyAn7UjMbeb2jUaMPcpE7HyPs4x9G0JAeLamBvuvSvY=;
	b=mXR1dVxugdb/E19/p5T7UOJqP1ChhYYfz4bghvFTDrnIZZOkBAroNm8nxchBlr/x/N
	qVp+/2Z8jERqSVo0kPPtwYf2lI+JOXgeu93UvvwrroBil3HxPHnCZe38gpV9HDHmBj+1
	o7ZAQjEAZaJMhGC/uycd3c/hah0itEKNaK7SLnTzPnYTDGZbpUJzUgD5oy6ES1/Er0EF
	Tga6yO1ZsWH8QAMy9l0P8SmeaRu53atSbU/6bJj6qnZe2JBHKmZhs34iGjTUWR1/ayAo
	+uPk2I0awYZMaBGwr71VLr0zGgYLNnSixl9LhQMIS2p7UmTym1oKbc41ExRFkmAxPFNn
	cm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oyAn7UjMbeb2jUaMPcpE7HyPs4x9G0JAeLamBvuvSvY=;
	b=qdrDoZfcQ4zI05X9LflihHoPYo28Qb/uf7xFc6Q4a1Pe0Qa1t5A+p0LFpFzhtbyj3X
	A2FWeytz2aQjjsSIkruZCTXgCUT8e4w09QEjiTZQ/euxUvoBicJZ8RjSGBX+evGgOHNT
	Qn1Qv4itiR+G/cPXoq0NxjRHckHzZGdzUL77y5CBGT9CWFjaGZvj3kDSIXGWvVMoZoRD
	3bU3X015q/E+99lm4RkI8PZTwXpTCVYmWVaM7N0uEGnq+81ChrptBLAJrieoA2eSL8PA
	Q7Kq0ItIreEKTxnBc5FKGADVZf/1g/grZ4kA1BYlotqeDjrmQSyNKkWncGniGzbP+pwh
	TNdg==
X-Gm-Message-State: AOUpUlH1xyucFdBU7CRqjJ8Lu/XSOv2TZu3zdX2yMFJQGze3sfVojYgt
	9gZ4RGEH07WfBX3jQhOfSxShpi0+
X-Google-Smtp-Source: AA+uWPy6INM8yySLDljO4rUuQhnU7DaKaDp7PhtECtKPDIlml7YRj8LbX/TwkgbNsTcH9lniA9wzRw==
X-Received: by 2002:adf:a634:: with SMTP id
	k49-v6mr12666139wrc.181.1534243987713; 
	Tue, 14 Aug 2018 03:53:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm13984976wrt.56.2018.08.14.03.53.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Aug 2018 03:53:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 10:53:11 +0000
Message-Id: <20180814105311.6580-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] weston: add dependency on virtual/libgbm for kms PACKAGECONFIG
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
X-List-Received-Date: Tue, 14 Aug 2018 10:53:07 -0000

* gbm is checked in configure.ac:

AC_ARG_ENABLE(drm-compositor, [  --enable-drm-compositor],,
              enable_drm_compositor=yes)
AM_CONDITIONAL(ENABLE_DRM_COMPOSITOR, test x$enable_drm_compositor = xyes)
if test x$enable_drm_compositor = xyes; then
  AC_DEFINE([BUILD_DRM_COMPOSITOR], [1], [Build the DRM compositor])
  PKG_CHECK_MODULES(DRM_COMPOSITOR, [libudev >= 136 libdrm >= 2.4.30 gbm mtdev >= 1.1.0])
  PKG_CHECK_MODULES(DRM_COMPOSITOR_GBM, [gbm >= 10.2],
                    [AC_DEFINE([HAVE_GBM_FD_IMPORT], 1, [gbm supports dmabuf import])],
                    [AC_MSG_WARN([gbm does not support dmabuf import, will omit that capability])])
fi

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/wayland/weston_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_4.0.0.bb b/meta/recipes-graphics/wayland/weston_4.0.0.bb
index e78b0d9194..3d192cf00a 100644
--- a/meta/recipes-graphics/wayland/weston_4.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_4.0.0.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
 # Weston on X11
-- 
2.17.1


