Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD9EB7E6B7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:26:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so5094634wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5MmQquINSrWHkPya0+WvjwNYbAKvweAq88tBk7HB1gM=;
	b=BKBAwdHreLw+sdh4xaXa2ulB4+lRfEKaPJOT1zW/KuYaQkm3tl6Kf2X1cMDf15/Onf
	6kjNOdS3GI2f+NGqNq6WIp6jKD4CgSLfIcnR5CGaoY+XdUUPiXuUFhbXl/m4EOlYKL0M
	HAroPu/R/2uFit88ybH41uck6SktyCNnLgHNdHGIesnWkJmN86ovtAU5kss+sZaix5cJ
	Xn/Tgkneu1aAym3Q7O/KsDPoSlOimHDl9Gj+EkKbek8SCiq3IAm4LhXvxJqv3vKDmo2E
	Tjn9xZ+b00BUrC4qP9YVkqdPTbniC3JYQPxpnwJ79/Ytt4tqmWB1GIwpTk5TZfuhDGVd
	DSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5MmQquINSrWHkPya0+WvjwNYbAKvweAq88tBk7HB1gM=;
	b=mIGZ5keOGA85vJv34CoCLcwcDzLtE0D3qmoNlRRkQcVo6glTr07+zB/Z1fkErBHqhG
	aadNh438aJqL3V6E2RMkvfkd/zRbTFn0jXYoipFYH7VHbMvUQEagkgkUCIUEyAe/BM7O
	VpBK/lgjYkHveuKV7FeOFGOG1h+RIO6kIdXGtRWcTqUankczzxxyNNFJ6+MocD2yI6Sk
	Dooqm+a0ognrrtWkAjeBM5PEktnU1nSmQ1JGfcyuDjjffrKxZM99iypNJZbmE3oyOtJY
	QJT108KJ/WkHcOycLp1yxRurbyPoWp6ciHArSW7kDIgPsT2ibXmT5vjwR2a2KvdqUyKC
	qN4g==
X-Gm-Message-State: APjAAAVSIclxPxBe03AGAo2xetiHbbQaUv6bRprBpPtv4KuksHUytpGR
	e5vvQJgx/Un0yoCkXxbpzmuyGjK1WXU=
X-Google-Smtp-Source: APXvYqy0BhVBvV9qVrz0HWI1TBILChqJtVT9jKXNXnzZWmtT7T5Y0K/9k2OjF5K4FMZQ5OSpoujoXQ==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr1028366wrs.281.1559388392461; 
	Sat, 01 Jun 2019 04:26:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm16270606wra.58.2019.06.01.04.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 04:26:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 13:26:23 +0200
Message-Id: <20190601112623.80424-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601112623.80424-1-alex.kanavin@gmail.com>
References: <20190601112623.80424-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] mesa-demos: update to 8.4.0
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
X-List-Received-Date: Sat, 01 Jun 2019 11:26:33 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0007-Install-few-more-test-programs.patch | 26 +++++++++----------
 ...w-missing-.glsl-.vert-.frag-files-to.patch | 20 +++++++-------
 ...perf-Install-.glsl-.vert-.frag-files.patch | 20 +++++++-------
 ...esa-demos_8.3.0.bb => mesa-demos_8.4.0.bb} |  6 ++---
 4 files changed, 33 insertions(+), 39 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-demos_8.3.0.bb => mesa-demos_8.4.0.bb} (92%)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch b/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
index 6b676cdd200..b27d9eafa50 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
@@ -1,4 +1,4 @@
-From c59e286fa4e818ca015dd40e4725636309970ea8 Mon Sep 17 00:00:00 2001
+From 2e0367a941445a862ab99c54ec85d1357d0f73c0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 10 Jul 2014 14:30:52 +0200
 Subject: [PATCH] Install few more test programs
@@ -8,27 +8,28 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- src/egl/opengl/Makefile.am    |  2 +-
- src/egl/opengles1/Makefile.am | 10 ++++------
- src/egl/openvg/Makefile.am    |  2 +-
- 3 files changed, 6 insertions(+), 8 deletions(-)
+ src/egl/opengl/Makefile.am | 3 +--
+ src/egl/openvg/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
-index fe7faa9..3e48141 100644
+index 6d184ff6..ab09d028 100644
 --- a/src/egl/opengl/Makefile.am
 +++ b/src/egl/opengl/Makefile.am
-@@ -50,7 +50,7 @@ endif
- endif
+@@ -57,8 +57,7 @@ endif
  
  if HAVE_EGL
+ bin_PROGRAMS = \
+-	eglinfo
 -noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	eglinfo \
++	eglinfo \
  	peglgears \
  	$(EGL_DRM_DEMOS) \
+ 	$(EGL_X11_DEMOS) \
 diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am
-index b0f1212..5fd1cf8 100644
+index b0f1212f..5fd1cf83 100644
 --- a/src/egl/openvg/Makefile.am
 +++ b/src/egl/openvg/Makefile.am
 @@ -49,7 +49,7 @@ endif
@@ -40,6 +41,3 @@ index b0f1212..5fd1cf8 100644
  	$(EGL_X11_DEMOS)
  endif
  endif
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch b/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
index a6085754d22..a6d168175ff 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
@@ -1,12 +1,13 @@
-From 0b6f95f9b8ece22e9856c150e4be29fd86eaf546 Mon Sep 17 00:00:00 2001
+From 894add34c2b5e6b4ccc78996bf681d7ec7bc9e36 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 10 Jul 2014 14:29:27 +0200
-Subject: [PATCH 8/9] glsl, perf: Add few missing .glsl, .vert, .frag files to
+Subject: [PATCH] glsl, perf: Add few missing .glsl, .vert, .frag files to
  EXTRA_DATA
 
 Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
  src/fpglsl/Makefile.am |  2 ++
  src/glsl/Makefile.am   | 10 ++++++++--
