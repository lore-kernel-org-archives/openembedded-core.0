Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.953.1599081243276926503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PrxIfpv1;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p9so699670ejf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0FQdOa12mF9znN1txQYM4w8jTjhST7kqj7FN47C/YI=;
        b=PrxIfpv1h8bG0aNAMl4g3I8Lvz3qR5WXACblS8XwpVuYZXxy2AdOWyeeRPzRv+zcwF
         tA4xv4Wq9NLAQOF5HGq+eyiArhn/B3PRX/65T67ZognaW+u4Oo8IIcH4NwDL3IilctOZ
         /nYjlH/oBfAAZO2qJHp2brQE/X878OJ7IhmgAA6btwW9KA/qf/8po0big2l5hr096qw0
         TOmcAVS/Eg9tsm7LQFV+dwovPBhwIL3s7EHgXuOuZoBZRBiDKcMh9NjSFCr4OAEgkQau
         gufFgB/6cLyx5b0lS7xTUHgfHpLsscgi6Zv+h5m28nQLQrLr+3ZJ7zXhFS1tDdeU3QaA
         LleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0FQdOa12mF9znN1txQYM4w8jTjhST7kqj7FN47C/YI=;
        b=dcNNvsuwQxs+M8nqFn8K8/FuYuO1UJdmHyeSgG3dzhmRzRTELMVsLkhAw5hZ2T8J4x
         Eve5PQ2lbCxiYY+QWpiUWMS6D98Oppa6DyNTm0AsTWMC+N+SFk4Jtqg11+RW+Bs4Pxhy
         04nZUiP7v6TKNT7XtucGnmAimn+KFFxH9eSGmmrHbfI5qL9UjbZAl9NRYymrn01OwHZx
         qIfsNCdQhxhm3RH2EE+zV5D9FwlRe75ULN4L2tzPNrxr5/txuiULEhCjDOYPzi/K2Rft
         lzd2vxRBYv1qCsZY/PUjYLBP13m2LwKHkdHko2x4RPh3L4C2sAGUoXnKjz5QeeBW9T4n
         6j3g==
X-Gm-Message-State: AOAM531BHIs8DrGH7DVU1osEIC2KWdKikXlfqJbMueBaXEEpkcmuJBYw
	8YrMnKtQ6jcTd/nbfh2NFf08gDe1SGY=
X-Google-Smtp-Source: ABdhPJzuMT5zfleetZfOjrO7J1oYRDNQtXirUcVHhU4fXSf6+yrjZTy8vHLhn5imCRCzQ+DT9CVA7Q==
X-Received: by 2002:a17:906:e08f:: with SMTP id gh15mr10711ejb.443.1599081241533;
        Wed, 02 Sep 2020 14:14:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/23] harfbuzz: upgrade 2.7.1 -> 2.7.2
Date: Wed,  2 Sep 2020 23:13:13 +0200
Message-Id: <20200902211330.4853-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.7.1.bb => harfbuzz_2.7.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.7.1.bb => harfbuzz_2.7.2.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
index 42b3af1ff0..8416eb93d8 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}
            file://0001-Do-not-disable-introspection-in-cross-builds.patch \
            file://0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch \
            "
-SRC_URI[sha256sum] = "e95ee43b6bd0d3d1307e2aacf0f9c0050e5baceb21988b367b833028114aa569"
+SRC_URI[sha256sum] = "b8c048d7c2964a12f2c80deb6634dfc836b603dd12bf0d0a3df1627698e220ce"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.28.0

