Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.2278.1611261586557708416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 12:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tHSHw3BU;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id c12so3042157wrc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 12:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ADhU5yfkMgPjas+Lus7NSajDPZFPilXP82Lwxt7A308=;
        b=tHSHw3BUmZL1V+4qimIna45vVAINLPPQKt0gw5qgJAfRFS1zmm9/O4tHDGDGobeQUm
         rh9OMMHQo8T491KNk5zdlMxlUfAnbov7reZJFsMHdG59GXAWCejTl6ZN+hxvtraFpHmm
         jRs4AoHg8EI4csoj4FfL3c3soDFHjB0mztJUnReg/dSzXJB4/detJtg4eVGrt8GMXiBc
         zOJnm5Hpy+IbkC4xXm8iVutHAZ7T6jOpekHx7+TWADfKY91OE80py25YsCH9y1A1Zm2d
         PXoLUF78CkMFMMvxGeYxLaiWqXNL7dOlyOINKNtTvcb/5dnQcdL7pPdMjlTJYAhBUg7Z
         fqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ADhU5yfkMgPjas+Lus7NSajDPZFPilXP82Lwxt7A308=;
        b=t/pOq8Zmd3q0TkQ65gTZcF8fKADB48f/EY9ZCJFJgyJrWAHTzZnwO0d9zPVeIo7VQ3
         r1WQjGopYPo8HFBHLbzYBF2bzARBH84ZRF4WuISu5G90BGLwxoJOCDWCjbz8p3iLLpUM
         Ev0/9ci8KOsoxflpUQmKWpFVEPIMtZ1ZmXUXKyUBjsHuGpIJjaEwcUox6DUjQEvZVdpd
         Uy3DEwkj08NWpqB3Yq2CGIfrWzttI8bx4ODUZ7OyHORgOOT7L8DpPNJbu3TxkAc2NNmf
         hZ02WOQBLXEPpGh7Pg/ERceYJK3smbY8bWKW0FjzakMom0LIzLWcii5Ps79g0WJrkD/P
         74+Q==
X-Gm-Message-State: AOAM530WoWYuOFtCmNzqjNOwxib9J5hf+PkwZlSNCpKAdR2yzbw27+t7
	GR7D3XGVvs4FOz5Og72slsuYtXbPzOpYsA==
X-Google-Smtp-Source: ABdhPJywJnJ6sNRv9CZFPR7B2oa/Bie1WJ5US+cMA6KjGUsN1xLL7PZazNBZLnhvihznD/yfwXbhBQ==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr1149100wrj.339.1611261584927;
        Thu, 21 Jan 2021 12:39:44 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.157])
        by smtp.gmail.com with ESMTPSA id o124sm9782456wmb.5.2021.01.21.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:39:44 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 2/3] elfutils: add PACKAGECONFIG for debuginfod
Date: Thu, 21 Jan 2021 21:38:52 +0100
Message-Id: <20210121203853.1461-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121203853.1461-1-dorindabassey@gmail.com>
References: <20210121203853.1461-1-dorindabassey@gmail.com>

removed the config option that disabled debuginfod and enabled it with PACKAGECONFIG

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.181.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
index c5bb62e961..c18de53b1e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            "
+
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
            file://0002-musl-libs.patch \
@@ -32,7 +33,7 @@ SRC_URI[sha256sum] = "29a6ad7421ec2acfee489bb4a699908281ead2cb63a20a027ce8804a16
 
 inherit autotools gettext ptest pkgconfig
 
-EXTRA_OECONF = "--program-prefix=eu- --disable-debuginfod"
+EXTRA_OECONF = "--program-prefix=eu-"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2_class-target = "bzip2"
@@ -41,6 +42,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
+PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
-- 
2.17.1

