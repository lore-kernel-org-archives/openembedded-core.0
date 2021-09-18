Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.4176.1632003274865668768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 15:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=7RHk33hb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id m3so46769628lfu.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 15:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iR4kZ5FEsiDz9TeY4GVMaq1XHwHnwNvFb0jfB8sQYA=;
        b=7RHk33hbIgwTbhmgcfV5oyDpDG0r/kxdfQMRfvYEkPEj14y74MYJFmdgdKazvtaMTj
         hg3BTMM1bltu6kZCfM7fBB+x7DjXXJ5vHpo9sigPjDrtno1mqyMzooX62Gqle6Kls60i
         o+bvwzFSFD8VPFiM8XbIhexRZiJueQ1XTLfL+RLKqI7CoyqlQ/tKoiGMkzX35OGBg3Xl
         SZRqUx+b6LI6nfizf3i5ThiD6YY++TUtw3pGsNsJ8fyh9hNRTws92n2qX22mtsT51v36
         clZqVwNYJ8BDEVwGuRA4ehCJP0ZB3JDmyvhVld/cndCUDhVSHIA2UUDDwLX1aG5AIRCv
         VJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iR4kZ5FEsiDz9TeY4GVMaq1XHwHnwNvFb0jfB8sQYA=;
        b=UKaJHWdKh9U0/spfuJkZ+fwHDP62JO+sb8m8Oi6P3Osd7ff5J36fuC7ls9jsS52DKV
         rlFQYoR6UmifldnqR8Gy++aW/k/GVzBYQ+qdatzQGy4fKFXFWu0LyPTKvC6G4yQJhkgK
         MvyTX0Znuhv6/d0FaKf225ll1Xlx3XHCUcWjcbk3BkaosWUQbaWJ27S421zEZYRu2AVW
         K/zmJulBgW8AjQLmIM+dO4TkQHMB7U9NLfT3YetP3kXKd8h1SiBrWYYCh4ox1uteqjNi
         HOH1jA27eOjResgRUnTc9Vl28E+gmQQo/0Quu5G/F+ERBcxFHcHQ+Dt4XwI8uWOSrAdw
         gQmA==
X-Gm-Message-State: AOAM5316JGhdukfBZl/e/ZR/VU7q2PrFE1Rrm7Bm5VySI3lLQnDmiBvH
	2PCS7/pZTYEPyet/8OQVlFjVjzIx+BL4/TfA
X-Google-Smtp-Source: ABdhPJz0e9UHO9/hoe3SujTwKzFSlzabA69kjw7/i2b4tMEhBmB/NugiZDc06d572q4dYjpID1oYbQ==
X-Received: by 2002:a05:6512:39c4:: with SMTP id k4mr12219476lfu.14.1632003272157;
        Sat, 18 Sep 2021 15:14:32 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id e15sm283663lfj.163.2021.09.18.15.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 15:14:31 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3: update to 3.9.7
Date: Sun, 19 Sep 2021 00:14:28 +0200
Message-Id: <20210918221428.2228951-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3_3.9.6.bb => python3_3.9.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.9.6.bb => python3_3.9.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.6.bb
rename to meta/recipes-devtools/python/python3_3.9.7.bb
index f04bfc3053..a5919c2439 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.7.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
+SRC_URI[sha256sum] = "f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

