Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.115514.1597945957975569692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 10:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cd0lixDm;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id o5so1506569pgb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UkZXC5eO7xgMIhwTDeobKPyqcfog6vVDYweXT+kbdkM=;
        b=cd0lixDmhWAuGniy3HpYVcG0YrrED9Qyh37V3sMgWRtMM9w3555PwOnkYGrZbPEeZO
         pWk1JG/i4/xnWvHlCSdoDuFni+yffhQvdY0XGvI2se9wx/tsvEYPqoBiezf0m0YsOYFC
         hYuYpizIUkFzUzE7ckO0S4S6u4IkMZWgEVzB0QAPhsqZ7XFjlWyLVVmei1lxt9FmnbAH
         wv+nC0KvHkungwNH3gGdH/u6TrZp1furSvi3ZIrtKQoPDH6w2uTEjpId1TAPrp22fkgB
         pQkvVL8vLOKd6oYTMF1oApnIYywfgwBjklVwyir3TcHMlKh9VsvGLFNs0hJkyfJncmF4
         CzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UkZXC5eO7xgMIhwTDeobKPyqcfog6vVDYweXT+kbdkM=;
        b=GaNg3dYm+iD7Pn5JshIyj0PVA+eg5osJG5ggYf+nSYSw+zCP7ewz7yeQwD+wDQ1Qwq
         LS4lwL/g2cOd9ll6SZ/nDVQO7Nu1PbBFu5Au/6EBcqndAF91t22tk8W9ydl9VIjxnLi2
         +HieXSnAA2vx1f9fr/VL2Fuqfz8erbLnvd3qmGx71RyBT3uLn00toZn6Uc5xcekG4FuF
         1lQ5PWqU1itwVdL1wE/kQeiKosxhjJ0xOzNJOUNm1R3ApIvcZx2T2sM3PnDyhFqo/wBB
         2gDA2UCeBWRL7TtoY1GrDEgS4UnhBbcDsX/752flA3ojNnZpGdPTMpxX1bQnr33oFeNP
         tgrg==
X-Gm-Message-State: AOAM532jnpbwSPE9iM44+M0lz1UBPg2/kDTQlgMcWQy29Tl4Yx6BzizK
	xemOrXCVN5UqK9fAOTT6CMd6mZo8t+dnKg==
X-Google-Smtp-Source: ABdhPJyiRy/B3aPSHs1WcgdRKzKNdkpWzTrk3gH4q+eJfzpqK/eJDIp5KykpAL1iOCdMl96jFXiWcg==
X-Received: by 2002:a63:2022:: with SMTP id g34mr3131479pgg.151.1597945957196;
        Thu, 20 Aug 2020 10:52:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id z2sm3679277pfq.46.2020.08.20.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 10:52:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] curl: Upgrade to 7.72.0
Date: Thu, 20 Aug 2020 10:52:34 -0700
Message-Id: <20200820175235.3307031-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/curl/{curl_7.71.1.bb => curl_7.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.71.1.bb => curl_7.72.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.71.1.bb b/meta/recipes-support/curl/curl_7.72.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.71.1.bb
rename to meta/recipes-support/curl/curl_7.72.0.bb
index f028f1fdd5..e7f5492694 100644
--- a/meta/recipes-support/curl/curl_7.71.1.bb
+++ b/meta/recipes-support/curl/curl_7.72.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "9d52a4d80554f9b0d460ea2be5d7be99897a1a9f681ffafe739169afd6b4f224"
+SRC_URI[sha256sum] = "ad91970864102a59765e20ce16216efc9d6ad381471f7accceceab7d905703ef"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.28.0

