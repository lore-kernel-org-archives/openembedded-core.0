Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.6927.1604421656803608366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ls6ldQxI;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id s25so11173769ejy.6
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFXc2cUa/LVzJ1+ywSt/uO/LehuV6+TK2TFaNu87VcY=;
        b=Ls6ldQxIhOW0wFx0XD26z1XetE1m4RsT+FwTphVVB0QKch18v0SoIjhhXjB6qCGPxr
         ZUmEdtDHnvOPGneXv2IGnEPpbYGR21v4mzp6qUM4keWBGZ8o7JE1ND1HKi79YAWA/cTc
         7z5YsmhHvD3+NeecxCxXQwcDI49ToRw/78rgWfIOO5UEsKuqThS8zBZlXt1abK1l8KLs
         8Mi1UdazjAvkwPZbuIqg/RuJArG78UjhmA4YheE3vYEgY/5xYT3fn8Pg6OBrEB2ZtTXn
         DgmCpNaXrINQFXRbnva9wJ6QSYn7rZN4Lj1TnqaKt6vktcubvaZwmSXH0sdnXGvBq9/b
         NJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFXc2cUa/LVzJ1+ywSt/uO/LehuV6+TK2TFaNu87VcY=;
        b=FJKmcYyleWBiEBt/47lYzfRHlkwy4veKwaVEHenzgdPUysWBWlLZNWDlACtvRSxO/b
         yLGcMwqfWlEZd+VHz+G0eJxW5msV1yyE8JiRis6lOVXGoE392sKf1kLKKC+vY8/lVuLC
         xfh2w9C3bRYMbXYjwb28e+IPgNbbRpNVfQZ44dfW84+lyXiEqSwzVBc0XlIYA/6Zkv9K
         nPJv++mVKMsvpS4B6nEC1EC3HdJmrFrkujkv4tEiy16hZRwSMRoCOC0Ux+Gh45d+CA0v
         J3zGXOlIQuv21JpfxfutwAB9unp+Pnky0846OUb4Q4h9XCUrRTr8YEwDY115RdFHeYaQ
         YgDA==
X-Gm-Message-State: AOAM531GhWkdR7rTYzmOcEheRKAvXERf8TRVgvSpNZnIZwaCwwsjEn+a
	dM8W5HdVpoCaCuheeIxrAoQvvKuAnO9nIw==
X-Google-Smtp-Source: ABdhPJzgGYPQmAaC0hgiJLzSSk1/7BvUOec3IB1GpkOXUv5AdEMU+xEbm8lgo0fsSUqg3g6ys4SsKQ==
X-Received: by 2002:a17:906:c096:: with SMTP id f22mr7429461ejz.488.1604421654944;
        Tue, 03 Nov 2020 08:40:54 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id t8sm11152179ejc.45.2020.11.03.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:40:54 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH 1/2] libsdl2: Fix directfb syntax error
Date: Tue,  3 Nov 2020 17:40:50 +0100
Message-Id: <20201103164051.444684-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build of libsdl2 with directfb is broken due to a spurious '}' and a
missing 'E' since version 2.0.12. The upstream is already fixed.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 83dce86801..8ecf161f69 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://directfb-spurious-curly-brace-missing-e.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1

