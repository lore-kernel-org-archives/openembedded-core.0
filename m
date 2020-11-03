Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.6930.1604421658343194289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ukhz6Xz5;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id s25so11173895ejy.6
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kaJN/QNhNO1clX850Pqp51fGIEAqsbqIKYmIpMqfMaQ=;
        b=Ukhz6Xz5Tai5r45YcZ6Y/z9jIWlLeCH1nENCYoAUcAqQyLzBzoZbWyeld+wT2QYNjv
         sNphpRV0qUTk4NPDXZ2FAcdEOI0GcOj5mQOnHzbPrNdnA38HA3zgy6lNIWNarbgVkrYY
         8JlYyC7oHXsGfOOByh9OKlpDWXHxHCg9iyVqlyj0Sk8CVe+EHx3EybMgRGrlux552ka3
         uBsdj/zU4eK/RPdgU3RL+YD0K7Y/Tel7Vtb6m0OxHiQpTulUZCywrEHBCf5t0IL7a9Ox
         BZ8iS6kVgyA9ZYDGaukqY6VVxm7j2LCp1a+lm8hONN3xPKPjziM3TRRK3F/JKD/eN18+
         P1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kaJN/QNhNO1clX850Pqp51fGIEAqsbqIKYmIpMqfMaQ=;
        b=GQNKnJddntPAvrD7gOoawaG8UKCaEGyUK8//zom9sSW5jra6IkmTczCkIaQJgm2L30
         9iZ8+ueASTpfJl6ujOD4+dFy7kQRtjMrz9hkRyIMMaKRk8pz7otYry3/RH3/ka3PpqjJ
         Uy8QQ7qE8paGEPAVWBzy9LpDenPvveGA9P19gEs/P2GZbGuKTKEYHE14+mTx8NXxhPcf
         EJ79NybTMzHxr4U9+R6PiGfrZfIUEfD+t8D2Alli5XtZW9O53hDJHM6qtikZbAog9jP1
         EbRlxflPY8Z5qNL88H8XG5p97VgvylxnmKZCIpLfibvZTY6neu710pl7Tp6mG1s9j2Co
         8epA==
X-Gm-Message-State: AOAM530y5n87TpDxdmQ1haZBGyVDamWuxqlQ0y5ZPrGvzLaHy9yIx2UC
	hRTX5z7r7wmmMJQ4GYQv0KvGMQ2WUQCA7w==
X-Google-Smtp-Source: ABdhPJwnuv2NlZ2VblSzjd7QUZYCrVmQhpbnY42h9hOq9vXTwZB/Bz6ec+YY++bTqoQ0gArSnOXrAw==
X-Received: by 2002:a17:906:2798:: with SMTP id j24mr20545318ejc.109.1604421656622;
        Tue, 03 Nov 2020 08:40:56 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id t8sm11152179ejc.45.2020.11.03.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:40:56 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH 2/2] libsdl2: Fix directfb SDL_RenderFillRect
Date: Tue,  3 Nov 2020 17:40:51 +0100
Message-Id: <20201103164051.444684-2-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103164051.444684-1-toertel@gmail.com>
References: <20201103164051.444684-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
DirectFB. The problem has already been fixed upstream.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
new file mode 100644
index 0000000000..83d4f4b1ec
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
@@ -0,0 +1,33 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1590793369 25200
+# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
+# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
+Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
+
+Lacky
+
+It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
+
+Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
++++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
+@@ -626,7 +626,7 @@
+     }
+
+     cmd->data.draw.count = count;
+-    SDL_memcpy(verts, rects, count);
++    SDL_memcpy(verts, rects, len);
+     return 0;
+ }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 8ecf161f69..0b75eb0c1d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -19,6 +19,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
+           file://directfb-renderfillrect-fix.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1

