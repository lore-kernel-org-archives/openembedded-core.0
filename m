Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.12320.1604673412576226754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wG4gzNLU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id g7so1512197pfc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sqvxcIUeuGGvVcYBNzGYJq3SVfRRVM/J75E3H0FwCtg=;
        b=wG4gzNLU4E3TekyF6JkAiEanK4iQld105MqgtjnOvPL4HYDV/10qBVZboIeHtrPav2
         ZmhnjjhuxU29zX4GYFQR1Ki1vVw8oLmm9lbr8/6BwxzE+kXiFX3yJRS7LjdfYw1X5loA
         wvD6z5ce0AXau1P4tBo65pGce1N7asqRYcEfsFmvmHA1iYTUYNZO9j4mnxw0q3YtsIii
         fqbvu0tT1OJZU1FOYt8RgcHFbnN7vtN1e3nvUBKGngd5dGW0KfPkPfzIw2qFGSRPACuf
         OiVv0xDL5gMU3K2XE7ZJDXEwruMNKKKzr+kHnaCTm4WPxv3ZL2THZ1tlVWQV75ZjrWA5
         oBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sqvxcIUeuGGvVcYBNzGYJq3SVfRRVM/J75E3H0FwCtg=;
        b=nE+gons72niJYE9J09eCdwYtCcAnMy1jOWpxScnMvmH3bkSc9pqpZu5A2CBtRGr3ck
         PbIKUwhjymK6PmQjwCjyIhjYyA3pPbmXFm/otqX9ufKJZOiqtEBWyLd9ZpmCNwBpLpOQ
         1iVGKj9N3GnZFrzYrbjLlRlGn6OxLfhinyPwK14R4WbpvsNHSEGlZHnZ8I5URqECClDB
         dPQgZ8I/TX5fX67ssv4TaqAGErfX71UhrltMH3Q6ScfZ7C129uIXE8V2nPeF9nNvAmvR
         cBWGOwbEAJQhCIrDUfnWIvQUL+lETSJ5t5VVodWHqPBSMm7ZKSP3ItAkYUIevPOdZzhH
         WPlQ==
X-Gm-Message-State: AOAM5325zHNsykIm9Pi6KeJMNcuicwLau/Y4tmKt2xOleC/S+wBBodVP
	LOWeghwFZxMPYCZ0wx1jURmZnrRB6Z4GmFgz
X-Google-Smtp-Source: ABdhPJxhEyxOCtqZjTl8mXcmMoZCSqc80LqujjPcvaSgxIe6Aoo/OLQQlZz0Pkq/grDuQ65cp4nc6w==
X-Received: by 2002:a17:90a:1f0b:: with SMTP id u11mr2860426pja.105.1604673411682;
        Fri, 06 Nov 2020 06:36:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/20] libsdl2: Fix directfb syntax error
Date: Fri,  6 Nov 2020 04:35:27 -1000
Message-Id: <f8d552be2e0bceb18ada28d34e962355050d9dae.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

Build of libsdl2 with directfb is broken due to a spurious '}' and a
missing 'E' since version 2.0.12. The upstream is already fixed.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8963daba093c3c5e2c60e1e4e057862971b84cb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
new file mode 100644
index 0000000000..aa351a89ba
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
@@ -0,0 +1,49 @@
+# HG changeset patch
+# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
+# Date 1585069551 25200
+# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
+# Parent  63387e8920f58f608288f247824ec5f4c286691f
+src/video/directfb/SDL_DirectFB_render.c: fix build
+Build with directfb is broken due to a spurious '}' and a missing 'E'
+since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
+  202 |         case SDL_BLENDMODE_MUL:
+      |         ^~~~
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
+  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
+      |                                                                   ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+
+diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Mon Mar 23 14:10:25 2020 -0700
++++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Mar 24 10:05:51 2020 -0700
+@@ -198,11 +198,10 @@
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
+
+             break;
+-        }
+         case SDL_BLENDMODE_MUL:
+             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
+             data->drawFlags = DSDRAW_BLEND;
+-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
+
+             break;
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..6285477921 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://directfb-spurious-curly-brace-missing-e.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.17.1

