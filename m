Return-Path: <zoltan.kuscsik@solution57.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id CAFB07F27C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 14:12:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id m10so62705687edv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=solution57.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=te3+yZCtmE44A3Cxrbp8M9wnRn5Ro7JZgxv7+xSlBuM=;
	b=aYRRowvcHB0KfjyI2p/N08kjqpGCHWySIRAjyyfVOV/+wTXQxWq1cQjn9syrvJyAww
	xl6k8AVgaLJaM/CH2VMwpdNjNBLbMnkV/QmtVu/da7cE2IcC1Ms0lNjBG+EhBfpIL4JA
	11ufVIHxAjIdKBXR7vafbiSH0S6f0moZKR3HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=te3+yZCtmE44A3Cxrbp8M9wnRn5Ro7JZgxv7+xSlBuM=;
	b=ZhlzkvTvMxtAeIeWERkguhsw1R0dB41KBYLJvLTkwZ72btlnh4hP0hc1lVjIHz3CzM
	GV5FkPSw9KzAkrfFDCdZxHzsIQWn34cB6crgGwPuVdOZmZEEHCK85/pyseIhsUOXHYmg
	0s017UOT25PNkOIa6CwBUhZmWa6mtnPjvP4JS7UwJmTMRc8h4knh84WNAwVgzYUTDWxS
	HBNdpanYZCQLR5rs7b9UsEG+3azXgTbG+jNU868ov1OXr9HIJAHTRKPZQu8pwPYEmve7
	A1gVoQYZBY7K/GQVF2xMFmpUWvZkX2o7pMmMkrrVzaZZHMnZWTdZxXZnJl4hPX+23sDo
	4EOQ==
X-Gm-Message-State: APjAAAUzNB74RSvRMA86guW3hGU0yeW8cWtOdh4pZYlGTeaNvzHI9qwD
	8kUHatfF3EoGjDv2cUX0+2JnLoZztFw=
X-Google-Smtp-Source: APXvYqx7izbHh7VYdRJMX++su47hxU3keVsg0m6umPUBtR7jQJvRRmZ+XtCFEKVZshdGwNLTdV3cQg==
X-Received: by 2002:a50:b803:: with SMTP id j3mr99380361ede.208.1564495967290; 
	Tue, 30 Jul 2019 07:12:47 -0700 (PDT)
Received: from hydra.zetee.io ([85.191.217.70])
	by smtp.gmail.com with ESMTPSA id
	l50sm16735295edb.77.2019.07.30.07.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jul 2019 07:12:46 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@solution57.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 16:12:41 +0200
Message-Id: <20190730141241.493-1-zoltan.kuscsik@solution57.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] kmscube: update to latest revision
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
X-List-Received-Date: Tue, 30 Jul 2019 14:12:48 -0000
Content-Transfer-Encoding: 8bit

Switch to gitlab URL, since previos location is now a mirror

Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@solution57.com>
---
 ...bo_map-_unmap-and-use-it-or-avoid-it.patch | 25 ++++++++++---------
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  4 +--
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
index 611e541598..a7a08f14e6 100644
--- a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
@@ -1,7 +1,7 @@
-From 761bf993ca55095f46380c0238583791c1797295 Mon Sep 17 00:00:00 2001
+From a91c588b5a4122506e7fe949c37d530621bdd997 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
 Date: Tue, 11 Jul 2017 14:50:37 -0500
-Subject: [PATCH kmscube] Detect gst_bo_map/_unmap and use it (or avoid it)
+Subject: [PATCH] Detect gst_bo_map/_unmap and use it (or avoid it)
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -18,6 +18,7 @@ Cc: Rob Clark <robdclark@gmail.com>
 Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
 
 Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2017-July/163020.html]
+Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@solution57.com>
 ---
  Makefile.am   | 5 ++++-
  configure.ac  | 3 +++
@@ -26,7 +27,7 @@ Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2017
  4 files changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index a36087d..ab4adbf 100644
+index ba064e4..3a0a50b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -43,7 +43,6 @@ kmscube_SOURCES = \
@@ -37,16 +38,16 @@ index a36087d..ab4adbf 100644
  	drm-atomic.c \
  	drm-common.c \
  	drm-common.h \
-@@ -59,3 +58,7 @@ kmscube_LDADD += $(GST_LIBS)
- kmscube_CFLAGS += $(GST_CFLAGS)
- kmscube_SOURCES += cube-video.c gst-decoder.c
- endif
+@@ -68,3 +67,7 @@ texturator_SOURCES = \
+ 	drm-common.c \
+ 	drm-legacy.c \
+ 	texturator.c
 +
 +if ENABLE_GBM_MAP
 +kmscube_SOURCES += cube-tex.c
 +endif
 diff --git a/configure.ac b/configure.ac
-index 8397f7b..c7f1f4d 100644
+index 6be6541..3d20121 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -49,5 +49,8 @@ if test "x$HAVE_GST" = "xyes"; then
@@ -59,7 +60,7 @@ index 8397f7b..c7f1f4d 100644
  AC_CONFIG_FILES([Makefile])
  AC_OUTPUT
 diff --git a/gst-decoder.c b/gst-decoder.c
-index 2d6d581..b84980e 100644
+index 5431014..0aa7a55 100644
 --- a/gst-decoder.c
 +++ b/gst-decoder.c
 @@ -332,6 +332,7 @@ set_last_frame(struct decoder *dec, EGLImage frame, GstSample *samp)
@@ -96,10 +97,10 @@ index 2d6d581..b84980e 100644
  	if (dmabuf_fd < 0) {
  		GST_ERROR("could not obtain DMABUF FD");
 diff --git a/kmscube.c b/kmscube.c
-index 3a2c4dd..276dc55 100644
+index 81803be..e93da67 100644
 --- a/kmscube.c
 +++ b/kmscube.c
-@@ -148,7 +148,11 @@ int main(int argc, char *argv[])
+@@ -166,7 +166,11 @@ int main(int argc, char *argv[])
  	else if (mode == VIDEO)
  		egl = init_cube_video(gbm, video, samples);
  	else
@@ -112,5 +113,5 @@ index 3a2c4dd..276dc55 100644
  	if (!egl) {
  		printf("failed to initialize EGL\n");
 -- 
-2.7.4
+2.22.0
 
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 513148f9e0..fd90d20172 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,8 +6,8 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "485b385e966a63cecc143765d112d267b299ffe5"
-SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
+SRCREV = "e888ea1d233b2639b87a68e099d18d4e919905df"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.22.0


