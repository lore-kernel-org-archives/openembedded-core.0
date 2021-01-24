Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.20966.1611496599362227342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 05:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDEvBeWu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d16so8960339wro.11
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=99j+p/gTJbQRYpQ0NtKaUlY1ZSLvUV+2fl4dlEBNBSU=;
        b=VDEvBeWuKAZMf/HYmK6IbYb3XSdiOafDnKjq80jUT6BsRqpZQ5QQo/lcTaUPPgCJkr
         N/Qfbzc4TkatpcoMXC7a82m92+XCBGYuSVUAwsJ4bwAR/3V30BOHmEyNpedh86SuESo/
         j5b59ZigE7qtE07Ps6aLLrbiFQ0oXx/DeOcc2an4uaTXS1GsxkFYp5hCEVN9bak9u/1k
         pf31UciPHcYfULtLcmjjjQ5mpl1QUvuB5GO0behHZuQtE+ZIa5WgHRj2l/JOVX1v+EmY
         tc3mJhlCFOsJFsNqaWcnpY2lXxqPm46kbAWXhgWatCg9Ys4uZnysV/j1SkpyeroXi15T
         wusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=99j+p/gTJbQRYpQ0NtKaUlY1ZSLvUV+2fl4dlEBNBSU=;
        b=sKaA4kDe5N8+EQbHPysRLE0fj68dNM5UThnNhW49imXycLdNg5JOKehnRUdfYJLuk0
         rromspgeZ/3lqN4G3EZ1dCl4h8LLYaNANi/xhOVu5OGcJ/kznAZitdtL6Zr95k7YddmY
         Ct26c/otRg0z2KbCENQCNqnEcv/ZD/UZI6qKzNsLWVvFj+bPiIbOlMQmF0y38HJWYl6e
         UXlwq2tv+2SlwmyNyyhizjiG2DO6U/0+mRyR5SYeVEPecSPfNmxwbbXv5N3KMAoUJgb8
         3GGVvoKI7oILwQl6Zov5pWu/WNNDEgkKmstJLXzqrqRfJLEZeULPCHcsv+jP/5Xy7i7V
         wKQg==
X-Gm-Message-State: AOAM5328BciP65afgN4KwTc1cDESvg45nRQVhTfR58kcD7LYR0T3sjgo
	78vnWxO+26fbKFpZrFapIqZCqBrwiSYQuw==
X-Google-Smtp-Source: ABdhPJzaJQpaVhps4WegagjneVb3uCeSANjeLSjbW67HXqR6K1qv7bNAmUrYDNzHf1FNZXvjPHmdfg==
X-Received: by 2002:a05:6000:18ac:: with SMTP id b12mr3863346wri.77.1611496597637;
        Sun, 24 Jan 2021 05:56:37 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.64.211])
        by smtp.gmail.com with ESMTPSA id x11sm17650186wmi.4.2021.01.24.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:37 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 2/5] elfutils: add PACKAGECONFIG for debuginfod
Date: Sun, 24 Jan 2021 14:55:56 +0100
Message-Id: <20210124135559.21894-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135559.21894-1-dorindabassey@gmail.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>

removed the config option that disabled debuginfod and enabled it with PACKAGECONFIG

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 2666032d24..7b829cc7d5 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d914
 
 inherit autotools gettext ptest pkgconfig
 
-EXTRA_OECONF = "--program-prefix=eu- --disable-debuginfod"
+EXTRA_OECONF = "--program-prefix=eu-"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2_class-target = "bzip2"
@@ -41,6 +41,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
+PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
-- 
2.17.1

