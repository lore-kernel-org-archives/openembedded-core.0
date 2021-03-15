Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.875.1615832024378739884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qNwFE/J3;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ha17so8487790pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awHvKAPa+joEEniNARD6J3KHvFWnWeu0xhdQHOI8qN8=;
        b=qNwFE/J3Eu6GsLU/Pk/6dZzXI7nIexWef9IZDr4Q5FY9ITeYkHVK7yn8U2J0RFN38L
         DYviNYG3emtL52HnMQT6k0sIzf+VLPlJ75fv19jvOzqnIUS4DJs2k97zPtdCh0/rPlBT
         GOlFuAfa5n3tuldUWVBlw8NcSuBV93qwrmo+/kvEnAEGQkIcnAyK/3oA3z9L/AfyvCaw
         O8ZTqHbekwSj6fy61Zn6TCXl1fWc2tbal13BqgsfDboDq/LBA2tZaRVoQ8WtaGQSPzAh
         msRxBVQpEmOqWTpCA1gRQGJTPo0YDmG6lkz90jJ3UOmBQhj/UmPfJKEWSAtSuiEOBCDl
         gD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awHvKAPa+joEEniNARD6J3KHvFWnWeu0xhdQHOI8qN8=;
        b=JJEtfTvbWH2HDxrmdF1ET38pfFXphKu9yEkoFjDCEXcpaHbtXvNSwMXO8K0/yffyz2
         945GoAFFyGddN3zmul7TcdzmBwozIvAwJTtCehENjVzR6wknWwrDBVCt/hPk1nYeQw8O
         WIyOLF1yGpf0Kv1FTqXKYkZItiDIsDNDKbwFmULEYPRJuCKcJlqgq7InBJDVF35r9cF8
         mUl23fkk9j7dBMIaQ+pv2d7FYU0x+K30zREs7R02ai1Iy7AaN1D5XCV+QHmTUs/64f/a
         DhSB001GmuS4fujIBHRjKVELYd6TNNNgDhZ49BE+NdvKxBdygzqpMq/wLMll3EQA/PNf
         /0rA==
X-Gm-Message-State: AOAM532OSRtLOWERy6txkExLRHgNCKSbv/WWkmL3WiiXKRIYzIAPf/6G
	OTQW2zwHugvnf5EGAX0rfJ/4+N7V58eKqQ==
X-Google-Smtp-Source: ABdhPJx4BYoOfVmyZYe7bG02fj8+67Gbj2VA9GidX5HsGel0IUVQOj0R4+yBX+L76n14H484PhS/ZA==
X-Received: by 2002:a17:90a:8c86:: with SMTP id b6mr386273pjo.8.1615832023557;
        Mon, 15 Mar 2021 11:13:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id t22sm302482pjw.54.2021.03.15.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 11:13:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libedit: upgrade 20191231-3.1 -> 20210216-3.1
Date: Mon, 15 Mar 2021 11:13:40 -0700
Message-Id: <20210315181340.2753491-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb} (82%)

diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
similarity index 82%
rename from meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
index 8d2d57a930..97aceaf716 100644
--- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
@@ -13,8 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
-SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
+SRC_URI[sha256sum] = "2283f741d2aab935c8c52c04b57bf952d02c2c02e651172f8ac811f77b1fc77a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2

