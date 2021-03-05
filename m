Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.12794.1614955658718659170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=roDkVpfI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id o10so1525251pgg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1vItSrZyaRCQ/dDKEun2Z+RlTd8HGPa4OhODpWo2VwY=;
        b=roDkVpfIgc820rmH6JtUkuXF+m5lEfP6L77JxV+hQjds/PFS9O5nEvjCFAJon+vIOM
         eBbdeAsVU8gLAQf6YySF6eSi0qitO9HjE4+FnqyTAVCqi0v3LAAY7fmvf38yin4kciB6
         EHV2ZEXa7dIohf0ZQ2rKiHWen4/s5jB3geCwCDdZYk1C2Rz7h92L3RS5LYeHw9oTaACY
         VC9SM14zpqYCYtpaHGyPJxgcgrmVwUMVondGn38eCvhlWejX2uGj8izjAi4xYHyBmWKO
         Ss3dMy1+D8Tfuv4+tzjiUilSSg2yfzg5JE7L0CWHHKY9NWMGUYw7/U7u3bK+9HW/Vaq0
         FSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vItSrZyaRCQ/dDKEun2Z+RlTd8HGPa4OhODpWo2VwY=;
        b=TegahmyQw3HMAnG1d5D//IjqWCI0b5MoF65IxI7nrysL7BtkQGha1I789gmKGVCq+m
         +R7LD3jpedZ9PVBOZGHO47Hp3x9MN/5VMr+emrHJB2MwlsszLTa4HFUARA+YulxbwEmT
         83S1dPAv3cGsPoVrzPhN7tuLSGtCR6FFlxkHzKDG7Le0cTnFO0dBIDUdriDcYXyadpuG
         jf0eyhKdppQIRAwbP0F6zJVEsSaCeM+rCBjwOztDHGVCaphMdoauqu7h+eA45PZ1eDZT
         kUFPW38vRR9i99hd6uI4dKo6WVxReqdLBd0PyIEjQHHWsryYMjhRnNy1RYCnE59uYWvC
         03JQ==
X-Gm-Message-State: AOAM5317bu+DuACJ9xQPdxfRh/iC7wrK0c9SQG+/Yp4opUlzX6G9kNcq
	93mPmG0LWMNhvW9vRCxNGisHIf3rdBHFBWos
X-Google-Smtp-Source: ABdhPJwqyCKCukxKTgKyADKpU5CyHx+DlQp+ITmrmXHC4XlEzgn7Piptf4YOz8eesHTBglNLJnKb7w==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id a5-20020a62bd050000b02901ab06d25edfmr9288637pff.32.1614955655169;
        Fri, 05 Mar 2021 06:47:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:34 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/27] libsdl2: fix CVE-2020-14409 CVE-2020-14410
Date: Fri,  5 Mar 2021 04:46:16 -1000
Message-Id: <d3b5f34efbfb9b2db961a649da5ba6b275db5e0b.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/CVE-2020-14409-14410.patch        | 79 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
new file mode 100644
index 0000000000..d8fa24bc65
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
@@ -0,0 +1,79 @@
+From a7ff6e96155f550a5597621ebeddd03c98aa9294 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Wed, 17 Jun 2020 08:44:45 -0700
+Subject: [PATCH] Fixed overflow in surface pitch calculation
+
+
+Upstream-Status: Backport
+[https://github.com/libsdl-org/SDL/commit/a7ff6e96155f550a5597621ebeddd03c98aa9294]
+CVE: CVE-2020-14409 CVE-2020-14410
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ src/video/SDL_surface.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/video/SDL_surface.c b/src/video/SDL_surface.c
+index 085d9ff1e..bff826f7c 100644
+--- a/src/video/SDL_surface.c
++++ b/src/video/SDL_surface.c
+@@ -28,24 +28,23 @@
+ #include "SDL_yuv_c.h"
+ 
+ 
+-/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow size_t */
+-SDL_COMPILE_TIME_ASSERT(surface_size_assumptions,
+-    sizeof(int) == sizeof(Sint32) && sizeof(size_t) >= sizeof(Sint32));
++/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow Sint64 */
++SDL_COMPILE_TIME_ASSERT(surface_size_assumptions, sizeof(int) == sizeof(Sint32));
+ 
+ /* Public routines */
+ 
+ /*
+  * Calculate the pad-aligned scanline width of a surface
+  */
+-static int
++static Sint64
+ SDL_CalculatePitch(Uint32 format, int width)
+ {
+-    int pitch;
++    Sint64 pitch;
+ 
+     if (SDL_ISPIXELFORMAT_FOURCC(format) || SDL_BITSPERPIXEL(format) >= 8) {
+-        pitch = (width * SDL_BYTESPERPIXEL(format));
++        pitch = ((Sint64)width * SDL_BYTESPERPIXEL(format));
+     } else {
+-        pitch = ((width * SDL_BITSPERPIXEL(format)) + 7) / 8;
++        pitch = (((Sint64)width * SDL_BITSPERPIXEL(format)) + 7) / 8;
+     }
+     pitch = (pitch + 3) & ~3;   /* 4-byte aligning for speed */
+     return pitch;
+@@ -59,11 +58,19 @@ SDL_Surface *
+ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+                                Uint32 format)
+ {
++    Sint64 pitch;
+     SDL_Surface *surface;
+ 
+     /* The flags are no longer used, make the compiler happy */
+     (void)flags;
+ 
++    pitch = SDL_CalculatePitch(format, width);
++    if (pitch < 0 || pitch > SDL_MAX_SINT32) {
++        /* Overflow... */
++        SDL_OutOfMemory();
++        return NULL;
++    }
++
+     /* Allocate the surface */
+     surface = (SDL_Surface *) SDL_calloc(1, sizeof(*surface));
+     if (surface == NULL) {
+@@ -78,7 +85,7 @@ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+     }
+     surface->w = width;
+     surface->h = height;
+-    surface->pitch = SDL_CalculatePitch(format, width);
++    surface->pitch = (int)pitch;
+     SDL_SetClipRect(surface, NULL);
+ 
+     if (SDL_ISPIXELFORMAT_INDEXED(surface->format->format)) {
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index fa7acc4c50..8e77c18f2d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
            file://directfb-renderfillrect-fix.patch \
+           file://CVE-2020-14409-14410.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1

