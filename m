Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.2998.1632252683134743151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 12:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=APgsP31e;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id x27so1901045lfu.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 12:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UpiYl8kFaJp7fp+OsUadCUEkbTt2wI+fJGD33McX2pM=;
        b=APgsP31exTuOgtSx77hcusynngJRsxtSzokvphlnr2w2mWeiTG2mr9nXDsCh9heYEo
         LjF9wxaKm84TX+prMo2F7bF/qHyw80Y7afQRK7DyuLnE5GIWRnSjzq+82kbsTBzVprKj
         NVrm7YDnIifhjFXk0e6bL1txktcTHKc6tftFQ/77atKk47sAxptd+Ft+FqkinyCMcceP
         BJeuN596l4S1cSD8qwalTNq91fa1BSh+rHUOXuU7C+qHRRc3xDAoEVcrMyWlADQdgjAE
         0fGrCbBK8TA83gLO4s7SVli1IFWUcyTRMgjW0p2KkUjoGq/+LXU3qYbo4uHNAtAL6Lt8
         GeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpiYl8kFaJp7fp+OsUadCUEkbTt2wI+fJGD33McX2pM=;
        b=pOJDuctGSOKm9CbHUTO3jAGZFsMSrI0XEF/T9hTvx00QxjueqNjyrD8RM62m1snL/L
         JSbj5xa/kk9e/1ahfVovsRlOoOBVTVP5TQBW2XFVKY/0+wV5JHoMAHBTwLvy2AvlgQQA
         ZM/uccLlcXvzykofPTO0R0uc/pjAanywdKHusEqbVNAEJIJlFUpPXnb9MH4n/wCtAzOV
         /ff2zzOzfxqojqGS7nHGXIlHC6QpIlGgU74zCT++5Cp8UE1bl0+Me2bmtHCv93OkEJEM
         9Rtw0AM7koP6YJbZOeI+IR8eO8jG8MfcnvdJ7GG2LC7dzAKKbg1vLPPoD8iZ6n4xTIbl
         /9Sw==
X-Gm-Message-State: AOAM530oz6NzHEoiXoDS3rlWSN36U/zn3s0tJkdf4qQjGWsRbgc9hUAT
	PKy8f6YIYatgtP6SbLO2Z2//dM2BfCRTr+iA
X-Google-Smtp-Source: ABdhPJwQAwcYE8xsdnproe3ffsDXS0ZU0k158/Z9r/YKUBoxsKvoNEYpQhFiaVL4oKQYwPno3i4xBQ==
X-Received: by 2002:a2e:898c:: with SMTP id c12mr11391241lji.16.1632252680660;
        Tue, 21 Sep 2021 12:31:20 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id j24sm387713lfh.302.2021.09.21.12.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:31:20 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/2] libinput: update to 1.19.0
Date: Tue, 21 Sep 2021 21:31:12 +0200
Message-Id: <20210921193112.2628135-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921193112.2628135-1-open.source@oleksandr-kravchuk.com>
References: <20210921193112.2628135-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.18.1.bb => libinput_1.19.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.18.1.bb => libinput_1.19.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.18.1.bb b/meta/recipes-graphics/wayland/libinput_1.19.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.18.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.0.bb
index 4e9be5e37f..341c0cc065 100644
--- a/meta/recipes-graphics/wayland/libinput_1.18.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb"
+SRC_URI[sha256sum] = "3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1

