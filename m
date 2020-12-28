Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2371.1609185887550210633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RzZLJsVa;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ga15so15590418ejb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N1T1NbYQZbvTxeyVvmkIhPrYwJAIzCUUeVOQjvSULP8=;
        b=RzZLJsVaLZkt3kfMd+zwIBSgYjAOnG90UFmXzpjEyrFAbOmNUaDG5UAldp08Jn0C+M
         lCNw/t/t7op3uwUYQQTzVgzljPgAWpBMCN8V0Dkr3C4Xc37UfSldCG0mcs4/Y5H5zH0Y
         vuWV9h4xdyIqvRpgsWBt1iscTWpZ7Y/uBnW/s9/l0CXYdcw2CuZYi0sGc4DmCkncW1Oi
         /j84/bxDewg48DvVuCaGVrxyWY1VyH+8TwjxanYgq+cb0qfd+EWBQ1f6smqG3WRzjD/L
         UFkX1DVFbZMdgI7jnHT7SVmzIjzr9fGzYvnTXTaVXU8JTeB667rAhue9mKGBJ8vP24/W
         2VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N1T1NbYQZbvTxeyVvmkIhPrYwJAIzCUUeVOQjvSULP8=;
        b=E2zAEaqxh12dE9d8LKQJUPFC2Y3DW6So6X9i3U4hGe/IqVDw207iyQNvVtbH56A8sr
         GZdHDO4K6u7kv2jTSgAT3TLZOd+mIz6G37FtAHV0hmAUP8NNOq9zIFAuWurVDelk5pkR
         Ig2Sd+hLrSqWuFv0QQ9yBD6Wax3haQ4y0Ox1TVUqrnpBazqEQVK90d5L7zdHd4dWH8Aw
         oJZr5vR/qEAV7oSfhmBFZHKBBQcuF/6IAn9OjnP+JQHpCw07JK+ol/ZhgynL/le+PxTq
         7kE2ZXszRwTF7gbHnBbWAZrRJjvZvryc1o+qWYZtgB+0/aBBogSR5EIa2te5pOoLWSkU
         eM6w==
X-Gm-Message-State: AOAM531MQYdwB8Bwrfn7ALwu7nV7OlaA2tgTydXKzaePjbIRYxCmmJ4i
	td4JpLsyzWMfcAuxkaCV6IZQCEDfx+c=
X-Google-Smtp-Source: ABdhPJx3VC8/g1mKWq3T2uPDGMmMLqOymh0Lb+xoqWvY1pao4GsbdKP6Vwd49RVMARlL6b6fFCHxpA==
X-Received: by 2002:a17:906:6b88:: with SMTP id l8mr42918769ejr.482.1609185886051;
        Mon, 28 Dec 2020 12:04:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/22] icu: update 68.1 -> 68.2
Date: Mon, 28 Dec 2020 21:04:19 +0100
Message-Id: <20201228200436.78130-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/icu/{icu_68.1.bb => icu_68.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/icu/{icu_68.1.bb => icu_68.2.bb} (96%)

diff --git a/meta/recipes-support/icu/icu_68.1.bb b/meta/recipes-support/icu/icu_68.2.bb
similarity index 96%
rename from meta/recipes-support/icu/icu_68.1.bb
rename to meta/recipes-support/icu/icu_68.2.bb
index 98aa6b7be6..1ca87feee4 100644
--- a/meta/recipes-support/icu/icu_68.1.bb
+++ b/meta/recipes-support/icu/icu_68.2.bb
@@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d"
-SRC_URI[data.sha256sum] = "03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d510"
+SRC_URI[code.sha256sum] = "c79193dee3907a2199b8296a93b52c5cb74332c26f3d167269487680d479d625"
+SRC_URI[data.sha256sum] = "2989b466fa010edc41297e12fdd5ae47c2610ad68b63af1a0bd2a1acfaf497f3"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.29.2

