Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1221.1604335799134694472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vUwKZaFR;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id dk16so19220475ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6mqrCtJYLPaZvoJpfvXxMlhnZmRY0PGMZqQK3VTdeg=;
        b=vUwKZaFRTi7fNaVVoPcF8J6mc4csLqdA6ad7WpTPecuosm6FcPf+Bn41M/HlVhU8xd
         dOkw/AhyINNP0q/Y3bTJKTZ9+b9vUu+h6/fqycOar2mhghSvXMbdGAh8cUks75AOsxqo
         7iXxABnjAlN8AwcY9bC2zwOp6mc4dQ1uLW6LUHh8nrM0fYzWbzeOnl+4h6NQlZVEFdkm
         G/YvV+B281vbzrA2fny2BIMemP6Fer1oCjQpFSKhtbSTKPHywO/Hw7pUwBxnBaFNKoFq
         XMl+6Css9jJhu4UAxQLoaxVIt9nt/F+K1Q5ku4q5CKM5Fl77vtF7voSi/2epmlrBQWFp
         wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6mqrCtJYLPaZvoJpfvXxMlhnZmRY0PGMZqQK3VTdeg=;
        b=Sn6b08rRe7BMh+CC/YCCLLdi2CzJN/tsbgc1iviUsA1NsdXfk2IuA/kWPVk36eisSc
         xSl81bCcmqFZJVgiR0Tut6OvD2+/6QQI9btbQn5Asa9Zc8OZcOs+/FNQeYnVJ3thtckp
         1QsNYFPr2zGyc7jLC7dk3pVOTNLdaj3slDJAHPKhCGQyJd3Qu1VfringlpFtwivyYDuG
         JnpQ6R1SAmgW3KW+HE7vmPEj21SgMJKh2GGgkiM5eDdUHkpAMctrMw7u5pK8x1azH5ef
         tEZVbHcyhwrvRhv7jTp8CQe+c7fxK6E53G0lm712d0ZXAYpHlFj1CPRnRrH/RPQ1H9hx
         leUA==
X-Gm-Message-State: AOAM532FDVKb+uk7ztVnyN9y2r9Be27BjtYgRCDOVtnHdVR1nSniDxPE
	vjpo4b06hZ+Y/O3Jwz4xol1f7iayVNsK9Q==
X-Google-Smtp-Source: ABdhPJxaBQzhQvPeRar5thpCTMOgioveMtjn//J0kiqxJPtHpjr1FhY2DN4ZnJX5jIrTSg0cyAHPAw==
X-Received: by 2002:a17:906:3650:: with SMTP id r16mr15860777ejb.419.1604335797487;
        Mon, 02 Nov 2020 08:49:57 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/80] xkeyboard-config: upgrade 2.30 -> 2.31
Date: Mon,  2 Nov 2020 17:48:32 +0100
Message-Id: <20201102164907.27572-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add python3native, as at least python 3.6 is needed during build, and not
all hosts have that.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xkeyboard-config_2.30.bb => xkeyboard-config_2.31.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.30.bb => xkeyboard-config_2.31.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb
index a4d67cd2ce..ad150544e1 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "095a524f7b633ed257617202d06c9c71fe020c8897b106cf0dcdd0c6e8b797d4"
+SRC_URI[sha256sum] = "da44181f2c8828789c720decf7d13acb3c3950e2a040af5132f50f04bb6aada3"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
 FILES_${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext python3native
 
 do_install_append () {
     install -d ${D}${datadir}/X11/xkb/compiled
-- 
2.29.0

