Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4113.1588240714637725112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MUm/oz83;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id i10so6080097wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1Yxw17M8hqqs+CXnfkpT+zFPxUR+w/S8ZzhDOGYQss=;
        b=MUm/oz83XALStaWi5AgpD4pKr8jDPXFNLgXL4ECBcHJqbdeZ4zXfjJ+P0c8/MFUzJF
         +sjimwxyLiltE3pbrl7Aq/cE33dPVBLrG6QNbZOcOkMc4/mCmjM7/Rrj21Ug8PL8rrT6
         Vkz3S9gXQdxv9nnDsk5A42+yoKx//qq47YKFopk+8NBA/uMCbKgo7xCIgTGeACRJDRob
         uYMK0VN4JEaLKWASmATvmDMz6dHKajeJSW7F18HnRRMruMNBCiM9HhPmEExf3qmN8pmh
         vcZXoRqJwxiCckYuwUfWVG84C2/Y8JcEJaHcwt5xEeF2gw9ctAIGfPMNWjI8LEr+jl6x
         CXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1Yxw17M8hqqs+CXnfkpT+zFPxUR+w/S8ZzhDOGYQss=;
        b=J4lM9N0tzXOD50oWL0uZs0Popxu9H6LEGhOKuoF18S1BrogCuq9Q8HGtWl4XeYkXup
         BJTZEgsx/0NLJfd2lPpTJ8uzapc6LXyyFQVNI6M5cgNRleHkNzuPiHDF7Up6sL2XghaM
         VYh5bkj7q4KkrvCGcmcR3OQNnKgMyUCxDI4z7OGZmJlDfMHSeWKIlFf820JO6PrgFYDZ
         OG2WSknv2yzwf8vpZPXaAOdIuM2f+7L8xkEo5+PwIEfoiXdIdDPW8WImUeaM8jBItkfi
         eSrtwoOacF749VWuq81e9ysaJsffSVzdvdrSp0iswkGCp1ycmOFP0bl0Q9falsUFwDZG
         jUTQ==
X-Gm-Message-State: AGi0PuYA6AcRgTcoMNsNXss2x3oS6wIkbUqu7yg3AGMZLJ35z4O65aqt
	34HyP0cwm61PEbWq70cjFvFoEjFL
X-Google-Smtp-Source: APiQypIaNJIaUD07KDijLresPyjBtajegUuCwLh66VK9dLCNEtZm5ooxEyh4YwWRYzJ+LkB4+HRFYw==
X-Received: by 2002:adf:f508:: with SMTP id q8mr3164307wro.117.1588240712899;
        Thu, 30 Apr 2020 02:58:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/17] kmscube: update to latest commit
Date: Thu, 30 Apr 2020 11:58:03 +0200
Message-Id: <20200430095815.2824-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop a mali-specific patch that was never ported to meson or accepted
upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...bo_map-_unmap-and-use-it-or-avoid-it.patch | 117 ------------------
 meta/recipes-graphics/kmscube/kmscube_git.bb  |   5 +-
 2 files changed, 2 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
deleted file mode 100644
index a7a08f14e6..0000000000
--- a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From a91c588b5a4122506e7fe949c37d530621bdd997 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Tue, 11 Jul 2017 14:50:37 -0500
-Subject: [PATCH] Detect gst_bo_map/_unmap and use it (or avoid it)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Those functions are not available on libMali, thus breaking
-builds and creating havoc.
-
-Removing the specific parts of the code that deal with
-gbm_bo_map() and gbm_bo_unmap() renders the kmscube utility
-a little less useful, but still valuable.
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Cc: Rob Clark <robdclark@gmail.com>
-Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
-
-Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2017-July/163020.html]
-Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@solution57.com>
----
- Makefile.am   | 5 ++++-
- configure.ac  | 3 +++
- gst-decoder.c | 7 ++++++-
- kmscube.c     | 4 ++++
- 4 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ba064e4..3a0a50b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -43,7 +43,6 @@ kmscube_SOURCES = \
- 	common.c \
- 	common.h \
- 	cube-smooth.c \
--	cube-tex.c \
- 	drm-atomic.c \
- 	drm-common.c \
- 	drm-common.h \
-@@ -68,3 +67,7 @@ texturator_SOURCES = \
- 	drm-common.c \
- 	drm-legacy.c \
- 	texturator.c
-+
-+if ENABLE_GBM_MAP
-+kmscube_SOURCES += cube-tex.c
-+endif
-diff --git a/configure.ac b/configure.ac
-index 6be6541..3d20121 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,5 +49,8 @@ if test "x$HAVE_GST" = "xyes"; then
- fi
- AM_CONDITIONAL(ENABLE_GST, [test "x$HAVE_GST" = "xyes"])
- 
-+AC_CHECK_LIB([gbm], [gbm_bo_map], [HAVE_GBM_BO_MAP=yes], [])
-+AM_CONDITIONAL(ENABLE_GBM_MAP, [test "x$HAVE_GBM_BO_MAP" = "xyes"])
-+
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
-diff --git a/gst-decoder.c b/gst-decoder.c
-index 5431014..0aa7a55 100644
---- a/gst-decoder.c
-+++ b/gst-decoder.c
-@@ -332,6 +332,7 @@ set_last_frame(struct decoder *dec, EGLImage frame, GstSample *samp)
- 	dec->last_samp = samp;
- }
- 
-+#if HAVE_GBM_BO_MAP
- // TODO this could probably be a helper re-used by cube-tex:
- static int
- buf_to_fd(const struct gbm *gbm, int size, void *ptr)
-@@ -357,6 +358,7 @@ buf_to_fd(const struct gbm *gbm, int size, void *ptr)
- 
- 	return fd;
- }
-+#endif
- 
- static EGLImage
- buffer_to_image(struct decoder *dec, GstBuffer *buf)
-@@ -410,12 +412,15 @@ buffer_to_image(struct decoder *dec, GstBuffer *buf)
- 
- 	if (is_dmabuf_mem) {
- 		dmabuf_fd = dup(gst_dmabuf_memory_get_fd(mem));
--	} else {
-+	}
-+#if HAVE_GBM_BO_MAP
-+	else {
- 		GstMapInfo map_info;
- 		gst_buffer_map(buf, &map_info, GST_MAP_READ);
- 		dmabuf_fd = buf_to_fd(dec->gbm, map_info.size, map_info.data);
- 		gst_buffer_unmap(buf, &map_info);
- 	}
-+#endif
- 
- 	if (dmabuf_fd < 0) {
- 		GST_ERROR("could not obtain DMABUF FD");
-diff --git a/kmscube.c b/kmscube.c
-index 81803be..e93da67 100644
---- a/kmscube.c
-+++ b/kmscube.c
-@@ -166,7 +166,11 @@ int main(int argc, char *argv[])
- 	else if (mode == VIDEO)
- 		egl = init_cube_video(gbm, video, samples);
- 	else
-+#if HAVE_GBM_BO_MAP
- 		egl = init_cube_tex(gbm, mode, samples);
-+#else
-+		printf("gbm_bo_map() support missing\n");
-+#endif
- 
- 	if (!egl) {
- 		printf("failed to initialize EGL\n");
--- 
-2.22.0
-
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index a1a295f660..c72fbc61a9 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,9 +6,8 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "76bb57d539cb43d267e561024c34e031bf351e04"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
-    file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
+SRCREV = "4660a7dca6512b6e658759d00cff7d4ad2a2059d"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.26.1

