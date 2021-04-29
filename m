Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.1567.1619664660806773817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 19:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vQo5sG8o;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id b21so5463969plz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n989OgFNZeT9zPMwDY/oLjSYPPsS4cREOXkCDqyUX20=;
        b=vQo5sG8ohS7Sb6DUGlTcdnMKkaivl+4JnBNu9+iYY+EtD8iUYite/+jesKsHPNmvSL
         LHXx9cr9cCgsrWxJW7L30FTYqQ8uqiYD7ojVny8HsRWa/yZA8a/IhYT4Vy5Jn4NLqmpU
         wdyTtt+iEHK4i5fdlKldDCc4396rHwOaT9EnFLfNtT+CF3nyFKoBDJ3SG+todNwL8kTq
         BqyHW1lMLxFUcy7lTywaUNYmkorXTKL20KfmJg2ZcaUBZwLmuHulNqpxwDo2SEiQ7KOM
         yPO+ouPanPV77YzalMSUpkQVe+8+zSHkjBJSuJA9n56bkRsVsPWK5p3n2vU/BSOEn5tL
         Rycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n989OgFNZeT9zPMwDY/oLjSYPPsS4cREOXkCDqyUX20=;
        b=ECDJ6xIcvuD7ec6rhIUe4mtweIl4YMzbgyPCn5OqeX658zMmmyCE5hnoUG/SlZT/X1
         Dmpd8l0p2d4bT2Br4e7pgyQGCK5tF1MfI+eafJQ3TduuCtJ5UvP3nr7F3QeoIRDErWQb
         dqpmWLcftIHK0kWXpS3+qYtpG8g50kU1HI6dmBQyHzaSFtnu16TAX1ysuXPwr7p3+hhy
         HDa4l+13L7WLpHFZb/AVgyjsKSEYZ7953VfcdDuKBedQD2hRUKWl1GkkUQC8c2HjcZ4H
         50dSKwI0v6wGdfYTG+JIr5C5jYMf2FWg56DfkOajtQZJvpWByymd9Lx7ezaHbOwfVBhv
         85fQ==
X-Gm-Message-State: AOAM53257MhOO38u/+3DpKIGQkv584dzaA203a0lDA6AKDs9TDANHIk7
	ictuSYdwuv1/7Vl3CSvdOyleE7Mo29YveQ==
X-Google-Smtp-Source: ABdhPJwfmFmVPj7DhxBpPUnq/h63UiGq0oAqvRHLveDyE7nP8FLx4THwWFNg+4iioz8jv/UKXnqaDA==
X-Received: by 2002:a17:902:b28b:b029:ed:19aa:5dec with SMTP id u11-20020a170902b28bb02900ed19aa5decmr22547798plr.78.1619664659834;
        Wed, 28 Apr 2021 19:50:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id j7sm864688pfd.129.2021.04.28.19.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 19:50:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 2/2] libjpeg-turbo: Use --reproducible option for nasm
Date: Wed, 28 Apr 2021 19:50:57 -0700
Message-Id: <20210429025057.42312-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429025057.42312-1-raj.khem@gmail.com>
References: <20210429025057.42312-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that nasm version and timestamps do but appear in build
outputs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
index b6efc6bca0..0bd6af8db9 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
@@ -29,7 +29,7 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
-export NASMENV = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
-- 
2.31.1

