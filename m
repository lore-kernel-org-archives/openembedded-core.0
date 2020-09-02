Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.910.1599081241032822658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+sWX3xC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id i22so706751eja.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cm1cB3FiHoGb5jwilg3auLTNaLlvtPM1t9lCohh0RdQ=;
        b=t+sWX3xCCUWwDfHsw1uFlu8sDEojivYTA5edjA0aMhNUkynJdJoevwXxAnc6WRg/VP
         NIS+HJwzFXg5JEWQzS4uQidfKx6cgAQO2CIyAUH2iN8SbAKpDRb+WJPYENwIrh82LG/6
         XL1AXwwhU4kGaPBNDA16DcKeg+HN8sD2X53JXgOij+lVlSLEWCfVonGey6r8eHeESxfA
         yYrrPTd9jDqTcewxN4dUOzIY4FaIx0EbEdjIjkSezCzzxX3fo8oyo3S1K5zCnaYS2h05
         hJLZGrUcu7GikQzu585CQdO1czfwnF6H+5z/J3/m+tJDQbm9O0TD3CPmjUnHxP0lXXye
         8XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cm1cB3FiHoGb5jwilg3auLTNaLlvtPM1t9lCohh0RdQ=;
        b=KXn9cjTbC3kSQ2Zf20/FZyNd6DXef6JpTAARTdbh8/hPENWnfbvpWljJSD8XimLQWb
         7ZX3DPKv39OdEl8Bz8PCVdnO0GB0YJn42GfZFKDZRmSAxa+Wo1hgAkyns6SMSTYzJSZ5
         4ZVUqqizcdEqBbG9Ie1nPxptkon4eJineyJbY1NrDy/sx6jlJYFMsT3VMU1GvmY44nPG
         7ae0CSwbdoZDbLdoKMVPbN6EawEo+3XygWEwvRYz2lLG9q2M2QLHS+8KcP0Jy2oeWNw7
         iPsIPC9BUSP37E25SwcMkYOUEnm/9XxdAtte1eCnfFrjQ6MO7Tj9P2CqEs3HEnrJfz2A
         VEog==
X-Gm-Message-State: AOAM532MbDLTd1pmkzLLc5rbi70GGIGHFjWuwAtbuRi7dTUvI+8yG/4d
	X1DwrADKcKCKB/GNX3dnBjqv/kqgGEA=
X-Google-Smtp-Source: ABdhPJzew+M+LFDrLW2+OAZiO7oy8B6+gt3lf8HvX1Qx7aLH+wTUfu6vINp+ckx3FO+SwR+7G8ifNQ==
X-Received: by 2002:a17:906:8687:: with SMTP id g7mr34469ejx.129.1599081239235;
        Wed, 02 Sep 2020 14:13:59 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:13:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/23] libxcrypt: upgrade 4.4.16 -> 4.4.17
Date: Wed,  2 Sep 2020 23:13:10 +0200
Message-Id: <20200902211330.4853-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: adjusted file list
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xcrypt-compat_4.4.16.bb => libxcrypt-compat_4.4.17.bb} | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                 | 8 ++++----
 .../{libxcrypt_4.4.16.bb => libxcrypt_4.4.17.bb}          | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.16.bb => libxcrypt-compat_4.4.17.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.16.bb => libxcrypt_4.4.17.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.16.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.16.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da7607aef3..104a2af4d2 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
-                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-"
+LIC_FILES_CHKSUM = "file://LICENSING;md5=102923b6e1b02a85c5a1203fa87d151d \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "4ffa4d38396c334a1e002427c22281b047a3d6a6"
+SRCREV = "6b110bcd4f4caa61fc39c7339d30adc20a7dd177"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.16.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.16.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb
-- 
2.28.0

