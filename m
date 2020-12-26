Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.19471.1608974894388406501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kETsM62V;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ga15so8320831ejb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WlgKfGbhknvgyeaxT3Ear7KAbMfY1tT25Q1aF5BIWNw=;
        b=kETsM62V2XvF1pexbz1vFjYgDp+FBgSSfnuoo96Vb3zTTmlDZehcJIR3b+OqfiqlWO
         EQWZ6hixYYe7KNDy/6RPPVx1Nf0iPxjfbXXOA+Pn6hNWhSo3qLNU6A0BgyGXZGmGxY7W
         l8LCuFxK2xSBd8zOdtViZVsZ7CBNj2b/XP+rBSiDBeCmBL0Q/gBCd61a30Tbd7BLMRb+
         097sQZBzaG3YAFbW1hvVwkfS8jM8MWzfZjT2Jis97PWy2tUGq1Nkw84weRCH5Kwvc6jS
         3QxqASyE23N2xN/coF6gANjMJLhYliph6UH1CJ5p8nvwHtvFqQuGgI616zwyjtjL1MYY
         18IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WlgKfGbhknvgyeaxT3Ear7KAbMfY1tT25Q1aF5BIWNw=;
        b=pg697g4MzdO9OPiG/tycxbFfQMwXzJQevfdOVFvRBC4G6qRPmsfbPgU0FrjymL90Vk
         zvohTZHNbapB28IrXUOcFTM6QxM6wCUPSK7dwXQJAbyaOUGztAnWwKdf3QekFBYmhBg8
         1gfEXeR0SINjgfLVUEpe5ByTtA1YuMcCZRVFpTD5kHFrstvvs4D5Doylmr20soMeZL4g
         E4SInlDI9zVk1b+1MnkHq7/+/rjRwT5n3gL0jNKlcqTmuSMTGOVXxdeMsUH1OIIG5GH7
         0/gwfDKNb4LXZbwfMc5QSrGmvRwzQ6LSDyO2Q+Nwa6xna94Eq0B8/xrLVgVSY6waNIQ/
         9Ogg==
X-Gm-Message-State: AOAM531+/yvCv+X7T+PIa7iRHLk3LMp8CphJ8K6NQV8gUvoIXAAMkNCK
	DTujeuvJ0qfcls9HZHsJjMWrCapOUHA=
X-Google-Smtp-Source: ABdhPJzXZg6zvzaZnuSsbipDHAq3VS0IIst4OKfsP12tlFFXaT9mRws9xdmmeNgUyFLM53GiOqN93w==
X-Received: by 2002:a17:906:8594:: with SMTP id v20mr33928186ejx.470.1608974893054;
        Sat, 26 Dec 2020 01:28:13 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:12 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/48] sbc: update 1.4 -> 1.5
Date: Sat, 26 Dec 2020 10:27:23 +0100
Message-Id: <20201226092732.52323-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-sbc_primitives-Fix-build-on-non-x86.patch | 45 +++++++++++++++++++
 .../sbc/{sbc_1.4.bb => sbc_1.5.bb}            |  7 +--
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
 rename meta/recipes-multimedia/sbc/{sbc_1.4.bb => sbc_1.5.bb} (75%)

diff --git a/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch b/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
new file mode 100644
index 0000000000..11cec74fbb
--- /dev/null
+++ b/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
@@ -0,0 +1,45 @@
+From f4a1224323e386090a44bf70ee0ac9877ba7fb0d Mon Sep 17 00:00:00 2001
+From: Marius Bakke <marius@gnu.org>
+Date: Tue, 22 Dec 2020 11:04:26 +0000
+Subject: [PATCH] sbc_primitives: Fix build on non-x86.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Don't call __builtin_cpu_init unless targeting i386 or x86_64.
+Otherwise we get an error at link time:
+
+  CC       sbc/sbc_primitives.lo
+sbc/sbc_primitives.c: In function ‘sbc_init_primitives_x86’:
+sbc/sbc_primitives.c:596:2: warning: implicit declaration of function ‘__builtin_cpu_init’; did you mean ‘__builtin_irint’? [-Wimplicit-function-declaration]
+[...]
+  CCLD     src/sbcdec
+ld: sbc/.libs/libsbc-private.a(sbc_primitives.o): in function `sbc_init_primitives':
+sbc_primitives.c:(.text+0x3a30): undefined reference to `__builtin_cpu_init'
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ sbc/sbc_primitives.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sbc/sbc_primitives.c b/sbc/sbc_primitives.c
+index 97a75be..09c214a 100644
+--- a/sbc/sbc_primitives.c
++++ b/sbc/sbc_primitives.c
+@@ -593,6 +593,7 @@ static int sbc_calc_scalefactors_j(
+ 
+ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ {
++#if defined(__x86_64__) || defined(__i386__)
+ 	__builtin_cpu_init();
+ 
+ #ifdef SBC_BUILD_WITH_MMX_SUPPORT
+@@ -604,6 +605,7 @@ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ 	if (__builtin_cpu_supports("sse4.2"))
+ 		sbc_init_primitives_sse(state);
+ #endif
++#endif
+ }
+ 
+ /*
diff --git a/meta/recipes-multimedia/sbc/sbc_1.4.bb b/meta/recipes-multimedia/sbc/sbc_1.5.bb
similarity index 75%
rename from meta/recipes-multimedia/sbc/sbc_1.4.bb
rename to meta/recipes-multimedia/sbc/sbc_1.5.bb
index 674d77ef48..04d82320c9 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.4.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.5.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 DEPENDS = "libsndfile1"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz \
+           file://0001-sbc_primitives-Fix-build-on-non-x86.patch \
+           "
 
-SRC_URI[md5sum] = "800fb0908899baa48dc216d8e156cc05"
-SRC_URI[sha256sum] = "518bf46e6bb3dc808a95e1eabad26fdebe8a099c1e781c27ed7fca6c2f4a54c9"
+SRC_URI[sha256sum] = "0cbad69823a99e8421fe0700e8cf9eeb8fa0c1ad28e8dbc2182b3353507931d2"
 
 inherit autotools pkgconfig
 
-- 
2.29.2