@@ -15,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  4 files changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
-index 47c1039..fd43c91 100644
+index 47c1039f..fd43c919 100644
 --- a/src/fpglsl/Makefile.am
 +++ b/src/fpglsl/Makefile.am
 @@ -39,10 +39,12 @@ noinst_PROGRAMS = \
@@ -32,7 +33,7 @@ index 47c1039..fd43c91 100644
  	mov-imm.glsl \
  	simpleif.glsl \
 diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
-index 4faa8db..079a29d 100644
+index 4faa8dbf..079a29d8 100644
 --- a/src/glsl/Makefile.am
 +++ b/src/glsl/Makefile.am
 @@ -37,7 +37,7 @@ AM_LDFLAGS = \
@@ -71,13 +72,13 @@ index 4faa8db..079a29d 100644
 +	skinning.vert \
  	toyball.shtest
 diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
-index 5363c58..c5cca8d 100644
+index f0031fea..60069396 100644
 --- a/src/perf/Makefile.am
 +++ b/src/perf/Makefile.am
-@@ -57,3 +57,9 @@ bin_PROGRAMS = \
- endif
+@@ -59,3 +59,9 @@ endif
  
  glslstateschange_LDADD = libperf.la ../util/libutil.la
+ glsl_compile_time_LDADD = ../util/libutil.la
 +
 +EXTRA_DIST = \
 +	glslstateschange1.frag \
@@ -85,7 +86,7 @@ index 5363c58..c5cca8d 100644
 +	glslstateschange2.frag \
 +	glslstateschange2.vert
 diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
-index 4a85ed4..48b08f4 100644
+index 4a85ed40..48b08f48 100644
 --- a/src/vpglsl/Makefile.am
 +++ b/src/vpglsl/Makefile.am
 @@ -44,6 +44,7 @@ EXTRA_DIST = \
@@ -96,6 +97,3 @@ index 4a85ed4..48b08f4 100644
  	mov.glsl \
  	nestedifs.glsl \
  	nestedswizzle.glsl \
--- 
-2.0.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
index 1262dee2379..8a98ba60d11 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
@@ -1,10 +1,11 @@
-From c8c3de5417d6b6c7d7579c528c0cab718f4bfdb6 Mon Sep 17 00:00:00 2001
+From 477ab6d90a17d8e4d3935be6ce8b8e154db0e3e5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 10 Jul 2014 14:48:12 +0200
-Subject: [PATCH 9/9] glsl, perf: Install .glsl, .vert, .frag files
+Subject: [PATCH] glsl, perf: Install .glsl, .vert, .frag files
 
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
  src/fpglsl/Makefile.am | 3 ++-
  src/glsl/Makefile.am   | 3 ++-
@@ -13,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  4 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
-index fd43c91..2bf51de 100644
+index fd43c919..2bf51de4 100644
 --- a/src/fpglsl/Makefile.am
 +++ b/src/fpglsl/Makefile.am
 @@ -38,7 +38,8 @@ noinst_PROGRAMS = \
@@ -27,7 +28,7 @@ index fd43c91..2bf51de 100644
  	dowhile2.glsl \
  	dowhile.glsl \
 diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
-index 079a29d..f66ec29 100644
+index 079a29d8..f66ec299 100644
 --- a/src/glsl/Makefile.am
 +++ b/src/glsl/Makefile.am
 @@ -118,7 +118,8 @@ vert_or_frag_only_LDADD = ../util/libutil.la
@@ -41,12 +42,12 @@ index 079a29d..f66ec29 100644
  	CH06-brick.vert \
  	CH11-bumpmap.frag \
 diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
-index c5cca8d..140256d 100644
+index 60069396..469bdf45 100644
 --- a/src/perf/Makefile.am
 +++ b/src/perf/Makefile.am
-@@ -58,7 +58,8 @@ endif
- 
+@@ -60,7 +60,8 @@ endif
  glslstateschange_LDADD = libperf.la ../util/libutil.la
+ glsl_compile_time_LDADD = ../util/libutil.la
  
 -EXTRA_DIST = \
 +demosdatadir=$(datadir)/$(PACKAGE)/
@@ -55,7 +56,7 @@ index c5cca8d..140256d 100644
  	glslstateschange1.vert \
  	glslstateschange2.frag \
 diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
-index 48b08f4..5526867 100644
+index 48b08f48..55268675 100644
 --- a/src/vpglsl/Makefile.am
 +++ b/src/vpglsl/Makefile.am
 @@ -38,7 +38,8 @@ noinst_PROGRAMS = \
@@ -68,6 +69,3 @@ index 48b08f4..5526867 100644
  	for.glsl \
  	func.glsl \
  	func2.glsl \
--- 
-2.0.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
similarity index 92%
rename from meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
rename to meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
index bae3b18bea5..129a47df48d 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/demos/${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
            file://0001-mesa-demos-Add-missing-data-files.patch \
            file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
            file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
@@ -19,8 +19,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/demos/${PV}/${BPN}-${PV}.tar.bz2
            file://0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch \
            file://0013-only-build-GLX-demos-if-needed.patch \
            "
-SRC_URI[md5sum] = "628e75c23c17394f11a316c36f8e4164"
-SRC_URI[sha256sum] = "c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b3e0bef"
+SRC_URI[md5sum] = "6b65a02622765522176d00f553086fa3"
+SRC_URI[sha256sum] = "01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d"
 
 inherit autotools pkgconfig distro_features_check
 # depends on virtual/egl, virtual/libgl ...
-- 
2.17.1


