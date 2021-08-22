Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9692.1629636705308743924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ztsr1Tsj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id e5so5228968wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoKQK7typZTPzoFvoggmrWxGooknCccHY/pRy5G0QQA=;
        b=Ztsr1Tsjq+m17Rkj9IolEac+ohiqFeoFEGTmDyNA41D0LAQWg9kbYFbDu7Q2KZdus6
         4ZrL+nxtAmonlSF2wF5HLAFcZeQjfmyTHqPtWxHOH6XSv88+cts2lpgGTFVPjSw6Xj9A
         sSUpmVqT0gjJEjISgWr2BAeKm6dhLxf5XUOlRI2urkPx4vJQvCjdd/g1yoqzth4nt1QG
         H0hRDukFUQWq58bY5TkSN8GNhwfRv7hLXVf/kNPqnHHLn6V+04pOYZNuf06E+Ozm/f//
         4kJi25pO5GvbIL6wK/cB958ry2BBuJIdbLBFbR3qr06xxrY8hxitxQjHeaFsM4nKumQg
         kE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoKQK7typZTPzoFvoggmrWxGooknCccHY/pRy5G0QQA=;
        b=eNP8f731j6632/BWVwkkCjxKVQvtbEMMR7u7orrO2ZaVVeD10IesXI9zgkR9M4OX+I
         R8VtPNiOIu4MwLUJcqv/4W7AMk99eJc2IlLK6dVhRQ+GRMuAwrqJSdFYZziXjEkWY/Y6
         b1p9GBnLW1ApFwx2qAof8vARpGnG8DSG/bgjh0kH/zAmHr+P6QFJ9eOeQMo6pQXBka+w
         Ic4hU0/RmUTrLQIIfXRdEYBLKmlMM7XTJI1iUkwG18pdHRmT1T/lJZkZx8/waO1xHILT
         RAWsUrDG24OH+BEraKdp5sw9PWc3YVoIGfccJ+9ldrwXtLD0WUSvyGRDa4Mv+WiSivoe
         WqfQ==
X-Gm-Message-State: AOAM5302gPiZHPQI9RT3YdxkaAasd1mEGhjyq0D6a4p6Zf4NE1GPRxqx
	ku4atXNjGxRgEEExq/w3mT3QZ754pKi07g==
X-Google-Smtp-Source: ABdhPJznfzQt8OEQX99egJVAT5g3EA0pvSpPlbGnCGaM0EuBpDKm/ACeHiDHzHTkkMNR+KPubgmehg==
X-Received: by 2002:a5d:4006:: with SMTP id n6mr8682522wrp.199.1629636703896;
        Sun, 22 Aug 2021 05:51:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 48/55] libwebp: upgrade 1.2.0 -> 1.2.1
Date: Sun, 22 Aug 2021 14:50:56 +0200
Message-Id: <20210822125103.310416-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webp/{libwebp_1.2.0.bb => libwebp_1.2.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.0.bb => libwebp_1.2.1.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.0.bb b/meta/recipes-multimedia/webp/libwebp_1.2.1.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.1.bb
index 9a3b5cd6b5..d634e02180 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c"
+SRC_URI[sha256sum] = "808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.31.1

